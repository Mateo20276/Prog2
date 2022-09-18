unit IngresarTarjeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.WinXPickers,

  //Nuestros Uses//
  TarjetaDeCredito;

type
  TForm2 = class(TForm)
    editTarjeta: TEdit;
    datePickerFecha: TDatePicker;
    buttonFinalizar: TButton;
    labelTarjeta: TLabel;
    ca: TLabel;
    editLimiteUnaCuota: TEdit;
    Label1: TLabel;
    editLimiteMultiplesCuotas: TEdit;
    Label2: TLabel;
    procedure buttonFinalizarClick(Sender: TObject);
    //procedure siTodoEstaBien;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Tarjeta1: TTarjetaDeCredito;        // cada vez que hace click, se crea la instancia

implementation

{$R *.dfm}


procedure TForm2.buttonFinalizarClick(Sender: TObject);
var
  status_code: Integer;
begin
//  nvalidado:= Tarjeta1.validarNumero(editTarjeta.text);
//  Tarjeta1.almacenarFecha(datepickerFecha.Date);
//  Mcuotas:= Tarjeta1.calcularLimiteMCuota(StrToFloat(Form1.editMonto.text), StrToFloat(editLimiteMultiplesCuotas.text), StrToInt(Form1.comboboxCuotas.text));
//  Ucuotas:= Tarjeta1.calcularLimiteUCuota(StrToFloat(Form1.editMonto.text), StrToFloat(editLimiteUnaCuota.text), StrToInt(Form1.comboboxCuotas.text));

  status_code := Tarjeta1.crearTarjeta(editTarjeta.text, datepickerFecha.Date, StrToInt(editLimiteUnaCuota.text), StrToInt(editLimiteMultiplesCuotas.text));

  if status_code = 0 then
    begin
      //siTodoEstaBien();

      Form2.Close;
    end
  else if status_code = 2 then
    Application.MessageBox('Cantidad de digitos insuficientes', 'error', MB_OK)
  else if status_code = 3 then
    Application.MessageBox('Numero de tarjeta invalido', 'error', MB_OK)
  else if status_code = 4 then
    Application.MessageBox('Entidad emisora no reconocida', 'error', MB_OK)
  else if status_code = 5 then
    Application.MessageBox('Fecha de vencimiento invalida', 'error', MB_OK)
  else if status_code = 6 then
    Application.MessageBox('El limite para unica cuota debe ser mayor a 0', 'error', MB_OK)
  else if status_code = 7 then
    Application.MessageBox('El limite para multiples cuotas debe ser mayor a 0', 'error', MB_OK);

end;



procedure TForm2.FormCreate(Sender: TObject);
begin
  datePickerFecha.Date := StrToDate('1/4/2022');
end;

end.
