unit Unit2;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Tipos, TadHash, ListArray;


const
  Null='Nulo';

Type

  Producto = Record
    codigo, precio, stock, detalle: ShortString;
    estado: Boolean;
//      procedure crear(aCUIT, aRazonSocial, aDomicilio, aTelefono, aCelular: ShortString);
//      procedure UserNull();
//      function printData(): String;
  End;

  ArchivoProductos = File Of Producto;

  Archivo = Object
    files: ArchivoProductos;
    size: integer;
    procedure Inicializar();
    function alta(P: Producto):boolean;
    function alta2(x: TipoElemento; P:Producto): Boolean;
    function modificacion(i:integer; P: Producto):boolean;
    function baja(i:integer): Boolean;
    function GenerarIndex(): TablaHash;
    function recuperar(i:integer): Producto;
  end;

  function Alta(P: Producto; var Index: TablaHash; var A: Archivo): Boolean;
  function Modificacion(P: Producto; var Index: TablaHash; var A: Archivo): Boolean;
  function Baja(P: Producto; var Index: TablaHash; var A: Archivo): Boolean;
  function Buscar(P: Producto; var Index: TablaHash; var A: Archivo): Producto;

  function CrearProducto(codigo, precio, stock, detalle: ShortString): Producto;
  function PrintData(P: Producto): String;
  function PorcentajeOcupacion(Tabla: TablaHash): String;
  function PorcentajeColisionesVsCargadas(Tabla: TablaHash): String;


implementation

//Metodos Objeto Usuario
function CrearProducto(codigo, precio, stock, detalle: ShortString): Producto;
var R: Producto;
begin
  R.codigo := codigo;
  R.precio := precio;
  R.stock := stock;
  R.detalle := detalle;
  R.estado := True;

  result := R;
end;


function PorcentajeOcupacion(Tabla: TablaHash): String;
begin
  result := Round(((Tabla.CantidadOcupados * 100) / Tabla.TableSize)).ToString + '%';
end;

function PorcentajeColisionesVsCargadas(Tabla: TablaHash): String;
var colisiones, cargadas: string;
begin
  result := Round(((Tabla.CantidadClavesZO * 100) / Tabla.CantidadClaves)).ToString + '%';
end;


function PrintData(P: Producto): String;
begin
  result := 'Codigo: ' + P.codigo + #13#10 +
  'Detalle: ' + P.detalle + #13#10 +
  'Estado: ' + BoolToStr(P.estado) + #13#10 +
  'Precio: ' + P.precio + #13#10 +
  'Stock: ' + P.stock + #13#10;

  if P.estado then
    result := result + 'Estado: ' + 'Habilitado'
  else result := result + 'Estado: ' + 'Desabilitado';
end;


//Metodos Objeto Archivo
procedure Archivo.Inicializar();
begin
  AssignFile(self.files,'Productos');
  if (not fileexists('Productos')) then Rewrite(self.files);
  reset(self.files);
  self.size := filesize(self.files);
  close(files);
end;


function Archivo.GenerarIndex(): TablaHash;
var P: Producto;
    i: integer;
    X: TipoElemento;
    Index: TablaHash;
begin
  Index.Crear(Cadena, Modulo, 100, 97);
  i := 0;
  reset(self.files);
  while not EOF(Files) do begin
    read(Files, P);
    X.Clave := P.codigo;
    X.Valor1 := i;
    Index.Insertar(X);
    Inc(i);
    Seek(files, i);            // creo que no es necesario
  end;
  close(files);
  result := Index;
end;


function Archivo.alta(P: Producto): Boolean;
begin
  reset(files);
  seek(files, size);
  write(Files, P);
  close(files);
  inc(Size);
  alta := true;
end;


function Archivo.baja(i: Integer): Boolean;
var P: Producto;
begin
  reset(files);
  seek(files, i);
  read(files, P);
  P.Estado := False;
  seek(files, i);
  write(files, P);
  closeFile(files);
end;


function Archivo.modificacion(i:integer; P: Producto): Boolean;
begin
  reset(files);
  seek(files,i);
  write(files, P);
  close(files);
end;


function Archivo.recuperar(i:integer): Producto;
var P: Producto;
begin
  reset(files);
  seek(files,i);
  read(files, P);
  close(files);
  recuperar:= P;
end;

function Archivo.alta2(x: TipoElemento; P:Producto): Boolean;
var i: Integer;
begin
  i := X.Valor1;
  reset(files);
  seek(files, i);
  read(files, P);
  P.Estado := True;
  seek(files, i);
  write(files, P);
  closeFile(files);
end;


// Metodos ABM
function Alta(P: Producto; var Index: TablaHash; var A: Archivo): Boolean;
var X: TipoElemento;
    PL: Variant;
    posTabla: PosicionTabla;
    i: Integer;
begin
  X.Clave := P.codigo;
  posTabla := Index.Buscar(X, PL);
  // Si lo encontro, solo modifica su estado a HABILITADO
  if posTabla <> posNula then begin

    X := Index.Recuperar(posTabla, PL);
    A.alta2(x, P);
    Alta := False;

//    P := Index.Recuperar(posTabla, PL);
//    i := X.Valor1;
//    A.Alta(P);
    Alta := True;

    Exit;
  end;
  // Sino, lo CREA
  X.Valor1 := A.Size;
  A.Alta(P);
  Index.Insertar(X);
  Alta := True;
end;

function Modificacion(P: Producto; var Index: TablaHash; var A: Archivo): Boolean;
var X: TipoElemento;
    i: Integer;
    posTabla: PosicionTabla;
    PL: Variant;
begin
  X.Clave := P.codigo;
  posTabla := Index.Buscar(X, PL);
  if posTabla = Nulo then begin
    Modificacion := False;
    exit;
  end;
  X := Index.Recuperar(posTabla, PL);
  i := X.Valor1;
  A.modificacion(i, P);
  // falta actualizar el arbol en memoria (dar de baja en el arbol)
  Modificacion := True;
end;


function Baja(P: Producto; var Index: TablaHash; var A: Archivo): boolean;
var X:TipoElemento;
    i:integer;
    posTabla: PosicionTabla;
    PL: Variant;
begin
  X.Clave := P.codigo;
  posTabla := Index.Buscar(X, PL);
  if posTabla = Nulo then begin
    Baja := False;
    Exit;
  end;
  X := Index.Recuperar(posTabla, PL);
  i := X.Valor1;
  A.Baja(i);
  Baja := True;
end;


function Buscar(P: Producto; var Index: TablaHash; var A: Archivo): Producto;
var X: TipoElemento;
    i: integer;
    posTabla: PosicionTabla;
    PL: Variant;
begin
  X.Clave := P.codigo;
  posTabla := Index.Buscar(X, PL);
  if posTabla = Nulo then begin
    P.codigo := Null;
    result := P;
    Exit;
  end;
  X := Index.Recuperar(posTabla, PL);
  i := X.Valor1;
  Buscar := A.recuperar(i);
end;

end.
