object Form7: TForm7
  Left = 438
  Top = 197
  Width = 870
  Height = 501
  Caption = 'Form7'
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
    Left = 64
    Top = 56
    Width = 47
    Height = 13
    Caption = 'ID SISWA'
  end
  object lbl2: TLabel
    Left = 64
    Top = 80
    Width = 17
    Height = 13
    Caption = 'NIS'
  end
  object lbl3: TLabel
    Left = 64
    Top = 104
    Width = 24
    Height = 13
    Caption = 'NISN'
  end
  object lbl4: TLabel
    Left = 64
    Top = 128
    Width = 65
    Height = 13
    Caption = 'NAMA SISWA'
  end
  object lbl5: TLabel
    Left = 64
    Top = 152
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object lbl6: TLabel
    Left = 176
    Top = 16
    Width = 124
    Height = 23
    Caption = 'DATA SISWA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 64
    Top = 176
    Width = 72
    Height = 13
    Caption = 'TEMPAT LAHIR'
  end
  object lbl8: TLabel
    Left = 64
    Top = 200
    Width = 79
    Height = 13
    Caption = 'TANGGAL LAHIR'
  end
  object lbl9: TLabel
    Left = 64
    Top = 248
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object lbl10: TLabel
    Left = 64
    Top = 224
    Width = 74
    Height = 13
    Caption = 'JENIS KELAMIN'
  end
  object lbl11: TLabel
    Left = 64
    Top = 272
    Width = 23
    Height = 13
    Caption = 'TELP'
  end
  object lbl12: TLabel
    Left = 64
    Top = 296
    Width = 13
    Height = 13
    Caption = 'HP'
  end
  object lbl13: TLabel
    Left = 64
    Top = 320
    Width = 38
    Height = 13
    Caption = 'STATUS'
  end
  object edt1: TEdit
    Left = 168
    Top = 48
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 168
    Top = 72
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 168
    Top = 96
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 168
    Top = 120
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 3
  end
  object edt5: TEdit
    Left = 168
    Top = 144
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object btn1: TButton
    Left = 64
    Top = 344
    Width = 73
    Height = 33
    Caption = 'Baru'
    TabOrder = 5
  end
  object btn2: TButton
    Left = 152
    Top = 344
    Width = 73
    Height = 33
    Caption = 'Simpan'
    TabOrder = 6
  end
  object btn3: TButton
    Left = 240
    Top = 344
    Width = 73
    Height = 33
    Caption = 'Edit'
    TabOrder = 7
  end
  object btn4: TButton
    Left = 328
    Top = 344
    Width = 73
    Height = 33
    Caption = 'Hapus'
    TabOrder = 8
  end
  object btn5: TButton
    Left = 416
    Top = 344
    Width = 73
    Height = 33
    Caption = 'Batal'
    TabOrder = 9
  end
  object btn6: TButton
    Left = 504
    Top = 344
    Width = 65
    Height = 33
    Caption = 'Laporan'
    TabOrder = 10
  end
  object dbgrd1: TDBGrid
    Left = 64
    Top = 386
    Width = 553
    Height = 65
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object edt6: TEdit
    Left = 168
    Top = 168
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 12
  end
  object edt7: TEdit
    Left = 168
    Top = 192
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 13
  end
  object edt8: TEdit
    Left = 168
    Top = 216
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 14
  end
  object edt9: TEdit
    Left = 168
    Top = 240
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 15
  end
  object edt10: TEdit
    Left = 168
    Top = 264
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 16
  end
  object edt11: TEdit
    Left = 168
    Top = 288
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 17
  end
  object edt12: TEdit
    Left = 168
    Top = 312
    Width = 209
    Height = 21
    Enabled = False
    TabOrder = 18
  end
  object zqry1: TZQuery
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 536
    Top = 80
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 512
    Top = 72
  end
end
