unit vectorDeSubconjuntos;

interface

uses System.SysUtils,
     subconjunto;

type

  TVectorDeSubconjuntos = Array of Tconjunto;

  ClassVectorDeSubconjuntos = object

    private
      vectorSubconjuntos: TVectorDeSubconjuntos;

    public
      procedure addSubconjunto(element: TConjunto);
      function existIn(element: TConjunto): boolean;
      function mostrarSubconjuntos(): string;

  end;



implementation


procedure ClassVectorDeSubconjuntos.addSubconjunto(element: TConjunto);
  begin
    SetLength(vectorSubconjuntos,Length(vectorSubconjuntos)+1);
    vectorSubconjuntos[Length(vectorSubconjuntos)-1] := element;
  end;


function ClassVectorDeSubconjuntos.existIn(element: TConjunto): boolean;
  var
    i,j: integer;
    resultado: boolean;

  begin
    resultado := false;

    for i := 0 to Length(vectorSubconjuntos)-1 do begin
      if Length(vectorSubconjuntos[i]) = Length(element) then begin

        resultado := True;
        for j := 0 to Length(element)-1 do begin
          if vectorSubconjuntos[i][j] <> element[j] then begin
            resultado := false;
            break
          end;
        end;

        break
      end;
    end;

    result := resultado;
  end;


function ClassVectorDeSubconjuntos.mostrarSubconjuntos(): string;
  var
    i,j: integer;
    str: string;

  begin

    str := '';
    for i := 0 to Length(vectorSubconjuntos)-1 do begin
      str := str + '( ';
      for j := 0 to Length(vectorSubconjuntos[i])-1 do begin

        if j < Length(vectorSubconjuntos[i])-1 then
          str := str + intToStr(vectorSubconjuntos[i][j]) + ' , '
                                                                  // Evito que al final de la cadena haya una coma
        else
          str := str + intToStr(vectorSubconjuntos[i][j]);

      end;

      str := str + ')' + #13#10;
    end;


    result := str;
  end;



end.
