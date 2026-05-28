unit Loop.Service;

interface
uses
 Vcl.ExtCtrls, Command.Logs;
 type
  TLoopProc = reference to procedure;
 type
  TLoopService = class
  private
    class var FTimer: TTimer;
    class var FProc: TLoopProc;
    class procedure OnTimer(Sender: TObject);
    public
     {Public Declarations}
    class procedure Start(AProc: TLoopProc; Interval: Integer);
    class procedure Stop;

  end;

implementation

{ TPrintLoopService }

class procedure TLoopService.OnTimer(Sender: TObject);
begin
 if Assigned(FProc) then
    FProc;
end;

class procedure TLoopService.Start(AProc: TLoopProc; Interval: Integer);
begin
 FProc := AProc;
  if FTimer = nil then
  begin
   FTimer := TTimer.Create(nil);
   FTimer.OnTimer := OnTimer;
  end;
  FTimer.Interval := Interval;
  FTimer.Enabled  := True;
end;

class procedure TLoopService.Stop;
begin
   if FTimer <> nil then
    FTimer.Enabled := False;
end;

end.
