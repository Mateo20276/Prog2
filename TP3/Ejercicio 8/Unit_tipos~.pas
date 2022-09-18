unit Unit_tipos;
interface
uses system.Variants, system.SysUtils;
const
    // Tabulador
    tabular= Char(9);
    // Retorno de carro
    retornoCarro = Char(13);
    // Retorno de Carro + Fin de Linea
    retornoCarro_finDeLinea = Char(13) + Char(10);
    // Fin de Linea solamente
    retornoFinDeLinea = Char(10);
type
    // Retorno de las funciones de manejo de las estructuras
    Resultado = (OK, CError, LLena, Vacia, PosicionInvalida, Otro, ClaveIncompatible, ClaveDuplicada);
    // Tipos de Datos Soportados x la clave <variant>
    TipoDatosClave = (Numero, Cadena, Fecha, Otros, Desconocido);
    // Tipos de Funcion Hash a Aplicar
    TipoFuncionesHash = (Modulo, Plegamiento, MitadDelCuadrado);
    // Datos a Guardar dentro de las estructuras
    tipoElemento = Object
        Clave: Variant; // Cualquier valor soportado x <TipoDatosClave>
        Valor1: Variant; // Cualquier valor soportado x un Variant
        Valor2: Pointer; // Puntero Generico a Cualquier cosa (dato primitivo, otra estructura, un objeto, etc.)
        //comportamientos:
        function armarString():string;
        function ArmarStringConSeparador (separador:string):string;
        function tipoDatoClave (inputClave:variant):TipoDatosClave;
        Function TipoElementoVacio(): TipoElemento;
        Function EsTEVacio(): Boolean;
        Procedure Inicializar(aTDC: TipoDatosClave; aValor1Inicial: Variant);
    end;
implementation
//------------------------------------------------------------------------------------
function tipoelemento.armarString: string;
var retorno: String;
begin
    Try
      retorno := VarToStr(Clave);
      retorno := retorno + tabular + VarToStr(Valor1);
      armarString := retorno;
    except
      armarString := '';
    End
end;
//------------------------------------------------------------------------------------
function tipoelemento.ArmarStringConSeparador(separador: string): string;
var retorno: String;
begin
    Try
      retorno := VarToStr(Clave);
      retorno := retorno + Separador + VarToStr(Valor1);
      ArmarStringConSeparador := retorno;
    except
      ArmarStringConSeparador := '';
    End
end;
//------------------------------------------------------------------------------------
function tipoelemento.tipoDatoClave(inputClave: Variant): TipoDatosClave;
var tipoClave:integer;
begin
    tipoClave:= vartype(inputClave);
    Case tipoClave of
       varEmpty : TipoDatoClave := Otros;
       varNull : TipoDatoClave := Otros;
       varAny : TipoDatoClave := Otros;
       varSmallInt : TipoDatoClave := Numero;
       varInteger : TipoDatoClave := Numero;
       varSingle : TipoDatoClave := Numero;
       varDouble : TipoDatoClave := Numero;
       varCurrency : TipoDatoClave := Numero;
       varDate : TipoDatoClave := Fecha;
       varOleStr : TipoDatoClave := Otros;
       varDispatch : TipoDatoClave := Otros;
       varError : TipoDatoClave := Otros;
       varBoolean : TipoDatoClave := Otros;
       varVariant : TipoDatoClave := Otros;
       varUnknown : TipoDatoClave := Desconocido;
       varShortint : TipoDatoClave := Numero;
       varByte : TipoDatoClave := Numero;
       varWord : TipoDatoClave := Numero;
       varLongWord : TipoDatoClave := Numero;
       varInt64 : TipoDatoClave := Numero;
       varStrArg : TipoDatoClave := Cadena;
       varString : TipoDatoClave := Cadena;
       varArray : TipoDatoClave := Otros;
       varByRef : TipoDatoClave := Otros;
       varUString : TipoDatoClave := Cadena;
       varTypeMask : TipoDatoClave := Otros;
    else
        TipoDatoClave := Otros;
    end;
end;
//------------------------------------------------------------------------------------
Function TipoElemento.TipoElementoVacio(): TipoElemento;
  Var X: TipoElemento;
  Begin
    X.Clave := '';
    X.Valor2 := NIL;
    TipoElementoVacio := X;
  End;
Function TipoElemento.EsTEVacio(): Boolean;
  Begin
    If (Clave = '') AND (Valor2 = NIL) Then
     begin
         EsTEVacio := True
     end
    else
     begin
         EsTEVacio := False;
     end;
  End;
//------------------------------------------------------------------------------------
Procedure TipoElemento.Inicializar(aTDC: TipoDatosClave; aValor1Inicial: Variant);
 Begin
    Case aTDC of
       Numero: clave := 0;
       Cadena: clave := '';
       Fecha: clave := Date;
    End;
 // Seteo el Valor Inicial del Valor 1 y NIL en el puntero
 Valor1:= aValor1Inicial;
 Valor2:= NIL;
 End;
end.
