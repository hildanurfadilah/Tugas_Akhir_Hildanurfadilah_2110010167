object Form1: TForm1
  Left = 225
  Top = 216
  Width = 870
  Height = 450
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 264
    Top = 32
    Width = 321
    Height = 19
    Caption = 'SISTEM INFORMASI DATABASE SEKOLAH'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object btn1: TButton
    Left = 216
    Top = 72
    Width = 97
    Height = 33
    Caption = 'DATA HUBUNGAN'
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 320
    Top = 72
    Width = 89
    Height = 33
    Caption = 'DATA KELAS'
    TabOrder = 1
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 424
    Top = 72
    Width = 89
    Height = 33
    Caption = 'DATA ORTU'
    TabOrder = 2
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 536
    Top = 72
    Width = 113
    Height = 33
    Caption = 'DATA POINT'
    TabOrder = 3
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 216
    Top = 128
    Width = 97
    Height = 33
    Caption = 'DATA SEMESTER'
    TabOrder = 4
    OnClick = btn5Click
  end
  object btn6: TButton
    Left = 320
    Top = 128
    Width = 89
    Height = 33
    Caption = 'DATA SISWA'
    TabOrder = 5
    OnClick = btn6Click
  end
  object btn7: TButton
    Left = 424
    Top = 128
    Width = 89
    Height = 33
    Caption = 'DATA USER'
    TabOrder = 6
    OnClick = btn7Click
  end
  object btn8: TButton
    Left = 536
    Top = 128
    Width = 113
    Height = 33
    Caption = 'DATA WALI KELAS'
    TabOrder = 7
    OnClick = btn8Click
  end
end
