unit MontosPorFecha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  //Mis modulos
  Estacionamiento;

type
  TForm5 = class(TForm)
    GridRangoFechas: TStringGrid;
    ComboBoxOptions: TComboBox;
    GridFecha: TStringGrid;
    LabelFecha1: TLabel;
    editDiaFecha1: TEdit;
    EditMesFecha1: TEdit;
    EditAñoFecha1: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    EditDiaFecha2: TEdit;
    EditMesFecha2: TEdit;
    EditAñoFecha2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    BtnMostrar: TButton;
    Label6: TLabel;
    procedure BtnMostrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);
    procedure ComboBoxOptionsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  Estacionamiento1: TEstacionamiento;

implementation

{$R *.dfm}

procedure TForm5.BtnMostrarClick(Sender: TObject);
  var
    FechaInit,FechaEnd: Tdate;
    v_montos: Vrecaudaciones;
    i: integer;

    PorHora,Media,Completa: Double;
    Fecha1: Tdate;

  begin

    if (ComboBoxOptions.ItemIndex = 0){#1} then begin // Rango de fechas seleccionado
      if (editDiaFecha1.Text = '') or (editMesFecha1.Text = '') or (editAñoFecha1.Text = '') or (editDiaFecha2.Text = '') or (editMesFecha2.Text = '') or (editAñoFecha2.Text = '') then
        MessageDlg('Debe Ingresar una fecha', mtERROR, [mbOK],0)

      else begin // #2

        FechaInit := StrToDate(EditDiaFecha1.Text+'/'+EditMesFecha1.Text+'/'+EditAñoFecha1.Text);
        FechaEnd  := StrToDate(EditDiaFecha2.Text+'/'+EditMesFecha2.Text+'/'+EditAñoFecha2.Text);

        if FechaEnd <= FechaInit then
          MessageDlg('El tiempo de salida debe ser posterior al tiempo de entrada', mtERROR, [mbOK],0)

        else begin // #3

          GridRangoFechas.Visible := True;
          GridFecha.Visible := False;

          GridRangoFechas.Cells[0,0] := 'Fecha';
          GridRangoFechas.Cells[1,0] := 'Monto Total';

          v_montos := Estacionamiento1.calcMontoTotalPorDia(FechaInit,FechaEnd);
          GridRangoFechas.RowCount := Length(v_montos)+1;

          for i := 1 to Length(v_montos) do begin
            GridRangoFechas.Cells[0,i] := DateToStr(v_montos[i-1].fecha);
            GridRangoFechas.Cells[1,i] := FloatToStr(v_montos[i-1].Monto);
          end;

        end; // #3
      end; // #2
    end // #1

    else if ComboBoxOptions.ItemIndex = 1 then begin // Ganancias por fecha seleccionado
      if (editDiaFecha1.Text = '') or (editMesFecha1.Text = '') or (editAñoFecha1.Text = '') then
        MessageDlg('Debe Ingresar una fecha', mtERROR, [mbOK],0)

      else begin

        GridRangoFechas.Visible := false;
        GridFecha.Visible := True;

        Fecha1 := StrToDate(EditDiaFecha1.Text+'/'+EditMesFecha1.Text+'/'+EditAñoFecha1.Text);
        Estacionamiento1.tarifasPorDia(Fecha1,PorHora,Media,Completa);

        GridFecha.Cells[0,0] := 'Fecha';
        GridFecha.Cells[1,0] := 'Monto Por Hora';
        GridFecha.Cells[2,0] := 'Monto Por Media Estadia';
        GridFecha.Cells[3,0] := 'Monto Por Estadia Completa';

        GridFecha.Cells[0,1] := DateToStr(Fecha1);
        GridFecha.Cells[1,1] := FloatToStr(Porhora);
        GridFecha.Cells[2,1] := FloatToStr(Media);
        GridFecha.Cells[3,1] := FloatToStr(Completa);
      end;

    end;



  end;


procedure TForm5.ComboBoxOptionsChange(Sender: TObject);
  begin
    if ComboBoxOptions.ItemIndex = 1 then begin
      EditDiaFecha2.Enabled := False;
      EditMesFecha2.Enabled := False;
      EditAñoFecha2.Enabled := False;
    end

    else begin
      EditDiaFecha2.Enabled := True;
      EditMesFecha2.Enabled := True;
      EditAñoFecha2.Enabled := True;
    end;



  end;

procedure TForm5.FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);
  begin
    Estacionamiento1 := Estacionamiento;
  end;

end.
