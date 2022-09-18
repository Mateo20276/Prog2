unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  ArbolesBinarios,
  ArbolesBinariosAVL,
  ArbolesBinariosBusqueda,

  Tipos;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function crearAVL(arbolInput: ArbolesBinarios.Arbol): ArbolAVL;    // modificar AVL
var
  arbolOutput: ArbolAVL;             // modificar AVL
  elemento: TipoElemento;
  posAVL: ArbolesBinariosAVL.PosicionArbol;

  procedure recorrer(Q: ArbolesBinarios.PosicionArbol);
  begin
    if Q <> Nulo then begin
      elemento := arbolInput.Recuperar(Q);
      arbolOutput.Insertar(elemento);
      recorrer(Q.HI);
      recorrer(Q.HD);
    end;
  end;

begin
  arbolOutput.Crear(arbolInput.DatoDeLaClave, arbolInput.CantidadNodos);
  recorrer(arbolInput.Root);
  result := arbolOutput;
end;


procedure cargarArboles(var BB: ArbolBB; var AVL: ArbolAVL; cantidad: Integer);
var i: Integer;
    elemento: TipoElemento;
begin
  Randomize;
  for i := 1 to cantidad do begin
    elemento.clave := Random(9);
    BB.Insertar(elemento);
    AVL.Insertar(elemento);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var BB: ArbolBB;
    AVL: ArbolAVL;       // cambiar a ArbolAVL  ArbolBB

begin
  memo1.Lines.Clear;
  BB.Crear(numero, 50);
  AVL.Crear(numero, 50);
  cargarArboles(BB, AVL, 9);

  memo1.Lines.Add('Binario Busqueda - PostOrden' + #13#10 + BB.PostOrden);
  memo1.Lines.Add('Binario AVL - PostOrden' + #13#10 + AVL.PostOrden);

  memo1.Lines.Add('Binario Busqueda - InOrden' + #13#10 + BB.InOrden);
  memo1.Lines.Add('Binario AVL - InOrden' + #13#10 + AVL.InOrden);
end;

end.
