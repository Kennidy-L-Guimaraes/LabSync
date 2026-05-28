unit CommandParsed.Dto;

interface
 uses Classes, Generics.Collections;
  type
   TCommandParsed = record
   public
    {Public Declarations}
    Name   : string;
    Target : string;
    Text   : string;
    Value  : string;
    Options : TDictionary<string,string>;
  end;

implementation
{ TCommandParsed }

end.
