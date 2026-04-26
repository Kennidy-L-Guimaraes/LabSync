unit Screen.Service;

interface
uses Command.Parser, SysUtils, Windows, Dialogs, Command.Logs, System.IOUtils,
 Types, Vcl.Imaging.jpeg, Vcl.Graphics;
 type
   TScreenService = class
    public
     {Public Declarations}
      class procedure CaptureScreenToJpg(const FileName: string; Quality: Integer);
   end;

implementation

{ TScreenService }

class procedure TScreenService.CaptureScreenToJpg(const FileName: string;
  Quality: Integer);
var
  Bmp: TBitmap;
  Jpg: TJPEGImage;
  DC: HDC;
begin
  Bmp := TBitmap.Create;
  Jpg := TJPEGImage.Create;
  try
    Bmp.Width := GetSystemMetrics(SM_CXSCREEN);
    Bmp.Height := GetSystemMetrics(SM_CYSCREEN);

    DC := GetDC(0);
    try
      BitBlt(Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height, DC, 0, 0, SRCCOPY);
    finally
      ReleaseDC(0, DC);
    end;

    Jpg.Assign(Bmp);
    Jpg.CompressionQuality := Quality;
    Jpg.Compress;
    Jpg.SaveToFile(FileName);
  finally
    Bmp.Free;
    Jpg.Free;
  end;
end;

end.
