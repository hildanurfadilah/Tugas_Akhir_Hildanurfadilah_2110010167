unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm9 = class(TForm)
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
    edt7: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure bersih;
    procedure posisiawal;
    procedure editclear;
    procedure editenabled;
    procedure FormCreate(Sender: TObject);
    procedure con1AfterConnect(Sender: TObject);
    procedure btn6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  id : string;

implementation

{$R *.dfm}

procedure TForm9.btn1Click(Sender: TObject);
begin
  editclear;
  editenabled;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  cmb1.Enabled:=True;
  edt3.Enabled:=True;
  edt4.Enabled:=True;
  edt5.Enabled:=True;
  edt6.Enabled:=True;
  edt7.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=True;
  btn3.Enabled:=False;
  btn4.Enabled:=False;
  btn5.Enabled:=False;

end;

procedure TForm9.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('NIK TIDAK BOLEH KOSONG');
  end else
  if edt2.Text ='' then
  begin
  ShowMessage('NAMA TIDAK BOLEH KOSONG');
  end else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into walikelas values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cmb1.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+edt7.Text+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from walikelas');
  zqry1.Open;
    if (edt1.Text = '')or (edt2.Text = '')or (cmb1.Text = '')or (edt3.Text = '')or (edt4.Text = '')or (edt5.Text = '')or (edt6.Text = '')or (edt7.Text = '') then
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

procedure TForm9.dbgrd1CellClick(Column: TColumn);
begin
  id:= zqry1.Fields[0].AsString;
  edt1.Text:=zqry1.FieldList[1].AsString;
  edt2.Text:=zqry1.FieldList[2].AsString;
  cmb1.Text:=zqry1.FieldList[3].AsString;
  edt3.Text:=zqry1.FieldList[4].AsString;
  edt4.Text:=zqry1.FieldList[5].AsString;
  edt5.Text:=zqry1.FieldList[6].AsString;
  edt6.Text:=zqry1.FieldList[7].AsString;
  edt7.Text:=zqry1.FieldList[8].AsString;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  cmb1.Enabled:=True;
  edt3.Enabled:=True;
  edt4.Enabled:=True;
  edt5.Enabled:=True;
  edt6.Enabled:=True;
  edt7.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=False;
  btn3.Enabled:=True;
  btn4.Enabled:=True;
  btn5.Enabled:=True;

end;

procedure TForm9.btn3Click(Sender: TObject);
begin
  ShowMessage('DATA BERHASIL DIUPDATE');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update walikelas set nik= "'+edt1.Text+'", nama="'+edt2.Text+'", jenis_kelamin="'+cmb1.Text+'", pendidikan="'+edt3.Text+'", telpon="'+edt4.Text+'", matpel="'+edt5.Text+'", alamat="'+edt6.Text+'", status="'+edt7.Text+'" where walikelas.id="'+id+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from walikelas');
  zqry1.Open;
  posisiawal;
end;

procedure TForm9.btn4Click(Sender: TObject);
begin
    if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning, [mbYes,mbNo],0)= mryes then
  begin
   zqry1.SQL.Clear;
   zqry1.SQL.Add('delete from walikelas where id= "'+edt1.Text+'"');
   zqry1.ExecSQL;

   zqry1.SQL.Clear;
   zqry1.SQL.Add('select * from walikelas');
   zqry1.Open;
   end else
  begin
  ShowMessage('DATA BATAL DIHAPUS!');
  posisiawal;
  end
end;

procedure TForm9.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.bersih;
begin
edt1.Clear;
edt2.Clear;
cmb1.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
edt6.Clear;
edt7.Clear;
end;

procedure TForm9.editclear;
begin
edt1.Text:='';
edt2.Text:='';
cmb1.Text:='';
edt3.Text:='';
edt4.Text:='';
edt5.Text:='';
edt6.Text:='';
edt7.Text:='';
end;

procedure TForm9.editenabled;
begin
edt1.Enabled:=True;
edt2.Enabled:=True;
cmb1.Enabled:=True;
edt3.Enabled:=True;
edt4.Enabled:=True;
edt5.Enabled:=True;
edt6.Enabled:=True;
edt7.Enabled:=True;
end;

procedure TForm9.posisiawal;
begin
bersih;
 btn1.Enabled:=True;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn4.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
 edt2.Enabled:=False;
 cmb1.Enabled:=False;
 edt3.Enabled:=False;
 edt4.Enabled:=False;
 edt5.Enabled:=False;
 edt6.Enabled:=False;
 edt7.Enabled:=False;

end;

procedure TForm9.FormCreate(Sender: TObject);
begin
 edt1.Text:='';
 edt2.Text:='';
 cmb1.Text:='';
 edt3.Text:='';
 edt4.Text:='';
 edt5.Text:='';
 edt6.Text:='';
 edt7.Text:='';

 edt1.Enabled:=False;
 edt2.Enabled:=False;
 cmb1.Enabled:=False;
 edt3.Enabled:=False;
 edt4.Enabled:=False;
 edt5.Enabled:=False;
 edt6.Enabled:=False;
 edt7.Enabled:=False;
end;

procedure TForm9.btn6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
