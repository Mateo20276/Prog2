object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 595
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
    Left = 48
    Top = 363
    Width = 81
    Height = 19
    Caption = 'Conjunto A'
  end
  object Label2: TLabel
    Left = 48
    Top = 419
    Width = 79
    Height = 19
    Caption = 'Conjunto B'
  end
  object Label3: TLabel
    Left = 387
    Top = 456
    Width = 148
    Height = 19
    Caption = 'Complejidad O(n^2)'
  end
  object Button1: TButton
    Left = 384
    Top = 376
    Width = 145
    Height = 51
    Caption = 'Run'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 34
    Top = 25
    Width = 521
    Height = 289
    TabOrder = 1
  end
  object editConjuntoA: TEdit
    Left = 143
    Top = 360
    Width = 210
    Height = 27
    TabOrder = 2
  end
  object editConjuntoB: TEdit
    Left = 143
    Top = 416
    Width = 210
    Height = 27
    TabOrder = 3
  end
end
