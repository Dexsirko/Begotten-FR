--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local COMMAND = Clockwork.command:New();
COMMAND.tip = "Brouillez une fréquence radio si vous possédez une radio ECW.";
COMMAND.text = "[bool TurnOn]"
COMMAND.flags = bit.bor(CMD_DEFAULT, CMD_DEATHCODE, CMD_FALLENOVER);
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if !player:HasItemByID("ecw_radio") then
		Clockwork.player:Notify(player, "Vous devez posséder une radio ECW pour utiliser cette commande !");
		
		return false;
	end

	if arguments[1] then
		local gender = player:GetGender();
		local activate = (arguments[1] == "true")
		local term = "off"
		local active = player:GetCharacterData("radioJamming", false)
		
		if active == activate then
			if active then
				term = "on"
			end
			Clockwork.player:Notify(player, "Cet appareil est déjà"..term.."!");
			return false
		end
		
		if arguments[1] == "true" then
			player:SetCharacterData("radioJamming", true);
			player:EmitSound("buttons/lightswitch2.wav", 70, 90, 0.4);
			
			Clockwork.chatBox:AddInTargetRadius(player, "me", string.gsub("turns on a strange device.", "^.", string.lower), player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
			
			netstream.Start(player, "radioJamming", true);
		else
			player:SetCharacterData("radioJamming", false);
			player:EmitSound("buttons/lightswitch2.wav", 70, 90, 0.4);
			
			Clockwork.chatBox:AddInTargetRadius(player, "me", string.gsub("turns off a strange device.", "^.", string.lower), player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
			
			netstream.Start(player, "radioJamming", false);
		end
	else
		Clockwork.player:Notify(player, "Vous devez spécifier vrai ou faux !");
	end
end;

Clockwork.command:Register(COMMAND, "SetECWJamming");