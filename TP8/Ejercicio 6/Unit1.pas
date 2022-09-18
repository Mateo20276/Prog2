unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  Tipos, Conjuntos;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    elementos1: TEdit;
    Label4: TLabel;
    desde1: TEdit;
    Label5: TLabel;
    hasta1: TEdit;
    Label6: TLabel;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    Label1: TLabel;
    hasta2: TEdit;
    Label2: TLabel;
    desde2: TEdit;
    Label3: TLabel;
    elementos2: TEdit;
    StaticText3: TStaticText;
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

function SonIguales(C1, C2: Conjunto): Boolean;
var i, j: Integer;
    X1, X2: TipoElemento;
    encontro: Boolean;
begin
  if C1.CantidadElementos <> C2.CantidadElementos then begin
    result := False;
    Exit;
  end;

  for i := 0 to C1.CantidadElementos do begin
    X1 := C1.Recuperar(i);
    encontro := False;
    for j := 0 to C2.CantidadElementos do begin
      X2 := C2.Recuperar(j);
      if X1.Clave = X2.Clave then encontro := True;
    end;

    if not encontro then Break;
  end;

  result := encontro;
end;


procedure TForm1.Button1Click(Sender: TObject);
var C1, C2: Conjunto;
    cant1, cant2, desd1, desd2, hast1, hast2: Integer;
begin
  memo1.Lines.Clear;

  cant1 := StrToInt(elementos1.Text);
  cant2 := StrToInt(elementos2.Text);
  desd1 := StrToInt(desde1.Text);
  desd2 := StrToInt(desde2.Text);
  hast1 := StrToInt(hasta1.Text);
  hast2 := StrToInt(hasta2.Text);

  if ((hast1 - desd1) < (cant1-1)) or ((hast2 - desd2) < (cant2-1)) then begin
    Application.MessageBox('El rango de valores debe ser mayor o igual a la cantidad de elementos', 'ERROR', MB_OK);
    Exit;
  end;

  C1.LlenarClavesRandom(cant1, desd1, hast1);
  C2.LlenarClavesRandom(cant2, desd2, hast2);

  memo1.Lines.Add('Conjunto 1: ' + #13#10 + C1.RetornarClaves);
  memo1.Lines.Add('Conjunto 2: ' + #13#10 + C2.RetornarClaves);

  if SonIguales(C1, C2) then memo1.Lines.Add('Son iguales')
  else memo1.Lines.Add('No son iguales');
end;

end.
