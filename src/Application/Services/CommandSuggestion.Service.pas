unit CommandSuggestion.Service;

interface
uses Windows, Math;
type
  TCommandSuggestionService = class
   private
    {Private Declarations}
     class function LevenshteinDistance(const S, T: string): Integer;
   public
    {Public Declarations}
    class function Suggest(const Cmd: string; const Commands: TArray<string>): string;
  end;

implementation

{ TCommandSuggestionService }

class function TCommandSuggestionService.LevenshteinDistance(const S,
  T: string): Integer;
var
  D: array of array of Integer;
  i, j: Integer;
begin
  SetLength(D, Length(S)+1, Length(T)+1);

  for i := 0 to Length(S) do
    D[i,0] := i;

  for j := 0 to Length(T) do
    D[0,j] := j;

  for i := 1 to Length(S) do
    for j := 1 to Length(T) do
    begin
      if S[i] = T[j] then
        D[i,j] := D[i-1,j-1]
      else
        D[i,j] := Min(
          Min(D[i-1,j] + 1,     //remove
              D[i,j-1] + 1),    //insert
              D[i-1,j-1] + 1    //sub
        );
    end;

  Result := D[Length(S), Length(T)];
end;

class function TCommandSuggestionService.Suggest(const Cmd: string;
  const Commands: TArray<string>): string;
var
  BestMatch: string;
  BestScore: Integer;
  CurrentScore: Integer;
  Candidate: string;
begin
  BestScore := MaxInt;
  BestMatch := '';

  for Candidate in Commands do
  begin
    CurrentScore := LevenshteinDistance(Cmd, Candidate);

    if CurrentScore < BestScore then
    begin
      BestScore := CurrentScore;
      BestMatch := Candidate;
    end;
  end;

  //Threshold: Not aplicable
  if BestScore <= 3 then
    Result := BestMatch
  else
    Result := '';
end;

end.
