unit Estacionamiento;

interface

uses
  SysUtils, DateUtils, Math;

type
  Rrecaudacion = record
    fecha: Tdate;
    Monto: Double;
  end;

  Vrecaudaciones = array of Rrecaudacion;


  RAuto = record       // 56 bytes
    patente: Integer;
    entrada: TDateTime;
    salida: TDateTime;
    tarifa: Double;
    tipoTarifa: String[16];
  end;

  ArchivoDeRegistro = File of RAuto;
  VautosArch = array of Rauto;


  TEstacionamiento = object
    private
      cantAutos: Integer;
      VAutos: array of RAuto;

    var
        precioHora:integer;
        mediaEstadia:integer;
        estadiaCompleta:integer;

    public
      constructor Create();
      procedure modificarPrecios(aprecioHora,amediaEstadia, aestadiaCompeta: Integer);
      procedure addAuto(aPatente: Integer; aEntrada: TDateTime; aSalida: TDateTime);
      function getAuto(index: Integer): RAuto;
      function getCantAutos(): Integer;
      function getTime(aEntrada: TDateTime; aSalida: TDateTime): String;
      function getTipoTarifa(tiempoTotal: Variant): String;
      function addTarifa(aTiempo: Double): Double;

      procedure cargarArchivo();
      Function LeerArchivo(): VautosArch;
      function buscarPorFecha(afecha: TDate): integer;
      procedure tarifasPorDia(aFecha: Tdate; var PorHora,Media,Completa: Double);
      function calcMontoTotalPorDia(FechaInit,FechaEnd: Tdate): Vrecaudaciones;
  end;

implementation

constructor TEstacionamiento.Create();
begin
  self.cantAutos := 0;
end;


procedure TEstacionamiento.modificarPrecios(aprecioHora,amediaEstadia, aestadiaCompeta: Integer);
  begin
    precioHora := aprecioHora;
    mediaEstadia := amediaEstadia;
    estadiaCompleta := aestadiaCompeta;
  end;



function TEstacionamiento.getTime(aEntrada, aSalida: TDateTime): String;
begin
  result:= FloatToStr((aSalida-aEntrada)*24);
end;


function TEstacionamiento.addTarifa(aTiempo: Double): Double;
var
  mas24: Integer;


begin

  mas24:= trunc(aTiempo) div 24;


  if aTiempo < (3 + mas24*24) then                                                            // [0,3) horas
    result := SimpleRoundTo(precioHora*(aTiempo-mas24*24) + (estadiaCompleta*mas24),-2)
  else if (aTiempo >= (3+mas24*24)) and (aTiempo < (6+mas24*24)) then                       // [3,6) horas
    result := SimpleRoundTo(mediaEstadia + (estadiaCompleta*mas24),-2)
  else                                                                                      // [6, +) horas
    result := SimpleRoundTo(estadiaCompleta*(mas24+1),-2)

end;

function TEstacionamiento.getTipoTarifa(tiempoTotal: Variant): String;
  begin

    if tiempoTotal<3 then
      result := 'Por hora'
    else if (tiempoTotal>=3) and (tiempoTotal<6) then
      result := 'Media estadia'
    else
      result := 'Estadia completa';
  end;


procedure TEstacionamiento.addAuto(aPatente: Integer; aEntrada: TDateTime; aSalida: TDateTime);
var
  tiempoTotal: Variant;
  fechaSalida: Tdatetime;
  Year,Month,Day: Word;
  Hour,Min,Sec,MSec: Word;
  first: boolean;
begin
  SetLength(self.VAutos, cantAutos+1);

  tiempoTotal := StrToFloat(getTime(aEntrada, aSalida));     // 1 = 1 hora

  if tiempoTotal > 24 then begin
    first := True;
    while tiempoTotal > 24 do begin

      if first then begin // Si es la primer iteracion le asigno la fecha de entrada original
        self.VAutos[cantAutos].entrada := aEntrada;
        aEntrada := Incday(aEntrada); //le sumo un dia a la fecha de entrada
        first := false;
      end

      else begin
        self.VAutos[cantAutos].entrada := aEntrada;
        self.VAutos[cantAutos].entrada := RecodeTime(aEntrada,0,0,0,1); // Asigno la hora en 00:00:00
        aEntrada := Incday(aEntrada);
      end;

      self.VAutos[cantAutos].patente := aPatente;

      decodedate(aSalida - (aSalida - (aEntrada-1)),Year,Month,Day); {ej: 12 - (12-(11-1)) = 12 - (12 - 10) = 12 - 2 = 10;}
      self.VAutos[cantAutos].salida := endofaday(Year,Month,Day); //Asigno la hora en 23:59:59

      self.VAutos[cantAutos].tipoTarifa := 'Estadia completa';
      self.VAutos[cantAutos].tarifa := self.addTarifa(24);

      tiempoTotal := tiempoTotal - 24;
      inc(self.cantAutos);
      SetLength(self.VAutos, cantAutos+1);
    end;

    self.VAutos[cantAutos].patente := aPatente;
    self.VAutos[cantAutos].entrada := aEntrada;
    self.VAutos[cantAutos].entrada := RecodeTime(aEntrada,0,0,0,1); // Asigno la hora en 00:00:00

    decodetime(aSalida,Hour,Min,Sec,MSec);

    if tiempoTotal = 24 then begin
      Hour := 23;
      Min := 59;
      Sec := 59;
      MSec := 59;
      aSalida := aSalida - 1;
    end

    else
      Hour := tiempoTotal;

    self.VAutos[cantAutos].salida  := RecodeTime(aSalida,Hour,Min,Sec,MSec);
    self.VAutos[cantAutos].tipoTarifa := getTipoTarifa(tiempoTotal);

  end


  else begin
    self.VAutos[cantAutos].patente := aPatente;
    self.VAutos[cantAutos].entrada := aEntrada;
    self.VAutos[cantAutos].salida  := aSalida;
    self.VAutos[cantAutos].tipoTarifa := getTipoTarifa(tiempoTotal);
  end;

  self.VAutos[cantAutos].tarifa := self.addTarifa(tiempoTotal);
  Inc(self.cantAutos);
end;


function TEstacionamiento.getAuto(index: Integer): RAuto;
begin
  result := self.VAutos[index];
end;


function TEstacionamiento.getCantAutos(): Integer;
begin
  result := self.cantAutos;
end;




////////////////////////////////////////////////////////////////////////////////
///                               Ejercicio 7                            ///////
////////////////////////////////////////////////////////////////////////////////

{ Se asume que el archivo es cargado secuencialmente
   por fecha de entrada }

procedure TEstacionamiento.cargarArchivo();
var
  i: integer;
  registro: RAuto;
  path: string;
  arch: ArchivoDeRegistro;

begin
  path := '..\..\RegistroDeAutos.bin';
  AssignFile(arch,path);

  if FileExists(path) then begin
    Reset(arch);
    Seek(arch,Filesize(arch));
  end

  else begin
    Rewrite(arch);
  end;


  for i := 0 to (self.getCantAutos()-1) do begin
    registro := self.getAuto(i);
    Write(arch, registro);
  end;

  Close(arch);
end;


Function TEstacionamiento.LeerArchivo(): VautosArch;
  var
    i: integer;
    path: string;
    registro: RAuto;
    arch: ArchivoDeRegistro;
    str: string;

    autos: VautosArch;

  begin
    path := '..\..\RegistroDeAutos.bin';
    AssignFile(arch,path);
    Reset(arch);

    i := 0;
    while not EOF(arch) do
    begin
      read(arch, registro);
      SetLength(autos,i+1);
      autos[i] := registro;
      inc(i);
    end;

    Close(arch);
    result := autos;
  end;




function TEstacionamiento.buscarPorFecha(afecha: Tdate): integer; //retorna el indice de la fecha
  var
    registro: RAuto;
    arch: ArchivoDeRegistro;
    path: string;

    fecha: Tdate;
    index,P: integer;
    found: boolean;

  begin
    path := '..\..\RegistroDeAutos.bin';
    Assignfile(arch,path);
    Reset(arch);

    found := false;
    index := -1;
    while not Eof(arch) and (not found) do begin
      Read(arch,registro);

      { Le saco la hora a la fecha de Entrada (Tdatetime) y lo almaceno en "Fecha" para poder hacer
        la comparacion con aFecha (Tdate)}
      P := pos(' ',DatetimeToStr(registro.entrada));
      Fecha := StrToDate( copy(DateTimeToStr(registro.entrada),1,P-1) );

      if (fecha = afecha) then begin
        inc(index);
        found := true;
      end

      else
        inc(index);
    end;

    if not found then
      index := -1;

    result := index;
  end;


procedure TEstacionamiento.tarifasPorDia(aFecha: Tdate; var PorHora,Media,Completa: Double);
  var
    path: string;
    arch: ArchivoDeRegistro;

    fecha: Tdate;
    registro: RAuto;
    indexFecha,P: integer;

  begin

    path := '..\..\RegistroDeAutos.bin';
    AssignFile(arch,path);
    Reset(arch);

    indexFecha := buscarPorFecha(aFecha); // Busco la primer ocurrencia de aFecha

    if indexFecha <> -1 then
      seek(arch,indexFecha); // Posiciono el puntero en la primer ocurrencia de aFecha

    Porhora := 0;
    Media := 0;
    Completa := 0;

    while not EOF(arch) and (indexFecha <> -1) do begin
      read(arch, registro);

      { Le saco la hora a la fecha de Entrada (Tdatetime) y lo almaceno en "Fecha" para poder hacer
        la comparacion con aFecha (Tdate)}
      P := pos(' ',DatetimeToStr(registro.entrada));
      Fecha := StrToDate( copy(DateTimeToStr(registro.entrada),1,P-1) );


      if Fecha <> aFecha then
        break

      else begin
        if registro.tipoTarifa = 'Por hora' then
          Porhora := Porhora + registro.tarifa

        else if registro.tipoTarifa = 'Media estadia' then
          Media := Media + registro.tarifa

        else if registro.tipoTarifa = 'Estadia completa' then
          Completa := Completa + registro.tarifa;

        end; // else

      end; // While
  end; // function



function TEstacionamiento.calcMontoTotalPorDia(FechaInit,FechaEnd: Tdate): Vrecaudaciones;
  var
    MontosPorDia: Vrecaudaciones;
    PorHora,Media,Completa: Double;

    i: integer;
    rango: Double;

  begin

    rango := (FechaEnd - FechaInit)+1;
    SetLength(MontosPorDia, Round(rango));

    for i:= 0 to (Round(rango)) do begin {ej: 12/3/2000 - 31/3/2000 = 19}
      tarifasPorDia(FechaInit,PorHora,Media,Completa);

      MontosPorDia[i].fecha := FechaInit;
      MontosPorDia[i].Monto := (PorHora + Media + Completa);

      FechaInit := Incday(FechaInit,1);
    end;

    result := MontosPorDia;
  end;




end.
