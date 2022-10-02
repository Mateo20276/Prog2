unit mipilaconlista;

interface
  Uses   Tipos, stdctrls, SysUtils, Variants, ListPointer;


Const
  MIN = 1;  // Inicio de la Lista
  MAX = 2000; // Cota de tamaño maximo
  Nulo= 0; // Indica posicion invalida de la lista

Type

  Pila = object
    Private
      Elementos: Lista;
      tope: PosicionLista;             // Bandera de tope de la pila
      Q_Items: Integer;               // Lleva la cantidad de elementos de la pila
      TDatoDeLaClave: TipoDatosClave; // Tipo de Dato de la Clave recibida en el crear pila vacia
      Size: LongInt;                  // Tamaño de la pila

    Public

    Function Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
    procedure apilar(x: TipoElemento);
    procedure desapilar();
    Function EsVacia(): Boolean;
    Function EsLLena(): Boolean;

  End;

implementation

Function Pila.Crear(avTipoClave: TipoDatosClave; alSize: LongInt): Resultado;
Begin
  if (alSize < Min) or (alSize > Max) then Crear:= CError;

  if (alSize >= Min) And (alSize <= Max) then Begin
    Tope:= listpointer.Nulo;
    Q_Items := 0;
    TDatoDeLaClave := avTipoClave;
    Size := alSize;
    Elementos.Crear(avTipoClave,alSize);
    Crear := OK;
  End;
End;

Function pila.EsVacia(): Boolean;
Begin
  EsVacia := (Elementos.EsVacia);
End;

// Control de lista llena
Function pila.EsLLena(): Boolean;
Begin
  EsLLena := (Elementos.EsLLena);
End;

procedure pila.apilar(x: TipoElemento);
begin
  if pila.esllena then exit;

  if X.TipoDatoClave(X.Clave) <> TDatoDeLaClave then Begin
    Exit;
  End;

  if pila.esvacia then begin
    elementos.Agregar(x);
    tope:= elementos.Comienzo;
    exit;
  end;

  elementos.Agregar(x);
  tope:= elementos.Siguiente(tope);


end;


procedure pila.desapilar();
var auxiliar: posicionlista;

begin
  if pila.esvacia then exit;

  auxiliar:= tope;
  elementos.eliminar(tope);
  tope:= elementos.anterior(auxiliar);

end;

end.
