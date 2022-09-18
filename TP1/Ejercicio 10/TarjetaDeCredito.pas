unit TarjetaDeCredito;

interface

uses
  SysUtils, Math;

type
  TTarjetaDeCredito = object
    private
      // Informacion de la Tarjeta
      numero: String;
      fechaVencimiento: TDate;
      entidadEmisora: String;
      // Creditos
      limiteUnicaCuota: Double;
      limiteMultiplesCuotas: Double;

      // Procedimientos Privados
      function validarFecha(fecha: TDate): Boolean;
      function validarNumero(input: String; var emisora: String): Integer;  // retorna un numero status_code
      function validarLimiteU(limite: Integer): Boolean;       // no es necesaria porque se valida en el form, pero lo ponemos para que el TAD se autoproteja
      function validarLimiteM(limite: Integer): Boolean;

      function calcularLimiteUCuota(monto: Double; cuotas: Integer): Integer;
      function calcularLimiteMCuotas(monto: Double; cuotas: Integer): Integer;

    public
      function crearTarjeta(aNumero: String; aFecha: TDate; aLimiteU, aLimiteM: Integer): Integer;   // Integer: status_code

      function getEntidadEmisora(): String;
      function getNumeroTarjeta(): String;
      function getFechaVencimiento(): String;
      function getLimiteUnicaCuota(): String;
      function getLimiteMultiplesCuotas(): String;

      function comprar(monto: Double; cuotas: Integer): Integer;

  end;


implementation




{ TTarjetaDeCredito }


{ TTarjetaDeCredito }


// CREATE

function TTarjetaDeCredito.crearTarjeta(aNumero: String; aFecha: TDate; aLimiteU, aLimiteM: Integer): Integer;
var
  statusNumero: Integer;
  statusFecha, statusLimiteU, statusLimiteM: Boolean;
  emisora: String;

// Codigos de estado
// 0 -> OK
begin
  statusNumero := validarNumero(aNumero, emisora);
  statusFecha := validarFecha(aFecha);
  statusLimiteU := validarLimiteU(aLimiteU);
  statusLimiteM := validarLimiteM(aLimiteM);

  if (statusNumero=0) and statusFecha and statusLimiteU and statusLimiteM then
    begin
      self.numero := aNumero;
      self.fechaVencimiento := aFecha;
      self.entidadEmisora := emisora;
      self.limiteUnicaCuota := aLimiteU;
      self.limiteMultiplesCuotas := aLimiteM;
      result := 0;
    end
  else
    begin
     if statusNumero <> 0 then             // numero de cuenta invalido
      result:= statusNumero
     else if not(statusFecha) then         // fecha es menor o igual a la actual
      result:= 5
     else if not(statusLimiteU) then       // limite es menor a 0
      result:= 6
     else if not(statusLimiteM) then       // limite es menor a 0
      result:= 7

    end;

end;


// Funciones GET

function TTarjetaDeCredito.getEntidadEmisora: String;
begin
  result := self.entidadEmisora;
end;



function TTarjetaDeCredito.getFechaVencimiento: String;
var i: Integer;
s: String;
begin
  s := DateToStr(self.fechaVencimiento);

  result := '';
  for i := 4 to 10 do
    result := result + s[i];

end;



function TTarjetaDeCredito.getLimiteUnicaCuota: String;
begin
  result := FloatToStr(self.limiteUnicaCuota);
end;



function TTarjetaDeCredito.getLimiteMultiplesCuotas: String;
begin
  result := FloatToStr(self.limiteMultiplesCuotas);
end;



function TTarjetaDeCredito.getNumeroTarjeta: String;
begin
  result := self.numero;
end;



// Validaciones CREATE


function TTarjetaDeCredito.validarFecha(fecha: TDate): Boolean;
begin
  result :=  Date < fecha;
end;



function TTarjetaDeCredito.validarLimiteM(limite: Integer): Boolean;
begin
  result := limite>0;
end;


function TTarjetaDeCredito.validarLimiteU(limite: Integer): Boolean;
begin
  result := limite>0;
end;



function TTarjetaDeCredito.validarNumero(input: String; var emisora: String): Integer;
var
  i, suma, resto: Integer;
  vDigitos: Array[0..15] of Integer;   // o [0..15]
  first4numbers: Integer;

begin
  result := 0;                        // status_code 0: OK

  if Length(input)>16 then            // *se valida desde la interfaz, pero lo agrego para el TAD
    result := 1                       // status_code 1: digitos excedidos
  else if Length(input)<16 then
    result := 2;                       // status_code 2: digitos insuficientes

  if ((result<>1) and (result<>2)) then
  begin
    first4numbers := StrToInt(input[1] + input[2] + input[3] + input[4]);
    emisora := '';

    if input[1]='4' then         // o probar self.numero[0]
      emisora := 'Visa'

    else if input[1]='3' then
      case input[2] of
        '4'..'7': emisora:= 'American Express';
      end

    else if input[1]='5' then
      case input[2] of
        '0': emisora:= 'Maestro';
        '6'..'8': emisora:= 'Maestro';               // rango [56, 58]
        '1'..'5': emisora:= 'Mastercard';            // rango [51, 55]
      end

    else if (((2720 - first4numbers) <= 699) and ((2720 - first4numbers) >= 0))then
      emisora := 'Mastercard';

    if emisora='' then
      result := 3
    else
      begin
      suma := 0;
      for i := 1 to Length(input) do   // si no anda, usar for i := 1 to Length(input) do
        begin
          if ((i-1) mod 2)=0 then
            begin
            vDigitos[i-1] := StrToInt(input[i])*2;
            if vDigitos[i-1] < 10 then
              suma := suma + vDigitos[i-1]
            else
              suma := suma + vDigitos[i-1] - 10 + 1
            end
          else
            begin
            vDigitos[i-1] := StrToInt(input[i]);
            suma := suma + vDigitos[i-1];
            end;
        end;

      resto := suma mod 10;
      if resto<>0 then
        result := 3                      // status_code 3: numero invalido
      end;
  end;
end;



// COMPRAS


function TTarjetaDeCredito.comprar(monto: Double; cuotas: Integer): Integer;
var statusLimU, statusLimM: Integer;
begin
  result := 0;
  statusLimU := calcularLimiteUCuota(monto, cuotas);
  statusLimM := calcularLimiteMCuotas(monto, cuotas);

  if statusLimM<>0 then
    result := statusLimM
  else if statusLimU<>0 then
    result := statusLimU;

end;



function TTarjetaDeCredito.calcularLimiteUCuota(monto: Double; cuotas: Integer): Integer;
var limite: Double;
begin
  limite := self.limiteUnicaCuota;

  if self.limiteUnicaCuota>=0 then
    if cuotas = 1 then
    begin
      if (self.getEntidadEmisora()='Visa') or (self.getEntidadEmisora()='American Express') then
        limite := limite - monto*0.8
      else
        limite := limite - monto
    end
    else
      limite := limite - (monto/cuotas);


    if (limite<0) and (cuotas=1) then
      begin
        result := 1;
        self.limiteUnicaCuota := 0;

      end
    else if (limite<0) and (cuotas>1) then
      begin
        result := 2;
        self.limiteUnicaCuota := 0;

      end
    else
      begin
        result := 0;
        self.limiteUnicaCuota := limite;
      end;

end;



function TTarjetaDeCredito.calcularLimiteMCuotas(monto: Double; cuotas: Integer): Integer;
var
  cuota, limite: Double;
begin
  limite := self.limiteMultiplesCuotas;
  if cuotas <> 1 then
    if self.limiteUnicaCuota-(monto/cuotas)>=0 then
      begin
        if self.limiteMultiplesCuotas>=0 then
          begin
            if cuotas <= 6 then
              begin
               cuota := (monto/cuotas);
               limite := limite - ((cuota*0.9)*(cuotas - 1))
              end
            else
              begin
               cuota := (monto/cuotas);
               limite := limite - ((cuota*0.7)*(cuotas - 1));
              end;
          end;

        if limite<0 then
          result := 3
        else
          begin
          result := 0;
          self.limiteMultiplesCuotas:= limite;
          end;
      end
    else
      result := 2;
end;



end.
