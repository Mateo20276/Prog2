unit Unit_lista_multas;

interface
uses system.SysUtils,
     ListArray,
     Unit_tipos,
     Unit_generar_datos_random;
type
      datosMulta=record
        fecha:string;
        importe:integer;
        estado:string;
      end;

      listaDeMultas=object
      private
      listaMultas:Lista;
      public
         procedure crearListaMultas();
         procedure crearMultaRandom();
         procedure cargarMultasRandom();
         procedure crearMulta(fecha:string;importe:integer;estado:string;numeroActa:string);

         function accederLista(): Lista;  // retorna la lista
         function añadirElemento(multa: TipoELemento): Pointer;

         function obtenerMulta(posicion:PosicionLista):tipoElemento;
         function primerMulta():PosicionLista;
         function ultimaMulta():PosicionLista;
         function siguienteMulta(posicion:PosicionLista):PosicionLista;
         function anteriorMulta(posicion:PosicionLista):PosicionLista;

         function obtener_fecha_de_multa(puntero:pointer):string;
         function obtener_importe_de_multa(puntero:pointer):integer;
         function obtener_estado_de_multa(puntero:pointer):string;
         function obtener_cantidad_items():Integer;
      end;


implementation
//##############################################################################
//#######################    DATOS MULTA    ####################################
//##############################################################################
//----------------------------FECHA MULTA---------------------------------------
function listaDeMultas.obtener_fecha_de_multa(puntero: Pointer): string;
var multa:^datosMulta;
begin
    multa:=puntero;
    obtener_fecha_de_multa:= multa.fecha;
end;
//---------------------------IMPORTE MULTA--------------------------------------
function listaDeMultas.obtener_importe_de_multa(puntero: Pointer): Integer;
var multa:^datosMulta;
begin
    multa:=puntero;
    obtener_importe_de_multa:= multa.importe;
end;
//---------------------------IMPORTE MULTA--------------------------------------
function listaDeMultas.obtener_estado_de_multa(puntero: Pointer): string;
var multa:^datosMulta;
begin
    multa:=puntero;
    obtener_estado_de_multa:= multa.estado;
end;
//##############################################################################
//#######################      OUTPUTS      ####################################
//##############################################################################
//---------------------------OBTENER MULTA--------------------------------------
function listaDeMultas.obtenerMulta(posicion: Integer): tipoElemento;
begin
    obtenerMulta:=listaMultas.Recuperar(posicion);
end;
//----------------------------PRIMER MULTA--------------------------------------
function listaDeMultas.primerMulta: Integer;
begin
    primerMulta:=listaMultas.Comienzo;
end;
//----------------------------PRIMER MULTA--------------------------------------
function listaDeMultas.ultimaMulta: Integer;
begin
    ultimaMulta:=listaMultas.Fin;
end;
//----------------------------SIGUIENTE MULTA-----------------------------------
function listaDeMultas.siguienteMulta(posicion: Integer): PosicionLista;
begin
    siguienteMulta:=listaMultas.Siguiente(posicion);
end;
//----------------------------ANTERIOR MULTA------------------------------------

function listaDeMultas.anteriorMulta(posicion: Integer): Integer;
begin
    anteriorMulta:=listaMultas.Anterior(posicion)
end;


//----------------------------CANTIDAD ITEMS------------------------------------
function listaDeMultas.obtener_cantidad_items: Integer;
begin
    obtener_cantidad_items:=listaMultas.CantidadElementos;
end;

//##############################################################################
//########################     INPUTS      #####################################
//##############################################################################
//-------------------------CREAR LISTA DE MULTAS--------------------------------
procedure listaDeMultas.crearListaMultas;
begin
    listaMultas.Crear(Cadena,2000);
end;
//--------------------CARGA 1 MULTAS GENERADAS CON RANDOM-----------------------
procedure listaDeMultas.crearMultaRandom;
var nuevaMulta,multaRegistrada:tipoElemento;
         multa: ^datosMulta;
         generarDato:generarDatos;
begin
   //meto datos en el record
   new(multa);
   multa^.fecha:= generarDato.fecha;
   multa^.importe:=generarDato.importe;
   multa^.estado:=generarDato.estado;

   //meto un string en la clave del tipo elemento
   nuevaMulta.Clave:=generarDato.numeroActa;
   //quiero meter un record en valor1 del tipo elemento
   nuevaMulta.Valor2:=multa;

   //meto el tipo elemento en la lista
   listaMultas.Agregar(nuevaMulta);

end;
//-------------------CARGA 10 MULTAS GENERADAS CON RANDOM-----------------------
procedure listaDeMultas.cargarMultasRandom;
var i:integer;
begin
    for i := 1 to 10 do
     begin
         crearMultaRandom;
     end;
end;
//--------------------CARGA 1 MULTAS DEFINIDA POR USUARIO-----------------------
procedure listaDeMultas.crearMulta(fecha: string; importe: Integer; estado: string; numeroActa: string);
var nuevaMulta,multaRegistrada:tipoElemento;
         multa: ^datosMulta;
begin
   //meto datos en el record
   new(multa);
   multa^.fecha:= fecha;
   multa^.importe:= importe;
   multa^.estado:= estado;

   //meto un string en la clave del tipo elemento
   nuevaMulta.Clave:= numeroActa;
   //quiero meter un record en valor1 del tipo elemento
   nuevaMulta.Valor2:=multa;

   //meto el tipo elemento en la lista
   listaMultas.Agregar(nuevaMulta);

end;
//-------------------------ACTUALIZAR MULTA-------------------------------------

function listaDeMultas.añadirElemento(multa: TipoELemento): Pointer;
begin
  listaMultas.Agregar(multa);
end;

function listaDeMultas.accederLista: Lista;
begin
  result := listaMultas;
end;

end.

