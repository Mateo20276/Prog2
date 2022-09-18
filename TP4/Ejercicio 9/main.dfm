object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 421
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object captionNumber: TLabel
    Left = 40
    Top = 168
    Width = 139
    Height = 19
    Caption = 'Number (decimal): '
  end
  object labelBase: TLabel
    Left = 40
    Top = 227
    Width = 141
    Height = 19
    Caption = 'Base (entre 2 y 16):'
  end
  object Edit1: TEdit
    Left = 201
    Top = 165
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 201
    Top = 224
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 1
  end
  object buttonEjecutar: TButton
    Left = 352
    Top = 192
    Width = 97
    Height = 33
    Caption = 'Ejecutar'
    TabOrder = 2
    OnClick = buttonEjecutarClick
  end
  object Memo1: TMemo
    Left = 488
    Top = 39
    Width = 233
    Height = 346
    TabOrder = 3
  end
end
