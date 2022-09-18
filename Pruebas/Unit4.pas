unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ListArray,Unit_tipos;

type
  TForm4 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  list: Lista;
  x: Tipoelemento;

implementation

{$R *.dfm}
function listacargada():lista;
begin
  list.Crear(Numero,20);
  x.clave:=5;
  list.agregar(x);
  x.clave:=2;
  list.agregar(x);
  x.clave:=7;
  list.agregar(x);
  x.clave:=7;
  list.agregar(x);
  x.clave:=5;
  list.agregar(x);
  x.clave:=7;
  list.agregar(x);
  listacargada:= list;


end;

function buscarnumero(N: Tipoelemento):lista;
var pos: posicionlista;
    lisa: lista;
begin
  pos:= listacargada.comienzo;
  lisa.Crear(Numero,20);
  while (pos <> nulo) do
    begin
      if (listacargada.recuperar(pos).clave = N.clave) then begin lisa.agregar(N);
      end;

      pos:=listacargada.siguiente(pos);
    end;
  buscarnumero:= lisa;

end;


function buscarnumerorec(N: TipoElemento): Lista;
var L: Lista;
    E: Tipoelemento;
procedure recursiva(Q: PosicionLista);
    begin
      if Q <> Nulo then
      begin
        E:= listacargada.recuperar(Q);
        if E.clave = N.clave then L.agregar(N);
        recursiva(listacargada.Siguiente(Q));
        end;
      
    end;
begin
  L.Crear(listacargada.DatoDeLaClave, listacargada.SizeList);
  recursiva(listacargada.comienzo);
  buscarnumerorec:= L  
end;


    
  


procedure TForm4.Button1Click(Sender: TObject);
var x: tipoelemento;
begin
  Memo1.clear;
  Memo1.lines.add(listacargada.RetornarClaves);
  x.clave:= 7;
  //Memo1.lines.add(buscarnumero(x).RetornarClaves);
  Memo1.lines.add(buscarnumerorec(x).RetornarClaves)



end;


end.
