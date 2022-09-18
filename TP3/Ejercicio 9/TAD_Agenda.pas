unit TAD_Agenda;

interface //Agregar o eliminar TAD Lista a preferencia
  Uses Unit_tipos, ListPointer,System.SysUtils;
Type
    TAgenda = Object
      Private
      Lista: Lista;
      Public
       function Ordenada(x: Lista): Lista;
       function Tiempo_Libre(x: Lista): Integer;
       function Horario_Especifico(x: Lista; tbuscado: TTime): String;
       function Porcentaje_Ocupacion(x: Lista): Double;
      End;
implementation
{ TAgenda }
function TAgenda.Tiempo_Libre(x: Lista): integer;
var
  elemento: tipoElemento;
  Q: PosicionLista;
  l: Variant;
  cont: Integer;

begin
  Q:=x.Comienzo;
  l:= 0;
  cont:=0;

  while Q <> Nulo do begin
    if l > 720 then
     begin
        exit
     end;
    l := l + StrToInt(X.Recuperar(Q).Valor1);
    Q := x.Siguiente(Q);

    cont:= cont + 1
 end;
 result:= (720 - l) / cont
end;





function TAgenda.Ordenada(x: Lista): Lista;   // Ordena la lista con los horarios

var
  elemento: tipoElemento;
  Q: PosicionLista;
  l: Integer;
  Tiempo: TTime;
  horas, minutos: Integer;
  numero: Integer;
 begin
  numero:= Tiempo_Libre(x);
  Q:=x.Comienzo;
  Tiempo:= StrToTime('09:00:00');
  Lista.Crear(Cadena,50);
  while Q <> Nulo do begin

    elemento.Clave:= X.Recuperar(Q).Clave;
    elemento.Valor1:= TimeToStr(Tiempo);
    self.Lista.Agregar(elemento);

    horas:=  (X.Recuperar(Q).Valor1 + numero) div 60;
    minutos:= (X.Recuperar(Q).Valor1 + numero) mod 60;
    Tiempo:= Tiempo + StrToTime(horas.ToString + ':' + minutos.ToString );
    Q:= x.Siguiente(Q);
  end;
  Result:= Lista;
end;


function TAgenda.Horario_Especifico(x: Lista;tbuscado: TTime): String; // Retorna en que esta ocurriendo en determinado horario
var
  elemento: tipoElemento;
  Q, fin,R,anterior,anterior1: PosicionLista;
  horas, minutos,numero: Integer;
  tiempo,g: TTime;


begin
  Q:= Lista.Comienzo;
  R:= x.Comienzo;
  fin:= Lista.Fin;
  Result:= 'Tiempo Libre';
  g:= StrToTime(Lista.Recuperar(Q).Valor1);
  while Q <> Nulo do
    begin
    anterior:= x.anterior(R);
    anterior1:= Lista.anterior(Q);
    if (tbuscado > g) and (Lista.Siguiente(Q) <> nulo) then
      begin
        Q := Lista.Siguiente(Q);
        R := x.Siguiente(R);
        if Lista.Siguiente(Q) <> nulo  then
        begin
          g:= StrToTime(Lista.Recuperar(Q).Valor1);
        end
        else
        begin
          g:= StrToTime(Lista.Recuperar(fin).Valor1);
        end;


      end
    else
      begin
         if tbuscado > StrToTime(Lista.Recuperar(Q).Valor1) then
         begin
            horas:= x.Recuperar(R).Valor1 div 60;
            minutos:=  x.Recuperar(R).Valor1 mod 60;
            tiempo:= StrToTime(Lista.Recuperar(Q).Valor1) + StrToTime(horas.ToString + ':' + minutos.ToString);
            if tiempo > tbuscado then
            begin
              Horario_Especifico:= Lista.Recuperar(Q).Clave;
              exit
            end
          else
            begin
              Horario_Especifico:= 'Tiempo Libre';
              exit
            end;
         end

         else
          begin
            horas:= x.Recuperar(anterior).Valor1 div 60;
            minutos:=  x.Recuperar(anterior).Valor1 mod 60;
            tiempo:= StrToTime(Lista.Recuperar(anterior1).Valor1) + StrToTime(horas.ToString + ':' + minutos.ToString);
          if tiempo > tbuscado then
            begin
              Horario_Especifico:= Lista.Recuperar(anterior1).Clave;
              exit
            end
          else
            begin
              Horario_Especifico:= 'Tiempo Libre';
              exit
            end;
         end;

      end;
  end;
end;

function TAgenda.Porcentaje_Ocupacion(x: Lista): Double;  // Retorna porcentaje de ocupacion
Var
  suma: Double;
  Q: PosicionLista;
begin
  Q:=x.Comienzo;
  suma:= 0;
  while Q <> Nulo do begin
    suma:= suma + StrToInt(x.Recuperar(Q).Valor1);
    Q := x.Siguiente(Q);

 end;
 Result:= (suma / 720) * 100
end;


end.
