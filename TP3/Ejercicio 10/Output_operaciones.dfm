object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Resultado'
  ClientHeight = 539
  ClientWidth = 691
  Color = 2236962
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxOperaciones: TGroupBox
    Left = 0
    Top = 0
    Width = 689
    Height = 537
    TabOrder = 0
    object Edit1: TEdit
      Left = 216
      Top = 13
      Width = 250
      Height = 33
      Alignment = taCenter
      AutoSize = False
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -17
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Resultado'
    end
    object GridResult: TStringGrid
      Left = 216
      Top = 39
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
  end
  object GroupBoxDIvision: TGroupBox
    Left = 0
    Top = 0
    Width = 689
    Height = 537
    TabOrder = 1
    Visible = False
    object Edit2: TEdit
      Left = 79
      Top = 3
      Width = 506
      Height = 41
      Alignment = taCenter
      AutoSize = False
      Color = 3355443
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Resultado'
    end
    object GridCociente: TStringGrid
      Left = 79
      Top = 85
      Width = 250
      Height = 447
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
    object GridResto: TStringGrid
      Left = 335
      Top = 85
      Width = 250
      Height = 447
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
      TabOrder = 2
    end
    object Edit3: TEdit
      Left = 79
      Top = 43
      Width = 250
      Height = 43
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
      Text = 'Cociente'
    end
    object Edit4: TEdit
      Left = 335
      Top = 43
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
      TabOrder = 4
      Text = 'Resto'
    end
  end
end
