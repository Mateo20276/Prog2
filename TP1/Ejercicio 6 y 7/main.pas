unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,Vcl.ExtCtrls,
  // Mis modulos
  Fecha, Estacionamiento, outputRegistro,outputArchivo,MontosPorFecha;

type
  TForm1 = class(TForm)
    GroupBoxEntrada: TGroupBox;
    labelHora: TLabel;
    labelMinutos: TLabel;
    labelDia: TLabel;
    labelMes: TLabel;
    labelAño: TLabel;
    editHoraEntrada: TEdit;
    editMinutosEntrada: TEdit;
    editDiaEntrada: TEdit;
    editMesEntrada: TEdit;
    editAñoEntrada: TEdit;
    textFecha: TStaticText;
    textHorario: TStaticText;
    GroupBoxSalida: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    editHoraSalida: TEdit;
    editMinutosSalida: TEdit;
    editDiaSalida: TEdit;
    editMesSalida: TEdit;
    editAñoSalida: TEdit;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    GroupBoxInfoCar: TGroupBox;
    Label15: TLabel;
    StaticText4: TStaticText;
    labelPatente: TLabel;
    editPatente: TEdit;
    buttonAddCar: TButton;
    BtnMostrarAutos: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnMostrarAutosHistoricos: TButton;
    BtnMontosPorFecha: TButton;
    // Archivos


    function validarFecha(): Boolean;
    function validarPatente(var patente: Integer): Boolean;
    function validarHora(): Boolean;
    procedure parseInputs(var aEntrada,aSalida: TDateTime);

    procedure buttonAddCarClick(Sender: TObject);
    procedure BtnMostrarAutosClick(Sender: TObject);
    procedure clearAll();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnMostrarAutosHistoricosClick(Sender: TObject);
    procedure BtnMontosPorFechaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure ActualizarPrecios(Hora,MEstadia,EstadiaC: string);
  end;

var
  Form1: TForm1;
  Estacionamiento1: TEstacionamiento;


implementation

{$R *.dfm}


procedure TForm1.buttonAddCarClick(Sender: TObject);
var
  Entrada,Salida: TDateTime;
  okFecha, okPatente, okHora: Boolean;
  patente: Integer;

begin
  okFecha := validarFecha();
  okPatente := validarPatente(patente);
  okHora := validarHora();

  if okFecha and okPatente and okHora then
  begin
    parseInputs(Entrada,Salida);  //Retorna por referencia las fechas y horarios en formato TdateTime
    if Salida>Entrada then
    begin
       Estacionamiento1.addAuto(patente, Entrada, Salida);
       clearAll()
    end
    else
      Application.MessageBox('El tiempo de salida debe ser posterior al tiempo de entrada', 'error', MB_OK);
  end;

end;


procedure TForm1.BtnMostrarAutosClick(Sender: TObject);
  begin
    Form2.FormCreate(self, Estacionamiento1);
    Form2.Show();
  end;

procedure TForm1.BtnMontosPorFechaClick(Sender: TObject);
  begin
    Form5.FormCreate(self, Estacionamiento1);
    Form5.ShowModal();
  end;


procedure TForm1.BtnMostrarAutosHistoricosClick(Sender: TObject);
  begin
    Form4.FormCreate(self, Estacionamiento1);
    Form4.Show();
  end;


procedure TForm1.parseInputs(var aEntrada,aSalida: TdateTime);
  var
    strEntrada,strSalida: string;

  begin
    strEntrada := editDiaEntrada.Text +'/'+ editMesEntrada.Text +'/'+ editAñoEntrada.Text +'/'+ ' ' + editHoraEntrada.Text +':'+ editMinutosEntrada.Text;
    strSalida := editDiaSalida.Text +'/'+ editMesSalida.Text +'/'+ editAñoSalida.Text +'/'+ ' ' + editHoraSalida.Text +':'+ editMinutosSalida.Text;

    aEntrada := StrToDateTime(strEntrada);
    aSalida := StrToDateTime(strSalida);
  end;


procedure TForm1.ActualizarPrecios(Hora,MEstadia,EstadiaC: string);
  begin
    Estacionamiento1.modificarPrecios(StrToInt(Hora),StrToInt(MEstadia),StrToInt(EstadiaC));
  end;



function TForm1.validarFecha(): boolean;
var
  diaE, mesE, añoE: Integer;
  diaS, mesS, añoS: Integer;
  fecha1, fecha2: TFecha;
  errorE,errorS: Integer;

begin
  result := false;

  diaE := StrToInt(editDiaEntrada.text);
  mesE := StrToInt(editMesEntrada.text);
  añoE := StrToInt(editAñoEntrada.text);

  diaS := StrToInt(editDiaSalida.text);
  mesS := StrToInt(editMesSalida.text);
  añoS := StrToInt(editAñoSalida.text);

  errorE := fecha1.Create(diaE, mesE, añoE);
  errorS := fecha2.Create(diaS, mesS, añoS);

  if (errorE=1) or (errorS=1) then
    Application.MessageBox('Dia invalido', 'error', MB_OK)
  else if (errorE=2) or (errorS=2) then
    Application.MessageBox('Mes invalido', 'error', MB_OK)
  else if (errorE=3) or (errorS=3) then
    Application.MessageBox('A�o invalido', 'error', MB_OK)
  else begin
    BtnMostrarAutos.Enabled := True;
    result := True;
  end;

end;



function TForm1.validarPatente(var patente: Integer): Boolean;
begin
  patente := StrToInt(editPatente.text);
  if Length(editPatente.text) < 3 then
    Application.MessageBox('Patente invalida', 'error', MB_OK)
  else
    result := True;
end;



function TForm1.validarHora(): Boolean;
var
  hora1, minutos1, hora2, minutos2: Integer;
begin
  result := True;

  hora1 := StrToInt(editHoraEntrada.text);
  minutos1 := StrToInt(editMinutosEntrada.text);

  if (hora1 > 23) then
    begin
      Application.MessageBox('Hora de entrada invalida', 'error', MB_OK);
      result := False;
    end;
  if (minutos1 > 59) then
    begin
      Application.MessageBox('Minutos de entrada invalidos', 'error', MB_OK);
      result := False;
    end;

  hora2 := StrToInt(editHoraSalida.text);
  minutos2 := StrToInt(editMinutosSalida.text);

  if (hora2 > 23) then
    begin
      Application.MessageBox('Hora de salida invalida', 'error', MB_OK);
      result := False;
    end;
  if (minutos2 > 59) then
    begin
      Application.MessageBox('Minutos de salida invalidos', 'error', MB_OK);
      result := False;
    end;
end;



procedure TForm1.clearAll();
  begin
    editDiaEntrada.Clear();
    editMesEntrada.Clear();
    editAñoEntrada.Clear();
    editHoraEntrada.Clear();
    editMinutosEntrada.Clear();

    editDiaSalida.Clear();
    editMesSalida.Clear();
    editAñoSalida.Clear();
    editHoraSalida.Clear();
    editMinutosSalida.Clear();

    editPatente.Clear();
  end;



procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    Estacionamiento1.cargarArchivo();
  end;



procedure TForm1.FormCreate(Sender: TObject);
  var
    path: string;
    arch: ArchivoDeRegistro;

  begin
    path := '..\..\RegistroDeAutos.bin';
    AssignFile(arch,path);

    if not FileExists(path) then begin
      BtnMostrarAutosHistoricos.Enabled := false;
      BtnMontosPorFecha.Enabled := false;
    end;

  end;

end.
