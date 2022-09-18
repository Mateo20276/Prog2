program Project1;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Fecha in 'Fecha.pas',
  Estacionamiento in 'Estacionamiento.pas',
  outputRegistro in 'outputRegistro.pas' {Form2},
  ObtenerPrecios in 'ObtenerPrecios.pas' {Form3},
  outputArchivo in 'outputArchivo.pas' {Form4},
  MontosPorFecha in 'MontosPorFecha.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
