object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 344
  ClientWidth = 601
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 40
    Width = 529
    Height = 273
    TabOrder = 0
    object Label1: TLabel
      Left = 63
      Top = 40
      Width = 415
      Height = 39
      Caption = 'ingrese los precios del estacinamiento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Monotype Corsiva'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 80
      Top = 128
      Width = 83
      Height = 15
      Caption = 'Precio Por Hora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 337
      Top = 128
      Width = 128
      Height = 15
      Caption = 'Precio Estadia Completa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 195
      Top = 128
      Width = 112
      Height = 15
      Caption = 'Precio Media Estadia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 88
      Top = 80
      Width = 368
      Height = 13
      Caption = 
        '----------------------------------------------------------------' +
        '----------------------------'
    end
    object EditHora: TEdit
      Left = 96
      Top = 149
      Width = 49
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      TextHint = '0000'
    end
    object EditEstadiaC: TEdit
      Left = 376
      Top = 149
      Width = 49
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 1
      TextHint = '0000'
    end
    object EditMEstadia: TEdit
      Left = 227
      Top = 149
      Width = 49
      Height = 21
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 2
      TextHint = '0000'
    end
    object BtnListo: TButton
      Left = 195
      Top = 216
      Width = 123
      Height = 25
      Caption = 'Listo !!!'
      TabOrder = 3
      OnClick = BtnListoClick
    end
  end
end
