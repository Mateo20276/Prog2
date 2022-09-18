unit Main;

interface

uses //Agregar o eliminar TAD Lista a preferencia
  Winapi.Windows,  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ListPointer, Unit_Tipos,
  //TAD
  TAD_Agenda, Vcl.WinXPickers, Vcl.ComCtrls,Math;
type
  TForm4 = class(TForm)
    Label1: TLabel;
    editActividad: TEdit;
    editDuracion: TEdit;
    Label2: TLabel;
    Cargar: TButton;
    Memo1: TMemo;
    Button1: TButton;
    datetimeHorario: TDateTimePicker;
    buttonVerHora: TButton;
    Label3: TLabel;
    buttonPorcentaje: TButton;
    procedure CargarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buttonVerHoraClick(Sender: TObject);

    procedure buttonPorcentajeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Lista1 : Lista;
  agenda: TAgenda;
  Hora: TTime;
  total: Integer;
  bool: Boolean;

implementation

{$R *.dfm}

procedure Cargar_Lista(Actv,Dur: Variant);
var
  elementos: TipoElemento;
  Q:Posicionlista;

//Horas de trabajo maximas = 12 horas, de 09:00 a 21:00
begin
  if not(bool) then
    begin
      total:= 0;
      bool := True
    end;
  Q:= Lista1.Comienzo;

  if Q = Nulo  then
  begin
    Lista1.Crear(Cadena,50);

  end;
  total:= total + StrToInt(Dur);
  if total > 720 then
    begin
      application.MessageBox('Hora excedida', 'error', MB_OK); // Si es mayor a 720 las actividades sumadas tira error
      total:= total - StrToInt(Dur);
      exit
    end;
  elementos.Clave:= Actv;
  elementos.Valor1:= Dur;
  Lista1.Agregar(elementos);



end;

function Ver_Actividades(): String; // Utiliza la funcion del TAD 'Horario_Especifico'

begin
  Result:= agenda.Horario_Especifico(Lista1,Hora);
end;

function Porcentaje(): Double;  //Utiliza la funcion del TAD 'Porcentaje_Ocupacion'
begin
   result:= RoundTo(agenda.Porcentaje_Ocupacion(Lista1), -2);
end;

procedure TForm4.buttonVerHoraClick(Sender: TObject);// Muestra la funcion del TAD 'Horario_Especifico'
begin
   Hora:= datetimeHorario.Time;
   Memo1.Lines.Add('Tipo de actividad a las ' +  TimeToStr(Hora) + ': ' + Ver_Actividades);
end;



procedure TForm4.CargarClick(Sender: TObject);  //Utiliza la funcion del  'Cargar_Lista'  para cargar la lista con inputs
begin
  Cargar_Lista((editActividad.text),(editDuracion.text));
  //Memo1.Lines.Add(Lista1.retornarClaves);
end;


procedure TForm4.buttonPorcentajeClick(Sender: TObject);   // Muestra la funcion del TAD 'Porcentaje_Ocupacion'
begin
  Memo1.Lines.Add('Se trabaja un ' + Porcentaje.ToString + '% de horas laborales')
end;

procedure TForm4.Button1Click(Sender: TObject);  // Muestra la funcion del TAD 'Ordenada'
begin
  Memo1.Lines.Add(agenda.Ordenada(Lista1).retornarClaves);
end;

end.
