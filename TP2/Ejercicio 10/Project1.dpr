program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  subconjunto in 'subconjunto.pas',
  vectorDeSubconjuntos in 'vectorDeSubconjuntos.pas',
  output in 'output.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
