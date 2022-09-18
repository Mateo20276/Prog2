unit ObtenerPrecios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,main;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    EditHora: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditEstadiaC: TEdit;
    EditMEstadia: TEdit;
    Label5: TLabel;
    BtnListo: TButton;
    procedure BtnListoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}


procedure TForm3.BtnListoClick(Sender: TObject);
  begin
    Form1.ActualizarPrecios(EditHora.text,EditMEstadia.text,EditEstadiaC.text);
    Form3.Close();
    Form1.Show();
  end;


procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    if (EditHora.text <> '') and (EditMEstadia.text <> '') and (EditEstadiaC.text <> '') then
      CanClose := True

    else begin
      MessageDlg('Debe Ingresar las Tarifas !!!',mtError,[mbOK],0);
      CanClose := false;
    end;

  end;

procedure TForm3.FormCreate(Sender: TObject);
  begin
    Form3.ShowModal();
  end;

end.
