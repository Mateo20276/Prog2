object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 380
  ClientWidth = 657
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
  object Label1: TLabel
    Left = 298
    Top = 8
    Width = 39
    Height = 13
    Caption = 'MULTAS'
  end
  object Label2: TLabel
    Left = 8
    Top = 82
    Width = 201
    Height = 13
    Caption = 'PATENTE CON MAYOR INFRACCIONES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 158
    Height = 13
    Caption = 'PATENTE CON MAYOR DEUDA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 101
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object Label5: TLabel
    Left = 8
    Top = 147
    Width = 31
    Height = 13
    Caption = 'Label4'
  end
  object Label6: TLabel
    Left = 8
    Top = 183
    Width = 108
    Height = 13
    Caption = 'DEUDAS SALDADAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 32
    Top = 8
    Width = 101
    Height = 13
    Caption = 'POSICION EN LISTA:'
  end
  object Label8: TLabel
    Left = 8
    Top = 312
    Width = 207
    Height = 13
    Caption = 'A'#209'ADIR NUEVAS PATENTES Y MULTAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 32
    Top = 55
    Width = 156
    Height = 21
    TabOrder = 0
    Text = 'PATENTE'
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 24
    Width = 75
    Height = 25
    Caption = 'ANTERIOR'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Button1: TButton
    Left = 113
    Top = 24
    Width = 75
    Height = 25
    Caption = 'SIGUIENTE'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 298
    Top = 26
    Width = 329
    Height = 335
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Memo2: TMemo
    Left = 8
    Top = 202
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo2')
    TabOrder = 4
  end
  object buttonAñadirMulta: TButton
    Left = 113
    Top = 331
    Width = 89
    Height = 30
    Caption = 'A'#241'adir Multa'
    TabOrder = 5
    OnClick = buttonAñadirMultaClick
  end
  object buttonAñadirPatente: TButton
    Left = 8
    Top = 331
    Width = 89
    Height = 30
    Caption = 'A'#241'adir Patente'
    TabOrder = 6
    OnClick = buttonAñadirPatenteClick
  end
end
