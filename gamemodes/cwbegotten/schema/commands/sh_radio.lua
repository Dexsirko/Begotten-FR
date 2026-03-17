--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("Radio");
COMMAND.tip = "Envoyez un message radio aux autres personnages.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;
COMMAND.alias = {"R"};
COMMAND.important = true;
COMMAND.isChatCommand = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local subfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
	
	if subfaction == "Clan Grock" then
		Schema:EasyText(player, "peru", "Vous ne pouvez pas utiliser de radios car vous rejetez la technologie !");
		
		return;
	end
	
	Clockwork.player:SayRadio(player, table.concat(arguments, " "), true);
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("ProclaimRadio");
COMMAND.tip = "Envoyez un message radio aux autres personnages.";
COMMAND.text = "<string Text>";
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;
COMMAND.alias = {"RadioProclaim"};
COMMAND.important = true;
COMMAND.isChatCommand = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = player:GetNetVar("kinisgerOverride") or player:GetFaction();
	local subfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
	
	if subfaction == "Clan Grock" then
		Schema:EasyText(player, "peru", "Vous ne pouvez pas utiliser de radios car vous rejetez la technologie !");
		
		return;
	end
	
	if (Schema:GetRankTier(faction, player:GetCharacterData("rank", 1)) >= 3) or faction == "Holy Hierarchy" or player:IsAdmin() or Clockwork.player:HasFlags(player, "P") then
		Clockwork.player:SayRadio(player, table.concat(arguments, " "), true, nil, true);
	else
		Schema:EasyText(player, "peru", "Tu n'es pas assez important pour faire ça !");
	end
end;

COMMAND:Register();