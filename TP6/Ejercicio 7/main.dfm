object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 476
  ClientWidth = 999
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 19
  object Label1: TLabel
    Left = 596
    Top = 83
    Width = 43
    Height = 19
    Caption = 'CUIT:'
  end
  object Label2: TLabel
    Left = 596
    Top = 116
    Width = 120
    Height = 19
    Caption = 'RAZ'#211'N SOCIAL:'
  end
  object Label3: TLabel
    Left = 596
    Top = 149
    Width = 89
    Height = 19
    Caption = 'DOMICILIO:'
  end
  object Label4: TLabel
    Left = 596
    Top = 182
    Width = 85
    Height = 19
    Caption = 'TEL'#201'FONO:'
  end
  object Label5: TLabel
    Left = 596
    Top = 215
    Width = 73
    Height = 19
    Caption = 'CELULAR:'
  end
  object Label6: TLabel
    Left = 50
    Top = 419
    Width = 43
    Height = 19
    Caption = 'CUIT:'
  end
  object Label7: TLabel
    Left = 596
    Top = 419
    Width = 43
    Height = 19
    Caption = 'CUIT:'
  end
  object Memo1: TMemo
    Left = 24
    Top = 24
    Width = 433
    Height = 313
    TabOrder = 0
  end
  object buttonAlta: TButton
    Left = 675
    Top = 256
    Width = 145
    Height = 57
    Caption = 'Dar de alta'
    TabOrder = 1
    OnClick = buttonAltaClick
  end
  object editCuit: TEdit
    Left = 660
    Top = 80
    Width = 121
    Height = 27
    TabOrder = 2
  end
  object editRazonSocial: TEdit
    Left = 722
    Top = 113
    Width = 121
    Height = 27
    TabOrder = 3
  end
  object editDomicilio: TEdit
    Left = 691
    Top = 146
    Width = 121
    Height = 27
    TabOrder = 4
  end
  object editTelefono: TEdit
    Left = 691
    Top = 179
    Width = 121
    Height = 27
    TabOrder = 5
  end
  object editCelular: TEdit
    Left = 675
    Top = 212
    Width = 121
    Height = 27
    TabOrder = 6
  end
  object StaticText1: TStaticText
    Left = 596
    Top = 34
    Width = 315
    Height = 40
    Caption = 'Agregar nueva persona'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object editSearchCuit: TEdit
    Left = 114
    Top = 416
    Width = 121
    Height = 27
    TabOrder = 8
  end
  object StaticText2: TStaticText
    Left = 48
    Top = 370
    Width = 337
    Height = 40
    Caption = 'Buscar persona por CUIT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object buttonBuscarCUIT: TButton
    Left = 265
    Top = 416
    Width = 106
    Height = 27
    Caption = 'Buscar'
    TabOrder = 10
    OnClick = buttonBuscarCUITClick
  end
  object buttonBaja: TButton
    Left = 811
    Top = 416
    Width = 134
    Height = 27
    Caption = 'Dar de baja'
    TabOrder = 11
    OnClick = buttonBajaClick
  end
  object editEliminarCuit: TEdit
    Left = 660
    Top = 416
    Width = 121
    Height = 27
    TabOrder = 12
  end
  object StaticText4: TStaticText
    Left = 596
    Top = 370
    Width = 285
    Height = 40
    Caption = 'Eliminar una persona'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
  end
end
