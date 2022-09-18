program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  QueuesPointer in 'QueuesPointer.pas',
  Tipos in 'Tipos.pas',
  StackPointer in 'StackPointer.pas',
  ListPointer in 'ListPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
