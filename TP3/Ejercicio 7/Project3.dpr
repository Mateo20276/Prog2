program Project3;

uses
  Vcl.Forms,
  Unit3 in 'Unit3.pas' {Form3},
  Unit_generador_random_de_patentes in 'Unit_generador_random_de_patentes.pas',
  Unit_generar_datos_random in 'Unit_generar_datos_random.pas',
  Unit_lista_patentes in 'Unit_lista_patentes.pas',
  Unit_lista_multas in 'Unit_lista_multas.pas',
  FormA�adirMulta in 'FormA�adirMulta.pas' {Form1},
  FormA�adirPatente in 'FormA�adirPatente.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
