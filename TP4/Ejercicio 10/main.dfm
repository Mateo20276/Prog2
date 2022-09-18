object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 446
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object labelNumber1: TLabel
    Left = 40
    Top = 184
    Width = 77
    Height = 19
    Caption = 'Numero 1:'
  end
  object labelNumber2: TLabel
    Left = 40
    Top = 235
    Width = 77
    Height = 19
    Caption = 'Numero 2:'
  end
  object editNumber1: TEdit
    Left = 123
    Top = 181
    Width = 73
    Height = 27
    Hint = '0'
    NumbersOnly = True
    TabOrder = 0
    TextHint = '0'
  end
  object editNumber2: TEdit
    Left = 123
    Top = 232
    Width = 73
    Height = 27
    NumbersOnly = True
    TabOrder = 1
    TextHint = '0'
  end
  object Memo1: TMemo
    Left = 360
    Top = 32
    Width = 345
    Height = 385
    TabOrder = 2
  end
  object buttonEjecutar: TButton
    Left = 208
    Top = 209
    Width = 75
    Height = 25
    Caption = 'Ejecutar'
    TabOrder = 3
    OnClick = buttonEjecutarClick
  end
end
