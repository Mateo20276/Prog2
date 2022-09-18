unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Tipos, Listcursor, Stackcursor;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
var L: Lista;
  X: Tipoelemento;
begin
  Memo1.clear();
 L.Crear(Numero, 10);
 L.LlenarClavesRandom(10,2,4);
 Memo1.Lines.Add(L.RetornarClaves );
 x.clave:= 4;
 L.eliminarelemenTO(X);
 Memo1.Lines.add('----------------------');
 Memo1.Lines.add(L.RetornarClaves)

end;



procedure TForm4.Button2Click(Sender: TObject);

var P: pila;
  X: Tipoelemento;
begin
  Memo1.clear();
  p.Crear(Numero, 10);
  p.LlenarClavesRandom(10,2,4);
  Memo1.Lines.Add(p.RetornarClaves );
  x.clave:= 4;
  p.eliminarelemento(x);
  Memo1.Lines.add('----------------------');
  Memo1.Lines.add(p.RetornarClaves);

end;
end.
