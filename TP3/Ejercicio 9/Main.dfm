object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 346
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 47
    Width = 44
    Height = 13
    Caption = 'Actividad'
  end
  object Label2: TLabel
    Left = 24
    Top = 90
    Width = 97
    Height = 13
    Caption = 'Duracion en minutos'
  end
  object Label3: TLabel
    Left = 24
    Top = 261
    Width = 77
    Height = 13
    Caption = 'Buscar por Hora'
  end
  object editActividad: TEdit
    Left = 74
    Top = 44
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editDuracion: TEdit
    Left = 134
    Top = 87
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object Cargar: TButton
    Left = 24
    Top = 160
    Width = 137
    Height = 57
    Caption = 'Cargar actividaes'
    TabOrder = 2
    OnClick = CargarClick
  end
  object Memo1: TMemo
    Left = 376
    Top = 44
    Width = 345
    Height = 274
    TabOrder = 3
  end
  object Button1: TButton
    Left = 200
    Top = 160
    Width = 153
    Height = 57
    Caption = 'Ver y cargar lista ordenada'
    TabOrder = 4
    OnClick = Button1Click
  end
  object datetimeHorario: TDateTimePicker
    Left = 107
    Top = 256
    Width = 81
    Height = 25
    Date = 44673.000000000000000000
    Time = 0.873759421294380400
    Kind = dtkTime
    TabOrder = 5
  end
  object buttonVerHora: TButton
    Left = 207
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = buttonVerHoraClick
  end
  object buttonPorcentaje: TButton
    Left = 56
    Top = 313
    Width = 199
    Height = 25
    Caption = 'Porcentaje horas trabajadas'
    TabOrder = 7
    OnClick = buttonPorcentajeClick
  end
end
