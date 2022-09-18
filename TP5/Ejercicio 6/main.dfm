object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ejercicio 8'
  ClientHeight = 303
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
    Top = 47
    Width = 30
    Height = 19
    Caption = ' C1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 91
    Width = 30
    Height = 19
    Caption = ' C2:'
  end
  object editCola2: TEdit
    Left = 52
    Top = 88
    Width = 237
    Height = 27
    TabOrder = 0
    OnKeyPress = editCola2KeyPress
  end
  object buttonEjecutar: TButton
    Left = 104
    Top = 136
    Width = 89
    Height = 34
    Caption = 'Ejecutar'
    TabOrder = 1
    OnClick = buttonEjecutarClick
  end
  object editCola1: TEdit
    Left = 52
    Top = 44
    Width = 237
    Height = 27
    TabOrder = 2
    OnKeyPress = editCola2KeyPress
  end
  object Memo1: TMemo
    Left = 40
    Top = 192
    Width = 233
    Height = 89
    TabOrder = 3
  end
end
