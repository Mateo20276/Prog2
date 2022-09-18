unit Unit_lista_array;

interface
uses unit_tipos, stdctrls,system.SysUtils,variants;

const
    inicio= 1; //inicio de lista
    fin=2000; //fin de lista
    nulo= 0; //posicion no valida en lista
type
    posicionLista = longint; //posicion de item en lista
    lista =object
      private
          elementos: array of unit_tipos.tipoElemento;
          inicioFlag, finalFLAG: posicionLista; //banderas inicio final de lista
          cantidad_items: integer; //cantidad de items en la lista
          tamaño_lista: longint; //tamaño de la lista
          tipo_de_dato_clave: unit_tipos.TipoDatosClave; // Tipo de Dato de la Clave recibida en el crear lista vacia
          procedure intercambiar_posiciones(posicion1,posicion2:posicionLista);
      public
          function crear(tipo_de_clave: unit_tipos.TipoDatosClave; tamañoDeLista:longint): unit_tipos.Resultado;
          function consulta_listaVacia():boolean;
          function consulta_listaLLena():boolean;
          function consulta_posicionLista(posicionEnLista:posicionLista):boolean;
          function agregar_elemento(elemento: unit_tipos.tipoElemento):resultado;
          function insertar_elemento(elemento: unit_tipos.tipoElemento; posicion:posicionLista): unit_tipos.Resultado;
          function eliminar_elemento(posicion:posicionLista): unit_tipos.Resultado;
          function buscar_elemento(elemento: unit_tipos.tipoElemento):posicionLista;
          function siguiente_posicion_en_lista(posicion:posicionLista):posicionLista;
          function anterior_posicion_en_lista (posicion:posicionLista):posicionLista;
          function posicion_fisica(posicionLogica:integer):posicionLista;
          function recuperar_elemento(posicion:posicionLista): unit_tipos.tipoElemento;
          function actualizar_elemento(elemento:unit_tipos.tipoElemento;posicion:posicionLista): unit_tipos.Resultado;
          function obtener_todos_los_elementos():string;
          function llenar_lista_random(tamañoLista:longint; desdeRango, hastaRango:longint): unit_tipos.Resultado;
          function obtener_comienzo_de_lista():posicionLista;
          function obtener_final_de_lista():posicionLista;
          function obtener_cantidad_de_elementos():longint;
          function obtener_tipo_de_dato_clave(): unit_tipos.TipoDatosClave;
          function obtener_tamaño_lista: longint;
          function obtener_tamaño_maximo_lista: longint;
          procedure ordenar_lista(ascendente:boolean);
     end;
implementation
//----------------------------PUBLICO-------------------------------------------
//=============================ORDENAR LISTA====================================
procedure lista.ordenar_lista(ascendente: Boolean);
var posicion_uno,posicion_dos:posicionLista;
    elemento_uno,elemento_dos:unit_tipos.tipoElemento;
begin
    posicion_uno:=inicioFlag;
    while posicion_uno<> nulo do
        begin
            posicion_dos:=inicioFlag;
            while posicion_dos<>nulo do
                begin
                    elemento_uno:=elementos[posicion_dos];
                    if anterior_posicion_en_lista(posicion_dos)<>nulo then
                     begin
                         elemento_dos := elementos[posicion_dos+1];
                         if (ascendente=true) and (elemento_uno.Clave > elemento_dos.Clave) then
                          begin
                              intercambiar_posiciones(posicion_dos,posicion_dos+1);
                          end
                         else if (ascendente=false) and (elemento_uno.Clave < elemento_dos.Clave) then
                          begin
                              intercambiar_posiciones(posicion_dos,posicion_dos+1);
                          end;
                     end;
                    posicion_dos:= siguiente_posicion_en_lista(posicion_dos);
                end;
            posicion_uno:= siguiente_posicion_en_lista(posicion_uno);
        end;

end;
//========================OBTENER TAMAÑO DE LISTA===============================
function lista.obtener_tamaño_maximo_lista: Integer;
begin
    obtener_tamaño_maximo_lista:=fin;
end;
//========================OBTENER TAMAÑO DE LISTA===============================
function lista.obtener_tamaño_lista: Integer;
begin
    obtener_tamaño_lista:=tamaño_lista;
end;
//======================OBTENER TIPO DE DATO CLAVE==============================
function lista.obtener_tipo_de_dato_clave: TipoDatosClave;
begin
    obtener_tipo_de_dato_clave:=tipo_de_dato_clave;
end;
//=======================OBTENER CANTIDAD DE LISTA==============================
function lista.obtener_cantidad_de_elementos: Integer;
begin
    obtener_cantidad_de_elementos:=cantidad_items;
end;
//========================OBTENER FINAL DE LISTA================================
function lista.obtener_final_de_lista: posicionLista;
begin
    obtener_final_de_lista:=finalFLAG;
end;
//=======================OBTENER COMIENZO DE LISTA==============================
function lista.obtener_comienzo_de_lista: posicionLista;
begin
    obtener_comienzo_de_lista:=inicioFlag;
end;
//========================LLENAR LISTA CON RANDOM===============================
function lista.llenar_lista_random(tamañoLista: Integer; desdeRango: Integer; hastaRango: Integer): Resultado;
var elemento:unit_tipos.tipoElemento;
           i:longint;
begin
    llenar_lista_random:= CError;
    tipo_de_dato_clave:= Numero;
    if crear(tipo_de_dato_clave,tamañoLista)<> OK then
     begin
         llenar_lista_random:= CError;
         exit;
     end;
    elemento.Inicializar(numero,'');
    system.Randomize;
    while not (consulta_listaLLena)  do
        begin
            elemento.Clave:= desdeRango + random(hastaRango);
            agregar_elemento(elemento);
        end;
    llenar_lista_random:= OK;
end;
//=====================ACTUALIZAR UN ELEMENTO DE LA LISTA=======================
function lista.obtener_todos_los_elementos: string;
var posicion:posicionLista;
    elemento: unit_tipos.tipoElemento;
    stringUnitario, stringTotal:string;
begin
    stringTotal:='';
    posicion:=inicioFlag;
    while posicion <> nulo do
        begin
            elemento:= recuperar_elemento(posicion);
            stringUnitario:= elemento.armarString;
            stringTotal:= stringTotal + stringUnitario + unit_tipos.tabular;
            posicion:= siguiente_posicion_en_lista(posicion);
        end;
    obtener_todos_los_elementos:=stringTotal;
end;
//=====================ACTUALIZAR UN ELEMENTO DE LA LISTA=======================
function lista.actualizar_elemento(elemento: tipoElemento; posicion: posicionLista): Resultado;
begin
    actualizar_elemento := CError;
    if elemento.tipoDatoClave(elemento.Clave)<> tipo_de_dato_clave then
     begin
         actualizar_elemento:= ClaveIncompatible;
         Exit;
     end
    else if consulta_posicionLista(posicion) then
     begin
         elementos[posicion]:=elemento;
         actualizar_elemento:= OK;
     end;
end;
//=====================RECUPERAR UN ELEMENTO DE LA LISTA========================
function lista.recuperar_elemento(posicion: posicionLista): tipoElemento;
var elemento: unit_tipos.tipoElemento;
begin
    recuperar_elemento:=elemento.TipoElementoVacio;
    if consulta_posicionLista(posicion) then
     begin
         recuperar_elemento:= elementos[posicion];
     end;
end;
//=========================POSICION FISICA EN LISTA=============================
function lista.posicion_fisica(posicionLogica: Integer): Integer;
begin
    posicion_fisica:=nulo;
    if (posicionLogica > 0) and (posicionLogica<= cantidad_items) then
     begin
         cantidad_items:=posicionLogica;
     end;
end;
//========================ANTERIOR POSICION EN LISTA============================
function lista.anterior_posicion_en_lista(posicion: Integer): posicionLista;
begin
    anterior_posicion_en_lista:= Nulo;
    if consulta_posicionLista(posicion) and (posicion>inicioFlag) then
     begin
         anterior_posicion_en_lista:= posicion-1;
     end;
end;
//========================SIGUIENTE POSICION EN LISTA===========================
function lista.siguiente_posicion_en_lista(posicion: Integer): posicionLista;
begin
    siguiente_posicion_en_lista:= Nulo;
    if consulta_posicionLista(posicion) and (posicion<finalFLAG) then
     begin
         siguiente_posicion_en_lista:= posicion+1;
     end;
end;
//========================BUSCAR ELEMENTO EN LISTA==============================
function lista.buscar_elemento(elemento: tipoElemento): posicionLista;
var posicionEnLista:posicionLista;
           encontro:boolean;
begin
    buscar_elemento:=nulo;
    if elemento.tipoDatoClave(elemento.Clave)<> tipo_de_dato_clave then
     begin
         exit;
     end;
    encontro:=false;
    posicionEnLista:=inicioFlag;
    while (posicionEnLista<>nulo) and (posicionEnLista<=finalFLAG) and (encontro=false) do
     begin
         if elementos[posicionEnLista].Clave= elemento.Clave then
          begin
              encontro:=true;
          end
         else
          begin
              posicionEnLista:=posicionEnLista+1;
          end;
     end;
    if encontro=true then
     begin
         buscar_elemento:=posicionEnLista;
     end;
end;
//=======================ELIMINAR ELEMENTO EN LISTA=============================
function lista.eliminar_elemento(posicion: Integer): Resultado;
var posicionEnLista:posicionLista;
begin
    eliminar_elemento:= CError;
    if consulta_listaVacia then
     begin
         eliminar_elemento:= Vacia;
     end
    else
     begin
         if consulta_posicionLista(posicion) then
          begin
              for posicionEnLista := posicion to finalFLAG-1 do
                begin
                    elementos[posicionEnLista]:=elementos[posicionEnLista+1];
                end;
                finalFLAG:=finalFLAG-1;
                cantidad_items:=cantidad_items-1;
                if finalFLAG < inicioFlag then //crea una lista vacia
                 begin
                     crear(tipo_de_dato_clave,tamaño_lista)
                 end;
                eliminar_elemento:= OK;
          end
         else
          begin
              eliminar_elemento:= PosicionInvalida;
          end;
     end;
end;
//=======================INSERTAR ELEMENTO EN LISTA=============================
function lista.insertar_elemento(elemento: tipoElemento; posicion: Integer): Resultado;
var posicionEnLista:posicionLista;
begin
    insertar_elemento:= CError;  // Controla que el Tipo de Dato de la Clave sea Homogeneo a la Lista
    if elemento.tipoDatoClave(elemento.Clave)<> tipo_de_dato_clave then
     begin
         insertar_elemento:= ClaveIncompatible;
         exit;
     end;
    if consulta_listaLLena then   //si lista esta llena devuelve llena
     begin
         insertar_elemento := LLena;
     end
    else
     begin
         if consulta_posicionLista(posicion) then
          begin
              for posicionEnLista := finalFLAG to posicion do //mueve un espacio desde final de flag hasta posicion ingresada
                begin
                    elementos[posicionEnLista+1] := elementos[posicionEnLista];
                end;
                elementos[posicion]:=elemento;
                finalFLAG:=finalFLAG+1;
                cantidad_items:=cantidad_items+1;
                insertar_elemento := OK;
          end
         else
          begin
              insertar_elemento:= PosicionInvalida;
          end;
     end;

end;
//===================CONSULTAR SI POSICION EN LISTA ES VALIDA===================
function lista.consulta_posicionLista(posicionEnLista: Integer): Boolean;
begin
    if not consulta_listaLLena and (posicionEnLista>=inicioFlag) and (posicionEnLista<=finalFLAG) then
     begin
         consulta_posicionLista:= true;
     end
    else
     begin
         consulta_posicionLista:= false;
     end;
end;
//=======================AGREGAR ELEMENTO A LISTA===============================
function lista.agregar_elemento(elemento: tipoElemento): Resultado;
begin
    agregar_elemento := CError;
    if elemento.tipoDatoClave(elemento.Clave)<> tipo_de_dato_clave then
     begin
         agregar_elemento:= ClaveIncompatible;
         exit;
     end;

    If consulta_listaLLena Then //consulta si la lista esta llena o no
     begin
         agregar_elemento := LLena
     end
    else
     begin
         finalFLAG:= finalFLAG +1; //aumenta en 1 el flag del final
         elementos[finalFLAG]:=elemento; // agrega el elemento en el nuevo flag
         cantidad_items:=cantidad_items+1;
         if consulta_listaVacia then
          begin
              inicioFlag:= finalFLAG;
          end;
         agregar_elemento := OK;
     end;
end;
//=======================CONSULTAR SI LISTA ESTA LLENA==========================
function lista.consulta_listaLLena: Boolean;
begin
    if fin = tamaño_lista then
     begin
         consulta_listaLLena:=true;
     end
    else
     begin
         consulta_listaLLena:= false;
     end;
end;
//=======================CONSULTAR SI LISTA ESTA VACIA=========================
function lista.consulta_listaVacia: Boolean;
begin
    if inicio = nulo then
     begin
        consulta_listaVacia:=true;
     end
    else
     begin
        consulta_listaVacia:=false;
     end;
end;

//============================CREAR LISTA=======================================
function lista.crear(tipo_de_clave: TipoDatosClave; tamañoDeLista: Integer): Resultado;
begin
   if tamañoDeLista < inicio then
    begin
        crear:= CError;
    end
   else if tamañoDeLista > fin then
    begin
        crear:=CError;
    end
   else if (tamañoDeLista>=inicio) and (tamañoDeLista<=fin) then
    begin
        inicioFlag:=nulo;
        finalFlag:=nulo;
        cantidad_items:=0;
        tipo_de_dato_clave:=tipo_de_clave;
        tamaño_lista:=tamañoDeLista;
        SetLength(elementos, (tamañoDeLista+1));
        crear:= OK;
    end;
end;
//----------------------------PRIVADO-------------------------------------------
procedure lista.intercambiar_posiciones(posicion1: Integer; posicion2: Integer);
var elemento_uno,elemento_dos: unit_tipos.tipoElemento;
begin
    elemento_uno :=  elementos[posicion1];
    elemento_dos :=  elementos[posicion2];
    elementos[posicion1] := elemento_dos;
    elementos[posicion2] := elemento_uno;
end;
end.
