unit Unit2;

interface
uses Vcl.Forms, Vcl.ComCtrls, Classes, SysUtils, Vcl.Graphics, Windows, Messages;
type
 TGetLogService = class
   private
    {Private Declarations}
    FLastLogCount : integer;

   public
    {Public Declarations}

    class procedure AppendLogLine(const ARichEdit : TRichEdit; const ALine : string);
    class procedure GetLogs(const ARichEdit: TRichEdit);
    class function
 end;

implementation

{ TGetLogService }

class procedure TGetLogService.AppendLogLine(const ARichEdit: TRichEdit;
  const ALine: string);
begin

    if Pos('SUCCESS', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clLime

  else if Pos('ERROR', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clRed

  else if Pos('CONFIG', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clAqua

  else if Pos('SHELL-ENABLED', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clYellow

  else if Pos('SHELL-DISABLE', Aline) > 0 then
    ARichEdit.SelAttributes.Color := $004080FF

  else if Pos('START SYSTEM', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clMoneyGreen

  else if Pos('OVER SYSTEM', Aline) > 0 then
    ARichEdit.SelAttributes.Color := clMedGray

  else if Pos('SERVER - CONNECT', Aline) > 0 then
    ARichEdit.SelAttributes.Color := TColor($00FF379B)

  else if Pos('SERVER - DISCONNECT', Aline) > 0 then
    ARichEdit.SelAttributes.Color := TColor($00FF80FF)

  else
    ARichEdit.SelAttributes.Color := clSilver;

  ARichEdit.SelText := Aline + sLineBreak;
end;

class procedure TGetLogService.GetLogs(const ARichEdit: TRichEdit);
const
  MAX_INITIAL_LINES = 250;

var
  Logs      : TStringList;
  i         : Integer;
  StartLine : Integer;
  FLastLogCount : integer;
begin
  Logs := TStringList.Create;
  try
    Logs.Text := FController.GetLogs;
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

end.
