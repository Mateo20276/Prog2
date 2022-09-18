unit outputCerrarCaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  //Mis modulos
  cajaRegistradora;

type
  TForm3 = class(TForm)
    GroupBoxBilletes: TGroupBox;
    GridCerrarCaja: TStringGrid;
    Label1: TLabel;
    GroupBoxSaldoTotal: TGroupBox;
    EditSaldoTotal: TEdit;
    BtnSaldoTotal: TButton;
    procedure FormCreate(Sender: TObject; var cajero: sumabilletes; var aCaja: Tcaja);
    procedure BtnSaldoTotalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TNombreBilletes = array[0..12] of string;

var
  Form3: TForm3;
  caja: Tcaja;

Const
  NombreBilletes: TNombreBilletes = ('Billetes de Mil','Billetes de Quinientos',
        'Billetes de Doscientos','Billetes de Cien','Billetes de Cincuenta',
        'Billetes de Veinte','Billetes de Diez','Monedas de Diez','Monedas de Cinco',
        'Monedas de Dos','Monedas de Uno','Monedas de Cincuenta Centavos',
        'Monedas de Veinticinco Centavos');

implementation

{$R *.dfm}


procedure TForm3.BtnSaldoTotalClick(Sender: TObject);
  begin
    EditSaldoTotal.Text := '$' + FloatToStr(caja.saldoTotal());
  end;


procedure TForm3.FormCreate(Sender: TObject; var cajero: sumabilletes; var aCaja: Tcaja);
  var
    i: integer;
    index: billetes;

  begin
    EditSaldoTotal.Text := '';
    caja := aCaja;

    index := B1000;
    for i := 0 to GridCerrarCaja.RowCount do begin
      GridCerrarCaja.Cells[0,i] := NombreBilletes[i];
      GridCerrarCaja.Cells[1,i] := FloatToStr(cajero[index]);
      inc(index);
    end;
  end;


end.
