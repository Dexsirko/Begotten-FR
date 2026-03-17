--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

PLUGIN:SetGlobalAlias("cwRituals");

Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_bindmenu.lua");

-- Certain recipes won't load until after the items have been initialized, so they need to be required manually to ensure the correct order.
Clockwork.kernel:IncludePrefixed("sh_ritual_items.lua");
Clockwork.kernel:IncludePrefixed("sh_rituals.lua");

local COMMAND = Clockwork.command:New("CharMark");
	COMMAND.tip = "Marquer manuellement un personnage pour la mort, de la même manière que le rituel sataniste. PAS LA MÊME CHOSE QUE LE TRAIT "MARQUÉ".";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"Mark", "PlyMark"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			if target:GetCharacterData("markedBySatanist") == true then
				Schema:EasyText(player, "darkgrey", target:Name().." is already marked for death!");
			else
				target:SetCharacterData("markedBySatanist", true);
				target:SetNetVar("markedBySatanist", true);
				
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", target:Name().." has been manually marked for death by "..player:Name());
			end
		else
			Schema:EasyText(player, "grey", arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharUnMark");
	COMMAND.tip = "Désigner un personnage s'il a été marqué par les Satanistes. NE RETIRE PAS LE TRAIT "MARKED", UTILISEZ '/CharTakeTrait marked' POUR CELA !";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"UnMark", "PlyUnMark"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			if target:GetCharacterData("markedBySatanist") == true then
				target:SetCharacterData("markedBySatanist", false);
				target:SetNetVar("markedBySatanist", false);
				
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", target:Name().." has been manually unmarked for death by "..player:Name());
			else
				Schema:EasyText(player, "darkgrey", target:Name().." is not marked for death!");
			end
		else
			Schema:EasyText(player, "grey", arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharMakeRitual");
	COMMAND.tip = "Forcer un personnage à effectuer un rituel, utile pour le débogage.";
	COMMAND.text = "<string Name> <string RitualID> [bool ignoreItems] [bool ignoreBeliefs]";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 2;
	COMMAND.alias = {"ForceRitual", "PlyForceRitual", "CharForceRitual", "MakeRitual", "PlyMakeRitual", "CharMakePerformRitual", "MakePerformRitual", "PlyMakePerformRitual"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local ritualID = arguments[2];
			local ritualTable = cwRituals.rituals.stored[ritualID];
			
			if ritualTable then
				if !cwRituals:PerformRitual(target, ritualID, nil, tobool(arguments[3] or false), tobool(arguments[4] or false)) then
					Schema:EasyText(player, "grey", target:Name().." could not perform "..ritualTable.name.."!");
				end
			else
				Schema:EasyText(player, "grey", ritualID.." is not a valid ritual!");
			end
		else
			Schema:EasyText(player, "grey", arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTransferFactionOverride");
	COMMAND.tip = "Transférer un Kinisger vers une fausse faction. Cela effacera leur fausse sous-faction, assurez-vous donc d'en définir une nouvelle !";
	COMMAND.text = "<string Name> <string Faction>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"TransferFactionOverride", "PlyTransferFactionOverride", "SetFactionOverride", "CharSetFactionOverride", "PlySetFactionOverride"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local faction = arguments[2];
			local name = target:Name();
			
			if (!Clockwork.faction:GetStored()[faction]) then
				Clockwork.player:Notify(player, faction.." is not a valid faction!");
				return;
			end;
			
			local targetFaction = target:GetCharacterData("kinisgerOverride");
			
			if (targetFaction == faction) then
				Clockwork.player:Notify(player, target:Name().." is already masquerading as the "..faction.." faction!");
				return;
			end;
			
			if (!Clockwork.faction:IsGenderValid(faction, target:GetGender())) then
				Clockwork.player:Notify(player, target:Name().." is not the correct gender for the "..faction.." faction!");
				return;
			end;
			
			if (!Clockwork.faction:GetStored()[faction].OnTransferred) then
				Clockwork.player:Notify(player, target:Name().." cannot be transferred to the "..faction.." faction!");
				return;
			end;
			
			local bSuccess, fault = Clockwork.faction:GetStored()[faction]:OnTransferred(target, Clockwork.faction:GetStored()[target:GetFaction()]);
			
			if (bSuccess != false) then
				target:SetCharacterData("kinisgerOverride", faction);
				target:SetCharacterData("kinisgerOverrideSubfaction", "");
				target:SetCharacterData("rank", nil);
				
				local targetAngles = target:EyeAngles();
				local targetPos = target:GetPos();
				
				Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
				
				target:SetPos(targetPos);
				target:SetEyeAngles(targetAngles);
					
				Clockwork.player:NotifyAll(player:Name().." has changed "..name.."'s disguise to the "..faction.." faction.");
			else
				Clockwork.player:Notify(player, fault or target:Name().." could not have their disguise changed to the "..faction.." faction!");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTransferSubfactionOverride");
	COMMAND.tip = "Transférer un personnage Kinisger vers une sous-faction factice.";
	COMMAND.text = "<string Name> <string Subfaction>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"TransferSubfactionOverride", "PlyTransferSubfactionOverride", "SetSubfactionOverride", "CharSetSubfactionOverride", "PlySetSubfactionOverride"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local subfaction = arguments[2];
			local faction = target:GetCharacterData("kinisgerOverride");
			
			if !faction or faction == "" then
				Clockwork.player:Notify(player, target:Name().." does not have a valid false faction!");
				return;
			end
			
			local factionSubfactions = Clockwork.faction:GetStored()[faction].subfactions;
			local name = target:Name();
			
			if (factionSubfactions) then
				for i, v in ipairs(factionSubfactions) do
					if v.name == subfaction then
						subfaction = v;
						
						break;
					end
				end
				
				if istable(subfaction) then
					target:SetCharacterData("kinisgerOverrideSubfaction", subfaction.name);
					
					local targetAngles = target:EyeAngles();
					local targetPos = target:GetPos();
					
					Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
					
					target:SetPos(targetPos);
					target:SetEyeAngles(targetAngles);
					
					Clockwork.player:NotifyAll(player:Name().." has transferred "..name.."'s disguise to the "..subfaction.name.." subfaction.");
				else
					Clockwork.player:Notify(player, subfaction.." is not a valid subfaction for this faction!");
				end
			else
				Clockwork.player:Notify(player, target:Name().."'s false faction does not have any subfactions!");
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();