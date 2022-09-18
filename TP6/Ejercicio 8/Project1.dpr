program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Unit2 in 'Unit2.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas',
  Tipos in 'Tipos.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackPointer in 'StackPointer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
