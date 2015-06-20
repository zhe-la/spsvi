unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, CPort,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TrackBar3: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Label5: TLabel;
    ComPort1: TComPort;
    Label6: TLabel;
    TrackBar4: TTrackBar;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    Label10: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label11: TLabel;
    TrackBar7: TTrackBar;
    TrackBar8: TTrackBar;
    TrackBar9: TTrackBar;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure TrackBar3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure TrackBar9Change(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ReadBuffer: array[0..255] of char;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
EnumComPorts(ComboBox1.Items);
ComboBox1.ItemIndex:= 0;
ComPort1.Port := ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
try
ComPort1.Open;
Label5.Caption:=ComboBox1.Text+', 115200';
Label5.Font.Color:= clGreen;
except
Label5.Font.Color:= clRed;
Label5.Caption:='��� ����������';
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
ComPort1.Close;
Label5.Font.Color:= clRed;
Label5.Caption:='��� ����������';
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
ComPort1.Port := ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var str,ori_str:string;
Rotkl,Rerror,Rkor,Potkl,Perror,Pkor,Yotkl,Yerror,Ykor:string;
n,n1,n2,k,k1,k2:integer;
begin
ComPort1.ReadStr(ori_str,Count);
Label33.Caption:=ori_str;
if (ori_str[1]='R') then
begin
str:= copy(ori_str,2,Length(ori_str)-1);
// ����� ������� ������� ������� (������� ������������)
n:= pos('E',str);
// ����������� ������ �� ������ �� �������, �������� ����� ���������
Rotkl:= copy(str,2,n-2);
// ������� ����� ������ �� ������ �� ���������� ������� (������� ��������� ������)
Delete(str,1,n);
n1:= pos('S',str);
Rerror:= copy(str,1,n1-1);
Delete(str,1,n1);
n2:= pos('P',str);
Rkor:= copy(str,1,n2-1);
Delete(str,1,n2);
Label15.Caption:=Rotkl;
Label16.Caption:=Rerror;
Label17.Caption:=Rkor;

k:= pos('E',str);
// ����������� ������ �� ������ �� �������, �������� ����� ���������
Potkl:= copy(str,2,k-2);
// ������� ����� ������ �� ������ �� ���������� ������� (������� ��������� ������)
Delete(str,1,k);
k1:= pos('S',str);
Perror:= copy(str,1,k1-1);
Delete(str,1,k1);

Label27.Caption:=Potkl;
Label28.Caption:=Perror;
Label29.Caption:=str;

end;

if (ori_str[1]='Y') then
begin
str:= copy(ori_str,2,Length(ori_str)-1);
// ����� ������� ������� ������� (������� ������������)
n:= pos('E',str);
// ����������� ������ �� ������ �� �������, �������� ����� ���������
Yotkl:= copy(str,2,n-2);
// ������� ����� ������ �� ������ �� ���������� ������� (������� ��������� ������)
Delete(str,1,n);
n1:= pos('S',str);
Yerror:= copy(str,1,n1-1);
Delete(str,1,n1);
Label30.Caption:=Yotkl;
Label31.Caption:=Yerror;
Label32.Caption:=str;
end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
FormatSettings.DecimalSeparator := '.';
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
Edit1.Text:=floattostr(TrackBar1.Position / 100);
ComPort1.WriteStr('RP'+Edit1.Text+''#13);
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
Edit2.Text:=floattostr(TrackBar2.Position / 100);
ComPort1.WriteStr('RI'+Edit2.Text+''#13);
end;

procedure TForm1.TrackBar3Change(Sender: TObject);
begin
Edit3.Text:=floattostr(TrackBar3.Position / 1000);
ComPort1.WriteStr('RD'+Edit3.Text+''#13);
end;

procedure TForm1.TrackBar4Change(Sender: TObject);
begin
Edit4.Text:=floattostr(TrackBar4.Position / 100);
ComPort1.WriteStr('PP'+Edit4.Text+''#13);
end;

procedure TForm1.TrackBar5Change(Sender: TObject);
begin
Edit5.Text:=floattostr(TrackBar5.Position / 100);
ComPort1.WriteStr('PI'+Edit5.Text+''#13);
end;

procedure TForm1.TrackBar6Change(Sender: TObject);
begin
Edit6.Text:=floattostr(TrackBar6.Position / 10000);
ComPort1.WriteStr('PD'+Edit6.Text+''#13);
end;

procedure TForm1.TrackBar7Change(Sender: TObject);
begin
Edit7.Text:=floattostr(TrackBar7.Position / 100);
ComPort1.WriteStr('YP'+Edit7.Text+''#13);
end;

procedure TForm1.TrackBar8Change(Sender: TObject);
begin
Edit8.Text:=floattostr(TrackBar8.Position / 100);
ComPort1.WriteStr('YI'+Edit8.Text+''#13);
end;

procedure TForm1.TrackBar9Change(Sender: TObject);
begin
Edit9.Text:=floattostr(TrackBar9.Position / 10000);
ComPort1.WriteStr('YD'+Edit9.Text+''#13);
end;

end.
