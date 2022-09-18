object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 219
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object buttonEjecutar: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Ejecutar'
    TabOrder = 0
    OnClick = buttonEjecutarClick
  end
  object editB: TEdit
    Left = 160
    Top = 80
    Width = 90
    Height = 27
    NumbersOnly = True
    TabOrder = 1
  end
  object StaticText1: TStaticText
    Left = 8
    Top = 32
    Width = 137
    Height = 23
    Caption = 'Escriba el numero:'
    TabOrder = 2
  end
  object editN: TEdit
    Left = 160
    Top = 32
    Width = 87
    Height = 27
    NumbersOnly = True
    TabOrder = 3
  end
  object StaticText2: TStaticText
    Left = 8
    Top = 80
    Width = 131
    Height = 23
    Caption = 'Escriba la bomba:'
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 102
    Top = 143
    Width = 145
    Height = 26
    TabOrder = 5
  end
end
