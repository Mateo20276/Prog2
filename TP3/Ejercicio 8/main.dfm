object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 332
  ClientWidth = 1013
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object editInput: TEdit
    Left = 48
    Top = 272
    Width = 921
    Height = 27
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'puntito,frutilla,puntito,puntito'
    OnKeyPress = editInputKeyPress
  end
  object buttonLoadEj1: TButton
    Left = 88
    Top = 51
    Width = 155
    Height = 57
    Caption = 'Cargar Ejemplo 1'
    TabOrder = 1
    OnClick = buttonLoadEj1Click
  end
  object buttonLoadEj2: TButton
    Left = 88
    Top = 160
    Width = 155
    Height = 57
    Caption = 'Cargar Ejemplo 2'
    TabOrder = 2
    OnClick = buttonLoadEj2Click
  end
  object buttonEjecutar: TButton
    Left = 344
    Top = 103
    Width = 185
    Height = 66
    Caption = 'Ejecutar'
    TabOrder = 3
    OnClick = buttonEjecutarClick
  end
  object memoOutput: TMemo
    Left = 609
    Top = 42
    Width = 312
    Height = 191
    TabOrder = 4
  end
end
