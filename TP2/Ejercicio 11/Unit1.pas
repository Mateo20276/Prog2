unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    buttonEjecutar: TButton;
    editB: TEdit;
    StaticText1: TStaticText;
    editN: TEdit;
    StaticText2: TStaticText;
    Memo1: TMemo;
    procedure buttonEjecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation
 {$R *.dfm}



function funcionRecursiva(n, b: Integer): String; //n variable numero, b variable bomba
begin
  if n > b then
    result:= funcionRecursiva((n div b),b) + funcionRecursiva(n-(n div b),b)//Recursividad

  else
    result:= IntToStr(n) + ' ';  // Caso base

end;


procedure TForm1.buttonEjecutarClick(Sender: TObject);
begin
  Memo1.Lines[0] := funcionRecursiva(StrToInt(editN.text),StrToInt(editB.text));  // Cargar en la funcion recursiva
end;

end.
