unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm10 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.btn1Click(Sender: TObject);
begin
with zqry1 do begin
SQL.Clear;
SQL.Add('select * from user where username='+QuotedStr(edt1.Text));
open;
end;
//jika tidak ditemukan data yang dicari
//maka tampilkan pesan

if zqry1.RecordCount=0
then
Application.MessageBox('Maaf user name tidak ditemukan','informasi',MB_OK or MB_ICONINFORMATION)
else
begin
if zqry1.FieldByName('password').AsString<>edt2.Text
then
Application.MessageBox('Pastikan password yang anda masukkan benar','error',MB_OK or MB_ICONERROR)
else
begin
hide;
Form1.Show;
end;

end;
end;
end.
