program Project5;

uses
  Vcl.Forms,
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  Tipos in 'Tipos.pas',
  Unit4 in 'Unit4.pas' {Form4},
  mipilaconlista in 'mipilaconlista.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
