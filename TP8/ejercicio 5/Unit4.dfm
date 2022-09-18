object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 299
  ClientWidth = 635
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
    Left = 352
    Top = 8
    Width = 241
    Height = 283
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 32
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 32
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 2
  end
  object Button3: TButton
    Left = 32
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
  end
  object EditC: TEdit
    Left = 152
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 4
    OnChange = EditCChange
  end
  object EditC1: TEdit
    Left = 152
    Top = 138
    Width = 121
    Height = 21
    TabOrder = 5
    OnChange = EditC1Change
  end
  object EditC2: TEdit
    Left = 152
    Top = 250
    Width = 121
    Height = 21
    TabOrder = 6
    OnChange = EditC2Change
  end
  object Button4: TButton
    Left = 248
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Button4'
    TabOrder = 7
    OnClick = Button4Click
  end
end
