local COMMAND = Clockwork.command:New("CharForceFallover")
	COMMAND.tip = "Forcer un personnage à tomber."
	COMMAND.text = "<string Name> [number Seconds]"
	COMMAND.access = "a"
	COMMAND.arguments = 1
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"ForceFallover", "PlyForceFallover"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		if (target) then
			Clockwork.player:SetRagdollState(target, RAGDOLL_FALLENOVER, tonumber(arguments[2]) --[[or 5]]);
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end
	end
COMMAND:Register()

local COMMAND = Clockwork.command:New("CharForceGetUp")
	COMMAND.tip = "Forcer un personnage à se relever."
	COMMAND.text = "<string Name>"
	COMMAND.access = "a"
	COMMAND.arguments = 1
	COMMAND.alias = {"ForceGetUp", "PlyForceGetUp"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			Clockwork.player:SetRagdollState(target, RAGDOLL_NONE);
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end
	end
COMMAND:Register()

local COMMAND = Clockwork.command:New("CharSetHealth");
	COMMAND.tip = "Définir la santé d'un personnage, avec un argument optionnel pour en faire sa nouvelle santé maximale.";
	COMMAND.text = "<string Name> <int Amount> [bool SetMax]";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"SetHealth", "PlySetHealth"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local amount = tonumber(arguments[2]) or 100;
		
		if (target) then
			target:SetHealth(amount);
			
			if arguments[3] and tobool(arguments[3]) == true then
				target.maxHealthSet = true;
				target:SetMaxHealth(amount);
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetMaxHealth");
	COMMAND.tip = "Définir la santé maximale d'un personnage.";
	COMMAND.text = "<string Name> <int Amount>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"SetMaxHealth", "PlySetMaxHealth"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local amount = tonumber(arguments[2]) or 100;
		
		if (target) then
			target:SetMaxHealth(amount);
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("SetHealthMaxAll");
	COMMAND.tip = "Définir tous les personnages de la carte avec la santé maximale.";
	COMMAND.text = "[bool AffectDuelists]";
	COMMAND.access = "a";
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"CharSetHealthMaxAll", "PlySetHealthMaxAll"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local affect_duelists = false;
		
		if arguments and arguments[1] and tobool(arguments[1]) == true then
			affect_duelists = true;
		end
		
		for _, v in _player.Iterator() do
			if v:HasInitialized() and v:Alive() then
				if !v.opponent or (v.opponent and affect_duelists) then
					v:SetHealth(v:GetMaxHealth() or 100);
				end
			end
		end
		
		Clockwork.player:NotifyAdmins("operator", player:Name().." has set everyone's health to max.", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetArmor");
	COMMAND.tip = "Définir l'armure d'un personnage.";
	COMMAND.text = "<string Name> <int Amount>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"PlySetArmor"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local amount = arguments[2] or 100;
		
		if (target) then
			target:SetArmor(amount);
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGetTraits");
	COMMAND.tip = "Affiche la liste des traits d'un personnage.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"GetTraits", "PlyGetTraits"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local traits = target:GetCharacterData("Traits");
			
			if traits then
				Clockwork.player:Notify(player, target:Name().." has the following traits: "..table.concat(traits, " "));
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGiveTrait");
	COMMAND.tip = "Attribuer un trait à un personnage.";
	COMMAND.text = "<string Name> <string TraitID>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"GiveTrait", "PlyGiveTrait"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local traitID = string.lower(arguments[2]);
		
		if (target and target:HasInitialized()) then
			if Clockwork.trait:FindByID(traitID) then
				target:GiveTrait(traitID);
				Clockwork.player:NotifyAdmins("operator", target:Name().." has been given the '"..traitID.."' trait by "..player:Name().."!", nil);
			else
				Clockwork.player:Notify(player, traitID.." is not a valid trait!");
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeTrait");
	COMMAND.tip = "Retirer un trait d'un personnage.";
	COMMAND.text = "<string Name> <string TraitID>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"TakeTrait", "PlyTakeTrait", "CharRemoveTrait", "RemoveTrait", "PlyRemoveTrait"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local traitID = string.lower(arguments[2]);
		
		if (target and target:HasInitialized()) then
			if Clockwork.trait:FindByID(traitID) then
				target:RemoveTrait(traitID);
				Clockwork.player:NotifyAdmins("operator", player:Name().." has taken the '"..traitID.."' trait from "..target:Name().."!", nil);
			else
				Clockwork.player:Notify(player, traitID.." is not a valid trait!");
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyGod");
	COMMAND.tip = "Activer/désactiver le mode invincible pour un joueur.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"CharGod", "God"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);

		if (target) then
			if (target:HasGodMode()) then
				target:GodDisable();
				Clockwork.player:NotifyAdmins("operator", target:Name().." has been ungodded by "..player:Name().."!", nil);
			else
				target:GodEnable();
				Clockwork.player:NotifyAdmins("operator", target:Name().." has been godded by "..player:Name().."!", nil);
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyGodAll");
	COMMAND.tip = "Activer le mode dieu pour tous les joueurs.";
	COMMAND.access = "s";
	COMMAND.alias = {"CharGodAll", "GodAll"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:GodEnable();
		end;
		
		Clockwork.player:NotifyAdmins("operator", player:Name().." has enabled god mode for all players.", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyUnGodAll");
	COMMAND.tip = "Désactiver le mode invincible pour tous les joueurs.";
	COMMAND.access = "s";
	COMMAND.alias = {"CharUnGodAll", "UnGodAll"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		for _, v in _player.Iterator() do
			v:GodDisable();
		end;
		
		Clockwork.player:NotifyAdmins("operator", player:Name().." has disabled god mode for all players.", nil);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTransferFaction");
	COMMAND.tip = "Transfère un personnage vers une faction. Cela réinitialisera sa sous-faction, pense donc à en définir une nouvelle !";
	COMMAND.text = "<string Name> <string Faction> [string Subfaction] [string Data]";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 2;
	COMMAND.alias = {"TransferFaction", "PlyTransferFaction", "SetFaction", "CharSetFaction", "PlySetFaction"};

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
			
			--if (!Clockwork.faction:GetStored()[faction].whitelist or Clockwork.player:IsWhitelisted(target, faction)) then
				local targetFaction = target:GetFaction();
				
				if (targetFaction == faction) then
					Clockwork.player:Notify(player, target:Name().." is already the "..faction.." faction!");
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
				
				local bSuccess, fault = Clockwork.faction:GetStored()[faction]:OnTransferred(target, Clockwork.faction:GetStored()[targetFaction], arguments[4]);
				
				if (bSuccess != false) then
					target:SetCharacterData("Faction", faction, true);
					target:SetCharacterData("rank", nil);
					target:SetCharacterData("rankOverride", nil);
					
					local factionSubfactions = Clockwork.faction:GetStored()[faction].subfactions;
					local subfaction;
					
					if (factionSubfactions) then
						for i, v in ipairs(factionSubfactions) do
							if arguments[3] then
								if v.name == arguments[3] then
									subfaction = v;
									
									break;
								end
							else
								subfaction = v;
								
								break;
							end
						end
						
						if subfaction and istable(subfaction) then
							target:SetCharacterData("Subfaction", subfaction.name, true);
							
							if cwBeliefs then
								-- Remove any subfaction locked beliefs.
								local beliefsTab = cwBeliefs:GetBeliefs();
								local targetBeliefs = target:GetCharacterData("beliefs");
								local targetEpiphanies = target:GetCharacterData("points", 0);
								
								for k, v in pairs(beliefsTab) do
									if v.lockedSubfactions and table.HasValue(v.lockedSubfactions, subfaction.name) then
										if targetBeliefs[k] then
											targetBeliefs[k] = false;
											
											targetEpiphanies = targetEpiphanies + 1;
											
											local beliefTree = cwBeliefs:FindBeliefTreeByBelief(k);
											
											if beliefTree.hasFinisher and targetBeliefs[beliefTree.uniqueID.."_finisher"] then
												targetBeliefs[beliefTree.uniqueID.."_finisher"] = false;
											end
										end
									end
								end
								
								target:SetCharacterData("beliefs", targetBeliefs);
								target:SetLocalVar("points", targetEpiphanies);
								target:SetCharacterData("points", targetEpiphanies);
								
								--local max_poise = target:GetMaxPoise();
								--local poise = target:GetNWInt("meleeStamina");
								local max_stamina = target:GetMaxStamina();
								local max_stability = target:GetMaxStability();
								local stamina = target:GetNWInt("Stamina", 100);
								
								target:SetMaxHealth(target:GetMaxHealth());
								target:SetLocalVar("maxStability", max_stability);
								--target:SetLocalVar("maxMeleeStamina", max_poise);
								--target:SetNWInt("meleeStamina", math.min(poise, max_poise));
								target:SetLocalVar("Max_Stamina", max_stamina);
								target:SetCharacterData("Max_Stamina", max_stamina);
								target:SetNWInt("Stamina", math.min(stamina, max_stamina));
								target:SetCharacterData("Stamina", math.min(stamina, max_stamina));
								
								hook.Run("RunModifyPlayerSpeed", target, target.cwInfoTable, true)
								
								target:NetworkBeliefs();
							end
						else
							target:SetCharacterData("Subfaction", "", true);
						end
					else
						target:SetCharacterData("Subfaction", "", true);
					end
					
					local targetAngles = target:EyeAngles();
					local targetPos = target:GetPos();
					
					Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
					
					target:SetPos(targetPos);
					target:SetEyeAngles(targetAngles);
					
					if subfaction then
						Clockwork.player:NotifyAll(player:Name().." has transferred "..name.." to the "..faction.." faction and "..subfaction.name.." subfaction.");
					else
						Clockwork.player:NotifyAll(player:Name().." has transferred "..name.." to the "..faction.." faction.");
					end
				else
					Clockwork.player:Notify(player, fault or target:Name().." could not be transferred to the "..faction.." faction!");
				end;
			--[[else
				Clockwork.player:Notify(player, target:Name().." is not on the "..faction.." whitelist!");
			end;]]--
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTransferSubfaction");
	COMMAND.tip = "Transférer un personnage vers une sous-faction.";
	COMMAND.text = "<string Name> <string Subfaction>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"TransferSubfaction", "PlyTransferSubfaction", "SetSubfaction", "CharSetSubfaction", "PlySetSubfaction"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local subfaction = arguments[2];
			local faction = target:GetFaction();
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
					target:SetCharacterData("Subfaction", subfaction.name, true);
					
					if cwBeliefs then
						-- Remove any subfaction locked beliefs.
						local beliefsTab = cwBeliefs:GetBeliefs();
						local targetBeliefs = target:GetCharacterData("beliefs");
						local targetEpiphanies = target:GetCharacterData("points", 0);
						
						for k, v in pairs(beliefsTab) do
							if v.lockedSubfactions and table.HasValue(v.lockedSubfactions, subfaction.name) then
								if targetBeliefs[k] then
									targetBeliefs[k] = false;
									
									targetEpiphanies = targetEpiphanies + 1;
									
									local beliefTree = cwBeliefs:FindBeliefTreeByBelief(k);
									
									if beliefTree.hasFinisher and targetBeliefs[beliefTree.uniqueID.."_finisher"] then
										targetBeliefs[beliefTree.uniqueID.."_finisher"] = false;
									end
								end
							end
						end
						
						target:SetCharacterData("beliefs", targetBeliefs);
						target:SetLocalVar("points", targetEpiphanies);
						target:SetCharacterData("points", targetEpiphanies);
						
						--local max_poise = target:GetMaxPoise();
						--local poise = target:GetNWInt("meleeStamina");
						local max_stamina = target:GetMaxStamina();
						local max_stability = target:GetMaxStability();
						local stamina = target:GetNWInt("Stamina", 100);
						
						target:SetMaxHealth(target:GetMaxHealth());
						target:SetLocalVar("maxStability", max_stability);
						--target:SetLocalVar("maxMeleeStamina", max_poise);
						--target:SetNWInt("meleeStamina", math.min(poise, max_poise));
						target:SetLocalVar("Max_Stamina", max_stamina);
						target:SetCharacterData("Max_Stamina", max_stamina);
						target:SetNWInt("Stamina", math.min(stamina, max_stamina));
						target:SetCharacterData("Stamina", math.min(stamina, max_stamina));
						
						hook.Run("RunModifyPlayerSpeed", target, target.cwInfoTable, true)
						
						target:NetworkBeliefs();
					end
					
					local targetAngles = target:EyeAngles();
					local targetPos = target:GetPos();
					
					Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
					
					target:SetPos(targetPos);
					target:SetEyeAngles(targetAngles);
					
					Clockwork.player:NotifyAll(player:Name().." has transferred "..name.." to the "..subfaction.name.." subfaction.");
				else
					Clockwork.player:Notify(player, subfaction.." is not a valid subfaction for this faction!");
				end
			else
				Clockwork.player:Notify(player, target:Name().."'s faction does not have any subfactions!");
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeFlags");
	COMMAND.tip = "Prendre les drapeaux d'un personnage.";
	COMMAND.text = "<string Name> <string Flag(s)>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			if (string.find(arguments[2], "a") or string.find(arguments[2], "s") or string.find(arguments[2], "o")) then
				Clockwork.player:Notify(player, "Vous ne pouvez pas prendre les drapeaux 'o', 'a' ou 's' !");
				return;
			end;
			
			Clockwork.player:TakeFlags(target, arguments[2]);
			Clockwork.player:NotifyAll(player:Name().." took '"..arguments[2].."' character flags from "..target:Name()..".");
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyTakeFlags");
	COMMAND.tip = "Prendre les drapeaux d'un joueur.";
	COMMAND.text = "<string Name> <string Flag(s)>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			if (string.find(arguments[2], "a") or string.find(arguments[2], "s") or string.find(arguments[2], "o")) then
				Clockwork.player:Notify(player, "Vous ne pouvez pas prendre les drapeaux 'o', 'a' ou 's' !");
				return;
			end;

			Clockwork.player:TakePlayerFlags(target, arguments[2]);
			Clockwork.player:NotifyAll(player:Name().." took '"..arguments[2].."' player flags from "..target:Name()..".");
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeColor");
	COMMAND.tip = "Récupère la couleur personnalisée d'un joueur.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "a";
	COMMAND.arguments = 1;
	COMMAND.alias = {"PlyTakeColor"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			Clockwork.kernel:SetPlayerColor(target, nil);
			Clockwork.player:Notify(player, "Vous avez subi"..target:Name().."'s color.");
		else
			Clockwork.player:Notify(player, "'"..arguments[1].."' is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetName");
	COMMAND.tip = "Définir le nom d'un personnage de manière permanente.";
	COMMAND.text = "<string Name> <string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local name = table.concat(arguments, " ", 2);
			
			Clockwork.player:NotifyAll(player:Name().." set "..target:Name().."'s name to "..name..".");
			Clockwork.player:SetName(target, name);
			target:SaveCharacter();
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetModel");
	COMMAND.tip = "Définir le modèle d'un personnage de manière permanente.";
	COMMAND.text = "<string Name> <string Model>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local model = table.concat(arguments, " ", 2);
			
			target:SetCharacterData("Model", model, true);
			target:SetModel(model);
			target:SaveCharacter();
			
			Clockwork.player:NotifyAll(player:Name().." set "..target:Name().."'s model to "..model..".");
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharForcePhysDesc");
	COMMAND.tip = "Définir la description d'un personnage de manière permanente.";
	COMMAND.text = "<string Name> <string Description>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharSetDesc", "ForcePhysDesc", "SetDesc"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		local minimumPhysDesc = config.Get("minimum_physdesc"):Get();
		local text = tostring(arguments[2]);
		
		if (string.len(text) < minimumPhysDesc) then
			Clockwork.player:Notify(player, "La description physique doit comporter au moins"..minimumPhysDesc.." characters long!");
			
			return;
		end;

		if (string.match(text, "%s%s+")) then
			Clockwork.player:Notify(player, "La description physique ne doit pas contenir d'espaces consécutifs.");
			return;
		end;
		
		target:SetCharacterData("PhysDesc", Clockwork.kernel:ModifyPhysDesc(text));
		target:SaveCharacter();
	end;
COMMAND:Register();


local COMMAND = Clockwork.command:New("CharSetColor");
	COMMAND.tip = "Définir la couleur de chat d'un joueur. Utilisez /ListColors pour voir toutes les couleurs disponibles.";
	COMMAND.text = "<string Name> <string Color>";
	COMMAND.access = "a";
	COMMAND.arguments = 2;
	COMMAND.alias = {"PlySetColor"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local colorTable = colors;
			local color = arguments[2];
			
			if (color and colorTable and !table.IsEmpty(colorTable) and colorTable[color]) then
				Clockwork.kernel:SetPlayerColor(target, colorTable[color]);
				Clockwork.player:Notify(player, "Vous avez défini"..target:Name().."'s color to '"..color.."'.")
			else
				Clockwork.player:Notify(player, "'"..arguments[2].."' is not a valid color!");
			end;
		else
			Clockwork.player:Notify(player, "'"..arguments[1].."' is not a valid player!");
		end;
	end;
COMMAND:Register();

local NAME_CASH = Clockwork.option:GetKey("name_cash");
local COMMAND = Clockwork.command:New("CharSetCoin");
	COMMAND.tip = "Définir les pièces d'un personnage.";
	COMMAND.text = "<string Name> <number Coin>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharSetTokens", "CharSetCash", "SetCoin", "SetTokens", "SetCash"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		local cash = math.floor(tonumber((arguments[2] or 0)));
		
		if (target) then
			if (cash and cash > 0) then
				local playerName = player:Name();
				local targetName = target:Name();
				local giveCash = cash - target:GetCash();
				local cashName = string.gsub(NAME_CASH, "%s", "");
				
				Clockwork.player:GiveCash(target, giveCash);
				
				Clockwork.player:Notify(player, "Vous avez défini"..targetName.."'s "..cashName.." to "..Clockwork.kernel:FormatCash(cash, nil, true)..".");
				Clockwork.player:Notify(target, "Votre"..cashName.." was set to "..Clockwork.kernel:FormatCash(cash, nil, true).." by "..playerName..".");
				
				target:SaveCharacter();
			else
				Clockwork.player:Notify(player, "Ce montant n'est pas valide !");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharAddCoin");
	COMMAND.tip = "Ajoute des pièces à un personnage. Utilise une valeur négative pour soustraire.";
	COMMAND.text = "<string Name> <number Coin>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"CharAddTokens", "CharAddCash", "AddCoin", "AddTokens", "AddCash"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		local cash = math.floor(tonumber((arguments[2] or 0)));
		
		if (target) then
			if (cash and (cash > 0 or cash < 0)) then
				local playerName = player:Name();
				local targetName = target:Name();
				
				Clockwork.player:GiveCash(target, cash);
				
				if cash > 0 then
					Clockwork.player:Notify(player, "Vous avez donné"..targetName.." "..Clockwork.kernel:FormatCash(cash, nil, true)..".");
				else
					Clockwork.player:Notify(player, "Vous avez subi"..Clockwork.kernel:FormatCash(-cash, nil, true).." from "..targetName..".");
				end
				
				target:SaveCharacter();
			else
				Clockwork.player:Notify(player, "Ce montant n'est pas valide !");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGiveItem");
	COMMAND.tip = "Donne un objet à un personnage. Spécifie une quantité à donner ou laisse vide pour 1.";
	COMMAND.text = "<string Name> <string Item> [number Amount]";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"GiveItem", "PlyGiveItem"};
	COMMAND.types = {"Player", "SpawnItem"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local itemTable = item.FindByID(arguments[2]);

			if (itemTable) then
				local amount = tonumber(arguments[3]) or 1;
			
				for i = 1, amount do
					local itemTable = item.CreateInstance(itemTable.uniqueID);
					local bSuccess, fault = target:GiveItem(itemTable, true);
					
					if (bSuccess) and i == amount then
						if amount == 1 then
							if (string.sub(itemTable.name, -1) == "s") then
								Clockwork.player:Notify(player, "Vous avez donné"..target:Name().." some "..itemTable.name..".");
							else
								Clockwork.player:Notify(player, "Vous avez donné"..target:Name().." a "..itemTable.name..".");
							end;
							
							if (player != target) then
								if (string.sub(itemTable.name, -1) == "s") then
									Clockwork.player:Notify(target, player:Name().." has given you some "..itemTable.name..".");
								else
									Clockwork.player:Notify(target, player:Name().." has given you a "..itemTable.name..".");
								end;
							end;
						else
							if (string.sub(itemTable.name, -1) == "s") then
								Clockwork.player:Notify(player, "Vous avez donné"..target:Name().." "..amount.." "..itemTable.name..".");
							else
								Clockwork.player:Notify(player, "Vous avez donné"..target:Name().." "..amount.." "..itemTable.name.."s.");
							end;
							
							if (player != target) then
								if (string.sub(itemTable.name, -1) == "s") then
									Clockwork.player:Notify(target, player:Name().." has given you "..amount.." "..itemTable.name..".");
								else
									Clockwork.player:Notify(target, player:Name().." has given you "..amount.." "..itemTable.name.."s.");
								end;
							end;
						end
					--[[else
						Clockwork.player:Notify(player, target:Name().." does not have enough space for this item!");]]
					end;
				end
			else
				Clockwork.player:Notify(player, "Ceci n'est pas un objet valide !");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharUseItem");
	COMMAND.tip = "Faire utiliser/équiper un objet à un personnage.";
	COMMAND.text = "<string Name> <string Item> [int itemID]";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"ForceEquip", "ForceUseItem", "PlyUseItem"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local itemTable;
			local itemList = Clockwork.inventory:GetItemsAsList(target:GetInventory());

			for k, v in pairs (itemList) do
				if v.uniqueID == arguments[2] then
					if !arguments[3] or !tonumber(arguments[3]) or math.Truncate(tonumber(arguments[3])) == v.itemID then
						itemTable = v;
						break;
					end
				end
			end
			
			if (itemTable and !itemTable.isBaseItem) then
				local bSuccess, fault = Clockwork.item:Use(target, itemTable, true);
				
				if (bSuccess) then
					Clockwork.player:Notify(player, "Vous avez effectué"..target:Name().." use a "..itemTable.name..".");
					
					--[[if (player != target) then
							Clockwork.player:Notify(target, player:Name().." has made you use/equip a "..itemTable.name..".");
					end;]]--
				else
					Clockwork.player:Notify(player, target:Name().." cannot use this item!");
				end;
			else
				Clockwork.player:Notify(player, "Ceci n'est pas un objet valide ou le joueur ne le possède pas !");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharUnequipItem");
	COMMAND.tip = "Faire retirer un objet à un personnage.";
	COMMAND.text = "<string Name> <string Item>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"ForceUnequip", "ForceUnequipItem", "PlyUnequipItem"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			local itemTable;
			local itemList = Clockwork.inventory:GetItemsAsList(target:GetInventory());

			for k, v in pairs (itemList) do
				if v.uniqueID == arguments[2] then
					if !arguments[3] or !tonumber(arguments[3]) or math.Truncate(tonumber(arguments[3])) == v.itemID then
						itemTable = v;
						break;
					end
				end
			end
			
			if (itemTable and !itemTable.isBaseItem) then
				local bSuccess, fault = Clockwork.kernel:ForceUnequipItem(target, itemTable.uniqueID, itemTable.itemID);
				
				if (bSuccess) then
					Clockwork.player:Notify(player, "Vous avez effectué"..target:Name().." unequip a "..itemTable.name..".");
					
					--[[if (player != target) then
							Clockwork.player:Notify(target, player:Name().." has made you unequip "..itemTable.name..".");
					end;]]--
				else
					Clockwork.player:Notify(player, target:Name().." cannot unequip this item!");
				end;
			else
				Clockwork.player:Notify(player, "Ceci n'est pas un objet valide ou le joueur ne le possède pas !");
			end;
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGiveFlags");
	COMMAND.tip = "Accorde des drapeaux à un personnage.";
	COMMAND.text = "<string Name> <string Flag(s)>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (istable(target)) then
			Clockwork.player:Notify(player, "Trop de joueurs avec l'identifiant "..arguments[1].."' were found. Re-enter the command with a specific player's name!");
			return;
		end;
		
		if (target) then
			if (string.find(arguments[2], "a") or string.find(arguments[2], "s") or string.find(arguments[2], "o")) then
				Clockwork.player:Notify(player, "Vous ne pouvez pas attribuer les drapeaux 'o', 'a' ou 's' !");
				return;
			end;
			
			Clockwork.player:GiveFlags(target, arguments[2]);
			Clockwork.player:NotifyAll(player:Name().." gave "..target:Name().." '"..arguments[2].."' character flags.");
			target:SaveCharacter();
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid character!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharKick");
    COMMAND.tip = "Expulse quelqu'un de son personnage.";
    COMMAND.flags = CMD_DEFAULT;
    COMMAND.arguments = 1;
    COMMAND.access = "s";
    COMMAND.text = "<string Name>";

    -- Called when the command has been run.
    function COMMAND:OnRun(player, arguments)
        local target = Clockwork.player:FindByID(arguments[1]);
        if(!IsValid(target)) then Schema:EasyText(player, "peru", "Ce n'est pas un joueur valide !"); return; end
		if !target.cwCharacter then Schema:EasyText(player, "peru", target:Name().." does not have a character loaded!"); return; end
		
		Clockwork.player:UnloadCharacter(target);
        Schema:EasyText(Schema:GetAdmins(), "yellow", (target:Name().." has been kicked off of their character by "..player:Name().."."));
		Clockwork.player:SetCreateFault(target, "You have been kicked off of your character.");
    end
COMMAND:Register();

local COMMAND = Clockwork.command:New("EnableFaction");
	COMMAND.tip = "Activer la résurrection et la création de nouveaux personnages pour une faction.";
	COMMAND.arguments = 1;
	COMMAND.access = "s";
    COMMAND.text = "<string Faction>";
	COMMAND.alias = {"UnlockFaction"};
	
	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local factionTable = Clockwork.faction:FindByID(arguments[1]);
		
		if !factionTable then Schema:EasyText(player, "peru", "Ce n'est pas une faction valide !"); return; end
		if !factionTable.disabled then Schema:EasyText(player, "peru", "Cette faction est déjà activée !"); return; end
		
		factionTable.disabled = false;
		
		Clockwork.player:NotifyAdmins("operator", player:Name().." has enabled the "..factionTable.name.." faction.");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("DisableFaction");
	COMMAND.tip = "Désactiver la réapparition et la création de nouveaux personnages pour une faction.";
	COMMAND.arguments = 1;
	COMMAND.access = "s";
    COMMAND.text = "<string Faction>";
	COMMAND.alias = {"LockFaction"};
	
	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local factionTable = Clockwork.faction:FindByID(arguments[1]);
		
		if !factionTable then Schema:EasyText(player, "peru", "Ce n'est pas une faction valide !"); return; end
		if factionTable.disabled then Schema:EasyText(player, "peru", "Cette faction est déjà désactivée !"); return; end
		
		factionTable.disabled = true;
		
		Clockwork.player:NotifyAdmins("operator", player:Name().." has disabled the "..factionTable.name.." faction.");
	end;
COMMAND:Register();