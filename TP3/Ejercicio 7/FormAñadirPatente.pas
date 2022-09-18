unit FormAñadirPatente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Agregar: TButton;
    Edit1: TEdit;
    procedure AgregarClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.AgregarClick(Sender: TObject);
begin
    if (Edit1.GetTextLen>5) then // si no estan los campos llenos, no se activa
      Form2.Close
    else
      Application.MessageBox('Patente invalida', 'error', MB_OK)
end;


procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);

  if key=#8 then key:=key
  else if ((not (key in ['A'..'Z', '0'..'9'])) and (key<>#8)) or (Edit1.GetTextLen=6) then
    key := #0;
end;

end.
