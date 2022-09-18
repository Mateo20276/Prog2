unit FormAñadirMulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers;

type
  TForm1 = class(TForm)
    labelPatente: TLabel;
    labelMulta: TLabel;
    Edit1: TEdit;
    labelFecha: TLabel;
    labelNumActa: TLabel;
    labelImporte: TLabel;
    labelEstado: TLabel;
    Edit2: TEdit;
    Edit4: TEdit;
    comboBoxEstado: TComboBox;
    DatePicker1: TDatePicker;
    buttonCargarMulta: TButton;
    procedure comboBoxEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure buttonCargarMultaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



// VALIDACIONES - ACTIVAR BOTON DE CARGA DE DATOS

procedure TForm1.buttonCargarMultaClick(Sender: TObject);
begin
    if (Edit1.GetTextLen>5) and (Edit2.GetTextLen>3) and (comboBoxEstado.GetTextLen<>0) and (Edit4.GetTextLen<>0) then // si no estan los campos llenos, no se activa
      Form1.Close()
    else
      Application.MessageBox('Verifique los datos', 'error', MB_OK);
end;

procedure TForm1.comboBoxEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  key := #0;
end;


procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);

  if key=#8 then key:=key
  else if ((not (key in ['A'..'Z', '0'..'9'])) and (key<>#8)) or (Edit1.GetTextLen=6) then
    key := #0;
end;


procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Edit2.GetTextLen=4) and (key<>#8) then
    key := #0;
end;


end.
