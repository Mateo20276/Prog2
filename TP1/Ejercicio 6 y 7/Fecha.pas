unit Fecha;

interface

type
  TFecha = object
    private
      dia: Integer;
      mes: Integer;
      año: Integer;
      function validate(aDia: Integer; aMes: Integer; aAño: Integer): Integer;
    public

      function create(aDia: Integer; aMes: Integer; aAño: Integer): Integer;
      function dayDifference(aFecha: TFecha): Integer;
  end;


implementation



function TFecha.create(aDia: Integer; aMes: Integer; aAño: Integer): Integer;
var flag: Integer;
begin
  flag := validate(aDia, aMes, aAño);

  if flag=0 then
    begin
      self.dia := aDia;
      self.mes := aMes;
      self.año := aAño;
    end
  else if flag=1 then
    result := flag  // 'Dia invalido'
  else if flag=2 then
    result := flag  //'Mes invalido'
  else if flag=3 then
    result := flag;  // 'Año invalido';

end;



function TFecha.validate(aDia: Integer; aMes: Integer; aAño: Integer): Integer;
var cantidadDias: Integer;
// result = status_code
begin
  result := 0;
  case aMes of
    2: cantidadDias := 28;
    1, 3, 5, 7, 8, 10, 12: cantidadDias := 31;
    4, 6, 9, 11: cantidadDias := 30;
  else
    result := 2;             // ok=0, errores: dia=1, mes=2, a単o=3
  end;

  if ((aAño mod 4)= 0) and (aMes=2) then
    cantidadDias := cantidadDias+1;

  if (result<>2) and ((aDia<1) or (aDia>cantidadDias)) then
    result := 1;

end;




function TFecha.dayDifference(aFecha: TFecha): Integer;
var difDia, difMes, difAño: Integer;

begin
  difAño := self.año - aFecha.año;
  difMes := self.mes - aFecha.mes;
  difDia := self.dia - aFecha.dia;

  result := 1;
end;


end.
