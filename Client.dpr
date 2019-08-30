program Client;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {fMain};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
