object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 503
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object Label4: TLabel
    Left = 36
    Top = 107
    Width = 73
    Height = 19
    Caption = 'Elementos'
  end
  object Label5: TLabel
    Left = 36
    Top = 140
    Width = 43
    Height = 19
    Caption = 'Desde'
  end
  object Label6: TLabel
    Left = 36
    Top = 173
    Width = 39
    Height = 19
    Caption = 'Hasta'
  end
  object Label1: TLabel
    Left = 36
    Top = 333
    Width = 39
    Height = 19
    Caption = 'Hasta'
  end
  object Label2: TLabel
    Left = 36
    Top = 300
    Width = 43
    Height = 19
    Caption = 'Desde'
  end
  object Label3: TLabel
    Left = 36
    Top = 267
    Width = 73
    Height = 19
    Caption = 'Elementos'
  end
  object Memo1: TMemo
    Left = 232
    Top = 40
    Width = 337
    Height = 425
    TabOrder = 0
  end
  object Button1: TButton
    Left = 36
    Top = 392
    Width = 161
    Height = 57
    Caption = 'Run'
    TabOrder = 1
    OnClick = Button1Click
  end
  object elementos1: TEdit
    Left = 123
    Top = 104
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 2
  end
  object desde1: TEdit
    Left = 123
    Top = 137
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 3
  end
  object hasta1: TEdit
    Left = 123
    Top = 170
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 4
  end
  object StaticText2: TStaticText
    Left = 36
    Top = 60
    Width = 140
    Height = 38
    Caption = 'Conjunto 1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object StaticText1: TStaticText
    Left = 36
    Top = 220
    Width = 140
    Height = 38
    Caption = 'Conjunto 2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -28
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object hasta2: TEdit
    Left = 123
    Top = 330
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 7
  end
  object desde2: TEdit
    Left = 123
    Top = 297
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 8
  end
  object elementos2: TEdit
    Left = 123
    Top = 264
    Width = 57
    Height = 27
    NumbersOnly = True
    TabOrder = 9
  end
  object StaticText3: TStaticText
    Left = 320
    Top = 471
    Width = 152
    Height = 23
    Caption = 'Complejidad O(n^2)'
    TabOrder = 10
  end
end
