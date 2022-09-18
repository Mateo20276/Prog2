object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 552
  ClientWidth = 604
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
  object LabelFecha1: TLabel
    Left = 159
    Top = 77
    Width = 57
    Height = 19
    Caption = 'Fecha 1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 214
    Top = 102
    Width = 10
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 143
    Top = 102
    Width = 10
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 393
    Top = 77
    Width = 57
    Height = 19
    Caption = 'Fecha 2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 448
    Top = 102
    Width = 10
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 377
    Top = 102
    Width = 10
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 291
    Top = 110
    Width = 16
    Height = 19
    Caption = '<>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GridRangoFechas: TStringGrid
    Left = 96
    Top = 161
    Width = 409
    Height = 320
    Color = clBtnFace
    ColCount = 2
    DefaultColWidth = 201
    DefaultColAlignment = taCenter
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object ComboBoxOptions: TComboBox
    Left = 214
    Top = 35
    Width = 185
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 1
    Text = 'Ganancias en un rango de fechas'
    OnChange = ComboBoxOptionsChange
    Items.Strings = (
      'Ganancias en un rango de fechas'
      'Ganancias de una fecha')
  end
  object GridFecha: TStringGrid
    Left = 8
    Top = 249
    Width = 588
    Height = 74
    Color = clBtnFace
    ColCount = 4
    DefaultColWidth = 145
    DefaultColAlignment = taCenter
    DefaultRowHeight = 34
    FixedCols = 0
    RowCount = 2
    ScrollBars = ssVertical
    TabOrder = 2
    Visible = False
  end
  object editDiaFecha1: TEdit
    Left = 88
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TextHint = '20'
  end
  object EditMesFecha1: TEdit
    Left = 159
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 4
    TextHint = '12'
  end
  object EditAñoFecha1: TEdit
    Left = 230
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 4
    NumbersOnly = True
    ParentFont = False
    TabOrder = 5
    TextHint = '2021'
  end
  object EditDiaFecha2: TEdit
    Left = 322
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    TextHint = '30'
  end
  object EditMesFecha2: TEdit
    Left = 393
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 7
    TextHint = '12'
  end
  object EditAñoFecha2: TEdit
    Left = 464
    Top = 109
    Width = 49
    Height = 24
    Cursor = crIBeam
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 4
    NumbersOnly = True
    ParentFont = False
    TabOrder = 8
    TextHint = '2021'
  end
  object BtnMostrar: TButton
    Left = 214
    Top = 496
    Width = 156
    Height = 25
    Caption = 'Mostrar Recaudaciones'
    TabOrder = 9
    OnClick = BtnMostrarClick
  end
end
