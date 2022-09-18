unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Conjuntos, Tipos, Vcl.StdCtrls;

type
  TForm4 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    EditC: TEdit;
    EditC1: TEdit;
    EditC2: TEdit;
    Button4: TButton;
    procedure EditCChange(Sender: TObject);
    procedure EditC1Change(Sender: TObject);
    procedure EditC2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  C,C1,C2: Conjunto;
  longitudC,longitudC1,longitudC2: longint;

implementation

{$R *.dfm}

procedure TForm4.Button4Click(Sender: TObject);
begin
  Memo1.lines.clear();
  Memo1.lines.add('C:');
  Memo1.lines.add(C.RetornarClaves());
  Memo1.lines.add('C1:');
  Memo1.lines.add(C1.RetornarClaves());
  Memo1.lines.add('C2:');
  Memo1.lines.add(C2.RetornarClaves());
  longitudC:= C.CantidadElementos();
  longitudC1:= C1.CantidadElementos();
  longitudC2:= C2.CantidadElementos();


  if longitudC >= longitudC1 then  begin
    if C.Interseccion(C1).CantidadElementos() = longitudC1 then
     begin
      memo1.Lines.add('C1 es subconjunto total de C')
     end
    Else if (C1.Interseccion(C).CantidadElementos() >= longitudC1 div 2) and (C1.Interseccion(C).CantidadElementos()<> 0) then
     begin
      memo1.Lines.add('C1 es subconjunto parcial de C')
     end
  end
  else
    if C1.Interseccion(C).CantidadElementos() = longitudC then
     begin
      memo1.Lines.add('C es subconjunto total de C1')
     end
    Else if (C1.Interseccion(C).CantidadElementos() >= longitudC div 2)  then
     begin
      memo1.Lines.add('C es subconjunto parcial de C1')
     end;





  if longitudC >= C2.CantidadElementos() then  begin
    if C.Interseccion(C2).CantidadElementos() = longitudC2 then
     begin
      memo1.Lines.add('C2 es subconjunto total de C')
     end
    Else if (C.Interseccion(C2).CantidadElementos() >= longitudC2 div 2) and (C.Interseccion(C2).CantidadElementos() <>0)  then
     begin
      memo1.Lines.add('C2 es subconjunto parcial de C')
     end
  end
  else
  if C2.Interseccion(C).CantidadElementos() = longitudC then
     begin
      memo1.Lines.add('C es subconjunto total de C2')
     end
    Else if (C2.Interseccion(C).CantidadElementos() >= longitudC div 2)  then
     begin
      memo1.Lines.add('C es subconjunto parcial de C2')
     end;






  if longitudC1 >= C2.CantidadElementos() then  begin
      if C1.Interseccion(C2).CantidadElementos() = longitudC2 then
     begin
      memo1.Lines.add('C2 es subconjunto total de C1')
     end
    Else if (C1.Interseccion(C2).CantidadElementos() >= longitudC2 div 2) and (C1.Interseccion(C2).CantidadElementos()<> 0)  then
     begin
      memo1.Lines.add('C2 es subconjunto parcial de C1')
     end
  end
  else
    if C2.Interseccion(C1).CantidadElementos() = longitudC1 then
     begin
      memo1.Lines.add('C1 es subconjunto total de C2')
     end
    Else if (C2.Interseccion(C1).CantidadElementos() >= longitudC1 div 2)  then
     begin
      memo1.Lines.add('C1 es subconjunto parcial de C2')
     end;







end;

procedure TForm4.EditC1Change(Sender: TObject);
var x:Tipoelemento;
begin
  x.clave:= EditC1.text;
  C1.Agregar(x);
end;

procedure TForm4.EditC2Change(Sender: TObject);
var x:Tipoelemento;
begin
 x.clave:= EditC2.text;
 C2.Agregar(x);

end;

procedure TForm4.EditCChange(Sender: TObject);
var x:Tipoelemento;
begin
  x.clave:= EditC.text;
  C.Agregar(x);

end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  C.Crear(Cadena,500);
  C1.Crear(Cadena,500);
  C2.Crear(Cadena,500);

end;

end.


end.
