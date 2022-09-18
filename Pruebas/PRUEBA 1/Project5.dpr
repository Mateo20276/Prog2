program Project5;

uses
  Vcl.Forms,
  ArbolesBinarios in 'ArbolesBinarios.pas',
  ArbolesBinariosAVL in 'ArbolesBinariosAVL.pas',
  ArbolesBinariosBusqueda in 'ArbolesBinariosBusqueda.pas',
  ListArray in 'ListArray.pas',
  ListCursor in 'ListCursor.pas',
  ListPointer in 'ListPointer.pas',
  QueuesPointer in 'QueuesPointer.pas',
  StackArray in 'StackArray.pas',
  StackCursor in 'StackCursor.pas',
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
