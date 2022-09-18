unit main;

interface //Application.MessageBox('Hora de salida invalida', 'error', MB_OK)

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.WinXPickers,
  //Mis modulos
  TarjetaDeCredito, IngresarTarjeta;

type
  TForm1 = class(TForm)
    editMonto: TEdit;
    buttonComprar: TButton;
    Memo1: TMemo;
    comboboxCuotas: TComboBox;
    labelMonto: TLabel;
    buttonAñadirTarjeta: TButton;
    procedure buttonComprarClick(Sender: TObject);
    procedure comboboxCuotasKeyPress(Sender: TObject; var Key: Char);
    procedure buttonAñadirTarjetaClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.buttonAñadirTarjetaClick(Sender: TObject);
begin
  Form2.ShowModal;
  buttonAñadirTarjeta.Enabled := Tarjeta1.getNumeroTarjeta = '';
end;



procedure TForm1.buttonComprarClick(Sender: TObject);
var
  monto: Double;
  cuotas, statusCompra: Integer;
  emisora, numeroTarjeta, fechaVencimiento: String;

begin
  if Tarjeta1.getNumeroTarjeta='' then
    Application.MessageBox('Por favor, ingrese una tarjeta', 'error', MB_OK);


  if (editMonto.Text<>'') and (comboboxCuotas.Text<>'') and (Tarjeta1.getNumeroTarjeta<>'') then
    begin
      monto := StrToFloat(editMonto.Text);
      cuotas := StrToInt(comboboxCuotas.Text);

      statusCompra := Tarjeta1.comprar(monto, cuotas);

      if (statusCompra=1) or (statusCompra=2) then
        Application.MessageBox('Limite de primer cuota excedido', 'error', MB_OK)
      else if statusCompra=3 then
        Application.MessageBox('Limite de multiples cuotas excedido', 'error', MB_OK);

      emisora := Tarjeta1.getEntidadEmisora();
      numeroTarjeta := Tarjeta1.getNumeroTarjeta();
      fechaVencimiento := Tarjeta1.getFechaVencimiento();
      Memo1.Text := 'Numero Tarjeta: ' + numeroTarjeta + ' - ' + emisora + ' - ' + fechaVencimiento + #13#10;
      Memo1.Lines.Add('Limite credito unica cuota: ' + Tarjeta1.getLimiteUnicaCuota());
      Memo1.Lines.Add('Limite credito unica cuota: ' + Tarjeta1.getLimiteMultiplesCuotas());

    end;
end;




procedure TForm1.comboboxCuotasKeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#0 then
    key := #0;
end;

end.
