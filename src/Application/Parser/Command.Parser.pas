unit Command.Parser;
interface
 uses System.SysUtils, CommandParsed.Dto, Generics.Collections;
 type
  TCommandParser = record
    public
      function Normalize(const S: string): string;
      function GetCommandName(const   S: string)  : string;
      function GetCommandValue(const  S: string)  : string;
      function GetCommandTarget(const S: string)  : string;
      function GetQuality(const S: string): Integer;
      function Parse(const S: string): TCommandParsed;
  end;

implementation

{ TParser }

function TCommandParser.GetCommandName(const S: string): string;
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

function TCommandParser.GetCommandTarget(const S: string): string;
var
  P     : Integer;
  Clean : string;
  Value : string;
begin
  Clean := LowerCase(S);
  P := Pos('target=', Clean);
  if P = 0 then
    Exit('');

  Value := Copy(S, P + 7, MaxInt);// 7 = length('target=')
  P := Pos(' ', Value);
  if P > 0 then
    Value := Copy(Value, 1, P - 1);

  Result := Trim(Value);
end;

function TCommandParser.GetCommandValue(const S: string): string;
var
  P     : Integer;
  Clean : string;
  Value : string;
begin
  Clean := LowerCase(S);
  P := Pos('value=', Clean);
  if P = 0 then
    Exit('');

  Value := Copy(S, P + 6, MaxInt); //6 = length('value=')
  P := Pos(' ', Value);
  if P > 0 then
    Value := Copy(Value, 1, P - 1);

  Result := Trim(Value);
end;

function TCommandParser.GetQuality(const S: string): Integer;
var
  Clean: string;
  P, I: Integer;
  NumStr: string;
begin
  Result := 20; // Default
  Clean := LowerCase(S);

  P := Pos('quality=', Clean);
  if P > 0 then
  begin
    I := P + Length('quality=');
    NumStr := '';

    while (I <= Length(Clean)) and CharInSet(Clean[I], ['0'..'9']) do
    begin
      NumStr := NumStr + Clean[I];
      Inc(I);
    end;

    Result := StrToIntDef(NumStr, 50);
  end;
end;

function TCommandParser.Normalize(const S: string): string;
begin
  Result := LowerCase(Trim(S));
end;

function TCommandParser.Parse(const S: string): TCommandParsed;
begin
  Result.Name   := GetCommandName(S);
  Result.Target := GetCommandTarget(S);
  Result.Text   := S;
  Result.Options := TDictionary<string,string>.Create;
  Result.Options.Add(
    'quality',
    intToStr(GetQuality(S))
  );

  Result.Options.Add(
    'value',
    GetCommandValue(S)
  );
end;

end.
