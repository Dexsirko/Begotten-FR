local COMMAND = Clockwork.command:New("EnableDiscordLogs");
	COMMAND.tip = "Actualise et active les journaux Discord.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		cwDiscordLog:Refresh();

	end;
COMMAND:Register();