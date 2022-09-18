unit outputArchivo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  //Mis modulos
  Estacionamiento;

type
  TForm4 = class(TForm)
    labelCantAutos: TLabel;
    Label1: TLabel;
    gridOutput: TStringGrid;
    editCantAutos: TEdit;
    procedure FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);
    procedure addAutoToGrid(var Estacionamiento: TEstacionamiento);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  autos: VautosArch;

implementation

{$R *.dfm}


procedure TForm4.FormCreate(Sender: TObject; var Estacionamiento: TEstacionamiento);

  begin
    autos := Estacionamiento.LeerArchivo();

    gridOutput.Cells[0,0] := 'Patente';
    gridOutput.Cells[1,0] := 'Entrada';
    gridOutput.Cells[2,0] := 'Salida';
    gridOutput.Cells[3,0] := 'Tipo de Tarifa';
    gridOutput.Cells[4,0] := 'Tarifa';

    self.addAutoToGrid(Estacionamiento);   // carga los datos de los autos
  end;

procedure TForm4.addAutoToGrid(var Estacionamiento: TEstacionamiento);
  var
    i: Integer;
    auto: RAuto;

  begin
    for i := 1 to Length(autos) do
      begin
        auto := autos[i-1];
        gridOutput.RowCount := i+1;

        gridOutput.Cells[0,i] := IntToStr(auto.patente);
        gridOutput.Cells[1,i] := DateTimeToStr(auto.entrada);
        gridOutput.Cells[2,i] := DateTimeToStr(auto.salida);
        gridOutput.Cells[3,i] := auto.tipoTarifa;
        gridOutput.Cells[4,i] := FloatToStr(auto.tarifa);
      end;

    self.editCantAutos.Text := IntToStr((gridOutput.RowCount)-1);
  end;

end.
