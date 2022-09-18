unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids,
  // Mis modulos
  Casilla;

type
  TForm1 = class(TForm)
    buttonEjecutar: TButton;
    gridLaberinto: TStringGrid;
    memoOutput: TMemo;
    buttonEjemplo1: TButton;
    procedure buttonEjemplo1Click(Sender: TObject);
    procedure buttonEjecutarClick(Sender: TObject);
    procedure gridLaberintoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TLaberinto = Array [0..6] of Array [0..9] of TCasilla;         // 7x10
  TMovimiento = Record
    direccion: Char;          // R=derecha, L=izquierda, D=abajo, U=arriba
    situacion: Char;          // M=mina, D=documento, S=segura
  End;
  TRecorrido = Array of TMovimiento;

var
  Form1: TForm1;
  laberinto: TLaberinto;


implementation

{$R *.dfm}



// CARGAR LABERINTO
function loadLaberinto(var aLaberinto: TLaberinto): TCasilla;      // retorna la casilla inicial
var
  x, y: Integer;
  flagE: Boolean;
  nullCasilla: TCasilla;
begin
  flagE := True;   // True = TODAVIA no se encontro ningun "E"
  for y := 0 to Length(aLaberinto)-1 do        // y=filas
    for x := 0 to Length(aLaberinto[0])-1 do   // x=columnas
      begin
        aLaberinto[y, x].Create(x, y, Form1.gridLaberinto.Cells[x, y][1]);    // -> el stringGrid tiene coordenadas al revés
        if (aLaberinto[y, x].getTipo = 'E') then
          if flagE then
            begin
            result := aLaberinto[y, x];
            flagE := False;
            end
          else
            begin
            Application.MessageBox('No puede ingresar mas de 2 puntos de partida', 'error', MB_OK);
            result := nullCasilla;
            Exit;
            end;
      end;
end;




procedure TForm1.gridLaberintoKeyPress(Sender: TObject; var Key: Char);
begin
 TEdit(gridLaberinto.Controls[0]).Text := #0;

 key := UpCase(key);
 if (key<>'S') and (key<>'D') and (key<>'E') and (key<>'M') then
    key := 'P';
end;



function readRecorrido(recorrido: TRecorrido; var minas: Integer): String;
var
  i: Integer;
begin
  result := 'Solucion: ' + #13#10;
  for i := 0 to Length(recorrido)-1 do
    result := result + '(' + recorrido[i].direccion + ';' + recorrido[i].situacion + ')' + #13#10;
  result := result + #13#10 + 'Cantidad de minas: ' + minas.ToString;
end;


function buscarSolucion(casillaInicial: TCasilla; var laberinto: TLaberinto): String;
var
  recorrido, recorridoSolucion: TRecorrido;
  minasSolucion: Integer;
  solucion: String;

  // INICIO Funcion Recursividad directa parametros acumuladores
    function recBuscarSolucion(casillaActual: TCasilla; var laberinto: TLaberinto; recorrido: TRecorrido; minas: Integer): Boolean;                 // funcion recursiva
    var
      casillaSiguiente: TCasilla;

    begin
      if casillaActual.getTipo() = 'D' then     // caso base: encontrar documentos
        begin
          if minasSolucion = minas then  begin


            if ((Length(recorridoSolucion)>=Length(recorrido))) or (Length(recorridoSolucion)=0) then
            begin
              recorridoSolucion := recorrido;   // almacena la solucion mas corta
              minasSolucion := minas;
            end
          end

         else if (minasSolucion>minas) then
          begin
             recorridoSolucion := recorrido;   // almacena la solucion mas corta
             minasSolucion := minas;

          end;

        end

      else
        begin
          laberinto[casillaActual.getY, casillaActual.getX].setVisitada(True);    // marca la casilla actual como visitada

          // Avanza en sentido horario (arriba, derecha, abajo, izquierda)

          // ARRIBA
          if (casillaActual.getY-1 >= 0) then     // verifica que se encuentre dentro del límite
            begin
              casillaSiguiente := laberinto[casillaActual.getY-1, casillaActual.getX];
              // si no fue visitada, y es Segura o Documento
              if (not casillaSiguiente.fueVisitada) and (casillaSiguiente.getTipo<>'P') then
                begin
                  // Añade el movimiento
                  SetLength(recorrido, Length(recorrido)+1);
                  recorrido[Length(recorrido)-1].direccion := 'U';
                  recorrido[Length(recorrido)-1].situacion := casillaSiguiente.getTipo;

                  // Incrementa la cantidad de minas
                  if casillaSiguiente.getTipo = 'M' then
                    Inc(minas);

                  // Llama funcion recursiva
                  recBuscarSolucion(casillaSiguiente, laberinto, recorrido, minas);

                  // BackingTrack
                  SetLength(recorrido, Length(recorrido)-1);
                  if casillaSiguiente.getTipo = 'M' then
                    Dec(minas);
                end;
            end;


          // DERECHA
          if (casillaActual.getX+1 < Length(laberinto[0])) then     // verifica que se encuentre dentro del límite
            begin
              casillaSiguiente := laberinto[casillaActual.getY, casillaActual.getX+1];
              // si no fue visitada, y es Segura o Documento
              if (not casillaSiguiente.fueVisitada) and (casillaSiguiente.getTipo<>'P') then
                begin
                  // Añade el movimiento
                  SetLength(recorrido, Length(recorrido)+1);
                  recorrido[Length(recorrido)-1].direccion := 'R';
                  recorrido[Length(recorrido)-1].situacion := casillaSiguiente.getTipo;

                  // Incrementa la cantidad de minas
                  if casillaSiguiente.getTipo = 'M' then
                    Inc(minas);

                  // Llama funcion recursiva
                  recBuscarSolucion(casillaSiguiente, laberinto, recorrido, minas);

                  // BackingTrack
                  SetLength(recorrido, Length(recorrido)-1);
                  if casillaSiguiente.getTipo = 'M' then
                    Dec(minas);
                end;
            end;


          // ABAJO
          if (casillaActual.getY+1 < Length(laberinto)) then     // verifica que se encuentre dentro del límite
            begin
              casillaSiguiente := laberinto[casillaActual.getY+1, casillaActual.getX];
              // si no fue visitada, y es Segura o Documento
              if (not casillaSiguiente.fueVisitada) and (casillaSiguiente.getTipo<>'P') then
                begin
                  // Añade el movimiento
                  SetLength(recorrido, Length(recorrido)+1);
                  recorrido[Length(recorrido)-1].direccion := 'D';
                  recorrido[Length(recorrido)-1].situacion := casillaSiguiente.getTipo;

                  // Incrementa la cantidad de minas
                  if casillaSiguiente.getTipo = 'M' then
                    Inc(minas);

                  // Llama funcion recursiva
                  recBuscarSolucion(casillaSiguiente, laberinto, recorrido, minas);

                  // BackingTrack
                  SetLength(recorrido, Length(recorrido)-1);
                  if casillaSiguiente.getTipo = 'M' then
                    Dec(minas);
                end;
            end;


          // IZQUIERDA
          if (casillaActual.getX-1 >= 0) then     // verifica que se encuentre dentro del límite
            begin
              casillaSiguiente := laberinto[casillaActual.getY, casillaActual.getX-1];
              // si no fue visitada, y es Segura o Documento
              if (not casillaSiguiente.fueVisitada) and (casillaSiguiente.getTipo<>'P') then
                begin
                  // Añade el movimiento
                  SetLength(recorrido, Length(recorrido)+1);
                  recorrido[Length(recorrido)-1].direccion := 'L';
                  recorrido[Length(recorrido)-1].situacion := casillaSiguiente.getTipo;

                  // Incrementa la cantidad de minas
                  if casillaSiguiente.getTipo = 'M' then
                    Inc(minas);

                  // Llama funcion recursiva
                  recBuscarSolucion(casillaSiguiente, laberinto, recorrido, minas);

                  // BackingTrack
                  SetLength(recorrido, Length(recorrido)-1);
                  if casillaSiguiente.getTipo = 'M' then
                    Dec(minas);
                end;
            end;
        end;

        // BACKTRACKING -> Luego de intentar todos los movimientos y no es posible ninguno
        laberinto[casillaActual.getY, casillaActual.getX].setVisitada(False);

    end;
  // FIN Funcion Recursividad directa parametros acumuladores



begin
  minasSolucion := 9999;
  recBuscarSolucion(casillaInicial, laberinto, recorrido, 0);
  if minasSolucion=9999 then
     minasSolucion := 0;
  result := readRecorrido(recorridoSolucion, minasSolucion);
end;



procedure TForm1.buttonEjecutarClick(Sender: TObject);
var
  casillaInicial: TCasilla;
  recorrido: TRecorrido;
  solucion: String;
begin
  memoOutput.Lines.Clear();
  casillaInicial := loadLaberinto(laberinto);

  if ((casillaInicial.getX>=0) and (casillaInicial.getX<=9)) and ((casillaInicial.getY>=0) and (casillaInicial.getX<=6)) then
    begin
      solucion := buscarSolucion(casillaInicial, laberinto);
      memoOutput.Lines.Add(solucion);
    end
  else
    Application.MessageBox('Ingrese un punto de partida (E)', 'error', MB_OK)
end;



procedure TForm1.buttonEjemplo1Click(Sender: TObject);
begin
  // [col, row] ; [x, y]  -> al reves a una matriz o array de vectores
  gridLaberinto.Cells[0, 0] := 'P';
  gridLaberinto.Cells[0, 1] := 'P';
  gridLaberinto.Cells[0, 2] := 'S';
  gridLaberinto.Cells[0, 3] := 'S';
  gridLaberinto.Cells[0, 4] := 'S';
  gridLaberinto.Cells[0, 5] := 'P';
  gridLaberinto.Cells[0, 6] := 'S';

  gridLaberinto.Cells[1, 0] := 'P';
  gridLaberinto.Cells[1, 1] := 'E';
  gridLaberinto.Cells[1, 2] := 'S';
  gridLaberinto.Cells[1, 3] := 'M';
  gridLaberinto.Cells[1, 4] := 'S';
  gridLaberinto.Cells[1, 5] := 'P';
  gridLaberinto.Cells[1, 6] := 'S';

  gridLaberinto.Cells[2, 0] := 'P';
  gridLaberinto.Cells[2, 1] := 'S';
  gridLaberinto.Cells[2, 2] := 'S';
  gridLaberinto.Cells[2, 3] := 'S';
  gridLaberinto.Cells[2, 4] := 'S';
  gridLaberinto.Cells[2, 5] := 'P';
  gridLaberinto.Cells[2, 6] := 'M';

  gridLaberinto.Cells[3, 0] := 'P';
  gridLaberinto.Cells[3, 1] := 'S';
  gridLaberinto.Cells[3, 2] := 'P';
  gridLaberinto.Cells[3, 3] := 'S';
  gridLaberinto.Cells[3, 4] := 'S';
  gridLaberinto.Cells[3, 5] := 'S';
  gridLaberinto.Cells[3, 6] := 'S';

  gridLaberinto.Cells[4, 0] := 'P';
  gridLaberinto.Cells[4, 1] := 'S';  // CAMBIAR "P" POR "S"
  gridLaberinto.Cells[4, 2] := 'P';
  gridLaberinto.Cells[4, 3] := 'P';
  gridLaberinto.Cells[4, 4] := 'S';
  gridLaberinto.Cells[4, 5] := 'S';
  gridLaberinto.Cells[4, 6] := 'M';

  gridLaberinto.Cells[5, 0] := 'M';
  gridLaberinto.Cells[5, 1] := 'S';
  gridLaberinto.Cells[5, 2] := 'P';
  gridLaberinto.Cells[5, 3] := 'P';
  gridLaberinto.Cells[5, 4] := 'D';
  gridLaberinto.Cells[5, 5] := 'S';
  gridLaberinto.Cells[5, 6] := 'S';

  gridLaberinto.Cells[6, 0] := 'P';
  gridLaberinto.Cells[6, 1] := 'M';
  gridLaberinto.Cells[6, 2] := 'P';
  gridLaberinto.Cells[6, 3] := 'P';
  gridLaberinto.Cells[6, 4] := 'S';
  gridLaberinto.Cells[6, 5] := 'S';
  gridLaberinto.Cells[6, 6] := 'M';

  gridLaberinto.Cells[7, 0] := 'P';
  gridLaberinto.Cells[7, 1] := 'S';
  gridLaberinto.Cells[7, 2] := 'S';
  gridLaberinto.Cells[7, 3] := 'M';
  gridLaberinto.Cells[7, 4] := 'S';
  gridLaberinto.Cells[7, 5] := 'M';
  gridLaberinto.Cells[7, 6] := 'S';

  gridLaberinto.Cells[8, 0] := 'M';
  gridLaberinto.Cells[8, 1] := 'S';
  gridLaberinto.Cells[8, 2] := 'S';
  gridLaberinto.Cells[8, 3] := 'S';
  gridLaberinto.Cells[8, 4] := 'M';
  gridLaberinto.Cells[8, 5] := 'S';
  gridLaberinto.Cells[8, 6] := 'M';

  gridLaberinto.Cells[9, 0] := 'M';
  gridLaberinto.Cells[9, 1] := 'P';
  gridLaberinto.Cells[9, 2] := 'S';
  gridLaberinto.Cells[9, 3] := 'M';
  gridLaberinto.Cells[9, 4] := 'S';
  gridLaberinto.Cells[9, 5] := 'S';
  gridLaberinto.Cells[9, 6] := 'S';

end;


procedure TForm1.FormCreate(Sender: TObject);
var x, y: Integer;
begin
  for y := 0 to 6 do        // y=filas
    for x := 0 to 9 do   // x=columnas
      Form1.gridLaberinto.Cells[x, y] := 'P';    // -> el stringGrid tiene coordenadas al revés
end;



end.
