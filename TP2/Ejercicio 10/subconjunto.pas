unit subconjunto;

interface

uses System.SysUtils;

type

  TConjunto = Array of Integer;

  ClassSubConjunto = object

    private
      subConjunto: Tconjunto;

    public

      constructor Create();

      function getElement(index: integer): integer;
      function getSubConjunto(): Tconjunto;
      function getLength(): integer;
      procedure addElement(element: integer);
      procedure removeLastElement();
      procedure justFirstElement();
      procedure clear();
      function sumar(): Integer;

  end;




implementation

constructor ClassSubConjunto.Create();
  begin
    SetLength(subConjunto,1);
    subConjunto[0] := 0;
  end;


function ClassSubConjunto.getSubConjunto(): Tconjunto;
  begin
    result := SubConjunto;
  end;


function ClassSubconjunto.getElement(index: integer): integer;
  begin
    result := subConjunto[index];
  end;


procedure ClassSubconjunto.addElement(element: integer);
  begin
    SetLength(subConjunto,Length(subConjunto)+1);
    subConjunto[Length(subConjunto)-1] := element;
  end;


procedure ClassSubConjunto.removeLastElement();
  begin
    SetLength(subConjunto,Length(subConjunto)-1);
  end;


procedure ClassSubConjunto.justFirstElement();
  begin
    SetLength(subConjunto,1);
  end;


procedure ClassSubConjunto.clear();
  begin
    SetLength(subConjunto,0);
  end;


function ClassSubConjunto.getLength(): integer;
  begin
    result := Length(subConjunto);
  end;


function ClassSubConjunto.sumar(): Integer;
  var i, suma: Integer;

  begin
    suma := 0;
    for i := 0 to Length(subconjunto)-1 do begin
      suma := suma + subconjunto[i];
    end;

    result := suma;
  end;

end.
