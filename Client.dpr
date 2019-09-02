program Client;

uses
  Vcl.Forms,
  ufMain in 'ufMain.pas' {fMain},
  WSClient in 'WSClient.pas';

{$R *.res}

begin
  system.ReportMemoryLeaksOnShutdown:=true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
