program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  StackArray in 'StackArray.pas',
  StackCursor in 'StackCursor.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
