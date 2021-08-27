object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Calculadora de IPVA'
  ClientHeight = 353
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 509
    Height = 137
    Align = alTop
    TabOrder = 0
    object lblValorCarro: TLabel
      Left = 16
      Top = 16
      Width = 125
      Height = 13
      Caption = 'Informe o valor do ve'#237'culo'
    end
    object lblTipoVeiculo: TLabel
      Left = 16
      Top = 74
      Width = 126
      Height = 13
      Caption = 'Selecione o tipo do ve'#237'culo'
    end
    object edtValor: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cboTipoVeiculo: TComboBox
      Left = 16
      Top = 93
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        'Autom'#243'veis'
        'Caminhonetes'
        'Autom'#243'veis transporte p'#250'blico'
        'Ve'#237'culos de locadoras'
        #212'nibus/Caminh'#227'o')
    end
  end
  object btnCalcular: TButton
    Left = 345
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Calcular'
    TabOrder = 1
    OnClick = btnCalcularClick
  end
  object btnLimpar: TButton
    Left = 426
    Top = 143
    Width = 75
    Height = 25
    Caption = '&Limpar'
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object lbxResultado: TListBox
    Left = 0
    Top = 174
    Width = 509
    Height = 179
    ItemHeight = 13
    TabOrder = 3
  end
end
