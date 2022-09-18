program Project5;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form4},
  Unit_tipos in 'Unit_tipos.pas',
  ListPointer in 'ListPointer.pas',
  Unit_lista_array in 'Unit_lista_array.pas',
  TAD_Agenda in 'TAD_Agenda.pas',
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
