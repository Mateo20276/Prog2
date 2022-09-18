unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids;

type
  TForm3 = class(TForm)
    Resultado: TButton;
    Memo1: TMemo;
    MatrizGrid: TStringGrid;
    CargarEjemplo: TButton;
    procedure ResultadoClick(Sender: TObject);
    procedure CargarEjemploClick(Sender: TObject);
    procedure MatrizGridKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TMatriz = array[0..6] of array[0..12] of String; //7x13 matriz Hardcode
  Tmovimiento = Record
    x:Integer;
    y:Integer;

  End;

  Tmovimientos = Array of Tmovimiento;


var
  Form3: TForm3;
  MOriginal, MAuxiliar: Tmatriz;   // es global, no debe modificarse, y se actualiza fuera de la funcion recursiva


implementation

{$R *.dfm}


procedure LoadMatriz(); // Cargamos la matriz auxiliar con puntos y la original
var
  i,j: Integer;
begin
  for i := 0 to Length(MOriginal)-1 do
    for j := 0 to Length(MOriginal[0])-1 do
    begin
       moriginal[i][j]:= Form3.MatrizGrid.Cells[j,i];
       mauxiliar[i][j]:= '.';
    end;

end;




function readRecorrido(recorrido: TMovimientos): String;
var
  i: Integer;
begin
  result := 'Solucion: ' + #13#10;
  for i := 0 to Length(recorrido)-1 do
    result := result + '(' + IntToStr(recorrido[i].x) + ';' + IntToStr(recorrido[i].y) + ')' + #13#10;
end;

// FUNCION RECURSIVA Y ACUMULADORA

function buscarCadena(Moriginal,Mauxiliar: Tmatriz): String;
var
  VectorAuxiliar, VectorResultado: TMovimientos;

    // INICIO Funcion Recursividad directa parametros acumuladores
    function recBuscarCadena(x,y: integer; Moriginal,Mauxiliar: Tmatriz; VectorAuxiliar: TMovimientos): Tmovimientos;
    begin
      Mauxiliar[y,x] := 'C';

      // ARRIBA
      if(y-1 >= 0) then
      begin
        if ((Moriginal[y-1,x]= 'C') and (Mauxiliar[y-1,x] = '.')) then
            begin
            SetLength(VectorAuxiliar,length(VectorAuxiliar) + 1);
            vectorAuxiliar[Length(vectorAuxiliar)-1].x := x;
            vectorAuxiliar[Length(vectorAuxiliar)-1].y := y - 1;

            recBuscarCadena(x,y-1,Moriginal,Mauxiliar, VectorAuxiliar);
            SetLength(VectorAuxiliar,length(VectorAuxiliar) - 1);
            end;
      end;

      // DERECHA
      if (x+1 < Length(Moriginal[0])) then
      begin
        if ((Moriginal[y,x+1] = 'C') and (Mauxiliar[y,x+1] = '.')) then
          begin
          SetLength(VectorAuxiliar,length(VectorAuxiliar) + 1);

          vectorAuxiliar[Length(vectorAuxiliar)-1].x := x + 1;
          vectorAuxiliar[Length(vectorAuxiliar)-1].y := y;
          recBuscarCadena(x+1,y,Moriginal,Mauxiliar, VectorAuxiliar);
          SetLength(VectorAuxiliar,length(VectorAuxiliar) - 1);
          end;
      end;

      // ABAJO
      if(y+1 < Length(Moriginal)) then
      begin

        if ((Moriginal[y+1,x] = 'C') and (Mauxiliar[y+1,x] = '.')) then
            begin
            SetLength(VectorAuxiliar,length(VectorAuxiliar) + 1);
            vectorAuxiliar[Length(vectorAuxiliar)-1].x := x;
            vectorAuxiliar[Length(vectorAuxiliar)-1].y := y + 1;

            recBuscarCadena(x,y+1,Moriginal,Mauxiliar, VectorAuxiliar);
            SetLength(VectorAuxiliar,length(VectorAuxiliar) - 1);
            end;
      end;

      // IZQUIERDA
      if(x-1 >= 0) then
      begin
        if ((Moriginal[y,x-1] = 'C') and (Mauxiliar[y,x-1] = '.')) then
            begin
            SetLength(VectorAuxiliar,length(VectorAuxiliar) + 1);

            vectorAuxiliar[Length(vectorAuxiliar)-1].x := x - 1;
            vectorAuxiliar[Length(vectorAuxiliar)-1].y := y;
            recBuscarCadena(x-1,y,Moriginal,Mauxiliar, VectorAuxiliar);
            SetLength(VectorAuxiliar,length(VectorAuxiliar) - 1);
            end
      end;

      Mauxiliar[y,x] := '.';

      if(Length(VectorResultado) < Length(VectorAuxiliar)) then
      begin
        VectorResultado:= VectorAuxiliar;
        result:= VectorResultado
      end;

    end;
    // FIN Funcion Recursividad directa parametros acumuladores

begin
   SetLength(VectorAuxiliar, 1);
   VectorAuxiliar[0].x := 0;
   VectorAuxiliar[0].y := 0;

   recBuscarCadena(0,0,moriginal,mauxiliar, VectorAuxiliar);
   result := readRecorrido(VectorResultado);
end;


// Main


procedure TForm3.MatrizGridKeyPress(Sender: TObject; var Key: Char);// Escriba "C" si quiere cambiar la cadena, si quiere poner un ponto escriba cualquier caracter
begin

 TEdit(MatrizGrid.Controls[0]).Text := #0;
 Key:= UpCase(Key);
 if (key<>'C') then
    key := '.';

end;

procedure TForm3.ResultadoClick(Sender: TObject);
var
  solucion: String;
begin
  Memo1.Lines.Clear();
  LoadMatriz();

  solucion := buscarCadena(Moriginal, Mauxiliar);

  Memo1.Lines.Add(solucion);
end;


// EJEMPLO

procedure TForm3.CargarEjemploClick(Sender: TObject);
var
  i,j: Integer;
begin
  for i := 0 to Length(MOriginal[0])-1 do
    begin
    for j := 0 to Length(MOriginal[0])-1 do
      begin
          Form3.MatrizGrid.Cells[j,i]:= '.';
      end;
    end;
  MatrizGrid.Cells[0,0]  := 'C';

  MatrizGrid.Cells[0,1]  := 'C';
  MatrizGrid.Cells[1,1]  := 'C';
  MatrizGrid.Cells[1,2]  := 'C';
  MatrizGrid.Cells[1,3]  := 'C';
  MatrizGrid.Cells[1,4]  := 'C'; // aca se divide en 2

  MatrizGrid.Cells[1,5]  := 'C';
  MatrizGrid.Cells[1,6]  := 'C';

  MatrizGrid.Cells[2,4]  := 'C';
  MatrizGrid.Cells[3,4]  := 'C'; // aca se divide en 2

  MatrizGrid.Cells[3,3]  := 'C';
  MatrizGrid.Cells[3,2]  := 'C';
  MatrizGrid.Cells[3,1]  := 'C';
  MatrizGrid.Cells[4,4]  := 'C';
  MatrizGrid.Cells[5,4]  := 'C';
  MatrizGrid.Cells[6,4]  := 'C';
  MatrizGrid.Cells[7,4]  := 'C';
  MatrizGrid.Cells[8,4]  := 'C';
  MatrizGrid.Cells[9,4]  := 'C';
  MatrizGrid.Cells[9,3]  := 'C';
  MatrizGrid.Cells[9,2]  := 'C';


end;



end.

