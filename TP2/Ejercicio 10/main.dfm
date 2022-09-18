object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 336
  ClientWidth = 318
  Color = 15584407
  CustomTitleBar.CaptionAlignment = taCenter
  Constraints.MaxHeight = 375
  Constraints.MaxWidth = 334
  Constraints.MinHeight = 375
  Constraints.MinWidth = 334
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object Ejecutar: TButton
    Left = 88
    Top = 304
    Width = 144
    Height = 25
    Caption = 'Ejecutar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Book Antiqua'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = EjecutarClick
  end
  object GroupBoxInput: TGroupBox
    Left = 8
    Top = 8
    Width = 303
    Height = 137
    Color = 16702941
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label1: TLabel
      Left = 64
      Top = 32
      Width = 168
      Height = 22
      Caption = 'Ingrese el conjunto base '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Monotype Corsiva'
      Font.Style = []
      ParentFont = False
    end
    object EditConjuntoBase: TEdit
      Left = 22
      Top = 64
      Width = 251
      Height = 27
      Alignment = taCenter
      TabOrder = 0
      TextHint = '10, 3, 1, 7, 4, 2'
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 151
    Width = 303
    Height = 138
    Color = 16702941
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label2: TLabel
      Left = 22
      Top = 21
      Width = 269
      Height = 44
      Caption = 
        'Ingrese el numero que debe dar la suma    de los elementos de lo' +
        's subconjuntos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Monotype Corsiva'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object EditNumeroSuma: TEdit
      Left = 62
      Top = 80
      Width = 179
      Height = 27
      Alignment = taCenter
      NumbersOnly = True
      TabOrder = 0
      TextHint = '7'
    end
  end
end
