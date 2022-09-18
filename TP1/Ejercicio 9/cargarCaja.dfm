object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 363
  ClientWidth = 550
  Color = cl3DLight
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 32
    Top = 24
    Width = 481
    Height = 313
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 135
      Top = 40
      Width = 199
      Height = 39
      Caption = 'Carga Del Cajero '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Monotype Corsiva'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 69
      Top = 80
      Width = 324
      Height = 13
      Caption = 
        '----------------------------------------------------------------' +
        '-----------------'
    end
    object BtnTerminar: TButton
      Left = 135
      Top = 264
      Width = 210
      Height = 25
      Caption = 'Terminar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = BtnTerminarClick
    end
    object GroupBox2: TGroupBox
      Left = 56
      Top = 126
      Width = 353
      Height = 105
      TabOrder = 1
      object ButtonCargar: TButton
        Left = 127
        Top = 66
        Width = 97
        Height = 25
        Caption = 'Cargar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Book Antiqua'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonCargarClick
      end
      object ComboBoxTipoBilleteCarga: TComboBox
        Left = 25
        Top = 27
        Width = 239
        Height = 24
        Style = csDropDownList
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Bookman Old Style'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 1
        Text = 'Billetes de mil'
        Items.Strings = (
          'Billetes de mil'
          'Billetes de quinientos'
          'Billetes de doscientos'
          'Billetes de cien'
          'Billetes de cincuenta'
          'Billetes de veinte'
          'Billetes de diez'
          'Monedas de diez'
          'Monedas de cinco'
          'Monedas de dos'
          'Monedas de uno'
          'Monedas de Cincuenta Centavos'
          'Monedas de VeintiCinco Centavos')
      end
      object EditMontoCarga: TEdit
        Left = 270
        Top = 27
        Width = 49
        Height = 21
        Alignment = taCenter
        MaxLength = 5
        NumbersOnly = True
        TabOrder = 2
        TextHint = '00000'
      end
    end
  end
end
