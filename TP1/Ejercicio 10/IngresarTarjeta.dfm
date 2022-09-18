object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 262
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object labelTarjeta: TLabel
    Left = 8
    Top = 32
    Width = 39
    Height = 13
    Caption = 'Tarjeta:'
  end
  object ca: TLabel
    Left = 8
    Top = 80
    Width = 61
    Height = 13
    Caption = 'Vencimiento:'
  end
  object Label1: TLabel
    Left = 8
    Top = 133
    Width = 82
    Height = 13
    Caption = 'Limite una cuota:'
  end
  object Label2: TLabel
    Left = 8
    Top = 176
    Width = 110
    Height = 13
    Caption = 'Limite multiples cuotas:'
  end
  object editTarjeta: TEdit
    Left = 79
    Top = 29
    Width = 121
    Height = 21
    MaxLength = 16
    NumbersOnly = True
    TabOrder = 0
  end
  object datePickerFecha: TDatePicker
    Left = 75
    Top = 69
    Date = 44647.000000000000000000
    DateFormat = 'mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
  end
  object buttonFinalizar: TButton
    Left = 91
    Top = 218
    Width = 83
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
    OnClick = buttonFinalizarClick
  end
  object editLimiteUnaCuota: TEdit
    Left = 131
    Top = 130
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object editLimiteMultiplesCuotas: TEdit
    Left = 131
    Top = 173
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 4
  end
end
