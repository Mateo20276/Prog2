object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 115
  ClientWidth = 305
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
    Left = 32
    Top = 24
    Width = 187
    Height = 19
    Caption = 'INGRESE LA PATENTE:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Agregar: TButton
    Left = 192
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Agregar'
    TabOrder = 0
    OnClick = AgregarClick
  end
  object Edit1: TEdit
    Left = 32
    Top = 64
    Width = 121
    Height = 27
    TabOrder = 1
    TextHint = 'AAAAAA'
    OnKeyPress = Edit1KeyPress
  end
end
