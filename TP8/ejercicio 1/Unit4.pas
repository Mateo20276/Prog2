unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Tipos,Conjuntos;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    editC: TEdit;
    editC1: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  C,C1,C2: Conjunto;


implementation

{$R *.dfm}

function RandomChar(): Char;
const
  CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
begin
  Randomize;
  result := CHARS[Random(CHARS.Length)+1]
end;



procedure TForm4.Button1Click(Sender: TObject);
var x:Tipoelemento;
begin
  x.clave:= editC.text;
  memo1.Lines.Clear();
  C.Agregar(x);

end;

procedure TForm4.Button2Click(Sender: TObject);
var x:Tipoelemento;
begin
  x.clave:= editC1.text;
  memo1.Lines.Clear();
  C1.Agregar(x);
end;

procedure TForm4.Button3Click(Sender: TObject);
var x: TipoElemento;
begin
  memo1.Lines.Clear();
  memo1.Lines.Add('Contunto a:');
  memo1.lines.add(C.RetornarClaves());
  memo1.Lines.Add('Contunto b:');
  memo1.lines.add(C1.RetornarClaves());
  memo1.Lines.Add('Interseccion a + b:');
  C2:= C.Interseccion(C1);
  memo1.Lines.Add(C2.RetornarClaves());
  memo1.Lines.Add('Union a + b:');
  C2:= C.Union(C1);
  memo1.Lines.Add(C2.RetornarClaves());
  memo1.Lines.Add('Diferencia a - b:');
  C2:= C.Diferencia(C1);
  memo1.Lines.Add(C2.RetornarClaves());
  x.clave:= '4';
  memo1.Lines.Add('" '+ x.clave + ' Pertenece a conjunto A: ' + C.Pertenece(x).Tostring + '"' );

end;

procedure TForm4.Button4Click(Sender: TObject);
var x:TipoElemento;

begin
  x.clave:= RandomChar;
  C.agregar(x)
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  C.Crear(Cadena,500);
  C1.Crear(Cadena,500);
  C2.Crear(Cadena,500);

end;

end.
