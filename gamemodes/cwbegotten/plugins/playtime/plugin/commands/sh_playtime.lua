local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("PlayTime");
COMMAND.tip = "Voir votre temps de jeu.";
COMMAND.text = "<none>";

function COMMAND:OnRun(player, arguments)
	--local playTime = ConvertSecondsToMultiples(player:PlayTime())
	local charPlayTime = ConvertSecondsToMultiples(player:CharPlayTime())
	
	--[[local days = playTime.days
	local minutes = playTime.minutes
	local hours = playTime.hours
	local seconds = playTime.seconds]]--
	
	local chardays = charPlayTime.days
	local charminutes = charPlayTime.minutes
	local charhours = charPlayTime.hours
	local charseconds = charPlayTime.seconds
	
	--Schema:EasyText(player, "lightslateblue", "Vous avez joué sur le serveur pendant :"..days.." Days - "..hours.." Hours - "..minutes.." Minutes - "..seconds.." Seconds.")
	Schema:EasyText(player, "lightslateblue", "Vous avez joué sur ce personnage pendant :"..chardays.." Days - "..charhours.." Hours - "..charminutes.." Minutes - "..charseconds.." Seconds.")
end;

COMMAND:Register();