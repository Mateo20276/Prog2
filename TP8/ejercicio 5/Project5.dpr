program Project5;

uses
  Vcl.Forms,
  ArbolesBinariosAVL in 'ArbolesBinariosAVL.pas',
  Conjuntos in 'Conjuntos.pas',
  ConjuntosAVL in 'ConjuntosAVL.pas',
  ListPointer in 'ListPointer.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackPointer in 'StackPointer.pas',
  Tipos in 'Tipos.pas',
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
