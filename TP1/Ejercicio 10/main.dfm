object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 204
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object labelMonto: TLabel
    Left = 16
    Top = 27
    Width = 51
    Height = 13
    Caption = 'Monto ($):'
  end
  object editMonto: TEdit
    Left = 72
    Top = 24
    Width = 82
    Height = 21
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    NumbersOnly = True
    TabOrder = 0
    TextHint = '0'
  end
  object buttonComprar: TButton
    Left = 168
    Top = 60
    Width = 113
    Height = 40
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Caption = 'Comprar'
    TabOrder = 1
    OnClick = buttonComprarClick
  end
  object Memo1: TMemo
    Left = 0
    Top = 105
    Width = 332
    Height = 99
    Align = alBottom
    Lines.Strings = (
      '')
    TabOrder = 2
  end
  object comboboxCuotas: TComboBox
    Left = 187
    Top = 24
    Width = 137
    Height = 21
    Hint = 'Cuotas'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = 'Cuotas'
    OnKeyPress = comboboxCuotasKeyPress
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
  end
  object buttonAñadirTarjeta: TButton
    Left = 50
    Top = 60
    Width = 113
    Height = 39
    Caption = 'A'#241'adir Tarjeta'
    TabOrder = 4
    OnClick = buttonAñadirTarjetaClick
  end
end
