unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  //Mis Tads
  //StackArray,
  StackCursor,
  //StackPointer,

  Tipos;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
const
    numeros = ['0'..'9'];
    variables = ['a'..'z', 'A'..'Z'];
    operadores = ['+','-','*','/'];
    parentesis = ['(',')'];

function fbf(input: String; var pila1, pila2: Pila): String;
var
  elemento, tope1, tope2: TipoElemento;
  strSig, strAnt: String;
  esValido: Boolean;
  countp1,countp2, count2: Integer;

begin
  countp1 := 0;    //  contador parentesis abiertos
  countp2 := 0;    //  contador parentesis cerrados
  count2 := 0;     //  contador caracteres validos

  while not pila1.EsVacia do begin
    tope1 := pila1.recuperar;
    pila1.desapilar;
    strSig := tope1.clave;

    // PRIMER CARACTER
    if pila2.esvacia then begin
      esValido := (strSig = '(') or (strSig = '-') or (strSig[1] in variables) or (strSig[1] in numeros);
      if esValido then begin
        Inc(count2);
        pila2.apilar(tope1);
        if strSig = '(' then Inc(countp1);
        // Si no está vacía, continua a la siguiente iteración, sino, termina
        if not pila1.esVacia then Continue else Break;
      end
      // Si no es valido:
      else Break;
    end;

    // Si la pila2 esta cargada (ya leyo el primer caracter de la pila1)
    // SIGUIENTES CARACTERES
    tope2 := pila2.recuperar;
    pila2.desapilar;
    strAnt := tope2.clave;

    // Si el caracter anterior era "abrir paréntesis"
    if strAnt = '(' then begin
      esValido := (strSig[1] in numeros) or (strSig[1] in variables) or (strSig = '-') or (strSig = '(');
      if esValido then begin
        Inc(count2);
        pila2.apilar(tope1);
        if strSig = '(' then Inc(Countp1);
      end
      // Si no es valido:
      else Break;
    end

    // Si el caracter anterior era "cerrar paréntesis"
    else if strAnt = ')' then begin
      esValido := (strSig[1] in operadores) or (strSig = ')');
      if esValido then begin
        Inc(Count2);
        pila2.apilar(tope1);
        if strSig = ')' then inc(Countp2);
      end
      // Si no es valido:
      else Break;
    end

    // Si el caracter anterior era un numero o una variable
    else if (strAnt[1] in numeros) or (strAnt[1] in variables) then begin
      esValido := (strSig[1] in operadores) or (strSig = ')');
      if esValido then begin
        Inc(Count2);
        pila2.apilar(tope1);
        if strSig = ')' then inc(Countp2);
      end
      // Si no es valido:
      else Break;
    end

    // Si el caracter anterior era un operador
    else if (strAnt[1] in operadores) then begin
      esValido:= (strSig[1] in numeros) or (strSig= '(') or (strSig[1] in variables);
      if esValido then begin
        Inc(Count2);
        pila2.apilar(tope1);
        if strSig = '(' then inc(Countp1);
      end
      // Si no es valido:
      else Break;
    end
  end;

  // FIN
  if ((count2 = Length(input)) and (countp1= countp2) and not(strSig[1] in operadores) ) then
    result := 'Formula bien formada'
  else result := 'Formula mal formada';
end;


procedure cargarpila(input: String; var pila1: Pila);
var
  elemento: Tipoelemento;
  i, tamaño: Integer;
begin
  tamaño := Length(input);
  for i := 1 to tamaño do begin
    elemento.clave:= input[(tamaño+1) - i];
    pila1.apilar(elemento);
  end;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  pila1,pila2: pila;
  input, output: String;
begin
  input := Form1.Edit1.Text;
  pila1.Crear(cadena, 50);
  pila2.Crear(cadena, 1);
  cargarpila(input, pila1);

  output := fbf(input, pila1, pila2);
  memo1.Lines.Clear;
  memo1.Lines.Add(output);
end;


// Validacion de caracteres
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not ((Key in variables) or (Key in numeros) or (Key in operadores) or (Key in parentesis) or (key=#8)) then
    Key := #0
end;

end.
