unit Command.Parser;

interface

uses
  System.SysUtils,
  CommandParsed.Dto,
  Generics.Collections;

type
  TCommandParser = record
  private
    function GetParamValue(const Source, Param: string): string;

  public
    function Normalize(const S: string): string;
    function GetCommandName(const S: string): string;
    function GetCommandValue(const S: string): string;
    function GetCommandTarget(const S: string): string;
    function GetQuality(const S: string): Integer;
    function Parse(const S: string): TCommandParsed;
  end;

implementation

{ TCommandParser }

function TCommandParser.Normalize(const S: string): string;
begin
  Result := LowerCase(Trim(S));
end;

function TCommandParser.GetCommandName(const S: string): string;
var
  Clean : string;
  P     : Integer;
begin
  Clean := Normalize(S);

  P := Pos(' ', Clean);

  if P > 0 then
    Result := Copy(Clean, 1, P - 1)
  else
    Result := Clean;
end;

function TCommandParser.GetParamValue(
  const Source, Param: string
): string;
const
  KnownParams: array[0..2] of string =
  (
    'target=',
    'value=',
    'quality='
  );

var
  LowerSource : string;
  ParamToken  : string;
  StartPos    : Integer;
  NextPos     : Integer;
  MinPos      : Integer;
  I           : Integer;
begin
  Result := '';

  LowerSource := LowerCase(Source);
  ParamToken  := LowerCase(Param) + '=';

  StartPos := Pos(ParamToken, LowerSource);

  if StartPos = 0 then
    Exit;

  StartPos := StartPos + Length(ParamToken);

  MinPos := Length(Source) + 1;

  for I := Low(KnownParams) to High(KnownParams) do
  begin
    if KnownParams[I] = ParamToken then
      Continue;

    NextPos := Pos(
      LowerCase(KnownParams[I]),
      LowerSource,
      StartPos
    );

    if (NextPos > 0) and (NextPos < MinPos) then
      MinPos := NextPos;
  end;

  Result := Trim(
    Copy(
      Source,
      StartPos,
      MinPos - StartPos
    )
  );
end;

function TCommandParser.GetCommandTarget(const S: string): string;
begin
  Result := GetParamValue(S, 'target');
end;

function TCommandParser.GetCommandValue(const S: string): string;
begin
  Result := GetParamValue(S, 'value');
end;

function TCommandParser.GetQuality(const S: string): Integer;
begin
  Result := StrToIntDef(GetParamValue(S, 'quality'),20);
end;

function TCommandParser.Parse(const S: string): TCommandParsed;
begin
  Result.Name    := GetCommandName(S);
  Result.Target  := GetCommandTarget(S);
  Result.Text    := S;
  Result.Value := GetCommandValue(S);
  Result.Options := TDictionary<string, string>.Create;
  Result.Options.Add('quality', IntToStr(GetQuality(S)) );
end;

end.
