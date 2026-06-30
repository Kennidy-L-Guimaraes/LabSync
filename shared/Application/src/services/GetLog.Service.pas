unit GetLog.Service;

interface
uses Vcl.Forms, Vcl.ComCtrls, Classes, SysUtils, Vcl.Graphics, Windows, Messages,
  Command.Logs, ApplicationMode.types;
type
 TGetLogService = class
   private
    {Private Declarations}
    class var
    FLog          : TLog;
    FLastLogCount : integer;

   public
    {Public Declarations}
    constructor Create(const Amode: TApplicationMode);
    destructor Destroy;
    class procedure AppendLogLine(const ARichEdit : TRichEdit; const ALine : string);
    class procedure CreateComponent(const ARichEdit: TRichEdit);
    class function  GetLogs: string;
 end;

implementation

{ TGetLogService }

class procedure TGetLogService.AppendLogLine(const ARichEdit: TRichEdit;
  const ALine: string);
begin
    if Pos('SUCCESS', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(34, 197, 94)
  else if Pos('ERROR', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(239, 68, 68)
  else if Pos('CONFIG', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(56, 189, 248)
  else if Pos('SHELL-ENABLED', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(250, 204, 21)
  else if Pos('SHELL-DISABLE', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(251, 146, 60)
  else if Pos('START SYSTEM', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(74, 222, 128)
  else if Pos('OVER SYSTEM', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(148, 163, 184)
  else if Pos('SERVER - CONNECT', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(192, 132, 252)
  else if Pos('SERVER - DISCONNECT', Aline) > 0 then
    ARichEdit.SelAttributes.Color := RGB(244, 114, 182)
  else if Pos('ONLINE', ALine) > 0 then
    ARichEdit.SelAttributes.Color := RGB(34, 197, 94)
  else if Pos('OFFLINE', ALine) > 0 then
    ARichEdit.SelAttributes.Color := RGB(239, 68, 68)
  else
    ARichEdit.SelAttributes.Color := RGB(203, 213, 225);

ARichEdit.SelText := Aline + sLineBreak;
end;

constructor TGetLogService.Create(const Amode: TApplicationMode);
begin
  Flog := TLog.Create(Amode);
end;

class procedure TGetLogService.CreateComponent(const ARichEdit: TRichEdit);
const
  MAX_INITIAL_LINES = 250;

var
  Logs      : TStringList;
  i         : Integer;
  StartLine : Integer;
begin
  Logs := TStringList.Create;
  try
    Logs.Text := GetLogs;
    ARichEdit.Perform(WM_SETREDRAW, 0, 0);

    try
      // FIRST LOAD
      if FLastLogCount = 0 then
      begin
        ARichEdit.Clear;
        StartLine := Logs.Count - MAX_INITIAL_LINES;

        if StartLine < 0 then
          StartLine := 0;

        for i := StartLine to Logs.Count - 1 do
        begin
          AppendLogLine(ARichEdit, Logs[i]);
        end;
      end
      // APPEND ONLY NEW LINES
      else
      begin
        for i := FLastLogCount to Logs.Count - 1 do
        begin
          AppendLogLine(ARichEdit, Logs[i]);
        end;
      end;

      FLastLogCount := Logs.Count;

    finally
      // MAIN RICHEDIT
      ARichEdit.Perform(WM_SETREDRAW, 1, 0);
      ARichEdit.Invalidate;

    end;
    // AUTO SCROLL MAIN
    ARichEdit.SelStart := ARichEdit.GetTextLen;
    ARichEdit.Perform(WM_VSCROLL, SB_BOTTOM, 0);

  finally
    Logs.Free;
  end;
end;

destructor TGetLogService.Destroy;
begin
  inherited;
  Flog.Destroy;
end;

class function TGetLogService.GetLogs: string;
var
 Content : string;
begin
  Content := FLog.ReadLogs('Audit.log');
  if Content = '' then
    Exit;
   Result := Content;
end;

end.
