unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    TrayIcon1: TTrayIcon;
    Button1: TButton;
    BalloonHint1: TBalloonHint;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrayIcon1BalloonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
//  TrayIcon1.Visible:= True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  BalloonHint1.ShowHint(Button1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  with TrayIcon1 do
  begin
    BalloonFlags:= bfInfo;
    BalloonHint:= 'Balloon Hint';
    BalloonTitle:= 'Balloon Title';
    BalloonTimeout:= 500;
    Hint:= 'component hint';
    Visible:= True;
  end;

  with BalloonHint1 do
  begin
    Title:= 'balloonHint Title';
    Description := 'This is my test message description';
    HideAfter:= 1000;
  end;
end;

procedure TForm1.TrayIcon1BalloonClick(Sender: TObject);
begin
  BalloonHint1.Description:= 'clicked on the balloon hint';
  BalloonHint1.ShowHint(Self);
end;

end.
