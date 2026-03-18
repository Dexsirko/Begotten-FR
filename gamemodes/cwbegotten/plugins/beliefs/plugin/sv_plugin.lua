--[[
	Begotten 3
	Created by cash wednesday, gabs, DETrooper and alyousha35
--]]

config.Add("xp_modifier", 2)
config.Add("min_xp_charplaytime", 720) -- The minimum playtime a character has to achieve for others to get damage and kill XP off them

cwBeliefs.xpValues = {
	["breakdown"] = 1, -- 1 xp per item broken down.
	["copy"] = 200, -- 200 xp per book copied by those with the 'Scribe' belief.
	["damage"] = 0.1, -- 0.1 xp per point of damage dealt per level.
	["drink"] = 3, -- 3 xp per drink consumed.
	["food"] = 5, -- 5 xp per food consumed.
	["kill"] = 2.5, -- 2.5 xp per killing blow per level.
	["meltdown"] = 2, -- 2 xp per item melted down.
	["mutilate"] = 2, -- 2 xp per mutiliation of a corpse. Also includes other stuff like eating hearts or harvesting bones.
	["residual"] = 1, -- 1 xp per minute survived in non-safezones.
	["read"] = 50, -- 50 xp for every unique scripture read. Halved if a member of a faction.
};

cwBeliefs.beliefNotifications = {
	["embrace_the_darkness"] = "Vous pouvez désormais utiliser le clic droit avec les Sens équipés pour activer l'invisibilité lorsque vous êtes à l'extérieur dans les Terres Désolées la nuit, pendant les tempêtes de sang, ou dans les mines, mais vous devez rester accroupi avec vos Sens équipés. Notez qu'après une attaque, il y aura un délai de cinq secondes avant de pouvoir vous camoufler. Tirer avec une arme à feu augmentera ce délai à 30 secondes.",
	["evasion"] = "Vous pouvez désormais faire une roulade en appuyant deux fois rapidement sur vos touches de déplacement (paramétrable dans le menu Clockwork Settings) ou en assignant une touche dans le menu des paramètres et en l'enfonçant tout en vous déplaçant. La roulade accorde des frames d'invincibilité et peut également éteindre les incendies.",
	["father"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi pousser un cri de guerre en tapant '/warcry' dans le chat, ce qui désorientera temporairement et réduira la santé mentale des joueurs ennemis proches.",
	["flagellant"] = "Vous pouvez désormais flageller votre propre chair en tapant '/flagellate' dans la boîte de dialogue.",
	["halfsword_sway"] = "Vous pouvez désormais changer de posture avec certaines armes en utilisant E + Clic droit !",
	["hard_glazed"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue.",
	["mother"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi pousser un cri de guerre en tapant '/warcry' dans le chat, ce qui désorientera temporairement et réduira la santé mentale des joueurs ennemis proches.",
	["old_son"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi pousser un cri de guerre en tapant '/warcry' dans le chat, ce qui désorientera temporairement et réduira la santé mentale des joueurs ennemis proches.",
	["parrying"] = "Vous pouvez désormais parer avec les armes de mêlée en utilisant votre touche de rechargement !",
	["primevalism"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue.",
	["satanism"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue.",
	["sister"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi pousser un cri de guerre en tapant '/warcry' dans le chat, ce qui désorientera temporairement et réduira la santé mentale des joueurs ennemis proches.",
	["sol_orthodoxy"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi mettre fin à votre misérable putain d'existence en tapant '/suicide'.",
	["voltism"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi vous électrocuter en tapant '/electrocute'.",
	--["deflection"] = "Vous pouvez désormais dévier en bloquant avec des armes de mêlée en effectuant des blocages chronométrés !",
	["wrestle_subdue"] = "Vous pouvez désormais maintenir au sol les ennemis qui ont été renversés en passant à vos Mains et en utilisant le Clic droit !",
	["young_son"] = "Vous pouvez désormais prier les Dieux en tapant '/pray' dans la boîte de dialogue. Vous pouvez aussi pousser un cri de guerre en tapant '/warcry' dans le chat, ce qui désorientera temporairement et réduira la santé mentale des joueurs ennemis proches.",
	-- Croyances de double maniement.
	["man_become_beast"] = "Vous pouvez désormais manier deux armes à la fois en les combinant dans l'onglet inventaire. Seules les armes à une main et les dagues peuvent être maniées à deux mains. Vous ne pourrez attaquer qu'en estoc si les deux armes sont capables d'attaques alternatives.",
	["murder_artform"] = "Vous pouvez désormais manier deux armes à la fois en les combinant dans l'onglet inventaire. Seules les armes à une main et les dagues peuvent être maniées à deux mains. Vous ne pourrez attaquer qu'en estoc si les deux armes sont capables d'attaques alternatives.",
	["repentant"] = "Vous pouvez désormais manier deux armes à la fois en les combinant dans l'onglet inventaire. Seules les armes à une main et les dagues peuvent être maniées à deux mains. Vous ne pourrez attaquer qu'en estoc si les deux armes sont capables d'attaques alternatives.",
	["witch_druid"] = "Vous pouvez désormais manier deux armes à la fois en les combinant dans l'onglet inventaire. Seules les armes à une main et les dagues peuvent être maniées à deux mains. Vous ne pourrez attaquer qu'en estoc si les deux armes sont capables d'attaques alternatives.",
};

cwBeliefs.residualXPZones = {"wasteland", "caves", "gore", "sea_styx", "sea_rough", "sea_calm", "toothboy", "scrapper"};

-- A function to level a player up.
function cwBeliefs:LevelUp(player)
	if IsValid(player) then
		local experience = player:GetCharacterData("experience", 0);
		local newExperience = experience;
		local level = player:GetCharacterData("level", 1);
		local levelCap = self.sacramentLevelCap;
		local newLevel = level;
		local points = player:GetCharacterData("points", 0);
		local subfaction = player:GetSubfaction();
		
		if player:HasBelief("loremaster") then
			levelCap = levelCap + 10;
		end
		
		if player:HasBelief("sorcerer") or player:HasBelief("the_paradox_riddle_equation") then
			levelCap = levelCap + 5;
		end
		
		if subfaction == "Rekh-khet-sa" then
			levelCap = levelCap + 666;
		end
		
		if level < levelCap then
			for i = level, levelCap - 1 do
				if (newExperience >= (self.sacramentCosts[newLevel + 1] or 666)) then
					newExperience = newExperience - (self.sacramentCosts[newLevel + 1] or 666);
					newLevel = newLevel + 1;
					points = points + 1;
					
					if newLevel == levelCap then
						points = points + 1;
					end
				else
					break;
				end
			end
				
			player:SetCharacterData("experience", newExperience);
			player:SetLocalVar("experience", newExperience);
			player:SetCharacterData("points", points);
			player:SetLocalVar("points", points);
			player:SetCharacterData("level", newLevel);
			player:SetNetVar("level", newLevel);
			Clockwork.plugin:Call("PlayerLevelUp", player, newLevel, points);
		end
	end
end

-- A function to give a new belief to a player.
function cwBeliefs:TakeBelief(player, uniqueID, niceName, category)
	if (!player:GetCharacterData("beliefs")) then
		player:SetCharacterData("beliefs", {});
	end;
	
	local points = player:GetCharacterData("points", 0)
	
	if (points <= 0) then
		Schema:EasyText(player, "peru", "Vous n'avez pas assez de foi pour suivre cette croyance !")
		return false
	end;

	if (player:GetNetVar("tied") != 0) then
		Schema:EasyText(player, "peru", "Vous ne pouvez pas suivre des croyances lorsque vous êtes attaché !");
		return false
	end;
	
	local beliefs = player:GetCharacterData("beliefs");
	local takeBelief = Clockwork.plugin:Call("ResolveBelief", player, uniqueID, category, beliefs);
	
	if (takeBelief and !beliefs[uniqueID]) then
		beliefs[uniqueID] = true
		player:SetCharacterData("beliefs", beliefs)
		player:SetCharacterData("points", math.Clamp(points - 1, 0, 100))
		player:SetLocalVar("points", player:GetCharacterData("points", 0));
		player:Notify("You have taken the \""..niceName.."\" belief.")
		player:SendLua([[Clockwork.Client:EmitSound("ambient/fire/ignite.wav", 40)]]);
		
		Clockwork.kernel:PrintLog(LOGTYPE_MINOR, player:Name().." has taken the \""..niceName.."\" belief.");
		
		hook.Run("BeliefTaken", player, uniqueID, category);
	end;
end;

function cwBeliefs:ForceTakeBelief(player, uniqueID)
	local beliefs = player:GetCharacterData("beliefs", {});
	
	if !beliefs[uniqueID] then
		local beliefTree = self:FindBeliefTreeByBelief(uniqueID);
		local category;

		if beliefTree then
			category = beliefTree.uniqueID;
		end
		
		beliefs[uniqueID] = true
		player:SetCharacterData("beliefs", beliefs);
		
		hook.Run("BeliefTaken", player, uniqueID, category);
	end
end

function cwBeliefs:ForceRemoveBelief(player, uniqueID, bRemoveDependencies)
	local beliefs = player:GetCharacterData("beliefs");
	local levels_to_remove = 1;
	
	if beliefs[uniqueID] then
		local beliefTree = self:FindBeliefTreeByBelief(uniqueID);
		local category;

		if beliefTree then
			category = beliefTree.uniqueID;
		end
		
		local beliefTable = self:FindBeliefByID(uniqueID, category)
		
		if beliefTable and beliefTable.subfaith and beliefTable.row == 1 then
			player:SetNetVar("subfaith", nil);
			player.cwCharacter.subfaith = nil;
		end
		
		beliefs[uniqueID] = false;
		
		if bRemoveDependencies then
			local requirements = beliefTable.requirements; 

			for k, v in pairs(requirements) do
				local requirementTable = self:FindBeliefByID(v, category)
				
				if requirementTable and requirementTable.subfaith and requirementTable.row == 1 then
					player:SetNetVar("subfaith", nil);
					player.cwCharacter.subfaith = nil;
				end
			
				beliefs[v] = false;
				levels_to_remove = levels_to_remove + 1;
			end;
		end
		
		beliefs[uniqueID] = false;
		
		player:SetCharacterData("beliefs", beliefs);
		player:SetCharacterData("level", math.max(player:GetCharacterData("level", 1) - levels_to_remove, 1));
		player:SetNetVar("level", player:GetCharacterData("level", 1));
		player:NetworkBeliefs();
		
		--local max_poise = player:GetMaxPoise();
		--local poise = player:GetNWInt("meleeStamina");
		local max_stamina = player:GetMaxStamina();
		local max_stability = player:GetMaxStability();
		local stamina = player:GetNWInt("Stamina", 100);
		
		player:SetMaxHealth(player:GetMaxHealth());
		player:SetLocalVar("maxStability", max_stability);
		--player:SetLocalVar("maxMeleeStamina", max_poise);
		--player:SetNWInt("meleeStamina", math.min(poise, max_poise));
		player:SetLocalVar("Max_Stamina", max_stamina);
		player:SetCharacterData("Max_Stamina", max_stamina);
		player:SetNWInt("Stamina", math.min(stamina, max_stamina));
		player:SetCharacterData("Stamina", math.min(stamina, max_stamina));
		
		hook.Run("RunModifyPlayerSpeed", player, player.cwInfoTable, true)
		
		player:SaveCharacter();
	end
end

function cwBeliefs:SetSacramentLevel(player, level)
	local beliefs = player:GetCharacterData("beliefs", {});
	local oldLevel = player:GetCharacterData("level", 1);
	local numBeliefs = 0;
	
	for k, v in pairs(beliefs) do
		numBeliefs = numBeliefs + 1;
	end
	
	local points = math.Clamp(level - numBeliefs - 1, 0, level - 1);
	
	player:SetCharacterData("experience", 0);
	player:SetLocalVar("experience", 0);
	player:SetCharacterData("points", points);
	player:SetLocalVar("points", points);
	player:SetCharacterData("points", points);
	player:SetCharacterData("level", level);
	player:SetNetVar("level", level);
	
	if oldLevel < level then
		Clockwork.plugin:Call("PlayerLevelUp", player, level, points);
	end
end

function cwBeliefs:ResetBeliefSharedVars(player)
	if player:HasBelief("the_storm") or player:HasBelief("the_paradox_riddle_equation") then
		player:SetNetVar("beliefFont", "Voltism");
	elseif player:GetNetVar("beliefFont") then
		player:SetNetVar("beliefFont", nil);
	end
	
	if player:HasBelief("nimble") then
		player:SetNetVar("hasNimble", true);
	elseif player:GetNetVar("hasNimble") then
		player:SetNetVar("hasNimble", nil);
	end
	
	if player:HasBelief("favored") then
		player:SetNetVar("favored", true);
	elseif player:GetNetVar("favored") then
		player:SetNetVar("favored", nil);
	end
end;

netstream.Hook("TakeBelief", function(player, data)
	cwBeliefs:TakeBelief(player, data[1], data[2], data[3]);
end)

concommand.Add("listbeliefs", function(player)
	if (player:IsAdmin()) then
		local beliefs = cwBeliefs.beliefTable;
		
		if beliefs then
			for k, v in pairs (beliefs) do
				for k2, v2 in pairs(v) do
					print(k2);
				end
			end;
		end;
	end;
end)

config.Add("max_sac_level", 40, true)