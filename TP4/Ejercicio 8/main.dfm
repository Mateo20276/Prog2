object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 456
  ClientWidth = 703
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object Edit1: TEdit
    Left = 40
    Top = 216
    Width = 121
    Height = 27
    TabOrder = 0
  end
  object buttonEjecutar: TButton
    Left = 192
    Top = 217
    Width = 75
    Height = 25
    Caption = 'Ejecutar'
    TabOrder = 1
    OnClick = buttonEjecutarClick
  end
  object Memo1: TMemo
    Left = 328
    Top = 40
    Width = 353
    Height = 385
    TabOrder = 2
  end
end
