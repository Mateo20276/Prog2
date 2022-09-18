unit Unit_generar_datos_random;

interface
uses system.SysUtils;
type
    generarDatos=object
      public
          function fecha():string;
          function importe():integer;
          function estado():string;
          function numeroActa():string;
    end;

implementation
function generarDatos.numeroActa: string;
var retorno:integer;
begin
    randomize;
    retorno:= random(300000);
    numeroActa:=retorno.ToString;
end;
//------------------------------------------------------------------------------
function generarDatos.estado: string;
var opcion:integer;
begin
   opcion:=0;
   randomize;
   while (opcion= 0) or (opcion>3) do
     begin
         opcion:=random(4);
     end;
   if opcion = 1 then
    begin
        estado:='pendiente';
    end
   else if opcion = 2 then
    begin
        estado:='abonada';
    end
   else if opcion = 3 then
    begin
        estado:='anulada';
    end;
end;
//------------------------------------------------------------------------------
function generarDatos.importe: Integer;
begin
   randomize;
   importe:= random(1000);
end;
//------------------------------------------------------------------------------
function generarDatos.fecha: string;
var dia, mes, año:integer;
          retorno:string;
begin
   randomize;
   dia:=0;
   mes:=0;
   while (dia<1) or (dia>28) do
    begin
        dia:= random(30);
    end;
   while (mes<1) or (mes>12) do
    begin
        mes:= random(12);
    end;

   año:= 2022;
   retorno:=dia.ToString+'/'+mes.ToString+'/'+año.ToString;
   fecha:=retorno;
end;
end.
