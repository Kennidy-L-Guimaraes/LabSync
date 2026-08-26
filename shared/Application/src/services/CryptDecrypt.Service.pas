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
  DECFormatBase, DECFormat, DECUtil, DECCiphers, DECRandom, System.Hash, DECCRC, DECTypes, DECCipherBase;

{ TCrypt }

class function TCrypt.Decrypt(const APlainText: string; const AKey: TBytes;
  out ANonceB64: string): string;
begin

end;

class function TCrypt.Encrypt(const APlainText: string; const AKey: TBytes;
  out ANonceB64: string): string;
var
  LCipher: TCipher_AES;
  LIV: TBytes;
begin
  LIV := RandomBytes(16);

  LCipher := TCipher_AES.Create;
  try
    LCipher.Mode := cmCBCx;
    LCipher.Init(AKey, LIV, 0);
    Result := LCipher.EncodeStringToString(APlainText, TFormat_Base64);
  finally
    LCipher.Free;
  end;

  ANonceB64 := TEncoding.ASCII.GetString(TFormat_Base64.Encode(LIV));
end;

end.
