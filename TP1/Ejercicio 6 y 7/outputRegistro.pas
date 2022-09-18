unit outputRegistro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  // Mis modulos
  Estacionamiento;

type
  TForm2 = class(TForm)
    labelCantAutos: TLabel;
    gridOutput: TStringGrid;
    editCantAutos: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);
    procedure addAutoToGrid(var Estacionamiento: TEstacionamiento);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}



procedure TForm2.FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);
  begin
    gridOutput.Cells[0,0] := 'Patente';
    gridOutput.Cells[1,0] := 'Entrada';
    gridOutput.Cells[2,0] := 'Salida';
    gridOutput.Cells[3,0] := 'Tipo de Tarifa';
    gridOutput.Cells[4,0] := 'Tarifa';

    self.editCantAutos.Text := IntToStr(Estacionamiento.getCantAutos());
    self.addAutoToGrid(Estacionamiento);   // carga los datos de los autos
  end;

procedure TForm2.addAutoToGrid(var Estacionamiento: TEstacionamiento);
var
  i: Integer;
  auto: RAuto;

begin
  for i := 1 to Estacionamiento.getCantAutos() do
    begin
      auto := Estacionamiento.getAuto(i-1);
      gridOutput.RowCount := i+1;

      gridOutput.Cells[0,i] := IntToStr(auto.patente);
      gridOutput.Cells[1,i] := DateTimeToStr(auto.entrada);
      gridOutput.Cells[2,i] := DateTimeToStr(auto.salida);
      gridOutput.Cells[3,i] := auto.tipoTarifa;
      gridOutput.Cells[4,i] := FloatToStr(auto.tarifa);
    end;
end;

end.
