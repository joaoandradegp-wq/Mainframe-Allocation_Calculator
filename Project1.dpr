program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ACM - Allocation Calculator for Mainframe 1.2';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
