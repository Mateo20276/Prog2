object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 319
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 384
    Top = 8
    Width = 347
    Height = 273
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 200
    Width = 105
    Height = 49
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 198
    Width = 105
    Height = 53
    Caption = 'Button2'
    TabOrder = 2
    OnClick = Button2Click
  end
  object editC: TEdit
    Left = 8
    Top = 160
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object editC1: TEdit
    Left = 144
    Top = 160
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object Button3: TButton
    Left = 144
    Top = 64
    Width = 105
    Height = 41
    Caption = 'Mostrar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 64
    Width = 105
    Height = 41
    Caption = 'Button4'
    TabOrder = 6
    OnClick = Button4Click
  end
end
