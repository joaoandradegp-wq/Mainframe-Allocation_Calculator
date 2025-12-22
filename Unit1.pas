unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Menus, Mask, WinSkinData, ExtCtrls;

type
  TForm1 = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    MainMenu1: TMainMenu;
    About1: TMenuItem;
    SkinData1: TSkinData;
    SpeedButton1: TSpeedButton;
    New1: TMenuItem;
    Label10: TLabel;
    Edit13: TEdit;
    Label11: TLabel;
    ComboBox1: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  cilin_trilhas, trilha_bytes, cilin_bytes: integer;
  bytes, kbytes, mbytes, gbytes, tbytes, trilhas1, trilhas2, cilindros1, cilindros2, blksize: double;

  aux: boolean = False;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
cilin_trilhas:=15;
trilha_bytes:=48000;
cilin_bytes:=trilha_bytes*cilin_trilhas;

bytes:=StrtoFloat(Edit1.Text)*StrToFloat(Edit2.Text);
kbytes:=bytes/1024;
mbytes:=kbytes/1024;
gbytes:=mbytes/1024;
tbytes:=gbytes/1024;

 if (ComboBox1.ItemIndex = 1) then
 blksize:=(Trunc(27990/StrToFloat(Edit2.Text))*StrToInt(Edit2.Text))
  else if (ComboBox1.ItemIndex = 2) then
  blksize:=(Trunc(32760/StrToFloat(Edit2.Text))*StrToInt(Edit2.Text))
   else
   blksize:=0;

trilhas1:=(bytes / trilha_bytes)+1;
cilindros1:=(bytes / cilin_bytes)+1;

trilhas2:=(trilhas1 / 16)+1;
cilindros2:=(cilindros1 / 16)+1;

Edit3.Text:=FormatFloat('###,###,##0.',(bytes));
Edit4.Text:=FormatFloat('###,###,##0.',(Round(kbytes)));
Edit5.Text:=FormatFloat('###,###,##0.0',mbytes);
Edit6.Text:=FormatFloat('###,###,##0.000',gbytes);
Edit7.Text:=FormatFloat('###,###,##0.000000',tbytes);

Edit13.Text:=FloatToStr(blksize);

trilhas1:=Trunc(trilhas1);
Edit8.Text:=FormatFloat('###,###,##0.',(trilhas1));

cilindros1:=Trunc(cilindros1);
Edit9.Text:=FormatFloat('###,###,##0.',(cilindros1));

trilhas2:=Round(trilhas2);
trilhas2:=Trunc(trilhas2);
Edit10.Text:=FormatFloat('###,###,##0.',(trilhas2));

cilindros2:=Round(cilindros2);
cilindros2:=Trunc(cilindros2);
Edit11.Text:=FormatFloat('###,###,##0.',(cilindros2));

Memo1.Clear;
Memo1.Lines.Add('SPACE=(TRK,('+FormatFloat('#',(trilhas1))+',1),RLSE)');
Memo1.Lines.Add('SPACE=(CYL,('+FormatFloat('#',(cilindros1))+',1),RLSE)');

Memo2.Clear;
Memo2.Lines.Add('SPACE=(TRK,('+FormatFloat('#',(trilhas2))+','+FormatFloat('#',(trilhas2))+'),RLSE)');
Memo2.Lines.Add('SPACE=(CYL,('+FormatFloat('#',(cilindros2))+','+FormatFloat('#',(cilindros2))+'),RLSE)');

end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
Const
//Caracteres para n„o serem aceitos
especiais = ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz<>!@#$%ß®&*().∞_+-,={}[]?;:|\/*"~^¥`®«Á‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
Edit1.SetFocus;
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
Const
//Caracteres para n„o serem aceitos
especiais = ' ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz<>!@#$%ß®&*().∞_+-,={}[]?;:|\/*"~^¥`®«Á‚¬‡¿„√È…Í Ë»ÌÕÓŒÏÃÊ∆ÙÚ˚˘¯£ÿÉ·¡Û˙Ò—™∫øÆΩº”ﬂ‘“ı’µ˛⁄€Ÿ˝›';
Var
Str : String;
begin
inherited;
Str := key;
if (Pos(Str,especiais)<>0) or (Str = '''') Then
begin
key:= #0;
end
else if key = #0 then
begin
Edit2.SetFocus;
end;

if ((key = #13) and (aux = False)) then
begin
cilin_trilhas:=15;
trilha_bytes:=48000;
cilin_bytes:=trilha_bytes*cilin_trilhas;

bytes:=StrtoFloat(Edit1.Text)*StrtoFloat(Edit2.Text);
kbytes:=bytes/1024;
mbytes:=kbytes/1024;
gbytes:=mbytes/1024;
tbytes:=gbytes/1024;

 if (ComboBox1.ItemIndex = 1) then
 blksize:=(Trunc(27990/StrToFloat(Edit2.Text))*StrToInt(Edit2.Text))
  else if (ComboBox1.ItemIndex = 2) then
  blksize:=(Trunc(32760/StrToFloat(Edit2.Text))*StrToInt(Edit2.Text))
   else
   blksize:=0;

trilhas1:=(bytes / trilha_bytes)+1;
cilindros1:=(bytes / cilin_bytes)+1;

trilhas2:=(trilhas1 / 16)+1;
cilindros2:=(cilindros1 / 16)+1;

Edit3.Text:=FormatFloat('###,###,##0.',(bytes));
Edit4.Text:=FormatFloat('###,###,##0.',(Round(kbytes)));
Edit5.Text:=FormatFloat('###,###,##0.0',mbytes);
Edit6.Text:=FormatFloat('###,###,##0.000',gbytes);
Edit7.Text:=FormatFloat('###,###,##0.000000',tbytes);

Edit13.Text:=FloatToStr(blksize);

trilhas1:=Trunc(trilhas1);
Edit8.Text:=FormatFloat('###,###,##0.',(trilhas1));

cilindros1:=Trunc(cilindros1);
Edit9.Text:=FormatFloat('###,###,##0.',(cilindros1));

trilhas2:=Round(trilhas2);
trilhas2:=Trunc(trilhas2);
Edit10.Text:=FormatFloat('###,###,##0.',(trilhas2));

cilindros2:=Round(cilindros2);
cilindros2:=Trunc(cilindros2);
Edit11.Text:=FormatFloat('###,###,##0.',(cilindros2));

Memo1.Clear;
Memo1.Lines.Add('SPACE=(TRK,('+FormatFloat('#',(trilhas1))+',1),RLSE)');
Memo1.Lines.Add('SPACE=(CYL,('+FormatFloat('#',(cilindros1))+',1),RLSE)');

Memo2.Clear;
Memo2.Lines.Add('SPACE=(TRK,('+FormatFloat('#',(trilhas2))+','+FormatFloat('#',(trilhas2))+'),RLSE)');
Memo2.Lines.Add('SPACE=(CYL,('+FormatFloat('#',(cilindros2))+','+FormatFloat('#',(cilindros2))+'),RLSE)');
end;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

if (Edit1.Text = '') or (Edit1.Text = null) or (Edit2.Text = '') or (Edit2.Text = null) then
SpeedButton1.Enabled:=False
else
SpeedButton1.Enabled:=True;

end;

procedure TForm1.Edit2Change(Sender: TObject);
begin

if (Edit1.Text = '') or (Edit1.Text = null) or (Edit2.Text = '') or (Edit2.Text = null) then
begin
aux:=True;
SpeedButton1.Enabled:=False;
end
else
begin
aux:=False;
SpeedButton1.Enabled:=True;
end;

end;

procedure TForm1.About1Click(Sender: TObject);
begin
AboutBox.Visible:=True;
Form1.Enabled:=False;
end;

procedure TForm1.New1Click(Sender: TObject);
begin
Edit1.Text:='';
Edit2.Text:='';
Edit3.Text:='';
Edit4.Text:='';
Edit5.Text:='';
Edit6.Text:='';
Edit7.Text:='';
Edit13.Text:='';
Edit8.Text:='';
Edit9.Text:='';
Edit10.Text:='';
Edit11.Text:='';
Memo1.Text:='';
Memo2.Text:='';

Edit1.SetFocus;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Release;
Form1 := Nil;
end;

procedure TForm1.Memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//PARA SELECIONAR TUDO QUANDO DER CTRL + A
if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
Memo1.SelectAll;
end;

procedure TForm1.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//PARA SELECIONAR TUDO QUANDO DER CTRL + A
if (ssCtrl in Shift) and (chr(Key) in ['A', 'a']) then
Memo2.SelectAll;
end;

end.
