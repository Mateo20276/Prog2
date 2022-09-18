object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 639
  ClientWidth = 896
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
    Left = 632
    Top = 52
    Width = 50
    Height = 19
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 632
    Top = 100
    Width = 48
    Height = 19
    Caption = 'Detalle'
  end
  object Label3: TLabel
    Left = 632
    Top = 148
    Width = 43
    Height = 19
    Caption = 'Precio'
  end
  object Label4: TLabel
    Left = 632
    Top = 196
    Width = 38
    Height = 19
    Caption = 'Stock'
  end
  object Label5: TLabel
    Left = 200
    Top = 462
    Width = 50
    Height = 19
    Caption = 'Codigo'
  end
  object Label6: TLabel
    Left = 424
    Top = 462
    Width = 50
    Height = 19
    Caption = 'Codigo'
  end
  object Label7: TLabel
    Left = 632
    Top = 370
    Width = 50
    Height = 19
    Caption = 'Codigo'
  end
  object Label8: TLabel
    Left = 632
    Top = 418
    Width = 48
    Height = 19
    Caption = 'Detalle'
  end
  object Label9: TLabel
    Left = 632
    Top = 466
    Width = 43
    Height = 19
    Caption = 'Precio'
  end
  object Label10: TLabel
    Left = 632
    Top = 514
    Width = 38
    Height = 19
    Caption = 'Stock'
  end
  object Memo1: TMemo
    Left = 32
    Top = 32
    Width = 529
    Height = 385
    TabOrder = 0
  end
  object buttonAlta: TButton
    Left = 648
    Top = 248
    Width = 161
    Height = 41
    Caption = 'Alta'
    TabOrder = 1
    OnClick = buttonAltaClick
  end
  object editCodigo: TEdit
    Left = 696
    Top = 49
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 2
  end
  object editDetalle: TEdit
    Left = 696
    Top = 97
    Width = 121
    Height = 27
    TabOrder = 3
  end
  object editPrecio: TEdit
    Left = 696
    Top = 145
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 4
  end
  object editStock: TEdit
    Left = 696
    Top = 193
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 5
  end
  object editSearch: TEdit
    Left = 256
    Top = 459
    Width = 105
    Height = 27
    TabOrder = 6
    TextHint = '123'
  end
  object editBaja: TEdit
    Left = 480
    Top = 459
    Width = 105
    Height = 27
    TabOrder = 7
    TextHint = '123'
  end
  object buttonBuscar: TButton
    Left = 200
    Top = 514
    Width = 161
    Height = 41
    Caption = 'Buscar'
    TabOrder = 8
    OnClick = buttonBuscarClick
  end
  object buttonBaja: TButton
    Left = 424
    Top = 514
    Width = 161
    Height = 41
    Caption = 'Baja'
    TabOrder = 9
    OnClick = buttonBajaClick
  end
  object buttonModificar: TButton
    Left = 648
    Top = 558
    Width = 161
    Height = 41
    Caption = 'Modificar'
    TabOrder = 10
    OnClick = buttonModificarClick
  end
  object editCodigo2: TEdit
    Left = 696
    Top = 367
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 11
  end
  object editDetalle2: TEdit
    Left = 696
    Top = 415
    Width = 121
    Height = 27
    TabOrder = 12
  end
  object editPrecio2: TEdit
    Left = 696
    Top = 463
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 13
  end
  object editStock2: TEdit
    Left = 696
    Top = 511
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 14
  end
  object Button1: TButton
    Left = 32
    Top = 450
    Width = 122
    Height = 45
    Caption = '% Ocupacion'
    TabOrder = 15
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 24
    Top = 513
    Width = 145
    Height = 43
    Caption = '% ZO vs Cargadas'
    TabOrder = 16
    OnClick = Button2Click
  end
end
