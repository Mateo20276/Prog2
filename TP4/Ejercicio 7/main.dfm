object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 392
  ClientWidth = 611
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
    Top = 191
    Width = 162
    Height = 27
    TabOrder = 0
    TextHint = '(a*b)'
    OnKeyPress = Edit1KeyPress
  end
  object Button1: TButton
    Left = 224
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Ejecutar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 352
    Top = 48
    Width = 241
    Height = 313
    TabOrder = 2
  end
end
