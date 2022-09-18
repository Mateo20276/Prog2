unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  // Mis modulos
  Tipos,
  //StackCursor
  //StackArray
  StackPointer
  ;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    buttonEjecutar: TButton;
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

function palindromo(x: String): String;
var
  i, count: Integer;
  pila1, pila2, pila3: Pila;
  elemento: TipoElemento;
  flag: Boolean;
begin
  // Cargar pilas
  pila1.Crear(cadena, 50);
  pila2.Crear(cadena, 50);
  count := Length(x)+1;

  for i:=1 to Length(x) do begin
    elemento.Clave := x[i];
    pila1.Apilar(elemento);
    elemento.Clave := x[count-i];
    pila2.Apilar(elemento);
  end;

  Form1.Memo1.Lines.Add('Pila original: ' + #13#10 + pila1.RetornarClaves);

  pila3.Crear(cadena, 50);
  flag := True;
  // Comparar pilas
  while not pila1.EsVacia do begin
    if pila1.Recuperar.Clave <> pila2.Recuperar.Clave then begin
      flag := False;
      Break;
    end;
    elemento := pila1.Recuperar;
    pila3.Apilar(elemento);
    pila1.DesApilar;
    pila2.DesApilar;
  end;

  pila1.InterCambiar(pila3, False);
  Form1.Memo1.Lines.Add('Pila reconstruida: ' + #13#10 + pila1.RetornarClaves);

  if Flag then result := 'Es palindromo'
  else result := 'No es palindromo';
end;


procedure TForm1.buttonEjecutarClick(Sender: TObject);
var
  resultado: String;
begin
  memo1.Lines.Clear;
  resultado := palindromo(edit1.Text);
  memo1.Lines.Add('Resultado: ' + resultado);
end;

end.
