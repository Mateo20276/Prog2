unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Tipos, Conjuntos;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    editConjuntoA: TEdit;
    editConjuntoB: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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


function CrearConjunto(str: String): Conjunto;
var sep, aux: String;
    P: Integer;
    C: Conjunto;
    X: TipoElemento;
begin
  C.Crear(Numero, 50);
  sep := ',';

  if str.Substring(str.Length, 1) <> sep then
    str := str + sep;

  P := Pos(Sep, str);
  while P > 0 do Begin
    aux := Copy(str, 1, P - 1);

    X.Clave := StrToInt(aux);
    C.Agregar(X);

    str := Copy(str, P + 1, Length(str));
    P := Pos(Sep, str);
  End;

  result := C;
end;


function EsSubconjunto(C1, C2: Conjunto): String;
var Caux: Conjunto;
begin
  // C1 = (3, 4, 5) ;    C2 = (1, 2, 3, 4, 5, 6, 7, 8, 9)
  result := 'Ningun conjunto es subconjunto propio del otro conjunto';

  if C1.CantidadElementos < C2.CantidadElementos then begin
    Caux := C1.Interseccion(C2);
    Caux := C1.Diferencia(Caux);
    if Caux.EsVacio then result := 'A es un subconjunto propio del conjunto B';
  end
  else if C1.CantidadElementos > C2.CantidadElementos then begin
    Caux := C2.Interseccion(C1);
    Caux := C2.Diferencia(Caux);
    if Caux.EsVacio then result := 'B es un subconjunto propio del conjunto A';
  end
  else if C1.CantidadElementos = C2.CantidadElementos then begin
    Caux := C2.Interseccion(C1);
    Caux := C2.Diferencia(Caux);
    if Caux.EsVacio then result := 'Los conjuntos A y B son iguales => Ambos son subconjuntos del otro';
  end;

end;


procedure TForm1.Button1Click(Sender: TObject);
var strA, strB: String;
    C1, C2: Conjunto;
begin
  memo1.Lines.Clear;

  strA := editConjuntoA.Text;
  strB := editConjuntoB.Text;
  C1 := CrearConjunto(strA);
  C2 := CrearConjunto(strB);

  memo1.Lines.Add('Conjunto A');
  memo1.Lines.Add(C1.RetornarClaves);
  memo1.Lines.Add('Conjunto B');
  memo1.Lines.Add(C2.RetornarClaves);

  memo1.Lines.Add(EsSubconjunto(C1, C2));
end;

end.
