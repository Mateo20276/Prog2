unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  // Mis modulos
  //StackCursor,
  StackArray,
  //StackPointer,
  Tipos;

type
  TForm1 = class(TForm)
    editNumber1: TEdit;
    editNumber2: TEdit;
    Memo1: TMemo;
    buttonEjecutar: TButton;
    labelNumber1: TLabel;
    labelNumber2: TLabel;
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

procedure mcd(n1, n2: Integer; var pila1: Pila);
var elemento: TipoElemento;
begin
  if n1=n2 then begin
    elemento.Clave := 'mcd(' + n1.ToString + ',' + n2.ToString + ')';
    pila1.Apilar(elemento)
  end
  else begin
    if n1>n2 then mcd(n1-n2, n2, pila1)
    else if n1<n2 then mcd(n1, n2-n1, pila1);

    elemento.Clave := 'mcd(' + n1.ToString + ',' + n2.ToString + ')';
    pila1.Apilar(elemento)
  end;


end;


procedure TForm1.buttonEjecutarClick(Sender: TObject);
var
  num1, num2: Integer;
  pila1, pila2: Pila;
  resultado: String;
begin
    num1 := StrToInt(editNumber1.Text);
    num2 := StrToInt(editNumber2.Text);

  if (num1<>0) and (num2<>0) then begin
    pila1.Crear(cadena, 2000);
    pila2.Crear(cadena, 2000);
    mcd(num1, num2, pila1);
    pila2.InterCambiar(pila1, True);
    memo1.Lines.Add(pila2.RetornarClaves)
  end
  else Application.MessageBox('Ingrese un numero distinto de 0', 'error', MB_OK)
end;

end.
