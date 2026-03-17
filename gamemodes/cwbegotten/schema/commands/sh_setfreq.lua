--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local COMMAND = Clockwork.command:New();
COMMAND.tip = "Définis la fréquence de ta radio, ou celle d'une radio fixe.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local radio;
	
	if (IsValid(trace.Entity) and trace.Entity:GetClass() == "cw_radio") then
		if (trace.HitPos:Distance( player:GetShootPos() ) <= 192) then
			radio = trace.Entity;
		else
			Clockwork.player:Notify(player, "Cette radio fixe est trop éloignée !");
			
			return;
		end;
	end;
	
	local frequency = arguments[1];
	
	if ( string.find(frequency, "^%d%d%d%.%d$") ) then
		local start, finish, decimal = string.match(frequency, "(%d)%d(%d)%.(%d)");
		
		start = tonumber(start);
		finish = tonumber(finish);
		decimal = tonumber(decimal);
		
		if (start == 1 and finish > 0 and finish < 10 and decimal > 0 and decimal < 10) then
			if (radio) then
				trace.Entity:SetFrequency(frequency);
				
				Clockwork.player:Notify(player, "Vous avez réglé la fréquence de cette radio fixe sur"..frequency..".");
			else
				player:SetCharacterData("frequency", frequency);
				
				Clockwork.player:Notify(player, "Vous avez réglé votre fréquence radio sur"..frequency..".");
			end;
		else
			Clockwork.player:Notify(player, "La fréquence radio doit être comprise entre 101.1 et 199.9 !");
		end;
	else
		Clockwork.player:Notify(player, "La fréquence radio doit ressembler à xxx.x !");
	end;
end;

Clockwork.command:Register(COMMAND, "SetFreq");

local COMMAND = Clockwork.command:New();
COMMAND.tip = "Définir une radio comme indestructible pour qu'elle ne puisse être détruite ou voir sa fréquence modifiée par les non-administrateurs.";
COMMAND.access = "s"

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor();
	local radio;
	
	if (IsValid(trace.Entity) and trace.Entity:GetClass() == "cw_radio") then
		radio = trace.Entity;

		if not radio:IsStatic() then
			radio:SetStatic(true);
		else
			radio:SetStatic(false);
		end
		
		Clockwork.player:Notify(player, (radio:IsStatic() and "You have made this radio indestructible!") or "You have made this radio destructible!");
	end;
end;

Clockwork.command:Register(COMMAND, "SetRadioIndestructible");