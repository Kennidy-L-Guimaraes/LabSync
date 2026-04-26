unit Command.Parser;
interface
 uses System.SysUtils;
 type
  TParser = record
    public
      function Normalize(const S: string): string;
      function GetCommandName(const S: string): string;
      function GetCommandValue(const S: string): string;
      function GetQuality(const S: string): Integer;
  end;

implementation

{ TParser }



{ TParser }

function TParser.GetCommandName(const S: string): string;
var
  Clean: string;
  P: Integer;
begin
  Clean := Normalize(S);

  P := Pos(' ', Clean);
  if P > 0 then
    Result := Copy(Clean, 1, P - 1)
  else
    Result := Clean;
end;

function TParser.GetCommandValue(const S: string): string;
var
  P: Integer;
  Value: string;
begin
  P := Pos('=', S);
  if P = 0 then
    Exit('');

  Value := Copy(S, P + 1, MaxInt);
  Value := Trim(Value);
  if (Length(Value) >= 2) and
     (Value[1] = '"') and
     (Value[Length(Value)] = '"') then
    Value := Copy(Value, 2, Length(Value) - 2);

  Result := Value;
end;

function TParser.GetQuality(const S: string): Integer;
var
  Clean: string;
  P: Integer;
  Value: string;
begin
  Result := 50; //Default
  Clean := LowerCase(S);

  P := Pos('quality=', Clean);
  if P > 0 then
  begin
    Value := Copy(Clean, P + 8, 3);
    Result := StrToIntDef(Value, 50);
  end;
end;

function TParser.Normalize(const S: string): string;
begin
  Result := LowerCase(Trim(S));
end;

end.
