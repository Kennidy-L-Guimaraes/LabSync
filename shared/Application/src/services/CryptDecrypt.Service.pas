unit CryptDecrypt.Service;

interface
 uses
   System.SysUtils, System.NetEncoding;
  type
   TCrypt = class
    class function Encrypt(const APlainText: string; const AKey: TBytes; out ANonceB64: string): string;
    class function Decrypt(const APlainText: string; const AKey: TBytes; out ANonceB64: string): string;
   end;

implementation

{ TCrypt }

uses
  DECFormatBase, DECFormat, DECUtil, System.Hash;

{ TCrypt }

class function TCrypt.Decrypt(const APlainText: string; const AKey: TBytes;
  out ANonceB64: string): string;
begin

end;

class function TCrypt.Encrypt(const APlainText: string; const AKey: TBytes;
  out ANonceB64: string): string;
begin

end;

end.
