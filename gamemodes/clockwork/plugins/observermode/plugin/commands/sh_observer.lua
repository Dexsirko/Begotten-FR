--[[
	BEGOTTEN III: Developed by DETrooper, cash wednesday, gabs & alyousha35
--]]

local COMMAND = Clockwork.command:New("Observer")
COMMAND.tip = "Entrer ou sortir du mode observateur."
COMMAND.access = "o"
COMMAND.logless = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (!player.cwObserverReset) then
		if (player:GetMoveType(player) == MOVETYPE_NOCLIP) then
			cwObserverMode:MakePlayerExitObserverMode(player)
		else
			cwObserverMode:MakePlayerEnterObserverMode(player)
		end
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("ClientsideObserver")
COMMAND.tip = "Entrer ou sortir du mode observateur côté client."
COMMAND.access = "s"
COMMAND.logless = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (!player.cwObserverReset) then
		netstream.Start(player, "ToggleClientsideObserver");
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("MakeSpectate");
	COMMAND.tip = "Fait entrer ou sortir un joueur du mode spectateur.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"PlyMakeSpectate", "MakeObserver", "MakeNoclip"};
	COMMAND.types = {"Player"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			if target.opponent then
				Schema:EasyText(player, "darkgrey", "["..self.name.."] "..target:Name().." is in a duel currently and cannot be put into spectator mode!");
				return false;
			end
			
			if (target:Alive() and !target:IsRagdolled() and !target.cwObserverReset) then
				if (target:GetMoveType(target) == MOVETYPE_NOCLIP) then
					cwObserverMode:MakePlayerExitObserverMode(target);
					Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has made "..target:Name().." exit spectator mode.", nil);
				else
					cwObserverMode:MakePlayerEnterObserverMode(target);
					Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has made "..target:Name().." enter spectator mode.", nil);
				end
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("MakeSpectateAll")
	COMMAND.tip = "Forcer tous les non-administrateurs à passer en mode spectateur.";
	COMMAND.access = "s";
	COMMAND.alias = {"SpectateAll", "ObserverAll", "NoclipAll"};
	
	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			if not v:IsAdmin() then
				if v.opponent then
					return false;
				end
				
				cwObserverMode:MakePlayerEnterObserverMode(v)
				Schema:EasyText(v, "cornflowerblue", "Vous êtes entré en mode spectateur !");
				v:StripWeapons();
			end
		end
		
		Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has made all non-admins exit spectator mode.", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("MakeUnSpectateAll");
	COMMAND.tip = "Forcer tous les non-administrateurs à quitter le mode spectateur, argument optionnel pour annuler le mode PK.";
	COMMAND.text = "[bool Unpermakill]";
	COMMAND.access = "s";
	COMMAND.optionalarguments = 1;
	COMMAND.alias = {"UnSpectateAll", "UnObserverAll", "UnNoclipAll"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			if not v:IsAdmin() and v.cwObserverMode then
				cwObserverMode:MakePlayerExitObserverMode(v);
				Schema:EasyText(v, "cornflowerblue", "Vous avez quitté le mode spectateur !");
			end
			
			if arguments and arguments[1] then
				if (v:GetCharacterData("permakilled")) then
					Schema:UnPermaKillPlayer(v, v:GetRagdollEntity());
				end;
			end
		end
		
		Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has made all non-admins exit spectator mode.", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyTeleportSpectators");
	COMMAND.tip = "Téléporte tous les joueurs en spectateur vers votre position cible.";
	COMMAND.access = "s";
	COMMAND.alias = {"PlyBringSpectators", "CharTeleportSpectators", "CharBringSpectators"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local hitPos = player:GetEyeTraceNoCursor().HitPos;
		
		for _, v in _player.Iterator() do
			if not v:IsAdmin() and v.cwObserverMode then
				Clockwork.player:SetSafePosition(v, hitPos);
			end
		end
		
		Clockwork.player:NotifyAll(player:Name().." has teleported all spectators to their target location.");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("Spectate")
COMMAND.tip = "Entrez ou sortez du mode spectateur si celui-ci est activé et que vous êtes mort."
COMMAND.logless = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if cwObserverMode.spectatorMode then
		if (!player.cwObserverReset) then
			if player.opponent then
				Schema:EasyText(player, "darkgrey", "Vous ne pouvez pas entrer en mode spectateur pendant un duel !");
				return false;
			end
			
			if !player:Alive() then
				if (player:GetMoveType(player) == MOVETYPE_NOCLIP) then
					cwObserverMode:MakePlayerExitObserverMode(player)
					Schema:EasyText(player, "cornflowerblue", "Vous avez quitté le mode spectateur !");
				else
					cwObserverMode:MakePlayerEnterObserverMode(player)
					Schema:EasyText(player, "cornflowerblue", "Vous êtes entré en mode spectateur !");
					player:StripWeapons();
				end
			else
				Schema:EasyText(player, "darkgrey", "Vous devez être mort pour activer manuellement le mode spectateur !");
			end
		end
	else
		Schema:EasyText(player, "grey", "Le mode spectateur n'est pas actuellement activé !");
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("SpectatorModeOn");
	COMMAND.tip = "Active le mode spectateur.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		cwObserverMode.spectatorMode = true;
		
		for _, v in _player.Iterator() do
			if v:HasInitialized() and !v:Alive() then
				Schema:EasyText(v, "darkgrey", "["..self.name.."] Spectator mode has been enabled! Type /spectate to toggle spectating.");
			end
		end

		Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has turned spectator mode on!", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("SpectatorModeOff");
	COMMAND.tip = "Désactiver le mode spectateur.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		cwObserverMode.spectatorMode = false;

		Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." has turned off spectator mode!", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("SpectatorModeStatus");
	COMMAND.tip = "Affiche si le mode spectateur est activé et, le cas échéant, qui s'y trouve.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if cwObserverMode.spectatorMode then
			local namesInObserver = {};
			
			for _, v in _player.Iterator() do
				if !v:IsAdmin() and v:GetMoveType() == MOVETYPE_NOCLIP then
					table.insert(namesInObserver, v:Name());
				end
			end
			
			local notifyString = "Spectator mode is on! There are "..tostring(#namesInObserver).." players in observer:"
			
			for i = 1, #namesInObserver do
				if i == #namesInObserver and i > 1 then
					notifyString = notifyString.." and "..namesInObserver[i]..".";
				else
					notifyString = notifyString.." "..namesInObserver[i]..",";
				end
			end
			
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] "..notifyString);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] Spectator mode is off!");
		end
	end;
COMMAND:Register();