unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids;

type
  TForm8 = class(TForm)
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
    lbl10: TLabel;
    cmb1: TComboBox;
    cmb2: TComboBox;
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
    procedure btn6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  id : string;

implementation

{$R *.dfm}

procedure TForm8.btn1Click(Sender: TObject);
begin
  editclear;
  editenabled;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  cmb1.Enabled:=True;
  cmb2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=True;
  btn3.Enabled:=False;
  btn4.Enabled:=False;
  btn5.Enabled:=False;

end;

procedure TForm8.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('USERNAME TIDAK BOLEH KOSONG');
  end else
  if edt2.Text ='' then
  begin
  ShowMessage('PASSWORD TIDAK BOLEH KOSONG');
  end else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into user values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cmb1.Text+'","'+cmb2.Text+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from user');
  zqry1.Open;
    if (edt1.Text = '')or (edt2.Text = '')or (cmb1.Text = '')or (cmb2.Text = '') then
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

procedure TForm8.dbgrd1CellClick(Column: TColumn);
begin
  id:= zqry1.Fields[0].AsString;
  edt1.Text:=zqry1.FieldList[1].AsString;
  edt2.Text:=zqry1.FieldList[2].AsString;
  cmb1.Text:=zqry1.FieldList[3].AsString;
  cmb2.Text:=zqry1.FieldList[4].AsString;

  edt1.Enabled:=True;
  edt2.Enabled:=True;
  cmb1.Enabled:=True;
  cmb2.Enabled:=True;

  btn1.Enabled:=False;
  btn2.Enabled:=False;
  btn3.Enabled:=True;
  btn4.Enabled:=True;
  btn5.Enabled:=True;

end;

procedure TForm8.btn3Click(Sender: TObject);
begin
  ShowMessage('DATA BERHASIL DIUPDATE');
  zqry1.SQL.Clear;
  zqry1.SQL.Add('Update user set username= "'+edt1.Text+'", password="'+edt2.Text+'", level= "'+cmb1.Text+'", status= "'+cmb2.Text+'", where id_user="'+id+'"');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from user');
  zqry1.Open;
  posisiawal;
end;

procedure TForm8.btn4Click(Sender: TObject);
begin
    if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning, [mbYes,mbNo],0)= mryes then
  begin
   zqry1.SQL.Clear;
   zqry1.SQL.Add('delete from user where id= "'+edt1.Text+'"');
   zqry1.ExecSQL;

   zqry1.SQL.Clear;
   zqry1.SQL.Add('select * from user');
   zqry1.Open;
   end else
  begin
  ShowMessage('DATA BATAL DIHAPUS!');
  posisiawal;
  end;
end;

procedure TForm8.btn5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm8.bersih;
begin
edt1.Clear;
edt2.Clear;
cmb1.Clear;
cmb2.Clear;
end;

procedure TForm8.editclear;
begin
edt1.Text:='';
edt2.Text:='';
cmb1.Text:='';
cmb2.Text:='';
end;

procedure TForm8.editenabled;
begin
edt1.Enabled:=True;
edt2.Enabled:=True;
cmb1.Enabled:=True;
cmb2.Enabled:=True;
end;

procedure TForm8.posisiawal;
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
 cmb2.Enabled:=False;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  edt1.Text:='';
  edt2.Text:='';
  cmb1.Text:='';
  cmb2.Text:='';

  edt1.Enabled:=False;
  edt2.Enabled:=False;
  cmb1.Enabled:=False;
  cmb2.Enabled:=False;
end;

procedure TForm8.btn6Click(Sender: TObject);
begin
frxReport1.ShowReport();
end;

end.
