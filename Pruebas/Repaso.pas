function HojasRecursivo(A: Arbol): Lista;
var    L: Lista;

    procedure recorrido(Q: PosicionArbol);
    begin
        if not A.RamaNula(Q) then begin
            recorrido(A.HijoIzquierdo(Q));
            recorrido(A.HijoDerecho(Q));
            if (A.HijoIzquierdo(Q) <> Nulo) and (A.HijoDerecho(Q) <> Nulo) then L.Añadir(A.Recuperar(Q));
        end;
    end;

begin
    L.Crear(A.DatoDeLaClave, A.SizeTree);
    recorrido(A.Root);
    result := L;
end;



function HojasIterativo(A: Arbol): Lista;
var posicion: TipoElemento;
    L: Lista;
    P: Pila;

    procedure iterativePreorder(Q: PosicionArbol);
    begin
        if Q = Nulo then Exit;
        posicion.valor2 := Q;
        P.Apilar(posicion);

        while not P.EsVacia do begin
            posicion := P.Recuperar;
            P.Desapilar;

            if A.HijoDerecho(posicion.valor2) <> Nulo then begin
                P.Apilar(A.HijoDerecho(posicion.valor2));
            end;

            if A.HijoIzquierdo(posicion.valor2) <> Nulo then begin
                P.Apilar(A.HijoIzquierdo(posicion.valor2));
            end;

            // Hoja
            if A.HijoDerecho(posicion.valor2) = Nulo and A.HijoIzquierdo(posicion.valor2) = Nulo then Begin
                L.Añadir(A.Recuperar(posicion));
            end;
        end;

    end;

begin
    L.Crear(A.DatoDeLaClave, A.SizeTree);
    P.Crear(Numero, A.SizeTree);
    iterativePreorder(A.Root);
    result := L;
end;


function recorrerNario(A: Arbol): Lista;
var L: Lista;

    procedure recorrido(Q: PosicionArbol);
    begin
        if Q <> Nulo then Begin
            if A.HijoIzquierdo(Q) = Nulo then L.Añadir(A.Recuperar(Q));
            recorrido(A.HijoIzquierdo(Q));
            recorrido(A.HijoDerecho(Q));
        end;

    end;

begin
    L.Crear(A.DatoDeLaClave, A.SizeTree);
    recorrido(A.Root);
    recorrerNario:= L;
end;



function GradoArbolNario(A: Arbol): Integer;
var gradoMayor: Integer;

    procedure recorrido(Q: PosicionArbol);
    var grado: Integer;
        pos: PosicionArbol;
    begin
        if Q <> Nulo then Begin
            if A.HijoIzquierdo(Q) <> Nulo then Begin
                grado := 0;
                pos := A.HijoIzquierdo(Q);
                while pos <> Nulo do begin
                    Inc(grado);
                    pos := A.HijoDerecho(pos);
                end;
                if grado > gradoMayor then gradoMayor := grado;
            end;

            recorrido(A.HijoIzquierdo(Q));
            recorrido(A.HijoDerecho(Q));
        end;
    end;

begin
    gradoMayor := 0;
    recorrido(A.Root);
    result := gradoMayor;
end;



function ArbolEspejo(A: Arbol): Arbol;
var pos: PosicionArbol;
    elemento: TipoElemento;

    procedure recorrido(Q1, Q2: PosicionArbol);
    begin
        if Q1 <> Nulo then Begin
            if ArbolEspejo.EsVacio then begin
                elemento := A.Recuperar(Q1);
                ArbolEspejo.CrearNodo(pos, elemento);
                ArbolEspejo.SetRoot(pos);
                Q2 := ArbolEspejo.Root;
            end
            else begin
                ArbolEspejo.CrearNodo(Q2, A.Recuperar(Q1));
                ArbolEspejo.ConectarHI(Q2);
            end;

                recorrido(A.HijoIzquierdo(Q1), ArbolEspejo.HijoDerecho(Q2));
                recorrido(A.HijoDerecho(Q1), ArbolEspejo.HijoIzquierdo(Q2));
        end;
    end;

begin
    ArbolEspejo.Crear(A.DatoDeLaClave, A.SizeTree);
    recorrido(A.Root, ArbolEspejo.Root);
end;


A.Recuperar(PosicionLista) -> TipoElemento
A.HijoIzquierdo(PosicionLista) -> PosicionLista