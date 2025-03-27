object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Sistema de loja'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mmMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  TextHeight = 15
  object imgPrincipal: TImage
    Left = 0
    Top = 0
    Width = 624
    Height = 422
    Align = alClient
    ExplicitLeft = 128
    ExplicitTop = 56
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object stbStatus: TStatusBar
    Left = 0
    Top = 422
    Width = 624
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    ExplicitLeft = 80
    ExplicitTop = 384
    ExplicitWidth = 0
  end
  object mmMenu: TMainMenu
    Left = 536
    Top = 32
    object ss1: TMenuItem
      Caption = '&Cadastro'
      object Carro1: TMenuItem
        Caption = 'Ca&rro'
        OnClick = Carro1Click
      end
    end
  end
  object tmrPrincipal: TTimer
    OnTimer = tmrPrincipalTimer
    Left = 440
    Top = 216
  end
end
