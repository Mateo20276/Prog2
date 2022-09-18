object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 434
  ClientWidth = 754
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Resultado: TButton
    Left = 168
    Top = 384
    Width = 105
    Height = 42
    Caption = 'Resultado'
    TabOrder = 0
    OnClick = ResultadoClick
  end
  object Memo1: TMemo
    Left = 679
    Top = 16
    Width = 67
    Height = 362
    TabOrder = 1
  end
  object MatrizGrid: TStringGrid
    Left = 0
    Top = 16
    Width = 673
    Height = 362
    ColCount = 13
    DefaultColWidth = 50
    DefaultRowHeight = 50
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing, goThumbTracking, goFixedRowDefAlign]
    TabOrder = 2
    OnKeyPress = MatrizGridKeyPress
    ColWidths = (
      50
      50
      50
      51
      50
      50
      52
      49
      50
      50
      50
      50
      55)
  end
  object CargarEjemplo: TButton
    Left = 472
    Top = 384
    Width = 97
    Height = 42
    Caption = 'Cargar Ejemplo'
    TabOrder = 3
    OnClick = CargarEjemploClick
  end
end
