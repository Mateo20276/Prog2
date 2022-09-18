unit Unit_lista_patentes;

interface
uses system.SysUtils,
     Unit_generador_random_de_patentes,
     ListArray,
     Unit_tipos,
     Unit_lista_multas;
type
//------------------------------------------------------------------------------
    listaDePatentes=object
      private
         listaPatentes:Lista;
      public
         procedure crearListaPatentes();
         procedure crearPatente();

         procedure agregarElemento(patente: String); // añade una patente

         function obtenerPatente(posicion:PosicionLista):tipoElemento;
         function obtenerPrimerPosicion():integer;
         function obtenerUltimaPosicion():integer;
         function siguientePatente(posicion:PosicionLista):PosicionLista;
         function anteriorPatente(posicion:PosicionLista):PosicionLista;
         procedure añadirMulta(posPatente: Integer; multa: TipoElemento);

//#######################      MULTAS      #####################################
         procedure agregarMultaAPatente(puntero:pointer);
         function posicionPrimerMulta(puntero:pointer):integer;
         function posicionUltimaMulta(puntero:pointer):integer;
         function posicionSiguienteMulta(posicion:PosicionLista;puntero:pointer):integer;
         function posicionAnteriorMulta(posicion:PosicionLista;puntero:pointer):integer;
         function obtenerMultaDePatente(puntero:pointer;posicion:PosicionLista):string;
//#######################     CALCULOS     #####################################
         function calcularTotal(puntero:pointer):string;
         function calcularMultaVieja(puntero:pointer;vieja:boolean):string;
         function calcularPatenteMasInfracciones():string;
         function calcularPatenteMayorDeuda():string;
    end;

var lista_de_multas:^listaDeMultas;

implementation
//##############################################################################
//#######################     CALCULOS     #####################################
//##############################################################################
//------------------------PATENTE CON MAS DEUDA---------------------------------
function listaDePatentes.calcularPatenteMayorDeuda: string;
var patente,patenteSiguiente:tipoElemento;
    i,retornoPosicion:integer;
    retorno,deuda1,deuda2:string;
begin
   i:=1;
   patente:=listaPatentes.Recuperar(i);
   retorno:=patente.Clave;
   deuda1:= calcularTotal(patente.Valor2);

   retornoPosicion:= i+1;

   while i<obtenerUltimaPosicion do
    begin
        patenteSiguiente:=listaPatentes.Recuperar(i+1);
        deuda2:= calcularTotal(patenteSiguiente.Valor2);
        if deuda1.ToInteger < deuda2.ToInteger then
         begin
            retorno:=patenteSiguiente.Clave;
            deuda1:=deuda2;
            retornoPosicion:= i+1;
         end;
        i:=i+1;
    end;
   retorno := retorno + ' deuda: ' + deuda1 + ' posicion en lista: ' + retornoPosicion.ToString;
   calcularPatenteMayorDeuda:=retorno;
end;
//---------------------PATENTE CON MAS INFRACCIONES-----------------------------
function listaDePatentes.calcularPatenteMasInfracciones(): string;
var multas1,multas2:^listaDeMultas;
    patente,patenteSiguientemulta:tipoElemento;
    i,cantidadElementos,retornoPosicion:integer;
    retorno:string;
begin
   i:=1;
   patente:=listaPatentes.Recuperar(i);
   retorno:=patente.Clave;
   multas1:= patente.Valor2;
   retornoPosicion:= i+1;

   cantidadElementos:=multas1.obtener_cantidad_items;

   while i<obtenerUltimaPosicion do
    begin
        patenteSiguientemulta:=listaPatentes.Recuperar(i+1);
        multas2:= patenteSiguientemulta.Valor2;
        if cantidadElementos < multas2.obtener_cantidad_items then
         begin
            retorno:=patenteSiguientemulta.Clave;
            cantidadElementos:=multas2.obtener_cantidad_items;
            retornoPosicion:= i+1;
         end;
        i:=i+1;
    end;
   retorno := retorno + ' cantidad infraccciones: ' + cantidadElementos.ToString + ' posicion en lista: ' + retornoPosicion.ToString;
   calcularPatenteMasInfracciones:=retorno;
end;
//---------------------------DEUDA MAS VIEJA------------------------------------
function listaDePatentes.calcularMultaVieja(puntero: Pointer;vieja:boolean): string;
var multas_de_patentes:^listaDeMultas;
    multa1,multa2:tipoElemento;
    i:integer;
    retorno:string;
    fecha1,fecha2:Tdate;
begin

    multas_de_patentes:=puntero;
    i:=1;
    multa1:=multas_de_patentes.obtenerMulta(i);
    retorno:= obtenerMultaDePatente(puntero,i);


    fecha1:=StrToDate(multas_de_patentes.obtener_fecha_de_multa(multa1.Valor2));

    while i <multas_de_patentes.ultimaMulta do
     begin
        multa2:=multas_de_patentes.obtenerMulta(i+1);
        fecha2:=StrToDate(multas_de_patentes.obtener_fecha_de_multa(multa2.Valor2));
        if (fecha1>fecha2)and (vieja=true) then
         begin
            retorno:= obtenerMultaDePatente(puntero,i+1);
            fecha1:=fecha2;
         end
        else if (fecha1<fecha2)and (vieja=false) then
         begin
            retorno:= obtenerMultaDePatente(puntero,i+1);
            fecha1:=fecha2;
         end;


        i:=i+1
     end;
    calcularMultaVieja:=retorno;
end;
//------------------------DEUDA TOTAL DE UN AUTO--------------------------------
function listaDePatentes.calcularTotal(puntero: Pointer): string;
var multas_de_patentes:^listaDeMultas;
    multa:tipoElemento;
    i,retorno:integer;
begin
    multas_de_patentes:=puntero;
    retorno:=0;
    for i := 1 to multas_de_patentes.ultimaMulta do
     begin
        multa:=multas_de_patentes.obtenerMulta(i);
        if 'pendiente' = multas_de_patentes.obtener_estado_de_multa(multa.Valor2) then
         begin
             retorno:= retorno + multas_de_patentes.obtener_importe_de_multa(multa.Valor2);
         end;
     end;
    calcularTotal:=retorno.ToString;
end;


//##############################################################################
//#######################      MULTAS      #####################################
//##############################################################################

//----------------------------POSICION PRIMER MULTA-----------------------------
function listaDePatentes.posicionPrimerMulta(puntero: Pointer): Integer;
var multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;
    posicionPrimerMulta:=multas_de_patentes.primerMulta;
end;


//----------------------------POSICION ULTIMA MULTA-----------------------------
function listaDePatentes.posicionUltimaMulta(puntero: Pointer): Integer;
var multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;
    posicionUltimaMulta:= multas_de_patentes.ultimaMulta;
end;


//-------------------------POSICION SIGUIENTE MULTA-----------------------------
function listaDePatentes.posicionSiguienteMulta(posicion:PosicionLista;puntero: Pointer): Integer;
var multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;
    posicionSiguienteMulta:=multas_de_patentes.siguienteMulta(posicion);
end;


//-------------------------POSICION ANTERIOR MULTA------------------------------
function listaDePatentes.posicionAnteriorMulta(posicion: Integer; puntero: Pointer): Integer;
var multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;
    posicionAnteriorMulta:=multas_de_patentes.anteriorMulta(posicion);
end;


//-----------------------------AGREGAR MULTA------------------------------------
procedure listaDePatentes.agregarMultaAPatente(puntero: Pointer);
var multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;
    multas_de_patentes.crearMultaRandom;
end;


//-----------------------------OBTENER MULTA------------------------------------
function listaDePatentes.obtenerMultaDePatente(puntero:pointer;posicion:PosicionLista): string;
var multa:tipoElemento;
    fecha,estado,retorno,tabular:string;
    importe:integer;
    multas_de_patentes:^listaDeMultas;
begin
    multas_de_patentes:=puntero;

    multa:=multas_de_patentes.obtenerMulta(posicion);

    fecha:=multas_de_patentes.obtener_fecha_de_multa(multa.Valor2);
    importe:= multas_de_patentes.obtener_importe_de_multa(multa.Valor2);
    estado:= multas_de_patentes.obtener_estado_de_multa(multa.Valor2);
    tabular:= '  ';
    retorno:= fecha+ tabular + importe.ToString + tabular + estado;
    obtenerMultaDePatente:= retorno;
end;


//##############################################################################
//#######################      PATENTES      ###################################
//##############################################################################

//----------------------------PRIMER PATENTES-----------------------------------
function listaDePatentes.obtenerUltimaPosicion: Integer;
begin
   obtenerUltimaPosicion:=listaPatentes.Fin;
end;


//----------------------------PRIMER PATENTES-----------------------------------
function listaDePatentes.obtenerPrimerPosicion: Integer;
begin
    obtenerPrimerPosicion:=listaPatentes.Comienzo;
end;


//----------------------------ANTERIOR PATENTES---------------------------------
function listaDePatentes.anteriorPatente(posicion: Integer): PosicionLista;
begin
    anteriorPatente:=listaPatentes.Anterior(posicion);
end;



//---------------------------SIGUIENTE PATENTES---------------------------------
function listaDePatentes.siguientePatente(posicion: Integer): PosicionLista;
begin
    siguientePatente:=listaPatentes.Siguiente(posicion);
end;


//----------------------------OBTENER PATENTES----------------------------------
function listaDePatentes.obtenerPatente(posicion: Integer): tipoElemento;
begin
    obtenerPatente:=listaPatentes.Recuperar(posicion);
end;


//----------------------------CREAR PATENTES------------------------------------
procedure listaDePatentes.crearPatente;
var patente:tipoElemento;
    nuevaPatente:generarPatente ;
begin
    patente.Clave:= nuevaPatente.generarPatente;

    new(lista_de_multas);

    lista_de_multas.crearListaMultas;

    patente.Valor2:= lista_de_multas;

    listaPatentes.Agregar(patente);
end;


//------------------------CREAR LISTA DE PATENTES-------------------------------
procedure listaDepatentes.crearListaPatentes;
begin
    listaPatentes.Crear(Cadena,2000);
end;





procedure listaDePatentes.añadirMulta(posPatente: Integer;
  multa: TipoElemento);
var
  listaAux: ^listaDeMultas;
  elementoAux: TipoElemento;
begin
  New(listaAux);
  listaAux := listaPatentes.Recuperar(posPatente).Valor2;   // se copio la lista de multas
  listaAux.añadirElemento(multa);

  elementoAux.Valor2 := listaAux;
  //self.recuperar(posPatente).Valor2^.agregar(multa);

  //Dispose(listaPatentes.Recuperar(posPatente).Valor2);  // libero la memoria de la lista de multas desactualizada
  listaPatentes.Actualizar(elementoAux, posPatente); // debo pasarle la lista actualizada como argumento, para que la reemplace


end;



procedure listaDePatentes.agregarElemento(patente: String);
var
  patenteElemento: tipoElemento;
  listaMultasAux: ^ListaDeMultas;
begin
    patenteElemento.Clave := patente;
    new(listaMultasAux);
    listaMultasAux.crearListaMultas;
    patenteElemento.Valor2 := listaMultasAux;

    listaPatentes.Agregar(patenteElemento);
end;

end.
