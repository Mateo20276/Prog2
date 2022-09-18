unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Grids,StrUtils,
  //Mis modulos
  cajaRegistradora, outputCerrarCaja;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBoxInputCompra: TGroupBox;
    GroupBoxOutputCompra: TGroupBox;
    GridMostrarVuelto: TStringGrid;
    Label2: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    EditTotalAPagar: TEdit;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    ComboBoxTipoBilleteCompra: TComboBox;
    EditSumarBillete: TEdit;
    UpDown1: TUpDown;
    BtnSumarBillete: TButton;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    BtnComprar: TButton;
    BtnCerrarCaja: TButton;

    procedure BtnSumarBilleteClick(Sender: TObject);
    procedure BtnComprarClick(Sender: TObject);
    procedure MostrarVuelto(vuelto: sumabilletes);
    procedure FormCreate(Sender: TObject);
    procedure BtnCerrarCajaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TNombreBilletes = array[0..12] of string;

var
  Form1: TForm1;
  caja: Tcaja;
  dineroObtenido: Tcaja; // Caja tipo buffer donde se van guardando los billetes ingresados
  indexComboBoxMain: sumabilletes;

Const
  NombreBilletes: TNombreBilletes = ('Billetes de Mil','Billetes de Quinientos',
        'Billetes de Doscientos','Billetes de Cien','Billetes de Cincuenta',
        'Billetes de Veinte','Billetes de Diez','Monedas de Diez','Monedas de Cinco',
        'Monedas de Dos','Monedas de Uno','Monedas de Cincuenta Centavos',
        'Monedas de Veinticinco Centavos');

implementation

{$R *.dfm}

uses
  cargarCaja;


procedure TForm1.BtnSumarBilleteClick(Sender: TObject);
  var
    tipoBillete: billetes;
    Monto,totalAPagar: integer;
    saldoTotal: Double;
    found: boolean;

  begin
    totalAPagar := StrToInt(EditTotalAPagar.Text);
    saldoTotal := dineroObtenido.saldoTotal();

    if (EditSumarBillete.Text = '') then
      MessageDlg('Debe Ingresar algun billete',mtError,[mbOK],0)

    else if saldoTotal >= (totalAPagar) then
      MessageDlg('Se supero el Monto total a pagar!!' + #13#10 + 'Realice la compra',mtError,[mbOK],0)

    else begin

      // Cargo en una especie de buffer los billetes que se van ingresando
      found := false;
      tipoBillete := B1000;
      while not found do begin
        if ComboBoxTipoBilleteCompra.ItemIndex = indexComboboxMain[tipoBillete] then // Busco el tipo de billete seleccionado
          found := True

        else
          inc(tipoBillete);
      end;

      Monto := StrToInt(EditSumarBillete.Text);
      dineroObtenido.cargar(tipoBillete,Monto);

    end;

  end;


procedure TForm1.BtnComprarClick(Sender: TObject);
  var
    billetesObtenidos: sumabilletes; //Registro con los billetes ingresados por el cliente
    totalAPagar: Double;
    saldoTotal: Double;
    vuelto: sumabilletes;

  begin
    if dineroObtenido.saldoTotal < StrToInt(EditTotalAPagar.Text) then
      MessageDlg('Dinero Insuficiente',mtError,[mbOK],0)

    else begin
      dineroObtenido.getCajero(billetesObtenidos);
      totalAPagar := StrToInt(EditTotalAPagar.Text);
      saldoTotal := dineroObtenido.saldoTotal();

      vuelto := caja.DarVuelto(billetesObtenidos,totalAPagar,saldoTotal);

      dineroObtenido.Create();


      if vuelto[B1000] = -1 then begin
        MessageDlg('No hay suficiente dinero en la caja para devolver el vuelto.' + #13#10 +
                   'Intente pagar con billetes mas chicos o Cargue mas dinero en la caja',mtError,[mbOK],0);

        if MessageDlg('¿Desea recargar la caja?',mtConfirmation,[mbYES,mbNO],0,mbYES) = mrYES then begin
          Form2.FormCreate(self);
        end;

      end

      else
        MostrarVuelto(vuelto);

    end;
  end;


procedure Tform1.MostrarVuelto(vuelto: sumabilletes);
  var
    i: integer;
    index: billetes;

  begin

    index := B1000;
    for i := 0 to (GridMostrarVuelto.RowCount)-1 do begin
      GridMostrarVuelto.Cells[0,i]  := NombreBilletes[i];
      GridMostrarVuelto.Cells[1,i]  := FloatToStr(vuelto[index]);
      inc(index);
    end;
  end;


procedure TForm1.BtnCerrarCajaClick(Sender: TObject);
  var
    cajero: sumabilletes;

  begin
    caja.getCajero(cajero);
    Form3.FormCreate(self, cajero, caja);
    Form3.Show();


  end;



procedure TForm1.FormCreate(Sender: TObject);
  var
    i: integer;
    j: billetes;

  begin
    j := B1000;
    for i := 0 to Length(indexComboBoxMain)-1 do begin // Viculo los indices del combo box con los indices billetes(B1000,B500...)
      indexComboBoxMain[j] := i; // Ej: B1000 = 0, B500 = 1s
      inc(j);
    end;

    dineroObtenido.Create(); //Inicializo todos los billetes en 0
    caja.Create();
  end;

end.
