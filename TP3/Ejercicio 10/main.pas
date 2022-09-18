unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls, Vcl.Grids,
  //Mis modulos
  Code_SSD,Output_NumerosConvertios;

type
  TForm1 = class(TForm)
    GroupBoxGrid: TGroupBox;
    Grid: TStringGrid;
    GroupBoxInput: TGroupBox;
    ButtonConvert: TButton;
    EditNum1: TEdit;
    EditNum2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure ButtonConvertClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Tgrilla = array of array of string;

var
  Form1: TForm1;
  SSD: Tad_SSD;


const grilla: Tgrilla = [

          ['Digit To Display','A','B','C','D','E','F','G','Cod 7-S'],
          ['0','ON','ON','ON','ON','ON','OFF','OFF','1111110'],
          ['1','OFF','ON','ON','OFF','OFF','OFF','OFF','0110000'],
          ['2','ON','ON','OFF','ON','ON','OFF','ON','1101101'],
          ['3','ON','ON','ON','ON','OFF','OFF','ON','1111001'],
          ['4','OFF','ON','ON','OFF','OFF','ON','ON','0110011'],
          ['5','ON','OFF','ON','ON','OFF','ON','ON','1011011'],
          ['6','ON','OFF','ON','ON','ON','ON','ON','1011111'],
          ['7','ON','ON','ON','OFF','OFF','OFF','OFF','1110000'],
          ['8','ON','ON','ON','ON','ON','ON','ON','1111111'],
          ['9','ON','ON','ON','ON','OFF','ON','ON','1111011']

    ];


implementation

{$R *.dfm}

procedure TForm1.ButtonConvertClick(Sender: TObject);
  var
    num1,num2: integer;

  begin

    num1 := StrToInt(EditNum1.Text);
    num2 := StrToInt(EditNum2.Text);

    SSD.Crear(num1,num2);
    Form2.ShowModal();

  end;


procedure TForm1.FormCreate(Sender: TObject);
  var
    row,col: integer;

  begin
    for row := 0 to Length(grilla)-1 do begin
      for col := 0 to Length(grilla[row])-1 do begin
        Grid.Cells[col,row] := grilla[row,col];
      end;

    end;



  end;

end.
