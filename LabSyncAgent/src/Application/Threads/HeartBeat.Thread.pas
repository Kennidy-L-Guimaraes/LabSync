unit HeartBeat.Thread;

interface
 uses DateUtils, SysUtils, Generics.Collections, Classes, dialogs;
  //Reference to Procedure
  type
    THeartbeatProc = reference to procedure;

  //Thread for Agent Connection **
  type
    THeartbeatThread = class(TThread)
  protected
    procedure Execute; override;
  private
    FHeartbeat: THeartbeatProc;
  public
    constructor Create(AController: THeartbeatProc);
  end;
implementation

{ THeartbeatThread }

constructor THeartbeatThread.Create(AController: THeartbeatProc);
begin
 inherited Create(false);
 FreeOnTerminate  := False;
 FHeartbeat       := AController;
end;

procedure THeartbeatThread.Execute;
begin
  while not Terminated do
   begin
      try
      FHeartbeat();
      except on E: Exception do
      showmessage('Error HeartBeat Access Server' + E.Message);
      end;
    Sleep(5000); //Sleeps for 5 seconds, and then checks the connection again.
   end;
end;

end.
