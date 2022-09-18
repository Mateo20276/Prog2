object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 577
  ClientWidth = 505
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxBilletes: TGroupBox
    Left = 24
    Top = 24
    Width = 457
    Height = 441
    TabOrder = 0
    object Label1: TLabel
      Left = 41
      Top = 35
      Width = 393
      Height = 31
      Caption = 'Monto por billetes y monedas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
    end
    object GridCerrarCaja: TStringGrid
      Left = 56
      Top = 90
      Width = 361
      Height = 329
      ColCount = 2
      DefaultColWidth = 178
      DefaultColAlignment = taCenter
      RowCount = 13
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object GroupBoxSaldoTotal: TGroupBox
    Left = 24
    Top = 480
    Width = 457
    Height = 89
    TabOrder = 1
    object EditSaldoTotal: TEdit
      Left = 96
      Top = 20
      Width = 273
      Height = 26
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TextHint = '000000'
    end
    object BtnSaldoTotal: TButton
      Left = 184
      Top = 55
      Width = 104
      Height = 25
      Caption = 'Ver Saldo total'
      TabOrder = 1
      OnClick = BtnSaldoTotalClick
    end
  end
end
