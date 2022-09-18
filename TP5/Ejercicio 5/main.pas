unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  // Mis modulos
  //QueuesPointer,
  //QueuesArray,
  QueuesCursor,
  StackPointer,
  ListPointer,
  Tipos, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    buttonEjecutar: TButton;
    memoPila: TMemo;
    memoCola: TMemo;
    memoOutput: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure buttonEjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}


function valoresComunes(var pila1: Pila; var cola1: Cola): Lista;
var pilaAux: Pila;
    elementoP, elementoC, elementoL: TipoElemento;
    i, posPila: Integer;
begin
  pilaAux.Crear(pila1.DatoDeLaClave, pila1.SizeStack);
  result.Crear(Cadena, 100);
  posPila := pila1.SizeStack;

  while not pila1.EsVacia do begin
    elementoP := pila1.Recuperar;
    pila1.DesApilar;
    pilaAux.Apilar(elementoP);

    for i := 1 to cola1.SizeQueue do begin
      elementoC := cola1.Recuperar;
      cola1.DesEncolar;
      cola1.Encolar(elementoC);

      if elementoP.clave = elementoC.Clave then begin
        elementoL.Clave := IntToStr(elementoP.Clave) + ':' + IntToStr(posPila) + ':' + IntToStr(i);
        result.Agregar(elementoL);
      end;
    end;
    Dec(posPila);
  end;

  pila1.InterCambiar(pilaAux, True);
end;



procedure TForm1.buttonEjecutarClick(Sender: TObject);
var pila1: Pila;
    cola1: Cola;
    listaOutput: Lista;
begin
  memoPila.Clear;
  memoCola.Clear;
  memoOutput.Clear;

  // Crear y cargar pila y cola con datos random
  pila1.LlenarClavesRandom(3+Random(3), 0, 10);
  cola1.LlenarClavesRandom(3+Random(2), 0, 10);
  memoPila.Lines.Add(pila1.RetornarClaves);
  memoCola.Lines.Add(cola1.RetornarClaves);

  // Output
  listaOutput := valoresComunes(pila1, cola1);
  memoOutput.Lines.Add(listaOutput.RetornarClaves);

  // Testear reconstrucción de la pila y cola a su estado inicial

//  memoOutput.Lines.Add('Pila');
//  memoOutput.Lines.Add(pila1.RetornarClaves);
//  memoOutput.Lines.Add('Cola');
//  memoOutput.Lines.Add(cola1.RetornarClaves);
end;

end.
