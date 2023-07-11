object Form10: TForm10
  Left = 192
  Top = 152
  Width = 870
  Height = 450
  Caption = 'LOGIN USER'
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 344
    Top = 40
    Width = 99
    Height = 19
    Caption = 'LOGIN USER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 280
    Top = 80
    Width = 54
    Height = 13
    Caption = 'USERNAME'
  end
  object lbl3: TLabel
    Left = 280
    Top = 104
    Width = 57
    Height = 13
    Caption = 'PASSWORD'
  end
  object edt1: TEdit
    Left = 360
    Top = 80
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 360
    Top = 104
    Width = 137
    Height = 21
    TabOrder = 1
  end
  object btn1: TButton
    Left = 296
    Top = 152
    Width = 153
    Height = 25
    Caption = 'LOGIN'
    TabOrder = 2
    OnClick = btn1Click
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Connected = True
    HostName = 'Localhost'
    Port = 3306
    Database = 'smkbinabangsa'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'D:\Project_Akhir\libmysql.dll'
    Left = 40
    Top = 16
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 120
    Top = 16
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from user')
    Params = <>
    Left = 80
    Top = 16
  end
end
