unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  // Mis modulos
  ArbolesBinariosBusqueda,
  Unit2;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    buttonAlta: TButton;
    editCuit: TEdit;
    Label1: TLabel;
    editRazonSocial: TEdit;
    Label2: TLabel;
    editDomicilio: TEdit;
    Label3: TLabel;
    editTelefono: TEdit;
    Label4: TLabel;
    editCelular: TEdit;
    Label5: TLabel;
    StaticText1: TStaticText;
    editSearchCuit: TEdit;
    Label6: TLabel;
    StaticText2: TStaticText;
    buttonBuscarCUIT: TButton;
    buttonBaja: TButton;
    editEliminarCuit: TEdit;
    Label7: TLabel;
    StaticText4: TStaticText;
    procedure buttonAltaClick(Sender: TObject);
    procedure buttonBuscarCUITClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonBajaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Archivo;
  arbolCUIT: ArbolBB;

implementation

{$R *.dfm}


procedure TForm1.buttonBajaClick(Sender: TObject);
var user: Usuario;
begin
  memo1.Lines.Clear;

  user.CUIT := editEliminarCuit.Text;
  
  if Baja(user, arbolCUIT, A) then begin
    Memo1.Lines.Add('Usuario dado de baja satisfactoriamente');
  end
  else Memo1.Lines.Add('Usuario no encontrado');

  A.GenerarIndex();
end;


procedure TForm1.buttonAltaClick(Sender: TObject);
var user: Usuario;
    CUIT, razonSocial, domicilio, telefono, celular: ShortString;

begin
  memo1.Lines.Clear;

  CUIT := editCUIT.Text;
  razonSocial := editRazonSocial.Text;
  domicilio := editDomicilio.Text;
  telefono := editTelefono.Text;
  celular := editCelular.Text;
  
  A.Inicializar;
  arbolCUIT := A.GenerarIndex;

  user.Crear(CUIT, razonSocial, domicilio, telefono, celular);
  if Alta(user, arbolCUIT, A) then
    Memo1.Lines.Add('Usuario registrado correctamente')
  else Memo1.Lines.Add('Usuario ya registrado');

  A.GenerarIndex();
end;



procedure TForm1.buttonBuscarCUITClick(Sender: TObject);
var user: Usuario;
begin
  memo1.Lines.Clear;

  user.CUIT := editSearchCuit.Text;
  user := Buscar(user, arbolCUIT, A);

  Memo1.Lines.Add(IntToStr(A.size));
  
  if user.CUIT <> Null then begin
    Memo1.Lines.Add('Usuario encontrado satisfactoriamente');
    Memo1.Lines.Add(user.printData());
  end
  else Memo1.Lines.Add('Usuario no encontrado');

//  Memo1.Lines.Add(arbolCUIT.InOrden)
end;



procedure TForm1.FormCreate(Sender: TObject);
begin
  A.Inicializar;
  arbolCUIT := A.GenerarIndex;
end;

end.
