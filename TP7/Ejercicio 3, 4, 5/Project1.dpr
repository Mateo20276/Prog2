program Project1;

uses
  Vcl.Forms,
  ListArray in 'ListArray.pas',
  main in 'main.pas' {Form1},
  TadHash in 'TadHash.pas',
  TadHashRC in 'TadHashRC.pas',
  TadHashRL in 'TadHashRL.pas',
  TadHashZO in 'TadHashZO.pas',
  Tipos in 'Tipos.pas',
  Unit2 in 'Unit2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
