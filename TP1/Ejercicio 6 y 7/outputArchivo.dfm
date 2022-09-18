object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 466
  ClientWidth = 799
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
  object labelCantAutos: TLabel
    Left = 284
    Top = 416
    Width = 182
    Height = 24
    Caption = 'Cantidad de vehiculos: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Roboto Cn'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 228
    Top = 35
    Width = 350
    Height = 27
    Caption = 'Registro Historico DE Vehiculos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Lucida Handwriting'
    Font.Style = []
    ParentFont = False
  end
  object gridOutput: TStringGrid
    Left = 135
    Top = 81
    Width = 552
    Height = 320
    Color = clBtnFace
    DefaultColWidth = 105
    DefaultColAlignment = taCenter
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      105
      105
      105
      105
      105)
  end
  object editCantAutos: TEdit
    Left = 472
    Top = 416
    Width = 41
    Height = 21
    Alignment = taCenter
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Text = '0'
  end
end
