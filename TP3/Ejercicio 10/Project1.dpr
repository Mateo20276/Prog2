program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas',
  Code_SSD in 'Code_SSD.pas',
  Output_NumerosConvertios in 'Output_NumerosConvertios.pas' {Form2},
  Output_operaciones in 'Output_operaciones.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
