--[[
	BEGOTTEN III: Developed by DETrooper, cash wednesday, gabs & alyousha35
--]]

local COMMAND = Clockwork.command:New("DoorResetParent")
COMMAND.tip = "Réinitialiser la porte parent active du joueur."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	cwDoorCmds.infoTable = cwDoorCmds.infoTable or {}

	if (IsValid(player.cwParentDoor)) then
		player.cwParentDoor = nil
		cwDoorCmds.infoTable = {}

		Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous avez effacé votre porte parente active.")
		netstream.Start(player, "doorParentESP", cwDoorCmds.infoTable)
	else
		Schema:EasyText(player, "grey", "["..self.name.."] Vous n'avez pas de porte parente active.")
	end
end

COMMAND:Register()