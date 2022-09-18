unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  // Mis modulos
  //StackPointer,
  StackArray,
  //StackCursor,
  Tipos;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    buttonEjecutar: TButton;
    captionNumber: TLabel;
    labelBase: TLabel;
    Memo1: TMemo;
    procedure buttonEjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function valorHex(x: Integer): String;
begin
  case x of
    10: result := 'A';
    11: result := 'B';
    12: result := 'C';
    13: result := 'D';
    14: result := 'E';
    15: result := 'F';
  end;
end;


procedure recursiva(n, b: Integer; var pila1: Pila);
var elemento: TipoElemento;
begin
  if n<b then begin
    elemento.Clave := IntToStr(n mod b);
    if elemento.Clave>9 then
      elemento.Clave := valorHex(elemento.Clave);
    pila1.Apilar(elemento);
  end
  else begin
    recursiva(n div b, b, pila1);
    elemento.Clave := IntToStr(n mod b);
    if elemento.Clave>9 then
      elemento.Clave := valorHex(elemento.Clave);
    pila1.Apilar(elemento);
  end;
end;


function output(var pila1: Pila): String;
begin
  result := 'Resultado: ';
  while not pila1.EsVacia do begin
    result := result + pila1.Recuperar.Clave;
    pila1.DesApilar;
  end;
end;


procedure TForm1.buttonEjecutarClick(Sender: TObject);
var
  pila1, pila2: Pila;
  n, b: String;

begin
  memo1.Lines.Clear;

  n := edit1.Text;
  b := edit2.Text;
  if (b.ToInteger<=1) or (b.ToInteger>16) then Application.MessageBox('Numero invalido', 'error', MB_OK)
  else begin
    pila1.Crear(Cadena, 50);
    recursiva(StrToInt(n), StrToInt(b), pila1);
    pila2.Crear(Cadena, 50);
    pila2.InterCambiar(pila1, True);
    memo1.Lines.Add(pila2.RetornarClaves);
    memo1.Lines.Add(output(pila2));
  end;

end;

end.
