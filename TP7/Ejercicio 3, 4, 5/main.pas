unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Unit2, TadHash, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    buttonAlta: TButton;
    editCodigo: TEdit;
    editDetalle: TEdit;
    editPrecio: TEdit;
    editStock: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    editSearch: TEdit;
    Label5: TLabel;
    editBaja: TEdit;
    Label6: TLabel;
    buttonBuscar: TButton;
    buttonBaja: TButton;
    buttonModificar: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    editDetalle2: TEdit;
    editPrecio2: TEdit;
    editStock2: TEdit;
    editCodigo2: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure buttonAltaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buttonBuscarClick(Sender: TObject);
    procedure buttonBajaClick(Sender: TObject);
    procedure buttonModificarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  A: Archivo;
  TablaProductos: TablaHash;

implementation

{$R *.dfm}

procedure TForm1.buttonBajaClick(Sender: TObject);
var product: Producto;
begin
  memo1.Lines.Clear;

  product.codigo := editBaja.Text;

  if Baja(product, TablaProductos, A) then begin
    Memo1.Lines.Add('Usuario dado de baja satisfactoriamente');
  end
  else Memo1.Lines.Add('Usuario no encontrado');

  A.GenerarIndex();

end;



procedure TForm1.buttonBuscarClick(Sender: TObject);
var product: Producto;
begin
  memo1.Lines.Clear;

  product.codigo := editSearch.Text;
  product := Buscar(product, TablaProductos, A);

  if product.codigo <> Null then begin
    Memo1.Lines.Add('Usuario encontrado satisfactoriamente');
    Memo1.Lines.Add(PrintData(product));
  end
  else Memo1.Lines.Add('Usuario no encontrado');
end;



procedure TForm1.buttonModificarClick(Sender: TObject);
var product: Producto;
    codigo, precio, stock, detalle: ShortString;

begin
  memo1.Lines.Clear;

  codigo := editCodigo2.Text;
  precio := editPrecio2.Text;
  stock := editStock2.Text;
  detalle := editDetalle2.Text;

  product.codigo := codigo;
  product := Buscar(product, TablaProductos, A);

  if product.codigo <> Null then begin
    Memo1.Lines.Add('Usuario encontrado satisfactoriamente');
    Memo1.Lines.Add(PrintData(product));

    product.precio := precio;
    product.stock := stock;
    product.detalle := detalle;

    if Modificacion(product, TablaProductos, A) then begin
      Memo1.Lines.Add('');
      Memo1.Lines.Add('Producto modificado correctamente');
      Memo1.Lines.Add(PrintData(product));
    end
    else Memo1.Lines.Add('Ha ocurrido un error');
  end
  else Memo1.Lines.Add('Usuario no encontrado');

  A.GenerarIndex();
end;




procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  memo1.Lines.Add('Porcentaje de ocupacion: ' + PorcentajeOcupacion(TablaProductos));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  memo1.Lines.Clear;
  memo1.Lines.Add('Porcentaje de claves en ZO vs cargadas: ' + PorcentajeColisionesVsCargadas(TablaProductos));
end;

procedure TForm1.buttonAltaClick(Sender: TObject);
var product: Producto;
    codigo, precio, stock, detalle: ShortString;

begin
  memo1.Lines.Clear;

  codigo := editCodigo.Text;
  precio := editPrecio.Text;
  stock := editStock.Text;
  detalle := editDetalle.Text;


//  product.codigo := codigo;
//  product := Buscar(product, TablaProductos, A);
//  if not(product.codigo <> null) then begin


  product := CrearProducto(codigo, precio, stock, detalle);

  if Alta(product, TablaProductos, A) then
   begin
    Memo1.Lines.Add('Producto registrado correctamente');
    Memo1.Lines.Add('');
    PrintData(product);

    end

  else
    Memo1.Lines.Add('Producto ya registrado');


  A.GenerarIndex();
end;




procedure TForm1.FormCreate(Sender: TObject);
begin
  A.Inicializar;
  TablaProductos := A.GenerarIndex;
end;



end.
