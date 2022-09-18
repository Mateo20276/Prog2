object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 598
  ClientWidth = 813
  Color = cl3DLight
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxEntrada: TGroupBox
    Left = 19
    Top = 15
    Width = 374
    Height = 298
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    BiDiMode = bdLeftToRight
    Caption = 'Datos De Entrada'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object labelHora: TLabel
      Left = 207
      Top = 123
      Width = 36
      Height = 18
      Caption = 'Hora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labelMinutos: TLabel
      Left = 205
      Top = 158
      Width = 60
      Height = 18
      Caption = 'Minutos: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labelDia: TLabel
      Left = 54
      Top = 124
      Width = 25
      Height = 18
      Caption = 'Dia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labelMes: TLabel
      Left = 54
      Top = 163
      Width = 32
      Height = 18
      Caption = 'Mes:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labelAño: TLabel
      Left = 54
      Top = 200
      Width = 30
      Height = 18
      Caption = 'A'#241'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 54
      Top = 97
      Width = 126
      Height = 16
      Caption = '---------------------'
    end
    object Label2: TLabel
      Left = 198
      Top = 97
      Width = 138
      Height = 16
      Caption = '-----------------------'
    end
    object editHoraEntrada: TEdit
      Left = 269
      Top = 122
      Width = 41
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
      TabOrder = 0
      TextHint = '00'
    end
    object editMinutosEntrada: TEdit
      Left = 269
      Top = 155
      Width = 41
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
      TabOrder = 1
      TextHint = '00'
    end
    object editDiaEntrada: TEdit
      Left = 93
      Top = 122
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
      TabOrder = 2
      TextHint = '00'
    end
    object editMesEntrada: TEdit
      Left = 93
      Top = 162
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
      TabOrder = 3
      TextHint = '00'
    end
    object editAñoEntrada: TEdit
      Left = 93
      Top = 199
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
      TabOrder = 4
      TextHint = '0000'
    end
    object textFecha: TStaticText
      Left = 74
      Top = 68
      Width = 84
      Height = 35
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object textHorario: TStaticText
      Left = 207
      Top = 68
      Width = 113
      Height = 35
      Caption = 'Horario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBoxSalida: TGroupBox
    Left = 418
    Top = 15
    Width = 374
    Height = 298
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Caption = 'Datos De Salida'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label8: TLabel
      Left = 213
      Top = 123
      Width = 36
      Height = 18
      Caption = 'Hora:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 213
      Top = 158
      Width = 60
      Height = 18
      Caption = 'Minutos: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label10: TLabel
      Left = 61
      Top = 126
      Width = 25
      Height = 18
      Caption = 'Dia:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 61
      Top = 165
      Width = 32
      Height = 18
      Caption = 'Mes:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 61
      Top = 202
      Width = 30
      Height = 18
      Caption = 'A'#241'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 46
      Top = 97
      Width = 150
      Height = 16
      Caption = '-------------------------'
    end
    object Label4: TLabel
      Left = 198
      Top = 97
      Width = 162
      Height = 16
      Caption = '---------------------------'
    end
    object editHoraSalida: TEdit
      Left = 277
      Top = 122
      Width = 41
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
      TabOrder = 0
      TextHint = '00'
    end
    object editMinutosSalida: TEdit
      Left = 277
      Top = 155
      Width = 41
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
      TabOrder = 1
      TextHint = '00'
    end
    object editDiaSalida: TEdit
      Left = 101
      Top = 122
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
      TabOrder = 2
      TextHint = '00'
    end
    object editMesSalida: TEdit
      Left = 101
      Top = 162
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
      TabOrder = 3
      TextHint = '00'
    end
    object editAñoSalida: TEdit
      Left = 101
      Top = 199
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
      TabOrder = 4
      TextHint = '0000'
    end
    object StaticText2: TStaticText
      Left = 72
      Top = 68
      Width = 84
      Height = 35
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object StaticText3: TStaticText
      Left = 207
      Top = 68
      Width = 113
      Height = 35
      Caption = 'Horario'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBoxInfoCar: TGroupBox
    Left = 136
    Top = 331
    Width = 531
    Height = 158
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label15: TLabel
      Left = 87
      Top = 73
      Width = 340
      Height = 16
      Caption = 
        '----------------------------------------------------------------' +
        '----'
    end
    object labelPatente: TLabel
      Left = 200
      Top = 104
      Width = 48
      Height = 16
      Caption = 'Patente:'
    end
    object StaticText4: TStaticText
      Left = 79
      Top = 44
      Width = 356
      Height = 35
      Caption = 'Informaci'#243'n del behiculo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object editPatente: TEdit
      Left = 264
      Top = 102
      Width = 41
      Height = 24
      Cursor = crIBeam
      MaxLength = 3
      TabOrder = 1
      TextHint = '000'
    end
  end
  object buttonAddCar: TButton
    Left = 191
    Top = 517
    Width = 202
    Height = 28
    Cursor = crHandPoint
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'A'#241'adir Auto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = buttonAddCarClick
  end
  object BtnMostrarAutos: TButton
    Left = 397
    Top = 517
    Width = 202
    Height = 28
    Cursor = crHandPoint
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Mostrar Los Autos A'#241'adidos'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = BtnMostrarAutosClick
  end
  object BtnMostrarAutosHistoricos: TButton
    Left = 190
    Top = 550
    Width = 202
    Height = 28
    Caption = 'Mostrar Autos Historicos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BtnMostrarAutosHistoricosClick
  end
  object BtnMontosPorFecha: TButton
    Left = 398
    Top = 550
    Width = 202
    Height = 28
    Caption = 'Mostrar Montos de "x" Fecha'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Book Antiqua'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = BtnMontosPorFechaClick
  end
end
