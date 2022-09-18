unit Output_operaciones;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  //Mis modulos
  Output_NumerosConvertios;

type
  TForm3 = class(TForm)
    GroupBoxOperaciones: TGroupBox;
    Edit1: TEdit;
    GridResult: TStringGrid;
    GroupBoxDIvision: TGroupBox;
    Edit2: TEdit;
    GridCociente: TStringGrid;
    GridResto: TStringGrid;
    Edit3: TEdit;
    Edit4: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
