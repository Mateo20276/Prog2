unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Unit_tipos,
  ListArray,

  Unit_generador_random_de_patentes, Unit_lista_multas,
  FormAñadirMulta, FormAñadirPatente,
  Vcl.StdCtrls, Vcl.Buttons,Unit_lista_patentes;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo2: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    buttonAñadirMulta: TButton;
    buttonAñadirPatente: TButton;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure buttonAñadirMultaClick(Sender: TObject);
    procedure buttonAñadirPatenteClick(Sender: TObject);
    procedure actualizarOutput();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  lista_de_Patentes:listaDePatentes;
  i:integer;
  posicion:integer;
  posicionMulta,totalDeuda:integer;
  patente:tipoElemento;
  puntero:pointer;

implementation

{$R *.dfm}


procedure TForm3.buttonAñadirMultaClick(Sender: TObject);
var
  posItem: PosicionLista;
  patente: String;
  multa: ^datosMulta;
  nuevaMulta: TipoElemento;
  input1, input2, input3, input4: Boolean;
begin
  Form1.ShowModal();

  // Verifica que esten los campos llenos
  input1 := Form1.Edit1.GetTextLen>5;
  input2 := Form1.Edit2.GetTextLen>3;
  input3 := Form1.comboBoxEstado.GetTextLen<>0;
  input4 := Form1.Edit4.GetTextLen<>0;

  if input1 and input2 and input3 and input4 then begin
    patente := Form1.Edit1.Text;
    patente := patente[1] + patente[2] + patente[3] + ' ' + patente[4] + patente[5] + patente[6]; // agrego un espacio a la patente

    posItem := lista_de_patentes.obtenerPrimerPosicion;

    // validar que se encuentre añadida la patente
    while posItem<>Nulo do begin
      // si encuentra la patente, añade la multa
      if lista_de_patentes.obtenerPatente(posItem).Clave = patente then begin
        new(multa);
        multa^.fecha := DateTimeToStr(Form1.DatePicker1.Date);
        multa^.importe := StrToInt(Form1.Edit4.Text);
        multa^.estado := Form1.comboBoxEstado.Text;

        nuevaMulta.Clave := Form1.Edit2.Text; // numero de acta
        nuevaMulta.Valor2 := multa;

        lista_de_patentes.añadirMulta(posItem, nuevaMulta);
        actualizarOutput();
        Exit;
      end;
      // sino sigue buscando
      posItem := lista_de_Patentes.siguientePatente(posItem)
    end;
    Application.MessageBox('La patente ingresada no existe. No se pudo agregar la multa.', 'error', MB_OK);
  end;


end;



procedure TForm3.buttonAñadirPatenteClick(Sender: TObject);
var
  posItem: PosicionLista;
  patente: String;
begin
  Form2.ShowModal();
  patente := Form2.Edit1.Text;

  if patente.Length=6 then begin
    patente := patente[1] + patente[2] + patente[3] + ' ' + patente[4] + patente[5] + patente[6]; // agrego un espacio a la patente

    posItem := lista_de_patentes.obtenerPrimerPosicion;

    // validar que no se encuentre añadida
    while posItem<>Nulo do begin
      if lista_de_patentes.obtenerPatente(posItem).Clave = patente then begin
        Application.MessageBox('La patente ingresada ya existe', 'error', MB_OK);
        Exit;
      end;
      posItem := lista_de_Patentes.siguientePatente(posItem)
    end;

    // añadir patente
    lista_de_Patentes.agregarElemento(patente);
    actualizarOutput();

  end;
end;


procedure TForm3.actualizarOutput;
var listaAux: ^listaDeMultas;
begin
    posicion:=lista_de_patentes.obtenerPrimerPosicion;

    patente:=lista_de_patentes.obtenerPatente(posicion);

    edit1.Text:= patente.Clave;
    Label7.Caption:='POSICION EN LISTA: ' + posicion.ToString;
    memo1.Clear;
    for i := 1 to lista_de_patentes.posicionUltimaMulta(patente.Valor2) do
     begin
        memo1.Lines.Add(lista_de_patentes.obtenerMultaDePatente(patente.Valor2,i));
     end;

    memo1.Lines.Add('');
    memo1.Lines.Add('TOTAL DE DEUDA: $' + lista_de_patentes.calcularTotal(patente.Valor2) );

    listaAux := patente.Valor2;
    if listaAux.obtener_cantidad_items()>0 then begin
      memo1.Lines.Add('MULTA MAS VIEJA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,true));
      memo1.Lines.Add('MULTA MAS NUEVA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,false));
    end;

    Label4.Caption:=lista_de_patentes.calcularPatenteMasInfracciones;
    Label5.Caption:=lista_de_patentes.calcularPatenteMayorDeuda;

   for i := 1 to lista_de_patentes.obtenerUltimaPosicion do
     begin
        patente:=lista_de_patentes.obtenerPatente(i);
        memo2.Clear;
        if  lista_de_patentes.calcularTotal(patente.Valor2)='0'  then
         begin
             memo2.Lines.Add(patente.Clave);
         end;

     end;

end;



procedure TForm3.FormCreate(Sender: TObject);
var i,q,t:integer;
  posicion:integer;
  posicionMulta,totalDeuda:integer;
  patente:tipoElemento;
  puntero:pointer;
begin
    //creo una lista de patente y una patente
    lista_de_Patentes.crearListaPatentes;
    t:=10;
    for i := 1 to 11 do
    begin
        lista_de_Patentes.crearPatente;
        patente:=lista_de_patentes.obtenerPatente(i);
        if i= 11 then
         begin
            t:=12;
         end;
        for q := 1 to t do
         begin
            lista_de_patentes.agregarMultaAPatente(patente.Valor2);
         end;
    end;
  actualizarOutput();
end;


// BOTONES ATRAS/SIGUIENTE
procedure TForm3.BitBtn1Click(Sender: TObject);
var listaAux: ^listaDeMultas;
begin
    if lista_de_patentes.anteriorPatente(posicion)=Nulo then
     begin
       posicion:=lista_de_patentes.obtenerUltimaPosicion;
     end
    else
     begin
        posicion:=lista_de_patentes.anteriorPatente(posicion);
     end;

    patente:=lista_de_patentes.obtenerPatente(posicion);
    edit1.Text:=patente.Clave;
    Label7.Caption:='POSICION EN LISTA: ' + posicion.ToString;
    memo1.Clear;
    for i := 1 to lista_de_patentes.posicionUltimaMulta(patente.Valor2) do
     begin
        memo1.Lines.Add(lista_de_patentes.obtenerMultaDePatente(patente.Valor2,i));
     end;

    memo1.Lines.Add('');
    memo1.Lines.Add('TOTAL DE DEUDA: $' + lista_de_patentes.calcularTotal(patente.Valor2) );

    listaAux := patente.Valor2;
    if listaAux.obtener_cantidad_items()>0 then begin
      memo1.Lines.Add('MULTA MAS VIEJA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,true));
      memo1.Lines.Add('MULTA MAS NUEVA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,false));
    end;


end;




procedure TForm3.Button1Click(Sender: TObject);
var listaAux: ^listaDeMultas;
begin
    if lista_de_patentes.siguientePatente(posicion)=Nulo then
     begin
       posicion:=lista_de_patentes.obtenerPrimerPosicion;
     end
    else
     begin
        posicion:=lista_de_patentes.siguientePatente(posicion);
     end;

    patente:=lista_de_patentes.obtenerPatente(posicion);
    edit1.Text:=patente.Clave;
    Label7.Caption:='POSICION EN LISTA: ' + posicion.ToString;
    memo1.Clear;
    for i := 1 to lista_de_patentes.posicionUltimaMulta(patente.Valor2) do
     begin
        memo1.Lines.Add(lista_de_patentes.obtenerMultaDePatente(patente.Valor2,i));
     end;

    memo1.Lines.Add('');
    memo1.Lines.Add('TOTAL DE DEUDA: $' + lista_de_patentes.calcularTotal(patente.Valor2) );

    listaAux := patente.Valor2;
    if listaAux.obtener_cantidad_items()>0 then begin
      memo1.Lines.Add('MULTA MAS VIEJA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,true));
      memo1.Lines.Add('MULTA MAS NUEVA: '+ lista_de_patentes.calcularMultaVieja(patente.Valor2,false));
    end;

end;



end.
