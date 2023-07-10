unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm7 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl6: TLabel;
    dbgrd1: TDBGrid;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    lbl3: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cmb1: TComboBox;
    edt6: TEdit;
    cmb2: TComboBox;
    lbl4: TLabel;
    lbl11: TLabel;
    edt7: TEdit;
    edt8: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure editclear;
    procedure editenabled;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  id : string;

implementation

{$R *.dfm}

procedure TForm7.btn1Click(Sender: TObject);
  editclear;
  editenabled;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  edt3.Enabled:=True;
  edt4.Enabled:=True;
  edt5.Enabled:=True;
  edt6.Enabled:=True;
  cmb1.Enabled:=True;
  edt7.Enabled:=True;
  edt8.Enabled:=True;
  cmb2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=True;
  btn3.Enabled:=False;
  btn4.Enabled:=False;
  btn5.Enabled:=False;

end;

procedure TForm7.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('NIS TIDAK BOLEH KOSONG');
  end else
  if edt2.Text ='' then
  begin
  ShowMessage('NISN TIDAK BOLEH KOSONG');
  end else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into siswa values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cmb1.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+cmb2.Text+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from siswa');
  zqry1.Open;
    if (edt1.Text = '')or (edt2.Text = '')or (edt3.Text = '')or (edt4.Text = '')or (edt5.Text = '')or (edt6.Text = '')or (cmb1.Text = '')or (edt7.Text = '')or (edt8.Text = '')or (cmb2.Text = '') then
    begin
    ShowMessage('INPUTAN WAJIB DI ISI!');
    end else
    if edt1.Text = zqry1.Fields[1].AsString then
    begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
    end
  end
end;

procedure TForm7.btn3Click(Sender: TObject);
begin
  ShowMessage('DATA BERHASIL DIUPDATE');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update siswa set nik= "'+edt1.Text+'", nisn="'+edt2.Text+'",  nama="'+edt3.Text+'", nik="'+edt4.Text+'", tempat_lahir="'+edt5.Text+'", tanggal_lahir="'+edt6.Text+'", jenis_kelamin="'+cmb1.Text+'", alamat="'+edt7.Text+'", telpon="'+edt8.Text+'", alamat="'+cmb2.Text+'" where siswa.id="'+id+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from siswa');
  zqry1.Open;
  posisiawal;
end;

procedure TForm7.dbgrd1CellClick(Column: TColumn);
begin
  id:= zqry1.Fields[0].AsString;
  edt1.Text:=zqry1.FieldList[1].AsString;
  edt2.Text:=zqry1.FieldList[2].AsString;
  edt3.Text:=zqry1.FieldList[4].AsString;
  edt4.Text:=zqry1.FieldList[5].AsString;
  edt5.Text:=zqry1.FieldList[6].AsString;
  edt6.Text:=zqry1.FieldList[7].AsString;
  cmb1.Text:=zqry1.FieldList[8].AsString;
  edt7.Text:=zqry1.FieldList[9].AsString;
  edt8.Text:=zqry1.FieldList[10].AsString;
  cmb2.Text:=zqry1.FieldList[11].AsString;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  edt3.Enabled:=True;
  edt4.Enabled:=True;
  edt5.Enabled:=True;
  edt6.Enabled:=True;
  cmb1.Enabled:=True;
  edt7.Enabled:=True;
  edt8.Enabled:=True;
  cmb2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=False;
  btn3.Enabled:=True;
  btn4.Enabled:=True;
  btn5.Enabled:=True;

end;
procedure TForm7.btn4Click(Sender: TObject);
begin
    if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning, [mbYes,mbNo],0)= mryes then
  begin
   zqry1.SQL.Clear;
   zqry1.SQL.Add('delete from siswa where id= "'+edt1.Text+'"');
   zqry1.ExecSQL;

   zqry1.SQL.Clear;
   zqry1.SQL.Add('select * from siswa');
   zqry1.Open;
   end else
  begin
  ShowMessage('DATA BATAL DIHAPUS!');
  posisiawal;
  end
end;

procedure TForm7.btn5Click(Sender: TObject);
begin
posisiawal;
end;

end.
