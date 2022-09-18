object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 8'
  ClientHeight = 517
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object Label1: TLabel
    Left = 16
    Top = 63
    Width = 30
    Height = 19
    Caption = ' C1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 107
    Width = 30
    Height = 19
    Caption = ' C2:'
  end
  object Label3: TLabel
    Left = 16
    Top = 155
    Width = 30
    Height = 19
    Caption = ' C3:'
  end
  object Label4: TLabel
    Left = 16
    Top = 19
    Width = 23
    Height = 19
    Caption = ' Q:'
  end
  object editCola2: TEdit
    Left = 52
    Top = 104
    Width = 237
    Height = 27
    TabOrder = 0
    OnKeyPress = editCola2KeyPress
  end
  object buttonEjecutar: TButton
    Left = 104
    Top = 208
    Width = 89
    Height = 34
    Caption = 'Ejecutar'
    TabOrder = 1
    OnClick = buttonEjecutarClick
  end
  object editCola1: TEdit
    Left = 52
    Top = 60
    Width = 237
    Height = 27
    TabOrder = 2
    OnKeyPress = editCola2KeyPress
  end
  object Memo1: TMemo
    Left = 40
    Top = 264
    Width = 233
    Height = 233
    TabOrder = 3
  end
  object editCola3: TEdit
    Left = 52
    Top = 152
    Width = 237
    Height = 27
    TabOrder = 4
    OnKeyPress = editCola2KeyPress
  end
  object editQ: TEdit
    Left = 52
    Top = 16
    Width = 37
    Height = 27
<<<<<<< Updated upstream
=======
    NumbersOnly = True
>>>>>>> Stashed changes
    TabOrder = 5
    OnKeyPress = editCola2KeyPress
  end
end
