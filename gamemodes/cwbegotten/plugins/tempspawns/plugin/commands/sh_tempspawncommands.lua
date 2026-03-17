local COMMAND = Clockwork.command:New("TempSpawnPointAdd");
COMMAND.tip = "Ajoute un point de réapparition temporaire à votre position ciblée."
COMMAND.text = "<string Class|Faction|Default> [number Rotate]"
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"
COMMAND.arguments = 1
COMMAND.optionalArguments = 1
 
-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = Clockwork.faction:FindByID(arguments[1])
	local class = Clockwork.class:FindByID(arguments[1])
	local name = nil
	local rotate = tonumber(arguments[2]) or nil

	if (class or faction) then
		if (faction) then
			name = faction.name
		else
			name = class.name
		end

		if not cwTempSpawns.spawnPoints then
			cwTempSpawns.spawnPoints = {};
		end
		
		cwTempSpawns.spawnPoints[name] = cwTempSpawns.spawnPoints[name] or {}
		cwTempSpawns.spawnPoints[name][#cwTempSpawns.spawnPoints[name] + 1] = {position = player:GetEyeTraceNoCursor().HitPos, rotate = rotate}

		Schema:EasyText(player, "cornflowerblue", "Vous avez ajouté un point de réapparition temporaire pour"..name..".")
	elseif (string.lower(arguments[1]) == "default") then
		cwTempSpawns.spawnPoints["default"] = cwTempSpawns.spawnPoints["default"] or {}
		cwTempSpawns.spawnPoints["default"][#cwTempSpawns.spawnPoints["default"] + 1] = {position = player:GetEyeTraceNoCursor().HitPos, rotate = rotate}
		
		Schema:EasyText(player, "cornflowerblue", "Vous avez ajouté un point de réapparition temporaire sans faction.")
	else
		Schema:EasyText(player, "grey", "Ce n'est pas une classe ou faction valide !")
	end
end;
 
COMMAND:Register();

local COMMAND = Clockwork.command:New("TempSpawnPointRemove")
COMMAND.tip = "Supprime les points de réapparition temporaires à votre position cible."
COMMAND.text = "<string Class|Faction|Default>"
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = Clockwork.faction:FindByID(arguments[1])
	local class = Clockwork.class:FindByID(arguments[1])
	local name = nil

	if (class or faction) then
		if (faction) then
			name = faction.name
		else
			name = class.name
		end
		
		if not cwTempSpawns.spawnPoints then
			cwTempSpawns.spawnPoints = {};
		end

		if (cwTempSpawns.spawnPoints[name]) then
			local position = player:GetEyeTraceNoCursor().HitPos
			local removed = 0

			for k, v in pairs(cwTempSpawns.spawnPoints[name]) do
				if (v.position:Distance(position) <= 256) then
					cwTempSpawns.spawnPoints[name][k] = nil

					removed = removed + 1
				end
			end

			if (removed > 0) then
				if (removed == 1) then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed "..removed.." "..name.." temporary spawn point.")
				else
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed "..removed.." "..name.." temporary spawn points.")
				end
			else
				Schema:EasyText(player, "cornflowerblue", "Il n'y avait aucun"..name.." temporary spawn points near this position.")
			end
		else
			Schema:EasyText(player, "darkgrey", "Il n'y a pas de"..name.." temporary spawn points.")
		end
	elseif (string.lower(arguments[1]) == "default") then
		if (cwTempSpawns.spawnPoints["default"]) then
			local position = player:GetEyeTraceNoCursor().HitPos
			local removed = 0

			for k, v in pairs(cwTempSpawns.spawnPoints["default"]) do
				if (v.position:Distance(position) <= 256) then
					cwTempSpawns.spawnPoints["default"][k] = nil

					removed = removed + 1
				end
			end

			if (removed > 0) then
				if (removed == 1) then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed "..removed.." factionless temporary spawn point.")
				else
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed "..removed.." factionless temporary spawn points.")
				end
			else
				Schema:EasyText(player, "cornflowerblue", "Il n'y avait aucun point de réapparition temporaire sans faction près de cette position.")
			end
		else
			Schema:EasyText(player, "darkgrey", "Il n'y a pas de points de réapparition temporaires sans faction.")
		end
	else
		Schema:EasyText(player, "grey", "Ceci n'est pas une classe ou faction valide !")
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("ClearTempSpawnPoints")
COMMAND.tip = "Supprime tous les points d'apparition temporaires sur la carte."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"
COMMAND.alias = {"TempSpawnPointRemoveAll"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	cwTempSpawns.spawnPoints = {};
end

COMMAND:Register()