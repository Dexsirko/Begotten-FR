--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

--setskin
--setattribute

local COMMAND = Clockwork.command:New("CfgListVars");
	COMMAND.tip = "Lister les variables de configuration de Clockwork.";
	COMMAND.text = "[string Find]";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local searchData = arguments[1] or "";
			netstream.Start(player, "CfgListVars", searchData);
		Clockwork.player:Notify(player, "Les variables de configuration ont été affichées dans la console.");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CfgSetVar");
	COMMAND.tip = "Définir une variable de configuration Clockwork.";
	COMMAND.text = "<string Key> [all Value] [string Map]";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local key = arguments[1];
		local value = arguments[2] or "";
		local configObject = config.Get(key);
		
		if (configObject:IsValid()) then
			local keyPrefix = "";
			local useMap = arguments[3];
			
			if (useMap == "") then
				useMap = nil;
			end;
			
			if (useMap) then
				useMap = string.lower(Clockwork.kernel:Replace(useMap, ".bsp", ""));
				keyPrefix = useMap.."'s ";
				
				if (!file.Exists("maps/"..useMap..".bsp", "GAME")) then
					Clockwork.player:Notify(player, useMap.." is not a valid map!");
					return;
				end;
			end;
			
			if (!configObject("isStatic")) then
				value = configObject:Set(value, useMap);
				
				if (value != nil) then
					local printValue = tostring(value);
					
					if (configObject("isPrivate")) then
						if (configObject("needsRestart")) then
							Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..string.rep("*", string.len(printValue)).."' for the next restart.");
						else
							Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..string.rep("*", string.len(printValue)).."'.");
						end;
					elseif (configObject("needsRestart")) then
						Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..printValue.."' for the next restart.");
					else
						Clockwork.player:NotifyAll(player:Name().." set "..keyPrefix..key.." to '"..printValue.."'.");
					end;
				else
					Clockwork.player:Notify(player, key.." was unable to be set!");
				end;
			else
				Clockwork.player:Notify(player, key.." is a static config key!");
			end;
		else
			Clockwork.player:Notify(player, key.." is not a valid config key!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("Announce");
	COMMAND.tip = "Avertir tous les joueurs sur le serveur.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local text = table.concat(arguments, " ");
		
		if (text) then
			if Schema.EasyText then
				for _, v in _player.Iterator() do
					if IsValid(v) and v:HasInitialized() then
						Schema:EasyText(v, "icon16/bell.png", "goldenrod", "[ANNOUNCEMENT] "..text);
						v:SendLua([[Clockwork.Client:EmitSound("ui/pickup_secret01.wav", 80, 80)]]);
					end
				end
			else
				Clockwork.player:Notify(PlayerCache or _player.GetAll(), text);
			end
		end;
	end;
COMMAND:Register();

--[[local COMMAND = Clockwork.command:New("ClearItems");
	COMMAND.tip = "Supprime tous les objets de la carte.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local items = 0;
		
		for k, v in pairs (ents.FindByClass("cw_item")) do
			if (hook.Run("CanClearItem", v)) then
				v:Remove();
				items = items + 1;
			end;
		end;
		
		if (items > 0) then
			Clockwork.player:Notify(player, "Vous avez retiré"..items.." items.");
		else
			Clockwork.player:Notify(player, "Aucun objet à retirer.");
		end;
	end;
COMMAND:Register();]]--

local COMMAND = Clockwork.command:New("ClearNPCs");
	COMMAND.tip = "Effacer toutes les décalcomanies.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local npcs = 0;
		
		for k, v in pairs (ents.GetAll()) do
			if (v:IsNPC() or v:IsNextBot()) then
				v:Remove();
				npcs = npcs + 1;
			end;
		end;
		
		if (npcs > 0) then
			Clockwork.player:Notify(player, "Vous avez retiré"..npcs.." NPCs.");
		else
			Clockwork.player:Notify(player, "Aucun PNJ à supprimer.");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyStopSound");
	COMMAND.tip = "Arrête tous les sons sur un joueur spécifique.";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"CharStopSound", "StopSoundTarget", "StopSoundPlayer"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);

		if (!target) then
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
			
			return;
		end;
	
		target:SendLua([[RunConsoleCommand("stopsound")]]);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("StopSoundGlobal");
	COMMAND.tip = "Arrête tous les sons pour tous les joueurs.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:SendLua([[RunConsoleCommand("stopsound")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("StopSoundRadius");
	COMMAND.tip = "Arrête tous les sons pour tous les joueurs dans un rayon spécifié. Le rayon par défaut est de 512.";
	COMMAND.optionalArguments = 1;
	COMMAND.access = "s";
	COMMAND.text = "[int Radius]";
	COMMAND.types = {"Radius"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local players = {};
		
		for k, v in pairs (ents.FindInSphere(player:GetEyeTrace().HitPos, arguments[1] or 512)) do
			if (v:IsPlayer()) then
				players[#players + 1] = v;
			end;
		end;
		
		for k, v in pairs(players) do
			v:SendLua([[RunConsoleCommand("stopsound")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ClearDecals");
	COMMAND.tip = "Effacer toutes les décalcomanies.";
	COMMAND.access = "a";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:SendLua([[RunConsoleCommand("r_cleardecals")]]);
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyReset");
	COMMAND.tip = "Réinitialiser un joueur.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "a";
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"Reset", "CharReset"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);

		if (!target) then
			target = player;
		end;
		
		local name = target:Name();
			if (target == player) then
				name = "yourself";
			end;
		local position = target:GetPos();
		local angles = target:GetAngles();
		local eyeAngles = target:EyeAngles();

		target:KillSilent();
		target:Spawn();
		target:SetPos(position);
		target:SetAngles(angles);
		target:SetEyeAngles(eyeAngles);
		
		Clockwork.player:Notify(player, "Vous avez réinitialisé"..name..".");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyExtinguish");
	COMMAND.tip = "Éteindre un joueur.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"CharExtinguish", "Extinguish"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local name = target:Name();
			local playerName = player:Name();
			
			if (target:IsOnFire()) then
				target:Extinguish();
				Clockwork.player:Notify(player, "Vous avez éteint"..name);
			else
				Clockwork.player:Notify(player, name.." is not on fire!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyIgnite");
	COMMAND.tip = "Enflamme un joueur.";
	COMMAND.text = "<string Name> <int Seconds>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharIgnite", "Ignite"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local name = target:Name();
			local playerName = player:Name();
			
			if (!target:IsOnFire()) then
				local time = tonumber(arguments[2]);
				
				for _, v in _player.Iterator() do
					if (v != player and v != target and v:IsAdmin() or v:IsUserGroup("operator")) then
						Clockwork.player:Notify(player, playerName.." has ignited "..name.." for "..time.." seconds.")
					end;
				end;
			
				Clockwork.player:Notify(player, "Vous avez allumé"..name.." for "..time.." seconds.")
					if (target:IsAdmin()) then
						Clockwork.player:Notify(target, "Vous avez été enflammé par"..playerName.."!");
					end;
				target:Ignite(time, 0);
			else
				Clockwork.player:Notify(player, name.." is already on fire!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyWarn");
	COMMAND.tip = "Ajouter un joueur à une liste blanche.";
	COMMAND.text = "<string Name> <string Warning>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharWarn", "Warn"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local playerName = player:Name();
			local name = target:Name();
			local message = table.concat(arguments, " ", 2);
			
			for _, v in _player.Iterator() do
				if (v != player and v != target and v:IsAdmin() or v:IsUserGroup("operator")) then
					Clockwork.player:Notify(v, playerName.." has warned "..name.." with the following message: \""..message.."\"")
				end;
			end;
			
			Clockwork.kernel:PrintLog(LOGTYPE_MAJOR, playerName.." has warned "..name.." with the following message: \""..message.."\"");
			Clockwork.player:Notify(target, "Vous avez été averti par"..playerName..": \""..message.."\"");
			Clockwork.player:Notify(player, "Vous avez averti"..name..": \""..message.."\"");
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ListColors");
	COMMAND.tip = "Affiche toutes les couleurs disponibles dans ta console. Le premier argument permet de rechercher dans la table.";
	COMMAND.text = "<string Search>";
	COMMAND.access = "a";
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local search = arguments[1];
		local colorTable = colors;
		local printTable = {};

		for k, v in pairs (colorTable) do
			if (search != nil and isstring(search)) then
				if (string.match(k, search)) then
					printTable[k] = v;
				else
					continue;
				end;
			else
				printTable[k] = v;
			end;
		end;
		
		if (printTable and !table.IsEmpty(printTable)) then
			netstream.Start(player, "PrintWithColor", "----- START COLOR LIST -----", Color(100, 255, 100));
				netstream.Heavy(player, "PrintTableWithColor", pon.encode(printTable));
			netstream.Start(player, "PrintWithColor", "----- END COLOR LIST -----", Color(100, 255, 100));
		elseif (isstring(search)) then
			Clockwork.player:Notify(player, "Aucune couleur trouvée avec l'argument de recherche "..search.."'!")
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PluginLoad");
	COMMAND.tip = "Tenter de charger un module.";
	COMMAND.text = "<string Name>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local plugin = plugin.FindByID(arguments[1]);
		
		if (!plugin) then
			Clockwork.player:Notify(player, "Ce plugin n'est pas valide !");
			return;
		end;
		
		local unloadTable = Clockwork.command:FindByID("PluginLoad");
		local loadTable = Clockwork.command:FindByID("PluginLoad");
		
		if (!plugin.IsDisabled(plugin.name)) then
			local bSuccess = plugin.SetUnloaded(plugin.name, false);
			local recipients = {};
			
			if (bSuccess) then
				Clockwork.player:NotifyAll(player:Name().." has loaded the "..plugin.name.." plugin for the next restart.");
				
				for _, v in _player.Iterator() do
					if (v:HasInitialized()) then
						if (Clockwork.player:HasFlags(v, loadTable.access)
						or Clockwork.player:HasFlags(v, unloadTable.access)) then
							recipients[#recipients + 1] = v;
						end;
					end;
				end;
				
				if (#recipients > 0) then
					netstream.Start(recipients, "SystemPluginSet", {plugin.name, false});
				end;
			else
				Clockwork.player:Notify(player, "Ce plugin n'a pas pu être chargé !");
			end;
		else
			Clockwork.player:Notify(player, "Ce plugin dépend d'un autre plugin !");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PluginUnload");
	COMMAND.tip = "Tenter de décharger un plugin.";
	COMMAND.text = "<string Name>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local plugin = plugin.FindByID(arguments[1]);
		
		if (!plugin) then
			Clockwork.player:Notify(player, "Ce plugin n'est pas valide !");
			return;
		end;
		
		local unloadTable = Clockwork.command:FindByID("PluginLoad");
		local loadTable = Clockwork.command:FindByID("PluginLoad");
		
		if (!plugin.IsDisabled(plugin.name)) then
			local bSuccess = plugin.SetUnloaded(plugin.name, true);
			local recipients = {};
			
			if (bSuccess) then
				Clockwork.player:NotifyAll(player:Name().." has unloaded the "..plugin.name.." plugin for the next restart.");
				
				for _, v in _player.Iterator() do
					if (v:HasInitialized()) then
						if (Clockwork.player:HasFlags(v, loadTable.access)
						or Clockwork.player:HasFlags(v, unloadTable.access)) then
							recipients[#recipients + 1] = v;
						end;
					end;
				end;
				
				if (#recipients > 0) then
					netstream.Start(recipients, "SystemPluginSet", {plugin.name, true});
				end;
			else
				Clockwork.player:Notify(player, "Ce plugin n'a pas pu être désactivé !");
			end;
		else
			Clockwork.player:Notify(player, "Ce plugin dépend d'un autre plugin !");
		end;
	end;
COMMAND:Register();

local function CreateShutdownWarningTimer(id, time, delay)
	timer.Create("ServerShutdownTimerWarning"..id, delay, 1, function()
		for _, v in _player.Iterator() do Clockwork.player:Notify(v, "Le serveur va s'éteindre dans"..time.."!") end
	
	end)

end

local function FancyTime(seconds)
	seconds = math.ceil(seconds)
	
	local minutes = math.floor(seconds / 60)
	local fancyTime = tostring(minutes).." minutes"
  
	local extraSeconds = (seconds - (minutes * 60))
  	if(extraSeconds > 0) then fancyTime = fancyTime.." and "..tostring(extraSeconds).." seconds" end

	return fancyTime

end

local COMMAND = Clockwork.command:New("ShutDown");
	COMMAND.tip = "Arrête le serveur en toute sécurité (c'est la seule manière d'appeler les fonctions de sauvegarde des données, utilise donc cette commande plutôt que le panneau de contrôle). Laisse l'argument optionnel vide si tu souhaites un arrêt immédiat.";
	COMMAND.text = "[seconds Delay]";
	COMMAND.access = "s";
	COMMAND.optionalArguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local delay = arguments[1];
	
		if delay and tonumber(delay) and tonumber(delay) > 0 then
			delay = tonumber(delay)

			local message = "The server will be shutting down in "..FancyTime(delay).."!";
		
			for _, v in _player.Iterator() do
				Clockwork.player:Notify(v, message);
			end

			if(delay > 30) then CreateShutdownWarningTimer("30Seconds", "30 seconds", delay - 30) end
			if(delay > 120) then CreateShutdownWarningTimer("2Minutes", "2 minutes", delay - 120) end
			if(delay > 300) then CreateShutdownWarningTimer("5Minutes", "5 minutes", delay - 300) end
			if(delay > 600) then CreateShutdownWarningTimer("10Minutes", "10 minutes", delay - 600) end
			if(delay > 1800) then CreateShutdownWarningTimer("30Minutes", "30 minutes", delay - 1800) end
			
			timer.Create("ServerShutdownTimer", delay, 1, function()
				RunConsoleCommand("disconnect");
			end);
		else
			RunConsoleCommand("disconnect");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ShutDownAbort");
	COMMAND.tip = "Annule le minuteur d'un arrêt du serveur.";
	COMMAND.access = "s";
	COMMAND.alias = {"CancelShutDown", "ShutDownCancel", "AbortShutDown"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if timer.Exists("ServerShutdownTimer") then
			timer.Remove("ServerShutdownTimer");
			timer.Remove("ServerShutdownTimerWarning30Seconds")
			timer.Remove("ServerShutdownTimerWarning2Minutes")
			timer.Remove("ServerShutdownTimerWarning5Minutes")
			timer.Remove("ServerShutdownTimerWarning10Minutes")
			timer.Remove("ServerShutdownTimerWarning30Minutes")
			
			for _, v in _player.Iterator() do
				Clockwork.player:Notify(v, "L'arrêt du serveur a été annulé !");
			end
		else
			Clockwork.player:Notify(player, "Aucun arrêt de serveur n'est actuellement en cours !");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("SaveData");
	COMMAND.tip = "Sauvegarde manuelle de l'état du serveur.";
	COMMAND.access = "s";
	
	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		Clockwork.kernel:ProcessSaveData(false, true);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ToggleCharSwapping");
	COMMAND.tip = "Activer ou désactiver le changement de personnage. S'applique uniquement aux personnages vivants et aux non-administrateurs.";
	COMMAND.access = "s";
	COMMAND.alias = {"CharSwappingToggle", "DisableCharSwapping", "EnableCharSwapping"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if Clockwork.charSwappingDisabled then
			Clockwork.charSwappingDisabled = false;
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has enabled charswapping for non-admins.");
			
			if Schema.fuckerJoeActive then
				Schema.fuckerJoeActive = false;
			end
		else
			Clockwork.charSwappingDisabled = true;
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has disabled charswapping for non-admins.");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ToggleFactionRatio");
	COMMAND.tip = "Activer ou désactiver le système de ratio de factions.";
	COMMAND.access = "s";
	COMMAND.alias = {"ToggleRatio", "FactionRatio", "RatioToggle"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if Clockwork.config:Get("faction_ratio_enabled"):Get() then
			Clockwork.config:Get("faction_ratio_enabled"):Set(false);
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has disabled the faction ratio system.");
		else
			Clockwork.config:Get("faction_ratio_enabled"):Set(true);
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has enabled the faction ratio system.");
		end
	end;
COMMAND:Register();