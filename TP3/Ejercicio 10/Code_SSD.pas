unit Code_SSD;

interface

uses
  System.SysUtils,Tipos,
//  ListArray;
  ListPointer;
//  ListCursor;



Type
  Tdigit_to_display = array [0..9] of string;
  TpunteroLista = ^Lista;

  registro_SSD = record
    cociente: Lista;
    resto: Lista
  end;



  Tad_SSD = Object
    private
      D_num1,D_num2: integer;  //Numeros ingresado (Decimales)
      L_num1:   Lista;   // Codificacion 7-S de num1
      L_num2:   Lista;   // Codificacion 7-S de num2

      procedure Convert(num: double; var List: Lista);

    public
      constructor Crear(num1,num2: integer);
      function sumar(): Lista;
      function restar(): Lista;
      function multiplicar(): Lista;
      function dividir(): registro_SSD;
      function getNum1(): Lista;
      function getNum2(): Lista;
  End;


const
  // Representacion 7-S De cada numero decimal
  digit_to_display: Tdigit_to_display = (
          {0}'1111110',{1}'0110000',{2}'1101101',{3}'1111001',{4}'0110011',
          {5}'1011011',{6}'1011111',{7}'1110000',{8}'1111111',{9}'1111011'
          );



implementation

constructor Tad_SSD.Crear(num1,num2: integer);
  begin
    // Guardo los numeros ingresado para poder hacer las operaciones
    self.D_num1 := num1;
    self.D_num2 := num2;

    // Asigno los tamaños a las listas segun la cantidad de digitos de cada num
    self.L_num1.Crear(cadena,Length(IntToStr(num1)));
    self.L_num2.Crear(cadena,Length(IntToStr(num2)));

    // Cargo las listas
    self.Convert(num1,self.L_num1);
    self.Convert(num2,self.L_num2);
  end;


procedure Tad_SSD.Convert(num: double; var List: Lista);
  var
    display: TipoElemento;
    num_Str: string;
    i: integer;

  begin
    //Convierto el numero a String
    num_Str := FloatToStr(num);
    display.Valor1 := num;

    for i := 1 to Length(num_Str) do begin
      display.Clave := digit_to_display[StrToInt(num_Str[i])]; // Convierto el digito a codificaion 7-S
      List.Agregar(display); // Agrego el digito 7-S a la lista
    end;
    
  end;  


// Retorna una lista con la suma de num1 y num2
function Tad_SSD.sumar(): Lista;
  var
    L_resultado: Lista;   // Codificacion 7-S del resultado de la suma
    suma: integer;

  begin
    suma := self.D_num1 + self.D_num2; // Hago la suma
    L_resultado.Crear(cadena, Length(IntToStr(suma))); // Le doy el tamaño a la lista
    self.Convert(suma,L_resultado); // Convierto la suma y la almaceno en la lista

    sumar := L_resultado;
  end;


// Retorna una lista con la resta de num1 y num2
function Tad_SSD.restar(): Lista;
  var
    L_resultado: Lista;   // Codificacion 7-S del resultado de la resta
    resta: integer;

  begin
    resta := self.D_num1 - self.D_num2; // Hago la resta

    if resta >= 0 then begin // Controlo que el resultado de la resta no sea menor a 0
      L_resultado.Crear(cadena, Length(IntToStr(resta))); // Le doy el tamaño a la lista
      self.Convert(resta,L_resultado); // Convierto la resta y la almaceno en la lista
    end

    else L_resultado.Crear(cadena, 1); // Le doy un tamaño de 1 a la lista



    restar := L_resultado;
  end;


// Retorna una lista con la multiplicacion de num1 y num2
function Tad_SSD.multiplicar(): Lista;
  var
    L_resultado: Lista;   // Codificacion 7-S del resultado de la multiplicacion
    multiplicacion: integer;

  begin
    multiplicacion := self.D_num1 * self.D_num2; // Hago la multiplicacion

    L_resultado.Crear(cadena, Length(IntToStr(multiplicacion))); // Le doy el tamaño a la lista
    self.Convert(multiplicacion,L_resultado); // Convierto la multiplicacion y la almaceno en la lista

    multiplicar := L_resultado;
  end;


// Retorna una lista con la division de num1 y num2
function Tad_SSD.dividir(): registro_SSD;
  var
    division: registro_SSD; // Codificacion 7-S del resultado de la division
    Element: TipoElemento;
    punteroLista: TpunteroLista;

    resto,cociente: double;
    C_large,R_large: integer;


  begin
    //Caclculo el cociente y el resto
    cociente := Trunc(self.D_num1 / self.D_num2); // Hago la division
    resto := self.D_num1 Mod self.D_num2;

    //Almaceno el largo del cociente y del resto
    C_large := Length(FloatToStr(cociente));
    R_large := Length(FloatToStr(resto));


    division.Cociente.Crear(cadena, C_large); // Le doy el tamaño a la lista del cociente
    self.Convert(cociente,division.cociente); // Convierto el cociente y lo almaceno en la lista

    division.Resto.Crear(cadena, R_large); // Le doy el tamaño a la lista del resto
    self.Convert(resto,division.resto); // Convierto el resto y lo almaceno en la lista

    dividir := division;
  end;


// Retorno la lista del num1
function Tad_SSD.getNum1(): Lista;
  begin
    result := L_num1;
  end;

// Retorno la lista del num2
function Tad_SSD.getNum2(): Lista;
  begin
    result := L_num2;
  end;

end.
