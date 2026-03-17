--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local COMMAND = Clockwork.command:New("CinematicText");
	COMMAND.tip = "Affiche un message cinématique à tous dans le chat. CECI N'EST PAS LA MÊME CHOSE QUE LE TEXTE CENTRÉ ! Votre message apparaîtra plus petit et plus bas sur l'écran.";
	COMMAND.text = "<string Text>";
	COMMAND.access = "a";
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local text = table.concat(arguments, " ");
		
		if (text != "") then
			if (SERVER) then
				netstream.Start(nil, "cwPrintCinematicText", {text, 10});
			end;
		else
			Schema:EasyText(player, "darkgrey", "["..self.name.."] You must specify text!")
		end;
	end;
COMMAND:Register();