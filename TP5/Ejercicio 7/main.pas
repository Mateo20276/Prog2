unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  QueuesPointer,
  ListPointer,
  Tipos;

type
  TForm1 = class(TForm)
    editCola2: TEdit;
    buttonEjecutar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    editCola1: TEdit;
    Memo1: TMemo;
    Label3: TLabel;
    editCola3: TEdit;
    editQ: TEdit;
    Label4: TLabel;
    procedure editCola2KeyPress(Sender: TObject; var Key: Char);
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


function ordenClientesAtendidos(Q: Integer; var cola1, cola2, cola3: Cola): Lista;
var
  elementoAux, elementoC1, elementoC2, elementoC3: TipoElemento;
  count1, count2, count3: Integer;
  countAnt1, countAnt2, countAnt3: Integer;

begin
  result.Crear(Cadena, 100);
  count1 := 1;  // Contadores posicion cliente en cola
  count2 := 1;
  count3 := 1;
  countAnt1 := 0;
  countAnt2 := 0;
  countAnt3 := 0;

  // Mientras haya personas esperando
  while (not cola1.EsVacia) or (not cola2.EsVacia) or (not cola3.EsVacia) do begin
    // Cola 1
    if not cola1.EsVacia then begin
      if count1 <> countAnt1 then begin
        elementoC1 := cola1.Recuperar;
        Inc(countAnt1);
      end;

      elementoC1.Clave := elementoC1.Clave - Q;
      if elementoC1.Clave <= 0 then begin
        elementoAux.Clave := 'Cliente ' + IntToStr(count1) + ' Cola 1';
        result.Agregar(elementoAux);
        cola1.DesEncolar;
        Inc(count1);
      end;
    end;

    // Cola 2
    if not cola2.EsVacia then begin
      if count2 <> countAnt2 then begin
        elementoC2 := cola2.Recuperar;
        Inc(countAnt2);
      end;

      elementoC2.Clave := elementoC2.Clave - Q;
      if elementoC2.Clave <= 0 then begin
        elementoAux.Clave := 'Cliente ' + IntToStr(count2) + ' Cola 2';
        result.Agregar(elementoAux);
        cola2.DesEncolar;
        Inc(count2);
      end;
    end;

    // Cola 3
    if not cola3.EsVacia then begin
      if count3 <> countAnt3 then begin
        elementoC3 := cola3.Recuperar;
        Inc(countAnt3);
      end;

      elementoC3.Clave := elementoC3.Clave - Q;
      if elementoC3.Clave <= 0 then begin
        elementoAux.Clave := 'Cliente ' + IntToStr(count3) + ' Cola 3';
        result.Agregar(elementoAux);
        cola3.DesEncolar;
        Inc(count3);
      end;
<<<<<<< Updated upstream

    end;
  end;



//  for i := 1 to Length(strC1) do begin
//    elementoC1 := cola1.Recuperar;
//    flag := False;
//    for j := 1 to Length(strC2) do begin
//      elementoC2 := cola2.Recuperar;
//      if elementoC1.Clave = elementoC2.Clave then flag := True;
//      cola2.DesEncolar;
//      cola2.Encolar(elementoC2);
//    end;
//    if flag = False then result := False;
//    cola1.DesEncolar;
//    cola1.Encolar(elementoC1);
//  end;

=======
    end;
  end;
>>>>>>> Stashed changes
end;


procedure cargarCola(str: String; var cola1: Cola);
var
  P: Integer;
  elemento: TipoElemento;
  Sep, aux: string;
begin
  cola1.Crear(Numero, 100);
  Sep := ',';

  if str.Substring(str.Length, 1) <> Sep then
    str := str + Sep;

  P := Pos(Sep, str);
  while P > 0 do begin
    aux := Copy(str, 1, P - 1);

    elemento.Clave := StrToInt(aux);
    cola1.Encolar(elemento);

    str := Copy(str, P + 1, Length(str));
    P := Pos(Sep, str);
  end;
end;



procedure TForm1.buttonEjecutarClick(Sender: TObject);
var strC1, strC2, strC3, output: String;
    cola1, cola2, cola3: Cola;
    Q: Integer;
    listaOutput: Lista;
begin
  memo1.Clear;
  strC1 := editCola1.Text;
  strC2 := editCola2.Text;
  strC3 := editCola3.Text;
  cargarCola(strC1, cola1);
  cargarCola(strC2, cola2);
  cargarCola(strC3, cola3);

  Q := StrToInt(editQ.Text);
<<<<<<< Updated upstream
  listaOutput.Crear(Cadena, 100);
  listaOutput := ordenClientesAtendidos(Q, cola1, cola2, cola3);
  memo1.Lines.Add(listaOutput.retornarClaves);
=======
  if Q <> 0 then begin
    listaOutput.Crear(Cadena, 100);
    listaOutput := ordenClientesAtendidos(Q, cola1, cola2, cola3);
    memo1.Lines.Add(listaOutput.retornarClaves);
  end
  else Application.MessageBox('"0" no es un valor valido para Q', 'Error', MB_OK)
>>>>>>> Stashed changes
end;



<<<<<<< Updated upstream


=======
>>>>>>> Stashed changes
procedure TForm1.editCola2KeyPress(Sender: TObject; var Key: Char);
begin
  key := UpCase(key);
  if (not (key in ['0'..'9'])) and (key<>',') and (key<>#8) then
    key := #0;
end;

end.
