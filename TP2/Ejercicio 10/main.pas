unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  //Mis modulos
  subconjunto,vectorDeSubconjuntos,output;

type
  TForm1 = class(TForm)
    Ejecutar: TButton;
    GroupBoxInput: TGroupBox;
    EditConjuntoBase: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    EditNumeroSuma: TEdit;
    procedure EjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;
  conjuntoBase: TConjunto;


implementation


procedure funcionRecursiva(subconjunto: ClassSubConjunto; conjuntoBase: TConjunto; var totalSubConjuntos: ClassVectorDeSubconjuntos; n,i,contador: integer);
  var
    j: integer;

  begin

    if i <> Length(conjuntoBase) then begin // caso base
      if (contador = i) then begin
        if (conjuntoBase[i] < n) then begin // Si el conjuntoBase[i] es menor a n, lo añade como primer elemento del subconjunto para hacer las comparaciones
          subconjunto.addElement(conjuntoBase[i]);
          contador := i + 1; // Aumenta el contador, el cual va a marcar desde donde va a recorrer "j"

          funcionRecursiva(subconjunto,conjuntoBase,totalSubConjuntos,n,i,contador) //Llamada recursiva
        end

        else if (conjuntoBase[i] = n) then begin // Si el conjuntoBase[i] es igual a n, lo añade como un subconjunto
          subconjunto.addElement(conjuntoBase[i]);
          totalSubConjuntos.addSubconjunto(subconjunto.getSubConjunto());

          subconjunto.clear();
          funcionRecursiva(subconjunto,conjuntoBase,totalSubConjuntos,n,i+1,contador+1) //Llamada recursiva
        end

        else
          funcionRecursiva(subconjunto,conjuntoBase,totalSubConjuntos,n,i+1,contador+1); //Llamada recursiva
      end


      else begin

        if contador = Length(conjuntoBase) then begin // Si el contador ya paso el final de "conjuntoBase", entonces "j" ya recorrio todas las posibles combinaciones con "i"
          inc(i); //Incremento "i" para obtener nuevas combinaciones
          contador := i; // reinicio el contador para que "j" vuelva a recorrer el conjuntoBase
          subconjunto.clear(); // Limpio el subconjunto
          funcionRecursiva(subConjunto,conjuntoBase,totalSubConjuntos,n,i,contador); //Llamada recursiva
        end

        else begin

          for j := contador to Length(conjuntoBase)-1 do begin

            if (conjuntoBase[j] <= n) and (conjuntoBase[j] + subconjunto.sumar() <= n) then begin //Si conjuntoBase[i] es menor o igual a n y la suma del subconjunto mas conjuntoBase[i] es menor o igual
              subconjunto.addElement(conjuntoBase[j]); // Añado el elemento al subconjunto

              if subconjunto.sumar() = n then begin // Si la suma del subconjunto es igual a "n"
                if not(totalSubConjuntos.existIn(subconjunto.getSubConjunto())) then begin // Si el subconjunto NO existe en el vectorDeSubconjuntos
                  totalSubConjuntos.addSubconjunto(subconjunto.getSubConjunto()); //Añade el subconjunto

                  // Elimina el ultimo elemento para seguir con las comparaciones
                  subconjunto.removeLastElement();
                end;
              end;

            end;
          end;

          // Una vez recorrido todo conjuntoBase
          inc(contador);// Incremento el contador para que "j" inicie su proxima iteracion en el siguiente elemento
          subconjunto.justFirstElement(); //Dejo solo el elemto de "i"
          funcionRecursiva(subCOnjunto,conjuntoBase,totalSubConjuntos,n,i,contador); //Llamada recursiva
        end;

      end;

    end;
  end;



{$R *.dfm}

procedure cargarCojuntoBase(var conjunto: Tconjunto; str: string);
  var
    Sep: string;
    P,i: integer;

  begin

    Sep := ',';
    i := 0;
    if str.Substring(str.Length, 1) <> Sep then
      str := str + Sep;

    P := Pos(Sep, str);
    while P > 0 do Begin
        Inc(I);
        SetLength(conjunto, i); // Se redimensiona el array y no se pierden los datos
        Conjunto[i - 1] := Copy(str, 1, P - 1).ToInteger();
        str := Copy(str, P + 1, Length(str));
        P := Pos(Sep, str);
      End;

  end;



procedure TForm1.EjecutarClick(Sender: TObject);
  var
    vectorSubconjuntos: ClassVectorDeSubconjuntos;
    subconjunto: ClassSubConjunto;
    n: integer;

  begin
//    conjuntoBase := [10, 3, 1, 7, 4, 2];
    cargarCojuntoBase(conjuntoBase,EditConjuntoBase.Text);
    n := StrToInt(EditNumeroSuma.Text);

    funcionRecursiva(subconjunto,conjuntoBase,vectorSubconjuntos,n,0{i},0{contador});
    Form2.Memo1.Lines.Add(vectorSubConjuntos.mostrarSubconjuntos());
    Form2.ShowModal();

  end;



end.
