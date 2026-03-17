COMMAND = Clockwork.command:New("ClearPAC")
COMMAND.tip = "Efface votre PAC actuel."

-- Called when the command has been run.
function COMMAND:OnRun(player)
	if !Clockwork.player:HasFlags(player, "W") then
		Clockwork.player:Notify(player, "Vous n'avez pas l'autorisation d'utiliser PAC !")
	else
		player:ConCommand("pac_clear_parts")
	end
end



COMMAND:Register(COMMAND, "ClearPAC")