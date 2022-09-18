program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  ArbolesBinarios in 'ArbolesBinarios.pas',
  ArbolesBinariosAVL in 'ArbolesBinariosAVL.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
