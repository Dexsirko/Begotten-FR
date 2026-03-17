--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local COMMAND = Clockwork.command:New("CinematicTextTarget");
	COMMAND.tip = "Affiche un message cinématique dans le chat à une cible. CECI N'EST PAS LA MÊME CHOSE QUE LE TEXTE CENTRÉ ! Votre message apparaîtra plus petit et plus bas sur l'écran. Il sera également visible pour vous.";
	COMMAND.text = "<string Target> <string Text>";
	COMMAND.access = "a";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local text = table.concat(arguments, " ", 2);
		
		if (string.len(string) > 3 and string.find(string.sub(text, 0, 1), '"') or string.find(string.sub(text, 0, -1), '"')) then
			Schema:EasyText(player, "firebrick", "Tu ne peux pas inclure de guillemets au début et à la fin de ton texte !");
			
			return;
		end;
		
		if (target) then
			if (text != "") then
				if (SERVER) then
					netstream.Start(target, "cwPrintCinematicText", {text, 10});
					netstream.Start(player, "cwPrintCinematicText", {text, 10});
				end;
			else
				Schema:EasyText(player, "darkgrey", "["..self.name.."] You must specify text!");
			end;
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();