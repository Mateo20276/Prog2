unit Unit_generador_random_de_patentes;

interface
uses system.SysUtils;

type
    generarPatente = object
      private
      public
          function generarPatente():string;
          function obtenerRandom(cadena:string):integer;
    end;
implementation
function generarPatente.generarPatente: string;
var letras,numeros,patente,caracter:string;
    i:integer;
begin
    letras:='ABCDEFGHIJKLMNÑOPQRSTUVWXYZ';
    numeros:='0123456789';

    for i := 1 to 7 do
      begin
          caracter:='';
          if i<4 then
           begin
               while  (caracter='') or (caracter = ' ') do
                  begin
                     caracter:=letras[obtenerRandom(letras)];
                  end;
               patente:=patente + caracter;
           end
          else if i=4 then
           begin
               patente:=patente + ' ';
           end
          else if i>4 then
           begin
              while  (caracter='') or (caracter = ' ') do
                  begin
                     caracter:=numeros[obtenerRandom(numeros)];
                  end;
               patente:=patente + caracter;
           end;
      end;
    generarPatente:=patente;
end;

function generarPatente.obtenerRandom(cadena: string): Integer;
var datoRandom:integer;
begin
    datoRandom:=length(cadena)+1;
    randomize;
    while (datoRandom = 0) or (datoRandom > length(cadena)) do
        begin
            datoRandom:= random(length(cadena))
        end;
    obtenerRandom:= datoRandom;
end;
end.
