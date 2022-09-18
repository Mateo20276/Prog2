object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 641
  ClientWidth = 1036
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 144
  TextHeight = 19
  object buttonEjecutar: TButton
    Left = 280
    Top = 544
    Width = 201
    Height = 57
    Caption = 'Ejecutar'
    TabOrder = 0
    OnClick = buttonEjecutarClick
  end
  object gridLaberinto: TStringGrid
    Left = 24
    Top = 40
    Width = 657
    Height = 465
    Color = clSkyBlue
    ColCount = 10
    DefaultRowHeight = 64
    FixedCols = 0
    RowCount = 7
    FixedRows = 0
    GradientStartColor = clWindow
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor, goThumbTracking, goFixedRowDefAlign]
    TabOrder = 1
    OnKeyPress = gridLaberintoKeyPress
  end
  object memoOutput: TMemo
    Left = 712
    Top = 40
    Width = 297
    Height = 465
    TabOrder = 2
  end
  object buttonEjemplo1: TButton
    Left = 552
    Top = 544
    Width = 201
    Height = 57
    Caption = 'Cargar Ejemplo'
    TabOrder = 3
    OnClick = buttonEjemplo1Click
  end
end
