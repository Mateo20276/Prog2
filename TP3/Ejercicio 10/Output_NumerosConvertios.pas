unit Output_NumerosConvertios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  //Mis Modulos
  Tipos,Code_SSD,
//  ListArray;
  ListPointer;
//  ListCursor;

type
  TForm2 = class(TForm)
    GroupBoxGrid: TGroupBox;
    GridNum1: TStringGrid;
    GridNum2: TStringGrid;
    GroupBoxInput: TGroupBox;
    Label2: TLabel;
    ButtonConvert: TButton;
    ComboBox1: TComboBox;
    Edit3: TEdit;
    Edit1: TEdit;
    procedure MostrarResultados(L_result: Lista; L_resultDiv: registro_SSD);
    procedure FormShow(Sender: TObject);
    procedure ButtonConvertClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  main,Output_operaciones;

{$R *.dfm}


procedure TForm2.FormShow(Sender: TObject);
  var
    i,j: integer;
    L_num1,L_num2: Lista;
    pos: PosicionLista;

  begin
    // Agrego las filas segun la cantidad de diitos de cada numero
    GridNum1.RowCount := Length(Form1.EditNum1.Text)+1;
    GridNum2.RowCount := Length(Form1.EditNum2.Text)+1;

    // CARGO LA PRIMERA FILA DE CADA GRILLA
    GridNum1.Cells[0,0] := 'Numero';
    GridNum1.Cells[1,0] := 'Cod 7-S';
    GridNum2.Cells[0,0] := 'Numero';
    GridNum2.Cells[1,0] := 'Cod 7-S';

    // Obtengo las listas de los numeros convertidos a 7-S
    L_num1 := SSD.getNum1();
    L_num2 := SSD.getNum2();


    pos := L_num1.Comienzo(); // OBtengo la primera posicion de la lista
    // CARGO EL GRID DE EL PRIMER NUMERO
    for i := 0 to GridNum1.ColCount do begin
      for j := 1 to GridNum1.RowCount do begin

        if i = 0 then
          GridNum1.Cells[i,j] := Form1.EditNum1.Text[j]

        else begin
          GridNum1.Cells[i,j] := L_num1.Recuperar(pos).Clave;
          pos := L_num1.Siguiente(pos);
        end;

      end;
    end;


    pos := L_num2.Comienzo(); // OBtengo la primera posicion de la lista
    // CARGO EL GRID DE EL SEGUNDO NUMERO
    for i := 0 to GridNum1.ColCount do begin
      for j := 1 to GridNum1.RowCount do begin

        if i = 0 then
          GridNum2.Cells[i,j] := Form1.EditNum2.Text[j]

        else begin
          GridNum2.Cells[i,j] := L_num2.Recuperar(pos).Clave;
          pos := L_num2.Siguiente(pos);
        end;

      end;
    end;

  end;



procedure TForm2.MostrarResultados(L_result: Lista; L_resultDiv: registro_SSD);
  var
    i,j: integer;
    pos: PosicionLista;

  begin

    if ComboBox1.ItemIndex = 3 then begin
      Form3.GroupBoxDIvision.Visible := True;
      Form3.GroupBoxOperaciones.Visible := False;


      // Cargo las filas de GridCociente segun los digitos del cociente
      pos := L_resultDiv.cociente.Comienzo();
      Form3.GridCociente.RowCount := Length(FloatToStr(L_resultDiv.Cociente.Recuperar(pos).Valor1))+1;

      // Cargo la primera fila conciente
      Form3.GridCociente.Cells[0,0] := 'Numeros';
      Form3.GridCOciente.Cells[1,0] := 'Cod 7-S';

      // CARGO EL GRID DEL COCIENTE
      for i := 0 to Form3.GridCociente.ColCount do begin
        for j := 1 to Form3.GridCociente.RowCount do begin

          if i = 0 then
            Form3.GridCociente.Cells[i,j] := FloatToStr(L_resultDiv.Cociente.Recuperar(pos).Valor1)[j]

          else begin
            Form3.GridCociente.Cells[i,j] := L_resultDiv.Cociente.Recuperar(pos).Clave;
            pos := L_resultDiv.cociente.Siguiente(pos);
          end;
        end;
      end;


      // Cargo las filas de GridResto segun los digitos del Resto
      pos := L_resultDiv.Resto.Comienzo();
      Form3.GridResto.RowCount := Length(FloatToStr(L_resultDiv.Resto.Recuperar(pos).Valor1))+1;

      // Cargo la primera fila
      Form3.GridResto.Cells[0,0] := 'Numeros';
      Form3.GridResto.Cells[1,0] := 'Cod 7-S';

      // CARGO EL GRID DEL RESTO
      for i := 0 to Form3.GridResto.ColCount do begin
        for j := 1 to Form3.GridResto.RowCount do begin

          if i = 0 then
            Form3.GridResto.Cells[i,j] := FloatToStr(L_resultDiv.Resto.Recuperar(pos).Valor1)[j]

          else begin
            Form3.GridResto.Cells[i,j] := L_resultDiv.Resto.Recuperar(pos).Clave;
            pos := L_resultDiv.resto.Siguiente(pos);
          end;

        end;
      end;

      //Muestro el formulario con el resultado
      Form3.ShowModal();
    end

    else begin
      Form3.GroupBoxDIvision.Visible := False;
      Form3.GroupBoxOperaciones.Visible := True;

      // Añado las filas segun las cifras del resultado de la operacion
      pos := L_result.Comienzo();
      Form3.GridResult.RowCount := Length(FloatToStr(L_result.Recuperar(pos).Valor1))+1;

      // Cargo la primera fila
      Form3.GridResult.Cells[0,0] := 'Numeros';
      Form3.GridResult.Cells[1,0] := 'Cod 7-S';

      // CARGO EL GRID RESULTADO
      for i := 0 to Form3.GridResult.ColCount do begin
        for j := 1 to Form3.GridResult.RowCount do begin

          if i = 0 then
            Form3.GridResult.Cells[i,j] := FloatToStr(L_result.Recuperar(pos).Valor1)[j]

          else begin
            Form3.GridResult.Cells[i,j] := L_result.Recuperar(pos).Clave;
            pos := L_result.Siguiente(pos);
          end;
        end;
      end;

      //Muestro el formulario con el resultado
      Form3.ShowModal();
    end;



  end;


procedure TForm2.ButtonConvertClick(Sender: TObject);
  var
    L_result: Lista;
    L_resultDiv: registro_SSD;
    num1,num2: integer;
    valid: boolean;

  begin
    num1 := StrToInt(Form1.EditNum1.Text);
    num2 := StrToInt(Form1.EditNum2.Text);

    valid := True;
    case ComboBox1.ItemIndex of
      0: L_result := SSD.sumar();// Realizo la suma

      1: begin // Realizo la resta
          if num2 > num1 then begin
            MessageDlg('Para esta Operacion num2 NO puede ser mayor a num1',mtERROR,[mbOK],0);
            valid := false;
          end

          else
            L_result := SSD.restar();

         end;

      2: L_result := SSD.multiplicar(); //Realizo la multiplicacion

      3: begin // Realizo la division
          if num2 = 0 then begin
            MessageDlg('NO puede dividir por cero',mtERROR,[mbOK],0);
            valid := false
          end

          else
            L_resultDiv := SSD.dividir();
         end;
    end;


    if valid then
      MostrarResultados(L_result,L_resultDiv);
  end;


end.
