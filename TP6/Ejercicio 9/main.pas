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

//    if (arbolInput.HijoIzquierdo(posSimple) = Nulo) and (arbolInput.HijoDerecho(posSimple) = Nulo) then begin
//      elemento := arbolInput.;
//    end;
  end;

begin
  arbolOutput.Crear(arbolInput.DatoDeLaClave, arbolInput.CantidadNodos);
  recorrer(arbolInput.Root);
  result := arbolOutput;
end;




procedure TForm1.Button1Click(Sender: TObject);
var bSimple: Arbol;
    AVL: ArbolAVL;       // cambiar a ArbolAVL  ArbolBB

begin
  memo1.Lines.Clear;
  bSimple.Crear(numero, 50);
  bSimple.CargarArbol;
  memo1.Lines.Add('Binario Simple' + #13#10 + bSimple.PreOrden);
  AVL := crearAVL(bSimple);

  memo1.Lines.Add(#13#10);
  memo1.Lines.Add('AVL' + #13#10 + AVL.PostOrden);
end;

end.
