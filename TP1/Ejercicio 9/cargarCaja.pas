unit cargarCaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  //Mis modulos
  cajaRegistradora,main;


type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    BtnTerminar: TButton;
    GroupBox2: TGroupBox;
    ButtonCargar: TButton;
    ComboBoxTipoBilleteCarga: TComboBox;
    EditMontoCarga: TEdit;

    procedure ButtonCargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnTerminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  indexComboBox: sumabilletes;

implementation

{$R *.dfm}


procedure TForm2.FormCreate(Sender: TObject);
  var
    i: integer;
    j: billetes;

  begin
    j := B1000;
    for i := 0 to Length(indexComboBox)-1 do begin // Viculo los indices del combo box con los indices billetes(B1000,B500...)
      indexComboBox[j] := i; // Ej: B1000 = 0, B500 = 1
      inc(j);
    end;

    Form1.Hide();
    Form2.ShowModal();
  end;


procedure TForm2.ButtonCargarClick(Sender: TObject);
  var
    index: billetes;
    found: boolean;

  begin
    if EditMontoCarga.Text = '' then
      MessageDlg('Ingrese algun monto',mtERROR,[mbOK],0)

    else begin
      index := B1000;
      found := false;

      while not found do begin
        if ComboBoxTipoBilleteCarga.ItemIndex = indexCombobox[index] then
          found := True

        else
          inc(index);
      end;

      caja.cargar(index,StrToInt(EditMontoCarga.Text));
    end;
  end;


procedure TForm2.BtnTerminarClick(Sender: TObject);
  begin
    Form2.Close();
  end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Form1.Show();
  end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  begin
    CanClose := True;
    if (caja.saldoTotal() = 0) then begin
      MessageDlg('No puede iniciar con la caja vacia',mtERROR,[mbOK],0);
      CanClose := false;
    end;

  end;

end.
