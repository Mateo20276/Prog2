object Form1: TForm1
  Left = 0
  Top = 113
  Caption = 'Seven-Segment Display'
  ClientHeight = 757
  ClientWidth = 1240
  Color = 2236962
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxGrid: TGroupBox
    Left = 8
    Top = 8
    Width = 1224
    Height = 533
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
    object Label1: TLabel
      Left = 320
      Top = 32
      Width = 612
      Height = 61
      ParentCustomHint = False
      Caption = 'Representaci'#243'n del c'#243'digo de 7 segmentos '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -47
      Font.Name = 'Pristina'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object Grid: TStringGrid
      Left = 56
      Top = 120
      Width = 1094
      Height = 390
      Color = 5592405
      ColCount = 9
      DefaultColWidth = 120
      DefaultColAlignment = taCenter
      DefaultRowHeight = 34
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
      ScrollBars = ssNone
      TabOrder = 0
    end
  end
  object GroupBoxInput: TGroupBox
    Left = 8
    Top = 547
    Width = 1224
    Height = 202
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
      Left = 264
      Top = 16
      Width = 703
      Height = 44
      ParentCustomHint = False
      Caption = 
        'Ingrese dos numero decimales para convertir a seven-segment disp' +
        'lay'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -33
      Font.Name = 'Pristina'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object Label3: TLabel
      Left = 488
      Top = 74
      Width = 53
      Height = 31
      ParentCustomHint = False
      Caption = 'num 1 '
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Papyrus'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object Label4: TLabel
      Left = 647
      Top = 74
      Width = 49
      Height = 31
      ParentCustomHint = False
      Caption = 'num 2'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Papyrus'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
    end
    object ButtonConvert: TButton
      Left = 528
      Top = 160
      Width = 139
      Height = 26
      Caption = 'Convertir numeros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Leelawadee'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonConvertClick
    end
    object EditNum1: TEdit
      Left = 456
      Top = 104
      Width = 113
      Height = 32
      Alignment = taCenter
      Color = 7829367
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object EditNum2: TEdit
      Left = 608
      Top = 104
      Width = 121
      Height = 32
      Alignment = taCenter
      Color = 7829367
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
    end
  end
end
