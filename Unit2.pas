unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    dbgrd1: TDBGrid;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    cmb1: TComboBox;
    cmb2: TComboBox;
    cmb3: TComboBox;
    con1: TZConnection;
    ds1: TDataSource;
    zqry1: TZQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    btn3: TButton;
    btn4: TButton;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btn1Click(Sender: TObject);
begin
edt1.Clear;
edtenabled;

edt1.Enabled:=True;
edt2.Enabled:=True;
cmb1.Enabled:=True;
cmb2.Enabled:=True;
cmb3.Enabled:=True;

btn1.Enabled:=False;
btn2.Enabled:=True;
btn3.Enabled:=True;
btn5.Enabled:=True;
end;

procedure TForm2.btn2Click(Sender: TObject);
begin
if edt1.Text ='' then
begin
ShowMessage('SISWA ID TIDAK BOLEH KOSONG!');
  end else
  if edt2.Text ='' then
  begin
  ShowMessage('ORTU ID TIDAK BOLEH KOSONG!');
  end else
  if cmb1.Text ='' then
begin
ShowMessage('STATUS HUBUNGAN TIDAK BOLEH KOSONG!');
  end else
begin
  zqry1.SQL.Clear;
  zqry1.SQL.Add('insert into hubungan values(null, "'+edt1.Text+'","'+edt2.Text+'","'+cmb1.Text+'","'+cmb2.Text+'","'+cmb3.Text+'")');
  zqry1.ExecSQL;

  zqry1.SQL.Clear;
  zqry1.SQL.Add('select * from hubungan');
  zqry1.Open;
  if (edt1.Text= '')or (edt2.Text= '')or (cmb1.Text= '')or (cmb2.Text= '')or (cmb3.Text= '') then
    begin
    ShowMessage('INPUTAN WAJIB DI ISI');
    end else
    if edt1.Text = zqry1.Fields[1].AsString then
    begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    posisiawal;
    end
end
end;
