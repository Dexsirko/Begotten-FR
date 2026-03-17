--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local COMMAND = Clockwork.command:New("CinematicTextRadius");
	COMMAND.tip = "Affiche les cibles dans un rayon avec un texte central. CE N'EST PAS LA MÊME CHOSE QUE LE TEXTE CENTRAL ! Votre message apparaîtra plus petit et plus bas sur l'écran.";
	COMMAND.text = "[int Radius] <string Text>";
	COMMAND.access = "a";
	COMMAND.arguments = 2;
	COMMAND.types = {"Radius"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local radius = tonumber(arguments[1]);
		local text = table.concat(arguments, " ", 2);

		if (text != "") then
			for k, v in pairs (ents.FindInSphere(player:GetEyeTrace().HitPos, radius)) do
				if (SERVER) then
					netstream.Start(v, "cwPrintCinematicText", {text, 10});
				end;
			end;
		else
			Schema:EasyText(player, "darkgrey", "["..self.name.."] You must specify text!");
		end;
	end;
COMMAND:Register();