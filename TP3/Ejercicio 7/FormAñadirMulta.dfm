object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 337
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  StyleElements = [seFont, seClient]
  PixelsPerInch = 144
  TextHeight = 19
  object labelPatente: TLabel
    Left = 30
    Top = 19
    Width = 93
    Height = 29
    Caption = 'Patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object labelMulta: TLabel
    Left = 30
    Top = 96
    Width = 143
    Height = 19
    Caption = 'Datos de la Multa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object labelFecha: TLabel
    Left = 30
    Top = 169
    Width = 40
    Height = 19
    Caption = 'Fecha'
  end
  object labelNumActa: TLabel
    Left = 30
    Top = 138
    Width = 115
    Height = 19
    Caption = 'Numero de Acta'
  end
  object labelImporte: TLabel
    Left = 30
    Top = 200
    Width = 78
    Height = 19
    Caption = 'Importe($)'
  end
  object labelEstado: TLabel
    Left = 30
    Top = 233
    Width = 47
    Height = 19
    Caption = 'Estado'
  end
  object Edit1: TEdit
    Left = 30
    Top = 54
    Width = 121
    Height = 27
    TabOrder = 0
    TextHint = 'AAAAAA'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 151
    Top = 131
    Width = 121
    Height = 27
    NumbersOnly = True
    TabOrder = 1
    TextHint = '0000'
    OnKeyPress = Edit2KeyPress
  end
  object Edit4: TEdit
    Left = 114
    Top = 197
    Width = 164
    Height = 27
    NumbersOnly = True
    TabOrder = 2
    TextHint = '0'
  end
  object comboBoxEstado: TComboBox
    Left = 114
    Top = 230
    Width = 164
    Height = 27
    TabOrder = 3
    TextHint = 'Seleccione un Estado'
    OnKeyPress = comboBoxEstadoKeyPress
    Items.Strings = (
      'pendiente'
      'abonada'
      'anulada')
  end
  object DatePicker1: TDatePicker
    Left = 114
    Top = 163
    Width = 164
    Height = 31
    Date = 44674.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 4
  end
  object buttonCargarMulta: TButton
    Left = 88
    Top = 280
    Width = 129
    Height = 40
    Caption = 'Cargar Multa'
    TabOrder = 5
    OnClick = buttonCargarMultaClick
  end
end
