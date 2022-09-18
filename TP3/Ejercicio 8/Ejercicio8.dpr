program Ejercicio8;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  ListCursor in 'ListCursor.pas',
  Unit_tipos in 'Unit_tipos.pas',
  ListArray in 'ListArray.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
