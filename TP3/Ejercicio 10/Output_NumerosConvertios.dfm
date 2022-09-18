object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Operaciones'
  ClientHeight = 736
  ClientWidth = 648
  Color = 2236962
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxGrid: TGroupBox
    Left = 5
    Top = 5
    Width = 636
    Height = 572
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ParentCustomHint = False
    BiDiMode = bdLeftToRight
    Color = 4473924
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    StyleElements = []
    object GridNum1: TStringGrid
      Left = 72
      Top = 72
      Width = 250
      Height = 481
      Color = 5592405
      ColCount = 2
      DefaultColWidth = 120
      DefaultColAlignment = taCenter
      DefaultRowHeight = 30
      DrawingStyle = gdsClassic
      FixedColor = 3355443
      FixedCols = 0
      RowCount = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientEndColor = 4473924
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object GridNum2: TStringGrid
      Left = 328
      Top = 72
      Width = 250
      Height = 481
      Color = 5592405
      ColCount = 2
      DefaultColWidth = 120
      DefaultColAlignment = taCenter
      DefaultRowHeight = 30
      DrawingStyle = gdsClassic
      FixedColor = 3355443
      FixedCols = 0
      RowCount = 11
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientEndColor = 4473924
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 72
      Top = 32
      Width = 250
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Numero 1'
    end
    object Edit1: TEdit
      Left = 328
      Top = 32
      Width = 250
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = 'Numero 2'
    end
  end
  object GroupBoxInput: TGroupBox
    Left = 4
    Top = 582
    Width = 636
    Height = 150
    ParentCustomHint = False
    Color = 4473924
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object Label2: TLabel
      Left = 157
      Top = 22
      Width = 311
      Height = 52
      ParentCustomHint = False
      Caption = 'Seleccione una operacion'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -40
      Font.Name = 'Pristina'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object ButtonConvert: TButton
      Left = 301
      Top = 88
      Width = 139
      Height = 24
      Caption = 'Realizar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonConvertClick
    end
    object ComboBox1: TComboBox
      Left = 197
      Top = 88
      Width = 98
      Height = 23
      Cursor = crHandPoint
      Style = csDropDownList
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 1
      Text = 'Sumar'
      Items.Strings = (
        'Sumar'
        'Restar'
        'Multiplicar'
        'Dividir')
    end
  end
end
