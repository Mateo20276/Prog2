unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  QueuesPointer,
  Tipos;

type
  TForm1 = class(TForm)
    editCola2: TEdit;
    buttonEjecutar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    editCola1: TEdit;
    Memo1: TMemo;
    procedure editCola2KeyPress(Sender: TObject; var Key: Char);
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


function mismosElementos(strC1, strC2: String; var cola1, cola2: Cola): Boolean;
var i, j: Integer;
    elementoC1, elementoC2: TipoElemento;
    flag: Boolean;
begin
  result := True;
  for i := 1 to Length(strC1) do begin
    elementoC1 := cola1.Recuperar;
    flag := False;
    for j := 1 to Length(strC2) do begin
      elementoC2 := cola2.Recuperar;
      if elementoC1.Clave = elementoC2.Clave then flag := True;
      cola2.DesEncolar;
      cola2.Encolar(elementoC2);
    end;
    if flag = False then result := False;
    cola1.DesEncolar;
    cola1.Encolar(elementoC1);
  end;
end;


procedure cargarCola(str: String; var cola1: Cola);
var i: Integer;
    elemento: TipoElemento;
begin
  cola1.Crear(Cadena, 100);
  for i := 1 to Length(str) do begin
    elemento.Clave := str[i];
    cola1.Encolar(elemento);
  end;
end;



procedure TForm1.buttonEjecutarClick(Sender: TObject);
var strC1, strC2, output: String;
    cola1, cola2: Cola;
begin
  memo1.Clear;
  strC1 := editCola1.Text;
  strC2 := editCola2.Text;
  cargarCola(strC1, cola1);
  cargarCola(strC2, cola2);

  if mismosElementos(strC1, strC2, cola1, cola2) then memo1.Lines.Add('Verdadero')
  else memo1.Lines.Add('Falso');

  // Verificar que las colas no se destruyeron
//  memo1.Lines.Add('Cola 1:' + #13#10 + cola1.RetornarClaves);
//  memo1.Lines.Add('Cola 2:' + #13#10 + cola2.RetornarClaves);
end;





procedure TForm1.editCola2KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if (not (key in ['A'..'Z', '0'..'9'])) and (key<>#8) then
    key := #0;
end;

end.
