object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 319
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 144
  TextHeight = 19
  object Label1: TLabel
    Left = 32
    Top = 31
    Width = 36
    Height = 19
    Caption = ' Cola'
  end
  object Label2: TLabel
    Left = 96
    Top = 31
    Width = 30
    Height = 19
    Caption = ' Pila'
  end
  object Label3: TLabel
    Left = 160
    Top = 31
    Width = 69
    Height = 19
    Caption = 'Resultado'
  end
  object buttonEjecutar: TButton
    Left = 182
    Top = 236
    Width = 139
    Height = 41
    Caption = 'Ejecutar'
    TabOrder = 0
    OnClick = buttonEjecutarClick
  end
  object memoPila: TMemo
    Left = 96
    Top = 56
    Width = 41
    Height = 233
    TabOrder = 1
  end
  object memoCola: TMemo
    Left = 32
    Top = 56
    Width = 41
    Height = 233
    TabOrder = 2
  end
  object memoOutput: TMemo
    Left = 160
    Top = 56
    Width = 185
    Height = 161
    TabOrder = 3
  end
end
