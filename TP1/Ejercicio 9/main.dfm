object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 609
  ClientWidth = 885
  Color = cl3DLight
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 857
    Height = 593
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 248
      Top = 35
      Width = 346
      Height = 43
      Caption = 'Seccion de compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Lucida Handwriting'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 176
      Top = 76
      Width = 480
      Height = 13
      Caption = 
        '----------------------------------------------------------------' +
        '--------------------------------------------------------'
    end
    object GroupBoxInputCompra: TGroupBox
      Left = 32
      Top = 112
      Width = 384
      Height = 412
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object Label6: TLabel
        Left = 92
        Top = 23
        Width = 207
        Height = 42
        Caption = 'Ingrese el dinero'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Papyrus'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GroupBox2: TGroupBox
        Left = 24
        Top = 94
        Width = 337
        Height = 80
        TabOrder = 0
        object Label3: TLabel
          Left = 68
          Top = 33
          Width = 78
          Height = 17
          Caption = 'Total a pagar :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Monotype Corsiva'
          Font.Style = []
          ParentFont = False
        end
        object EditTotalAPagar: TEdit
          Left = 152
          Top = 32
          Width = 97
          Height = 21
          Alignment = taCenter
          NumbersOnly = True
          TabOrder = 0
          Text = '500'
        end
      end
      object GroupBox3: TGroupBox
        Left = 24
        Top = 193
        Width = 337
        Height = 80
        TabOrder = 1
        object ComboBoxTipoBilleteCompra: TComboBox
          Left = 16
          Top = 31
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 0
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
        object EditSumarBillete: TEdit
          Left = 175
          Top = 31
          Width = 49
          Height = 21
          Alignment = taCenter
          NumbersOnly = True
          ReadOnly = True
          TabOrder = 1
          Text = '0'
          TextHint = '00000'
        end
        object UpDown1: TUpDown
          Left = 224
          Top = 31
          Width = 16
          Height = 21
          Associate = EditSumarBillete
          TabOrder = 2
        end
        object BtnSumarBillete: TButton
          Left = 256
          Top = 31
          Width = 65
          Height = 21
          Caption = 'sumar'
          TabOrder = 3
          OnClick = BtnSumarBilleteClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 24
        Top = 294
        Width = 337
        Height = 80
        TabOrder = 2
        object BtnComprar: TButton
          Left = 88
          Top = 27
          Width = 161
          Height = 29
          Caption = 'Comprar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Book Antiqua'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = BtnComprarClick
        end
      end
    end
    object GroupBoxOutputCompra: TGroupBox
      Left = 440
      Top = 112
      Width = 384
      Height = 412
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      object Label4: TLabel
        Left = 139
        Top = 23
        Width = 125
        Height = 42
        Caption = 'Tu vuelto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Papyrus'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GridMostrarVuelto: TStringGrid
        Left = 51
        Top = 71
        Width = 305
        Height = 328
        ColCount = 2
        DefaultColWidth = 150
        RowCount = 13
        ScrollBars = ssNone
        TabOrder = 0
        RowHeights = (
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24
          24)
      end
    end
    object BtnCerrarCaja: TButton
      Left = 280
      Top = 546
      Width = 249
      Height = 31
      Caption = 'Cerrar caja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Book Antiqua'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BtnCerrarCajaClick
    end
  end
end
