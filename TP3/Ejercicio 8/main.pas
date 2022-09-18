unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  // Mis modulos
  Unit_tipos,
  ListCursor; // elegir un TAD
  //ListArray;
  //ListPointer;

type
  TForm1 = class(TForm)
    editInput: TEdit;
    buttonLoadEj1: TButton;
    buttonLoadEj2: TButton;
    buttonEjecutar: TButton;
    memoOutput: TMemo;
    procedure buttonEjecutarClick(Sender: TObject);
    procedure cargarRecorrido(var recorrido: lista);
    function getPuntaje(recorrido: lista): String;
    procedure buttonLoadEj1Click(Sender: TObject);
    procedure buttonLoadEj2Click(Sender: TObject);
    procedure editInputKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.cargarRecorrido(var recorrido: lista);
var
  Sep, str, aux: string;
  P,i: Integer;
  elemento: TipoElemento;
  valorAux, bonusCount: Integer;
  vectorAux: Array of TipoElemento;
begin
  str := EditInput.Text;
  Sep := ',';
  i := 0;

  if str.Substring(str.Length, 1) <> Sep then
    str := str + Sep;

  P := Pos(Sep, str);
  bonusCount := 0;

  while P > 0 do Begin
    aux := Copy(str, 1, P - 1);
    valorAux := 0;

    if aux='PUNTITO' then
      valorAux := 1
    else if aux='FRUTILLA' then
      valorAux := 10
    else if aux='BANANA' then
      valorAux := 30
    else if aux='CEREZAS' then
      valorAux := 50
    else if aux='FANTASMA' then
      if bonusCount>0 then
        valorAux := 100
      else begin
        recorrido.Crear(Cadena, 1); // vuelve a crear la lista para limpiar
        elemento.Inicializar(Cadena, Numero);
        elemento.Valor1 := -1;
        elemento.Clave := aux;
        recorrido.Agregar(elemento);
        Exit;
      end
    else if aux='BONUS' then
      bonusCount := 10
    else
      begin
      recorrido.Crear(Cadena, 1);
      Exit;      // termina la ejecucion
      end;

    // Si input es OK
    if bonusCount>0 then begin
      valorAux := valorAux*2;
      Dec(bonusCount);
    end;

    // Añade a vector auxiliar
    elemento.Inicializar(Cadena, Numero);
    elemento.Valor1 := valorAux;
    elemento.Clave := aux;
    SetLength(vectorAux, Length(vectorAux)+1);
    vectorAux[Length(vectorAux)-1] := elemento;

    str := Copy(str, P + 1, Length(str));
    P := Pos(Sep, str);
  end;

  // Si todos los elementos eran validos, crea el recorrido
  recorrido.Crear(Cadena, Length(vectorAux));   // longitud variable
  for i := 0 to Length(vectorAux)-1 do
    recorrido.Agregar(vectorAux[i])
end;



function TForm1.getPuntaje(recorrido: lista): String;
var
  puntaje: Integer;
  item: PosicionLista;
begin
  puntaje := 0;
  item := recorrido.Comienzo;
  while item <> Nulo do begin
    puntaje := puntaje + recorrido.Recuperar(item).Valor1;
    item := recorrido.Siguiente(item);
  end;

  if puntaje=-1 then
    result := 'Perdiste!'
  else
    result := 'Puntaje: ' + puntaje.ToString;
end;



procedure TForm1.buttonEjecutarClick(Sender: TObject);
var
  puntaje: String;
  recorrido: lista;
begin
  memoOutput.Lines.Clear();
  cargarRecorrido(recorrido);

  if not recorrido.EsVacia then begin
    puntaje := getPuntaje(recorrido);
    memoOutput.Lines.Add(puntaje);
  end
  else
    Application.MessageBox('Recorrido invalido', 'error', MB_OK);
end;


procedure TForm1.editInputKeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if (not (key in ['A'..'Z'])) and (key<>',') and (key<>#8) then
    key := #0;
end;


procedure TForm1.buttonLoadEj1Click(Sender: TObject);
begin
  editInput.Text := 'PUNTITO,FRUTILLA,PUNTITO,PUNTITO,BANANA,PUNTITO,PUNTITO,FANTASMA,PUNTITO,PUNTITO,CEREZAS,PUNTITO';
end;


procedure TForm1.buttonLoadEj2Click(Sender: TObject);
begin
editInput.Text := 'PUNTITO,PUNTITO,PUNTITO,BANANA,PUNTITO,PUNTITO,BONUS,PUNTITO,PUNTITO,FANTASMA,PUNTITO,PUNTITO,CEREZAS,PUNTITO';
end;

end.
