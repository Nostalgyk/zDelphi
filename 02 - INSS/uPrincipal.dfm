object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 447
    Height = 169
    Align = alTop
    Color = clHighlight
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 110
      Height = 13
      Caption = 'Informe o sal'#225'rio bruto'
      Color = clHotLight
      ParentColor = False
    end
    object EdtSalario: TEdit
      Left = 24
      Top = 35
      Width = 110
      Height = 19
      Cursor = crIBeam
      TabOrder = 0
      OnKeyPress = EdtSalarioKeyPress
    end
  end
  object btnCalcular: TButton
    Left = 364
    Top = 175
    Width = 83
    Height = 24
    Cursor = crHandPoint
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = btnCalcularClick
  end
end
