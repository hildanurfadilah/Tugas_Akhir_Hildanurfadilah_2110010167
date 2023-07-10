unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm3 = class(TForm)
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
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure posisiawal;
    procedure bersih;
    procedure editclear;
    procedure editenabled;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  id : string;

implementation


{$R *.dfm}

procedure TForm3.btn1Click(Sender: TObject);
begin
  editclear;
  editenabled;

  edt1.Enabled:=True;
  edt2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=True;
  btn3.Enabled:=False;
  btn4.Enabled:=False;
  btn5.Enabled:=False;

end;

procedure TForm3.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('NAMA KELAS TIDAK BOLEH KOSONG');
  end else
  if edt2.Text ='' then
  begin
  ShowMessage('JURUSAN TIDAK BOLEH KOSONG');
  end else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into kelas values(null,"'+edt1.Text+'","'+edt2.Text+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kelas');
  zqry1.Open;
    if (edt1.Text = '')or (edt2.Text = '') then
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

procedure TForm3.dbgrd1CellClick(Column: TColumn);
begin
  id:= zqry1.Fields[0].AsString;
  edt1.Text:=zqry1.FieldList[1].AsString;
  edt2.Text:=zqry1.FieldList[2].AsString;

  edt1.Enabled:=True;
  edt2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=False;
  btn3.Enabled:=True;
  btn4.Enabled:=True;
  btn5.Enabled:=True;

end;

procedure TForm3.btn3Click(Sender: TObject);
begin
  ShowMessage('DATA BERHASIL DIUPDATE');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update kelas set nama= "'+edt1.Text+'", jurusan="'+edt2.Text+'" where kelas.id="'+id+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from kelas');
  zqry1.Open;
  posisiawal;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
    if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning, [mbYes,mbNo],0)= mryes then
  begin
   zqry1.SQL.Clear;
   zqry1.SQL.Add('delete from kelas where id= "'+edt1.Text+'"');
   zqry1.ExecSQL;

   zqry1.SQL.Clear;
   zqry1.SQL.Add('select * from kelas');
   zqry1.Open;
   end else
  begin
  ShowMessage('DATA BATAL DIHAPUS!');
  posisiawal;
  end;
end;

procedure TForm3.btn5Click(Sender: TObject);
begin
  posisiawal;
end;

procedure TForm3.bersih;
begin
edt1.Clear;
edt2.Clear;
end;

procedure TForm3.editclear;
begin
edt1.Text:='';
edt2.Text:='';
end;

procedure TForm3.editenabled;
begin
edt1.Enabled:=True;
edt2.Enabled:=True;
end;

procedure TForm3.posisiawal;
begin
 bersih;
 btn1.Enabled:=True;
 btn2.Enabled:=False;
 btn3.Enabled:=False;
 btn4.Enabled:=False;
 btn5.Enabled:=False;
 edt1.Enabled:=False;
 edt2.Enabled:=False;
end;


procedure TForm3.FormCreate(Sender: TObject);
begin
  edt1.Text:='';
  edt2.Text:='';

  edt1.Enabled:=False;
  edt2.Enabled:=False;
end;

end.
