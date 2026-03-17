COMMAND = Clockwork.command:New("PACEditor")
COMMAND.tip = "Ouvre l'éditeur PAC."

-- Called when the command has been run.
function COMMAND:OnRun(player)
	if !Clockwork.player:HasFlags(player, "W") then
		Clockwork.player:Notify(player, "Vous n'avez pas l'autorisation d'utiliser PAC !")
	else
		player:ConCommand("pac_editor")
	end
end



COMMAND:Register(COMMAND, "PACEditor")