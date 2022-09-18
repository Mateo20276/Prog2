unit Unit2;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Tipos, ArbolesBinariosBusqueda;


const
      Null='Nulo';

Type

  Usuario = Object
      CUIT, RazonSocial, Domicilio, Telefono, Celular : ShortString;
      Estado: Boolean;
      procedure crear(aCUIT, aRazonSocial, aDomicilio, aTelefono, aCelular: ShortString);
      procedure UserNull();
      function printData(): String;
  End;

  ArchivoUsuarios = File Of Usuario;

  Archivo = Object
    files: ArchivoUsuarios;
    size: integer;
    procedure Inicializar();
    function alta(U:usuario):boolean;
    function modificacion(i:integer;U:Usuario):boolean;
    function baja(i:integer):boolean;
    function GenerarIndex():ArbolBB;
    function recuperar(i:integer):Usuario;
  end;

  Puser = ^Usuario;

  function Alta(U:Usuario;var Index:ArbolBB;var A:Archivo):boolean;
  function Modificacion(U:Usuario;var Index:ArbolBB;var A:Archivo):boolean;
  function Baja(U:Usuario;var Index:ArbolBB;var A:Archivo):boolean;
  function Buscar(U:Usuario;var Index:ArbolBB;var A:Archivo):Usuario;

implementation

//Metodos Objeto Usuario
procedure Usuario.crear(aCUIT, aRazonSocial, aDomicilio, aTelefono, aCelular: ShortString );
begin
  CUIT:=aCUIT;
  RazonSocial:=aRazonSocial;
  Domicilio:=aDomicilio;
  Telefono:=aTelefono;
  Celular:=aCelular;
  Estado := True;
end;


procedure Usuario.UserNull();
begin
  CUIT := Null;
end;


function Usuario.printData(): String;
begin
  result := 'CUIT: ' + CUIT + #13#10 +
  'Razon Social: ' + RazonSocial + #13#10 +
  'Domicilio: ' + Domicilio + #13#10 +
  'Telefono: ' + Telefono + #13#10 +
  'Celular: ' + Celular + #13#10;

  if Estado then
    result := result + 'Estado: ' + 'Habilitado'
  else result := result + 'Estado: ' + 'Desabilitado';
end;


//Metodos Objeto Archivo
procedure Archivo.Inicializar();
begin
  AssignFile(self.files,'Users');
  if (not fileexists('Users')) then Rewrite(self.files);
  reset(self.files);
  self.size := filesize(self.files);
  close(files);
end;


function Archivo.GenerarIndex(): ArbolBB;
var U:Usuario;
    i:integer;
    X:TipoElemento;
    Index:ArbolBB;
begin
  Index.Crear(Cadena, 500);
  i:=0;
  reset(self.files);
  while not EOF(Files) do begin
    read(Files,U);
    X.Clave:=U.CUIT;
    X.Valor1:=i;
    Index.Insertar(X);
    inc(i);
    seek(files,i);            // creo que no es necesario
  end;
  close(files);
  result := Index;
end;


function Archivo.alta(U:usuario): Boolean;
begin
  reset(files);
  seek(files,size);
  write(Files,U);
  close(files);
  inc(Size);
  alta:=true;
end;


function Archivo.baja(i:integer): Boolean;
var U:usuario;
begin
  reset(files);
  seek(files,i);
  read(files,U);
  U.Estado:=False;
  seek(files, i);
  write(files,U);
  closeFile(files);
end;


function Archivo.modificacion(i:integer;U:Usuario): Boolean;
begin
  reset(files);
  seek(files,i);
  write(files,U);
  close(files);
end;


function Archivo.recuperar(i:integer):Usuario;
var U:Usuario;
begin
  reset(files);
  seek(files,i);
  read(files,U);
  close(files);
  recuperar:=U;
end;


// Metodos ABM
function Alta(U:Usuario; var Index:ArbolBB;var A: Archivo):boolean;
var X:TipoElemento;
begin
  X.Clave:=U.CUIT;
  if Index.BusquedaBinaria(X)<>Nulo then begin
    Alta:=false;
    exit;
  end;
  X.Valor1 := A.size;
  A.alta(U);
  Index.Insertar(X);
  Alta:=true;
end;


function Modificacion(U: Usuario; var Index: ArbolBB; var A: Archivo):boolean;
var X:TipoElemento;
    i:integer;
    posArbol: PosicionArbol;
begin
  X.Clave:=U.CUIT;
  posArbol := Index.BusquedaBinaria(X);
  if posArbol=Nulo then begin
    Modificacion:=false;
    exit;
  end;
  X:=Index.Recuperar(posArbol);
  i:=X.Valor1;
  A.modificacion(i,U);
  // falta actualizar el arbol en memoria (dar de baja en el arbol)
  Modificacion:=true;
end;


function Baja(U: Usuario; var Index: ArbolBB; var A: Archivo): boolean;
var X:TipoElemento;
    i:integer;
    posArbol: PosicionArbol;
begin
  X.Clave:=U.CUIT;
  posArbol := Index.BusquedaBinaria(X);
  if posArbol=Nulo then begin
    Baja:=false;
    exit;
  end;
  X := Index.Recuperar(posArbol);
  i := X.Valor1;
  A.Baja(i);
  // falta actualizar el arbol en memoria (dar de baja en el arbol)
  Baja:=true;
end;


function Buscar(U:Usuario; var Index:ArbolBB; var A:Archivo): Usuario;
var X: TipoElemento;
    i: integer;
    posArbol: PosicionArbol;
begin
  X.Clave:=U.CUIT;
  posArbol := Index.BusquedaBinaria(X);
  if posArbol=Nulo then begin
    U.UserNull;
    result := U;
    Exit;
  end;
  X:=Index.Recuperar(posArbol);
  i:=X.Valor1;
  Buscar:=A.recuperar(i);
end;

end.
