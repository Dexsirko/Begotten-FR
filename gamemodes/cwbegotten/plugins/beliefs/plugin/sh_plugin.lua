--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

game.AddParticles("particles/blood_impact.pcf");
PrecacheParticleSystem("blood_advisor_pierce_spray");
util.PrecacheSound("nhzombie_headexplode.wav")
util.PrecacheSound("nhzombie_headexplode_jet.wav")
util.PrecacheModel("models/begotten/heads/female_gorecap.mdl");
util.PrecacheModel("models/begotten/heads/male_gorecap.mdl");

PLUGIN:SetGlobalAlias("cwBeliefs");

Clockwork.kernel:IncludePrefixed("sh_beliefs.lua");
Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_meta.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

cwBeliefs.sacramentLevelCap = cwBeliefs.sacramentLevelCap or 40;
cwBeliefs.sacramentCosts = {
	[2] = 10,
	[3] = 20,
	[4] = 30,
	[5] = 40,
	[6] = 50,
	[7] = 60,
	[8] = 70,
	[9] = 80,
	[10] = 90,
	[11] = 100,
	[12] = 120,
	[13] = 140,
	[14] = 160,
	[15] = 180,
	[16] = 200,
	[17] = 220,
	[18] = 240,
	[19] = 260,
	[20] = 280,
	[21] = 300,
	[22] = 320,
	[23] = 340,
	[24] = 360,
	[25] = 380,
	[26] = 400,
	[27] = 420,
	[28] = 440,
	[29] = 460,
	[30] = 480,
	[31] = 500,
	[32] = 520,
	[33] = 540,
	[34] = 560,
	[35] = 580,
	[36] = 600,
	[37] = 620,
	[38] = 640,
	[39] = 660,
	[40] = 666,
};

-- Called when Clockwork config has initialized.
function cwBeliefs:ClockworkConfigInitialized(key, value)
	if key == "max_sac_level" and isnumber(value) then
		self.sacramentLevelCap = math.floor(value);
	end
end

-- Called when Clockwork config has changed.
function cwBeliefs:ClockworkConfigChanged(key, data, previousValue, newValue)
	if key == "max_sac_level" and isnumber(newValue) then
		self.sacramentLevelCap = math.floor(newValue);
	end
end

local COMMAND = Clockwork.command:New("CharClearBeliefs");
COMMAND.tip = "Réinitialiser les croyances d'un joueur.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"ClearBeliefs", "PlyClearBeliefs", "ResetBeliefs"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		target:ResetBeliefs();
		
		if (player != target) then
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous avez réinitialisé "..target:Name().." croyances ");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous avez réinitialisé vos propres croyances.");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n'est pas un joueur valide !");
	end;
end;

COMMAND:Register();

--[[local COMMAND = Clockwork.command:New("CharClearBeliefsAll");
COMMAND.tip = "Réinitialiser les croyances de tous les joueurs.";
COMMAND.access = "s";
COMMAND.alias = {"ClearBeliefsAll", "PlyClearBeliefsAll", "ResetBeliefsAll"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	for _, v in _player.Iterator() do
		if (v:HasInitialized()) then
			v:ResetBeliefs();
		end
	end

	Schema:EasyText(Schema:GetAdmins(), "lightslategrey", player:Name().." has cleared everyone's beliefs! If this was in error then god help us all.", nil);
end;

COMMAND:Register();]]--

local COMMAND = Clockwork.command:New("CharAddExperience");
COMMAND.tip = "Ajouter de la foi (expérience) à un joueur.";
COMMAND.text = "<string Name> <int Experience>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.alias = {"AddFaith", "GiveFaith", "CharAddXP", "AddXP", "AddExperience", "PlyAddXP", "PlyAddExperience"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local xp = arguments[2];
		
		if xp and tonumber(xp) then
			if (player != target) then
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has given "..target:Name().." "..xp.." experience.");
			else
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has given themself "..xp.." experience.");
			end;
			
			target:HandleXP(tonumber(xp), true);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharAddExperienceRadius")
    COMMAND.tip = "Ajoute de la foi (expérience) à tous les personnages dans un rayon spécifique.";
    COMMAND.access = "s";
    COMMAND.arguments = 2;
    COMMAND.text = "<int Experience> <int Radius>";
    COMMAND.alias = {"AddFaithRadius", "GiveFaithRadius", "CharAddXPRadius", "AddXPRadius", "AddExperienceRadius", "PlyAddXPRadius", "PlyAddExperienceRadius"};
	COMMAND.types = {"", "Radius"}
    -- Called when the command has been run.
    function COMMAND:OnRun(player, arguments)
		local radius = tonumber(arguments[2]);
		local xp = tonumber(arguments[1]);
		
		if !radius then
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number for the radius!");
			
			return false;
		end
		
		if !xp then
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number for the experience!");
			
			return false;
		end
		
		local counter = 0;
		
        for k, v in pairs(ents.FindInSphere(player:GetEyeTrace().HitPos, radius)) do
            if v:IsPlayer() and v:Alive() and !v.cwObserverMode then
                v:HandleXP(xp);
				
				counter = counter + 1;
            end
        end
		
		if counter > 0 then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has given "..counter.." characters "..xp.." experience each.");
		else
			Schema:EasyText(player, "grey", "["..self.name.."] There were no nearby characters to give experience to!");
		end
    end
COMMAND:Register()

local COMMAND = Clockwork.command:New("CharGiveBelief");
COMMAND.tip = "Donne une croyance à un joueur.";
COMMAND.text = "<string Name> <string BeliefID>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.alias = {"GiveBelief", "PlyGiveBelief"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local belief = arguments[2];
		
		if belief and cwBeliefs:FindBeliefByID(belief) then
			if (player != target) then
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has given "..target:Name().." the '"..belief.."' belief.");
			else
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has given themself the '"..belief.."' belief.");
			end;
			
			cwBeliefs:ForceTakeBelief(target, belief);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid belief!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGetBeliefs");
	COMMAND.tip = "Affiche la liste des croyances d'un personnage (utilise /CharOpenBeliefTree pour consulter son arbre de croyances).";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"GetBeliefs", "PlyGetBeliefs"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local beliefs = target:GetCharacterData("beliefs");
			
			if beliefs then
				local belief_strings = {};
			
				for k, v in pairs(beliefs) do
					if v == true then
						table.insert(belief_strings, k);
					end
				end
			
				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] "..target:Name().." has the following beliefs: "..table.concat(belief_strings, " "));
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeBelief");
COMMAND.tip = "Prends une croyance à un joueur. Argument optionnel pour supprimer les croyances dépendantes. Les niveaux sont retirés respectivement.";
COMMAND.text = "<string Name> <string BeliefID> (bool RemoveDependencies)";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.optionalArguments = 1
COMMAND.alias = {"TakeBelief", "PlyTakeBelief", "CharRemoveBelief", "RemoveBelief", "PlyRemoveBelief"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local belief = arguments[2];
		local bRemoveDependencies = arguments[3];
		
		if belief and cwBeliefs:FindBeliefByID(belief) then
			if bRemoveDependencies then
				if (player != target) then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed from "..target:Name().." the '"..belief.."' belief and any dependencies.");
				else
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed from yourself the '"..belief.."' belief and any dependencies.");
				end;
			else
				if (player != target) then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed from "..target:Name().." the '"..belief.."' belief.");
				else
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed from yourself the '"..belief.."' belief.");
				end;
			end
			
			cwBeliefs:ForceRemoveBelief(target, belief, bRemoveDependencies);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid belief!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetSacramentLevel");
COMMAND.tip = "Définir le niveau de Sacrement d'un joueur.";
COMMAND.text = "<string Name> <int SacramentLevel>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.alias = {"SetSacramentLevel", "PlySetSacramentLevel"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local level = arguments[2];
		
		if level then
			level = tonumber(level);
			
			if level > 0 then
				if (player != target) then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s sacrament level to "..tostring(level)..".");
				else
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] "..player:Name().." has set their own sacrament level to "..tostring(level)..".");
				end;
			
				cwBeliefs:SetSacramentLevel(target, level);
			else
				Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number above 0!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number between 1 and 30!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

--[[local COMMAND = Clockwork.command:New("CharSetSacramentLevelAll");
COMMAND.tip = "Définir les Niveaux de Sacrement de tous les joueurs.";
COMMAND.text = "<int SacramentLevel>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"SetSacramentLevelAll", "PlySetSacramentLevelAll"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local level = arguments[1];
	
	if level then
		level = tonumber(level);
		
		if level > 0 and level <= 30 then
			for _, v in _player.Iterator() do
				if (v:HasInitialized()) then
					cwBeliefs:SetSacramentLevel(v, level);
				end
			end

			Schema:EasyText(Schema:GetAdmins(), "lightslategrey", player:Name().." has set everyone's sacrament level to "..level..".", nil);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number between 1 and 30!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] You must specify a valid number between 1 and 30!");
	end
end;

COMMAND:Register();]]--

local COMMAND = Clockwork.command:New("CharOpenBeliefTree");
COMMAND.tip = "Ouvrir l'arbre de croyance d'un joueur.";
COMMAND.text = "<string Name>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"OpenBeliefTree", "PlyOpenBeliefTree"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local curTime = CurTime()
		
		if (!player.NextOpenTree or player.NextOpenTree < curTime or args[1]) then
			player.NextOpenTree = curTime + 1
			
			local level = target:GetCharacterData("level", 1)
			local beliefs = target:GetCharacterData("beliefs", {})
			local experience = target:GetCharacterData("experience", 0)
			local points = target:GetCharacterData("points", 0)
			local faith = target:GetFaith() or "Faith of the Light"
			
			netstream.Start(player, "OpenLevelTreeOtherPlayer", {target, level, experience, beliefs, points, faith});
			
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] ".."You have opened "..target:Name().."'s belief tree!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisper");
COMMAND.tip = "Parle en langues à travers le néant vers une cible. Si la cible de ce message n'appartient pas à la Foi des Ténèbres ou à la Foi de la Sœur, le message sera anonyme et drainera également la santé mentale de votre cible, bien que cela entraînera une quantité modérée de corruption pour vous-même.";
COMMAND.text = "<string Name> <string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 2;
COMMAND.alias = {"DW"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch", "shedskin"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		if player:GetFaith() == "Faith of the Dark" or player:GetSubfaith() == "Faith of the Sister"  then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") or player:HasBelief("shedskin") then
				local curTime = CurTime();
				local message = "\""..table.concat(arguments, " ", 2).."\"";
				local targetFaith = target:GetFaith();
				
				if target:GetNetVar("kinisgerOverride") == "Goreic Warrior" and target:GetNetVar("kinisgerOverrideSubfaction") ~= "Clan Reaver" then
					targetFaith = "Faith of the Family";
				end

				if (targetFaith == "Faith of the Dark" or target:GetSubfaith() == "Faith of the Sister") then
					player:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					target:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					Clockwork.chatBox:Add(player, player, "darkwhisper", message);
					Clockwork.chatBox:Add(target, player, "darkwhisper", message);
				elseif !player.nextDarkWhisper or player.nextDarkWhisper <= curTime then
					player:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					target:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					Clockwork.chatBox:Add(player, nil, "darkwhispernondark", message);
					Clockwork.chatBox:Add(target, nil, "darkwhispernondark", message);
					player:HandleNeed("corruption", 10);
					target:HandleSanity(-5);
					target:Disorient(5);
					
					player.nextDarkWhisper = curTime + 15;
				else
					Schema:EasyText(player, "chocolate", "Vous devez attendre encore"..-math.ceil(curTime - player.nextDarkWhisper).." seconds before darkwhispering this character again!");
				end;
				
				target.lastDarkWhisperer = player;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière', 'Devin' ou 'Mue' avant de pouvoir murmurer à l'ombre !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne foi pour faire cela !");
		end
	else
		Schema:EasyText(player, "grey",arguments[1].." is not a valid character!");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperDirect");
COMMAND.tip = "Parle en langues à travers le néant au personnage que tu regardes. Si la cible de ce message n'appartient pas à la Foi des Ténèbres ou à la Foi de la Sœur, le message sera anonyme et drainera également la santé mentale de ta cible, bien que cela entraînera une quantité modérée de corruption pour toi-même.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"DWD"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch", "shedskin"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.entity:GetPlayer(player:GetEyeTraceNoCursor().Entity);
	
	if (target) then
		if player:GetFaith() == "Faith of the Dark" or player:GetSubfaith() == "Faith of the Sister" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") or player:HasBelief("shedskin") then
				local curTime = CurTime();
				local message = "\""..table.concat(arguments, " ", 1).."\"";
				local targetFaith = target:GetFaith();
				
				if target:GetNetVar("kinisgerOverride") == "Goreic Warrior" and target:GetNetVar("kinisgerOverrideSubfaction") ~= "Clan Reaver" then
					targetFaith = "Faith of the Family";
				end

				if (targetFaith == "Faith of the Dark" or target:GetSubfaith() == "Faith of the Sister") then
					player:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					target:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					Clockwork.chatBox:Add(player, player, "darkwhisper", message);
					Clockwork.chatBox:Add(target, player, "darkwhisper", message);
				elseif !player.nextDarkWhisper or player.nextDarkWhisper <= curTime then
					player:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					target:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					Clockwork.chatBox:Add(player, nil, "darkwhispernondark", message);
					Clockwork.chatBox:Add(target, nil, "darkwhispernondark", message);
					player:HandleNeed("corruption", 10);
					target:HandleSanity(-5);
					target:Disorient(5);
					
					player.nextDarkWhisper = curTime + 15;
				else
					Schema:EasyText(player, "chocolate", "Vous devez encore attendre"..-math.ceil(curTime - player.nextDarkWhisper).." seconds before darkwhispering this character again!");
				end;
				
				target.lastDarkWhisperer = player;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière', 'Devin' ou 'Mue' avant de pouvoir murmurer à l'ombre !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne foi pour faire cela !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperEvent");
COMMAND.tip = "Parle en langues à travers le néant à tous les joueurs de la carte.";
COMMAND.text = "<string Message>";
COMMAND.access = "s";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.isChatCommand = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local message = "\""..table.concat(arguments, " ", 1).."\"";

	for _, v in _player.Iterator() do
		if v:HasInitialized() and v:Alive() then
			Clockwork.chatBox:Add(v, nil, "darkwhisperevent", message);
			v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_long"..math.random(1, 5)..".mp3", 80, 100)]]);
			
			if v:GetFaith() ~= "Faith of the Dark" and v:GetSubfaith() ~= "Faith of the Sister" then
				v:HandleSanity(-5);
				v:Disorient(5);
			end
		end
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperFaction");
COMMAND.tip = "Parle en langues à travers le néant à tes frères.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"DWF"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch", "shedskin"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = player:GetFaction();
	local faith = player:GetFaith();
	
	if faith == "Faith of the Dark" or player:GetSubfaith() == "Faith of the Sister" then
		if faction == "Children of Satan" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") then
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() and ((v:GetFaction() == "Children of Satan") or Clockwork.player:HasFlags(v, "L")) then
						if v:GetSubfaction() == "Kinisger" and v:GetNetVar("kinisgerOverride") then
							Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message);
						else
							Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
						end
							
						v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière' ou 'Voyante' avant de pouvoir murmurer dans les ténèbres !");
			end
		elseif faction == "Goreic Warrior" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") or player:HasBelief("shedskin") then
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() then
						local vFaction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
						
						if ((vFaction == "Goreic Warrior") and (v:GetFaith() == "Faith of the Dark" or v:GetSubfaith() == "Faith of the Sister")) or Clockwork.player:HasFlags(v, "L") then
							if v:GetSubfaction() == "Kinisger" then
								Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message);
							else
								Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
							end
							
							v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
						end
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière', 'Devin' ou 'Mue' avant de pouvoir murmurer à l'ombre !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne faction pour faire cela !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne foi pour faire cela !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperFactionProclaim");
COMMAND.tip = "Parle en langues avec autorité à travers le vide à tes frères.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"DWFP"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faction = player:GetFaction();
	local faith = player:GetFaith();
	
	if faith == "Faith of the Dark" or player:GetSubfaith() == "Faith of the Sister" then
		if faction == "Children of Satan" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") then
				if !player:IsAdmin() and !Clockwork.player:HasFlags(player, "P") and Schema:GetRankTier(faction, player:GetCharacterData("rank", 1)) < 3 then
					Schema:EasyText(player, "peru", "Tu n'es pas assez important pour faire cela !");
				
					return false;
				end
			
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() and ((v:GetFaction() == "Children of Satan") or Clockwork.player:HasFlags(v, "L")) then
						Clockwork.chatBox:SetMultiplier(1.35);
						
						if v:GetSubfaction() == "Kinisger" and v:GetNetVar("kinisgerOverride") then
							Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message);
						else
							Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
						end
							
						v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière' ou 'Voyante' avant de pouvoir murmurer à l'ombre !");
			end
		elseif faction == "Goreic Warrior" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") or player:HasBelief("shedskin") then
				if !player:IsAdmin() and !Clockwork.player:HasFlags(player, "P") then
					Schema:EasyText(player, "peru", "Tu n'es pas assez important pour faire ça !");
				
					return false;
				end
			
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() then
						local vFaction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
						
						if ((vFaction == "Goreic Warrior") and (v:GetFaith() == "Faith of the Dark" or v:GetSubfaith() == "Faith of the Sister")) or Clockwork.player:HasFlags(v, "L") then
							Clockwork.chatBox:SetMultiplier(1.35);
							
							if v:GetSubfaction() == "Kinisger" then
								Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message);
							else
								Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
							end
							
							v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
						end
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière', 'Devin' ou 'Mue' avant de pouvoir murmurer à l'ombre !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne faction pour faire cela !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous n'avez pas la foi requise pour accomplir cela !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperFactionKinisger");
COMMAND.tip = "Parle en langues à travers le néant à tes frères d'illusion.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"DWFK"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch"};
COMMAND.subfaction = "Kinisger";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player:GetSubfaction() == "Kinisger" then
		local faction = player:GetNetVar("kinisgerOverride") or player:GetFaction();
		
		if faction ~= "Wanderer" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") then
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() then
						local vFaction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
						
						if (vFaction == faction) and (v:GetFaith() == "Faith of the Dark" or v:GetSubfaith() == "Faith of the Sister") then
							Clockwork.chatBox:SetMultiplier(1.35);
							
							if v:GetSubfaction() == "Kinisger" and v:GetNetVar("kinisgerOverride") then
								Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message)
							else
								Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
							end
							
							v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
						end
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière' ou 'Voyante' avant de pouvoir murmurer à l'ombre !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la faction appropriée pour faire cela !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous n'êtes pas la bonne sous-faction pour faire cela !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkWhisperFactionKinisgerProclaim");
COMMAND.tip = "Parle en langues avec autorité à travers le vide à tes frères de jeu.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"DWFKP"};
COMMAND.isChatCommand = true;
COMMAND.onerequiredbelief = {"soothsayer", "witch"};
COMMAND.subfaction = "Kinisger";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player:GetSubfaction() == "Kinisger" then
		local faction = player:GetNetVar("kinisgerOverride") or player:GetFaction();
		
		if faction ~= "Wanderer" then
			if player:HasBelief("witch") or player:HasBelief("soothsayer") then
				if !player:IsAdmin() and !Clockwork.player:HasFlags(player, "P") and !Schema:GetRankTier(faction, player:GetCharacterData("rank", 1)) >= 3 then
					Schema:EasyText(player, "peru", "Tu n'es pas assez important pour faire ça !");
				
					return false;
				end
				
				local message = "\""..table.concat(arguments, " ", 1).."\"";

				for _, v in _player.Iterator() do
					if v:HasInitialized() and v:Alive() then
						local vFaction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
						
						if (vFaction == faction) and (v:GetFaith() == "Faith of the Dark" or v:GetSubfaith() == "Faith of the Sister") then
							Clockwork.chatBox:SetMultiplier(1.35);
							
							if v:GetSubfaction() == "Kinisger" and v:GetNetVar("kinisgerOverride") then
								Clockwork.chatBox:Add(v, player, "darkwhisperglobalkinisger", message)
							else
								Clockwork.chatBox:Add(v, player, "darkwhisperglobal", message);
							end
							
							v:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
						end
					end;
				end;
			else
				Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Sorcière' ou 'Devineresse' avant de pouvoir murmurer dans les ténèbres !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la faction appropriée pour faire cela !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous n'êtes pas la bonne sous-faction pour faire cela !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DarkReply");
COMMAND.tip = "En usant de toute ta volonté, réponds à un murmure des ténèbres qui t'est parvenu à travers le néant. Note que cela entraînera une légère corruption si tu n'appartiens pas à la Foi des Ténèbres.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.isChatCommand = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if IsValid(player.lastDarkWhisperer) then
		local message = "\""..table.concat(arguments, " ", 1).."\"";

		Clockwork.chatBox:Add(player, player, "darkwhisperreply", message);
		Clockwork.chatBox:Add(player.lastDarkWhisperer, player, "darkwhisperreply", message);
		
		player:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
		player.lastDarkWhisperer:SendLua([[Clockwork.Client:EmitSound("darkwhisper/darkwhisper_short"..math.random(1, 11)..".mp3", 80, 100)]]);
		
		if (player:GetFaith() ~= "Faith of the Dark" and player:GetSubfaith() ~= "Faith of the Sister") then
			player:HandleNeed("corruption", 5);
		end;
	else
		Schema:EasyText(player, "firebrick", "Il n'y a pas de murmure sombre auquel répondre !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("Pray");
COMMAND.tip = "Adresse une prière à ceux qui te gouvernent. Prépare-toi aux conséquences de cette action.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.isChatCommand = true;

local faithcolors = {
	["HARD-GLAZED"] = "goldenrod",
	["SOL ORTHODOXY"] = "darkgoldenrod",
	["VOLTISM"] = "steelblue",
	["MOTHER"] = "grey",
	["FATHER"] = "slategray",
	["OLD SON"] = "lightslategray",
	["PRIMEVALISM"] = "darkred",
	["SISTER"] = "lightsteelblue",
	["YOUNG SON"] = "darkgrey",
	["SATANISM"] = "crimson",
}

local ringcolors = {
	["LIGHT"] = "gold",
	["DARK"] = "firebrick",
	["FAMILY"] = "grey",
}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local faith = player:GetFaith();
	
	if faith then
		local subfaith = player:GetSubfaith();
	
		if subfaith and subfaith ~= "" and subfaith ~= "N/A" then
			local message = table.concat(arguments, " ", 1)
			local faith_str = string.upper(string.gsub(faith, "Faith of the ", ""));
			local ofaithstr = faith_str
			local marked = player:GetNetVar("marked");
			local favored = player:GetNetVar("favored");
			local markedstr = "";
			local subfaith = player:GetSubfaith();
			
			faith_str = string.upper(string.gsub(subfaith, "Faith of the ", ""));
			
			local ringcolor = "ivory";
			local color = "ivory";
			local markedcolor = "red";
			local favoredcolor = "blue";
			local admins = {};
			
			if (ringcolors[ofaithstr]) then
				ringcolor = ringcolors[ofaithstr]
			end;
			
			if (faithcolors[faith_str]) then
				color = faithcolors[faith_str];
			end;
			
			if favored then
				markedstr = " FAVORED";
				markedcolor = "mediumblue";
			elseif marked then
				markedstr = " MARKED";
			end

			for _, v in _player.Iterator() do
				if (Clockwork.player:IsAdmin(v)) then
					admins[#admins + 1] = v;
				end;
			end;
			
			local plycol = _team.GetColor(player:Team());
			
			if (player:GetFaction() == FACTION_GOREIC) then
				plycol = plycol:Lighten(100)
			end;

			-- Make it work with imbeciles!
			if player:HasTrait("imbecile") then
				local imbecileText = message;
				
				if #imbecileText > 2 then
					local fillers = {"uh", "uhh", "uhhh", "erm", "ehh", "like"};
					local suffixes = {".", ",", ";", "!", ":", "?"};
					local splitText = string.Split(imbecileText, " ");
					local tourettes = {"ASSHOLE", "FUCKING", "FUCK", "ASS", "BITCH", "CUNT", "PENIS"};
					local vowels = {["upper"] = {"A", "E", "I", "O", "U"}, ["lower"] = {"a", "e", "i", "o", "u"}};
					
					for i = 1, #splitText do
						local currentSplit = splitText[i];
						
						if math.random(1, 2) == 1 then
							for j = 1, #currentSplit do
								for k = 1, 5 do
									local vowelShuffle = math.random(1, 5);
									
									currentSplit = string.gsub(currentSplit, vowels["upper"][k], vowels["upper"][vowelShuffle]);
									currentSplit = string.gsub(currentSplit, vowels["lower"][k], vowels["lower"][vowelShuffle]);
								end
							end
						elseif #currentSplit >= 2 then
							local characterToRepeat = math.random(1, #currentSplit - 1);
							local str = string.utf8sub(currentSplit, characterToRepeat, characterToRepeat);
							
							currentSplit = string.gsub(string.utf8setchar(currentSplit, characterToRepeat, "#"), "#", str.."-"..string.utf8lower(str));
						end
						
						if #currentSplit >= 2 and math.random(1, 3) == 1 then
							local suffix_found = false;
							
							for j = 1, #suffixes do
								if string.utf8endswith(currentSplit, suffixes[j]) then
									suffix_found = true;
									break;
								end
							end
							
							if not suffix_found then
								if math.random(1, 10) == 1 then
									currentSplit = currentSplit.."- "..tourettes[math.random(1, #tourettes)].."!";
								else
									currentSplit = fillers[math.random(1, #fillers)];
								end
							end
						end
						
						if math.random(1, 6) == 1 then
							currentSplit = string.utf8upper(currentSplit);
						end
						
						splitText[i] = currentSplit;
					end
					
					message = table.concat(splitText, " ");
				end
			end
			
			Schema:EasyText(admins, ringcolor, "[PRAYER ", color, faith_str, markedcolor, markedstr, ringcolor, "] ", plycol, player:Name(), "ivory", ": "..message)
			Schema:EasyText(player, color, "You make a prayer: \""..message.."\"")
			
			Clockwork.chatBox:AddInTargetRadius(player, "me", "murmure une courte prière aux dieux.", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
			
			local nextPrayerBonus = player:GetCharacterData("nextPrayerBonus", 0);
			
			if player:GetCharacterData("charPlayTime", 0) >= nextPrayerBonus then
				-- 15 minutes between prayer bonuses.
				player:SetCharacterData("nextPrayerBonus", player:GetCharacterData("charPlayTime", 0) + 900);
				
				player:HandleXP(10);
				
				if cwCharacterNeeds then
					player:HandleNeed("corruption", -3);
				end
			end
		else
			Schema:EasyText(player, "chocolate", "Vous devez choisir une sous-foi dans le menu 'Croyances' avant de pouvoir prier !");
		end
	else
		Schema:EasyText(player, "chocolate", "Tu n'as aucun dieu à qui prier !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PrayReply");
COMMAND.tip = "Envoyer un message à un joueur en tant que réponse à une prière.";
COMMAND.text = "<string Name> <string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.access = "s";
COMMAND.arguments = 2;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local message = string.upper("\""..table.concat(arguments, " ", 2).."\"");

		if target ~= player then
			Clockwork.chatBox:Add(player, nil, "prayerreply", message);
		end
		
		Clockwork.chatBox:Add(target, nil, "prayerreply", message);

		local admins = {}
		for _, v in _player.Iterator() do
			if (Clockwork.player:IsAdmin(v)) then
				admins[#admins + 1] = v;
			end;
		end;
		
		local t = _team.GetColor(target:Team())
		local p = _team.GetColor(player:Team())
		
		if (target:GetFaction() == FACTION_GOREIC) then
		t = t:Lighten(75);
		end;
		if (player:GetFaction() == FACTION_GOREIC) then
			p = p:Lighten(75);
		end;
		
		
		Schema:EasyText(admins, t, "[PRAYER RESPONSE] ", p, player:Name(), "ivory", " to ", t, target:Name(), "ivory", ": "..message)
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("Relay");
COMMAND.tip = "Parle à tes frères Voltistes par le biais de signaux électriques aériens.";
COMMAND.text = "<string Message>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;
COMMAND.alias = {"RE"};
COMMAND.isChatCommand = true;
COMMAND.subfaith = "Voltism";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local subfaith = player:GetSubfaith();
	
	if subfaith == "Voltism" then
		if player:HasBelief("wire_therapy") then
			local message = "\""..table.concat(arguments, " ", 1).."\"";
			local listeners = {};

			for _, v in _player.Iterator() do
				if v:HasInitialized() and v:Alive() and ((v:GetSubfaith() == "Voltism") or Clockwork.player:HasFlags(v, "L")) then
					table.insert(listeners, v);
					v:SendLua([[Clockwork.Client:EmitSound("buttons/combine_button"..math.random(2, 3)..".wav", 90, 150)]]);
				end;
			end;
			
			Clockwork.chatBox:Add(listeners, player, "relay", message);
		else
			Schema:EasyText(player, "chocolate", "Vous devez avoir la croyance 'Wire Therapy' avant de pouvoir relayer !");
		end
	else
		Schema:EasyText(player, "firebrick", "Vous n'êtes pas de la bonne foi pour faire cela !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("Warcry");
	COMMAND.tip = "Terrifiez vos ennemis jusqu'à la soumission avec un cri sauvage. Cela affectera négativement la santé mentale de toute personne à portée de voix qui ne partage pas votre foi.";
	COMMAND.flags = CMD_DEFAULT;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if player:WaterLevel() >= 3 then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas faire cela sous l'eau !");
		
			return false;
		end
		
		if player:GetNetVar("tied") != 0 then
			Schema:EasyText(player, "firebrick", "Tu n'as pas la volonté de faire cela !");
		
			return false;
		end;
	
		local faction = player:GetNetVar("kinisgerOverride") or player:GetFaction();
		local subfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
		local faith = player:GetFaith();
		local player_has_belief = false;
		local player_has_daring_trout = player:HasBelief("daring_trout");
		local player_has_fearsome_wolf = player:HasBelief("fearsome_wolf");
		local player_has_watchful_raven = player:HasBelief("watchful_raven");
		local sanity_debuff;
		local warcry_beliefs;
		local affected_players = {};
		
		if player:GetNetVar("kinisgerOverride") then
			if player:GetNetVar("kinisgerOverride") == "Goreic Warrior" then
				if player:GetNetVar("kinisgerOverrideSubfaction") ~= "Clan Reaver" then
					faith = "Faith of the Family";
					sanity_debuff = -10;
					warcry_beliefs = {};
					player_has_belief = true;
				else
					sanity_debuff = -35;
					warcry_beliefs = {"sadism"};
				end
			elseif player:GetNetVar("kinisgerOverride") == "Hillkeeper" then
				warcry_beliefs = {}
				player_has_belief = true;
			else
				sanity_debuff = -35;
				warcry_beliefs = {"sadism"};
			end
		else
			if faith == "Faith of the Family" then
				if faction == "Hillkeeper" then
					warcry_beliefs = {}
					player_has_belief = true;
				else
					sanity_debuff = -10;
					warcry_beliefs = {"father", "mother", "old_son", "young_son", "sister"};
				end
			elseif faith == "Faith of the Dark" then
				sanity_debuff = -35;
				warcry_beliefs = {"sadism"};
			elseif faith == "Faith of the Light" and (faction == "Hillkeeper" or subfaction == "Low Ministry") then
				warcry_beliefs = {}
				player_has_belief = true;
			else
				Schema:EasyText(player, "firebrick", "Vous n'avez pas la foi requise pour accomplir cela !");
				return;
			end
		end
		
		if faction == "Hillkeeper" or subfaction == "Low Ministry" then
			player_has_belief = true
		end
		
		for i = 1, #warcry_beliefs do
			if player:HasBelief(warcry_beliefs[i]) then
				player_has_belief = true;
				break;
			end
		end
		
		if player_has_belief or subfaction == "Clan Grock" then
			local curTime = CurTime();
			
			if (!player.lastWarCry) or player.lastWarCry < curTime then
				local radius = config.Get("talk_radius"):Get() * 2;
				local playerPos = player:GetPos();
				
				player:HandleSanity(2);
				
				if player_has_watchful_raven and faction == "Hillkeeper" then
					player:HandleSanity(5);
					player:HandleStamina(10);
					player.ravenBuff = true;
					
					timer.Create("RavenTimer_"..player:EntIndex(), 15, 1, function()
						if IsValid(player) then
							player.ravenBuff = false;
						end
					end);
				end
				
				for k, v in pairs(ents.FindInSphere(playerPos, radius)) do
					local isPlayer = v:IsPlayer();
					
					if (isPlayer and v:GetMoveType() == MOVETYPE_WALK) then
						local immune = v == player;
						local vFaction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
						local vSubfaction = v:GetNetVar("kinisgerOverrideSubfaction") or v:GetSubfaction();
						
						if faction ~= "Hillkeeper" then
							if player_has_watchful_raven and Clockwork.player:DoesRecognise(v, player) then
								v:HandleSanity(5);
								v:HandleStamina(10);
								v.ravenBuff = true;
								
								table.insert(affected_players, v);
								
								timer.Create("RavenTimer_"..v:EntIndex(), 15, 1, function()
									if IsValid(v) then
										v.ravenBuff = false;
										Clockwork.hint:Send(v, "'Watchful is the Raven' has worn off...", 10, Color(175, 100, 100), true, true);
									end
								end);
							end
						end
						
						if subfaction == "Clan Grock" then
							local clothesItem = player:GetClothesEquipped()
					
							if clothesItem and table.HasValue(clothesItem.attributes, "iconoclast") and !player:GetShieldEquipped() then
								local targetSubfaction = v:GetNetVar("kinisgerOverrideSubfaction") or v:GetSubfaction();
								
								if targetSubfaction == "Clan Grock" then
									v:HandleStamina(25);
									v.iconoclastBuff = true;
									hook.Run("RunModifyPlayerSpeed", v, v.cwInfoTable, true);
								
									table.insert(affected_players, v);
									timer.Create("IconoclastTimer_"..v:EntIndex(), 15, 1, function()
										if IsValid(v) then
											v.iconoclastBuff = false;
											hook.Run("RunModifyPlayerSpeed", v, v.cwInfoTable, true);
											Clockwork.hint:Send(v, "'Iconoclast' has worn off...", 10, Color(175, 100, 100), true, true);
										end
									end);
								end
							end
						end 
						
						-- Make fearsome wolf damage buff apply to everyone irrespective of faith or faction.
						if player_has_fearsome_wolf then
							if not player.warCryVictims then
								player.warCryVictims = {};
							end
							
							if !immune then
								table.insert(player.warCryVictims, v);
							end
						end
							
						if (faction == "Wanderer" or vFaction == "Wanderer") and v:GetFaith() ~= faith then
							-- Kinisgers can twisted warcry if disguised as a Reaver.
							if faith == "Faith of the Dark" then
								if faction == vFaction then
									immune = true;
								elseif v.banners then
									for k2, v2 in pairs(v.banners) do
										if v2 == "glazic" then
											if vFaction == "Gatekeeper" or vFaction == "Pope Adyssa's Gatekeepers" or vFaction == "Hillkeeper" or vFaction == "Holy Hierarchy" then
												immune = true;
											
												break;
											end
										end
									end
								end
							
								if !immune then
									if Schema.towerSafeZoneEnabled or !v:InTower() then
										-- Cooldown for getting sanity debuff.
										if !v.lastWarCried or v.lastWarCried < curTime - 60 then
											v.lastWarCried = curTime;
											
											if v:HasBelief("prudence") then
												v:HandleSanity(math.Round(sanity_debuff / 2));
											else
												v:HandleSanity(sanity_debuff);
											end
										end
									end
								
									v:Disorient(5.5);
								end
							elseif faith == "Faith of the Family" then
								if faction == "Hillkeeper" then
									if vFaction == "Hillkeeper" or vFaction == "Holy Hierarchy" or v:GetFaith() == "Faith of the Light" then
										immune = true;
									end
								elseif faction == vFaction or (faction == "Wanderer" and vSubfaction == "Clan Reaver") then
									immune = true;
								elseif v.banners then
									for k2, v2 in pairs(v.banners) do
										if v2 == "glazic" then
											if vFaction == "Gatekeeper" or vFaction == "Pope Adyssa's Gatekeepers" or vFaction == "Hillkeeper" or vFaction == "Holy Hierarchy" then
												immune = true;
											
												break;
											end
										end
									end
								end
								
								if !immune then
									if Schema.towerSafeZoneEnabled or !v:InTower() then
										-- Cooldown for getting sanity debuff.
										if !v.lastWarCried or v.lastWarCried < curTime - 60 then
											v.lastWarCried = curTime;
											
											if v:HasBelief("prudence") then
												v:HandleSanity(math.Round(sanity_debuff / 2));
											else
												v:HandleSanity(sanity_debuff);
											end
										end
									end
								
									if subfaction == "Clan Grock" then
										if !v:HasBelief("saintly_composure") then
											v:Disorient(1);
										end
									else
										v:Disorient(2.5);
									end
								end
							--[[elseif faith == "Faith of the Light" then
								if vFaction == "Hillkeeper" or vFaction == "Gatekeeper" or vFaction == "Holy Hierarchy" then
									immune = true
								end

								if !immune then
									if Schema.towerSafeZoneEnabled or !v:InTower() then
										if !v.lastWarCried or v.lastWarCried < curTime - 5 then
											v.lastWarCried = curTime;
											if !v:HasBelief("saintly_composure") then
												v:CustomDisorient(1.25,0.8,3);
											end
										end
									end
								end]]--
							end
						end
					elseif v:IsNPC() or v:IsNextBot() then
						if player_has_fearsome_wolf then
							if not player.warCryVictims then
								player.warCryVictims = {};
							end
							
							table.insert(player.warCryVictims, v);
						end
					end
				end

				if (faction == "Hillkeeper") then
					if (faith == "Faith of the Family" and player.bloodHowlActive) then
						if cwStamina then
							player:HandleStamina(50);
							player:ModifyBloodLevel(-150);
						end
					end

					player:EmitSound((Clockwork.player:HasFlags(player, "~") and "warcries/warcry"..math.random(1, 16)..".mp3" or "glazecries/hillcry_"..math.random(1, 20)..".wav"), 100, math.random(90, 105));

					Clockwork.chatBox:AddInTargetRadius(player, "me", "pousse un cri retentissant !", playerPos, radius);
				elseif (subfaction == "Low Ministry") then
					player:EmitSound("lmcries/lm_cry" .. math.random(1,19) .. ".mp3", 100, math.random(90, 105));
					Clockwork.chatBox:AddInTargetRadius(player, "me", "pousse un cri déchirant !", playerPos, radius);
				elseif subfaction == "Clan Grock" then
					local clothesItem = player:GetClothesEquipped()
					
					if clothesItem and table.HasValue(clothesItem.attributes, "iconoclast") and !player:GetShieldEquipped() and cwStamina then
						player:HandleSanity(-5);
						local warcrySounds = {"kronos/sawcrazy/random2.wav", "kronos/sawcrazy/random1.wav", "kronos/sawrunner/sawrunner_attack2.wav", "kronos/sawrunner/sawrunner_alert30.wav", "kronos/boss/mace_scream.wav"}
						local selectedSound = warcrySounds[math.random(#warcrySounds)]
						player:EmitSound(selectedSound, 100, math.random(60, 75));
						Clockwork.chatBox:AddInTargetRadius(player, "me", "hurle et gémit dans une parodie de prière !", playerPos, radius);
						netstream.Start(player, "UpgradedWarcry", affected_players);
					else
						player:HandleStamina(25);
						player:EmitSound("warcries/grock_warcry"..math.random(1, 11)..".ogg", 100, math.random(60, 75));
						Clockwork.chatBox:AddInTargetRadius(player, "me", "crie sauvagement !", playerPos, radius);
					end
				-- Kinisgers can FotF warcry if not disguised as a reaver.
				elseif faith == "Faith of the Family" then
					local warcryText = "lets out a feral warcry!"
					local warcryPitch = math.random(90, 105)
					local warcrySound = "warcries/warcry"..math.random(1, 16)..".mp3"
					
					if player:GetGender() == GENDER_MALE then
						if faction != "Goreic Warrior" then
							warcrySound = "warcries/jambw_yell_"..math.random(1, 17)..".mp3"								
						end
					else
						warcrySound = "warcries/warcry_female"..math.random(1, 16)..".mp3"
					end
					
					if player.bloodHowlActive then
						if cwStamina then
							warcryText = "howls a feral warcry and spits blood!"
							warcryPitch = math.random(70, 80)
							player:HandleStamina(50);
							
							if !player.opponent then
								player:ModifyBloodLevel(-150);
							end
						end
					end

					local clothesItem = player:GetClothesEquipped()

					if (clothesItem) then
						if clothesItem.attributes then
							if table.HasValue(clothesItem.attributes, "rage") and !player:GetShieldEquipped() and cwStamina then
								warcryText = "cries out in fearless rage!"
								warcrySound = "begotten/berserker/new/"..math.random(1, 5)..".wav"
								warcryPitch = math.random(90, 100)
								-- if !player.bloodHowlActive then
									player:HandleStamina(15);
								-- end
							end
						end
					end

					if player:HasBelief("deceitful_snake") then
						if player.deceitfulLastDamages then
							local healthToRestore = 0;
							
							for i, v in ipairs(player.deceitfulLastDamages) do
								if v.damageTime >= (curTime - 2) then
									if player.abyssalHowlActive then
										healthToRestore = healthToRestore + (v.damage);
									else
										healthToRestore = healthToRestore + (v.damage / 1.43);
									end
								end
							end
							
							if healthToRestore > 0 then
								player:SetHealth(math.min(player:Health() + healthToRestore, player:GetMaxHealth()));
							end
							
							if healthToRestore >= 15 then
								warcrySound = "vj_dm_giantworm/worm_strikingarch"..math.random(1, 2)..".wav"
								warcryText = "growls with the voice of an abyssal horror, and their flesh shifts and regrows itself!"
							end
						end		
					end
					
					if player_has_watchful_raven then						
						warcryText = "speaks in tongues with the voice of a vengeful spirit of Nature!"
						warcrySound = "warcries/motherwarcry"..math.random(1, 9)..".mp3"
						
						netstream.Start(player, "UpgradedWarcry", affected_players);
					end
					
					player:EmitSound(warcrySound, 100, warcryPitch);
					Clockwork.chatBox:AddInTargetRadius(player, "me", warcryText, playerPos, radius);
				else
					player:HandleSanity(-5);
					player:EmitSound("warcries/twistedwarcry"..math.random(1, 5)..".mp3", 100, math.random(90, 105));
					
					Clockwork.chatBox:AddInTargetRadius(player, "me", "pousse un cri de guerre déformé, hurlant avec les voix de ses victimes passées !", playerPos, radius);
				end
				
				if player_has_daring_trout then
					player.daringTroutActive = true;
					
					timer.Create("DaringTroutTimer_"..player:EntIndex(), 20.5, 1, function()
						if IsValid(player) then
							if player.daringTroutActive then
								player.daringTroutActive = nil;
								Clockwork.hint:Send(player, "'Daring is the Trout' has worn off...", 10, Color(175, 100, 100), true, true);
							end
						end
					end);
				end
				
				if player_has_fearsome_wolf then
					--netstream.Start(player, "UpgradedWarcry");
					
					player.fearsomeSpeed = true;
				
					hook.Run("RunModifyPlayerSpeed", player, player.cwInfoTable, true);
				
					timer.Create("FearsomeWolfTimer_"..player:EntIndex(), 20.5, 1, function()
						if IsValid(player) then
							player.fearsomeSpeed = nil;
							player.warCryVictims = nil;
							
							hook.Run("RunModifyPlayerSpeed", player, player.cwInfoTable, true);
							Clockwork.hint:Send(player, "'Fearsome is the Wolf' has worn off...", 10, Color(175, 100, 100), true, true);
						end
					end);
				end
				
				player.lastWarCry = curTime + 60;
			else
				Schema:EasyText(player, "firebrick", "Vous ne pouvez pas crier à nouveau avant"..tostring(math.ceil(player.lastWarCry - curTime)).." more seconds!");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous n'êtes pas du bon sous-courant religieux pour faire cela !");
		end
	end;
	
	if CLIENT then
		Clockwork.ConVars.Binds.WARCRY = Clockwork.kernel:CreateClientConVar("cwWarcryBind", 0, true, true)
		Clockwork.setting:AddKeyBinding("Key Bindings", "Warcry: ", "cwWarcryBind", "cwsay /warcry");
	end
COMMAND:Register();

local COMMAND = Clockwork.command:New("Electrocute");
COMMAND.tip = "Électrocutez-vous pour stimuler votre esprit. Cela vous rendra un peu de santé mentale mais vous infligera des dégâts. Requiert un objet 'Tech' ou 'Technocraft' dans votre inventaire, et consommera une petite partie de sa durabilité.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 0;
COMMAND.subfaith = "Voltism";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local curTime = CurTime();

	if !player.nextFlagellate or player.nextFlagellate < curTime then
		if player:HasBelief("voltism") then
			if player:GetNetVar("tied") == 0 and !player:IsRagdolled() then
				local itemList = Clockwork.inventory:GetItemsAsList(player:GetInventory());
				local techItemTable;
				local isTechnocraft = false;

				for k, v in pairs(itemList) do
					if v.uniqueID == "tech" then
						techItemTable = v;
						break;
					end
				end
				
				if !techItemTable then
					for k, v in pairs(itemList) do
						if v.uniqueID == "technocraft" then
							isTechnocraft = true;
							techItemTable = v;
							break;
						end
					end
				end

				if techItemTable then
					--player:TakeDamage(8);
					player:HandleSanity(10);
					
					player.flagellating = true;
					player.ignoreConditionLoss = true;
					Schema:DoTesla(player, true);
					player.flagellating = false;
					player.ignoreConditionLoss = false;
					
					if player:HasBelief("wriggle_fucking_eel") then
						player:StopAllBleeding();
						player:HandleNeed("corruption", -2);
						player:HandleNeed("sleep", -5);
					end
					
					local condition;
					
					if isTechnocraft then
						condition = techItemTable:GetCondition() - 1;
					else
						condition = techItemTable:GetCondition() - 5;
					end
					
					player:HandleXP(3);

					if condition <= 0 then
						player:TakeItem(techItemTable);
					else
						techItemTable:SetCondition(condition);
					end
					
					Clockwork.chatBox:AddInTargetRadius(player, "me", "commence à convulser sous les arcs électriques qui jaillissent de son corps !", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
					
					player.nextFlagellate = curTime + 1;
				else
					Schema:EasyText(player, "chocolate", "Vous n'avez pas d'objet 'Tech' dans votre inventaire !");
				end
			else
				Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous électrocuter maintenant !");
			end;
		else
			Schema:EasyText(player, "firebrick", "Tu n'as pas la volonté nécessaire pour faire cela !");
		end
		
		player.nextFlagellate = curTime + 1;
	else
		Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous électrocuter maintenant !");
	end
end;

if CLIENT then
	Clockwork.ConVars.Binds.ELECTROCUTE = Clockwork.kernel:CreateClientConVar("cwElectrocuteBind", 0, true, true)
	Clockwork.setting:AddKeyBinding("Key Bindings", "Electrocute: ", "cwElectrocuteBind", "cwsay /electrocute");
end

COMMAND:Register();

local COMMAND = Clockwork.command:New("Flagellate");
COMMAND.tip = "Expiez vos péchés en flagellant votre chair.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 0;
COMMAND.subfaith = "Sol Orthodoxy";

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local curTime = CurTime();
	
	if !player.nextFlagellate or player.nextFlagellate < curTime then
		if player:HasBelief("flagellant") or player:GetSubfaction() == "Kinisger" then
			if player:GetNetVar("tied") == 0 and !player:IsRagdolled() then
				if player.iFrames then
					Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous flageller en roulant !");
					return false;
				end
			
				local activeWeapon = player:GetActiveWeapon();
				
				if activeWeapon:IsValid() then
					if activeWeapon:GetClass() == "cw_lantern" and player:HasBelief("extinctionist") then
						local weaponItemTable = item.GetByWeapon(activeWeapon);
						
						if weaponItemTable then
							local currentOil = weaponItemTable:GetData("oil");
							local selfless = "himself";
							
							if (player:GetGender() == GENDER_FEMALE) then
								selfless = "herself";
							end
							
							if currentOil >= 1 then
								local damageInfo = DamageInfo();
								
								player:Ignite(15);
								weaponItemTable:SetData("oil", math.Clamp(currentOil - math.random(10, 25), 0, 100));
								player:SetNetVar("oil", math.Round(weaponItemTable:GetData("oil"), 0));
								player:EmitSound("ambient/fire/gascan_ignite1.wav");
								
								Clockwork.chatBox:AddInTargetRadius(player, "me", "flagellés"..selfless.." avec une lanterne allumée, s’arrogeant d’huile brûlante et s’embrasant soudainement !", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
								
								return true;
							else
								local damage = math.random(3,8);
								if (player:Health() - 10) >= damage or player.scornificationismActive then -- Fix this later (does not account for damage buffs)
									player:TakeDamage(damage);
									Clockwork.chatBox:AddInTargetRadius(player, "me", "flagellés"..selfless.." avec une lanterne éteinte !", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
									player.nextFlagellate = curTime + 1;
									return true;
								else
									Schema:EasyText(player, "firebrick", "Tu ne peux pas te flageller à mort !");
									return false
								end
							end
						end
					elseif activeWeapon:GetClass() == "begotten_fists" or !activeWeapon.IsABegottenMelee then
						Schema:EasyText(player, "firebrick", "Vous ne pouvez pas flageller avec cette arme !");
						return false;
					end
				else
					Schema:EasyText(player, "firebrick", "Vous ne pouvez pas flageller avec cette arme !");
					return false;
				end
				
				if player:GetNetVar("Guardening") then
					Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous flageller tout en bloquant !");
					return false;
				end
				
				local attacktable = GetTable(activeWeapon.AttackTable)
				
				if attacktable then
					local damage = attacktable["primarydamage"];
					local damagetype = attacktable["dmgtype"];
					local attacksoundtable = GetSoundTable(activeWeapon.AttackSoundTable);
										
					local d = DamageInfo()
					d:SetDamage(damage * 0.5);
					d:SetAttacker(player);
					d:SetDamageType(damagetype);
					d:SetDamagePosition(player:GetPos() + Vector(0, 0, 48));
					d:SetInflictor(activeWeapon);
					
					if (player:Health() - 18) >= d:GetDamage() or player.scornificationismActive then -- Fix this later (does not account for damage buffs)
						player.flagellating = true;
						player.ignoreConditionLoss = true;
						player:TakeDamageInfo(d);
						player.flagellating = false;
						player.ignoreConditionLoss = false;
						
						if attacksoundtable then
							player:EmitSound(attacksoundtable["hitbody"][math.random(1, #attacksoundtable["hitbody"])]);
						end
						
						if cwSanity then
							player:HandleSanity(math.Round(d:GetDamage() / 3));
						end
						
						local selfless = "himself";
						
						if (player:GetGender() == GENDER_FEMALE) then
							selfless = "herself";
						end
						
						-- Bellhammer special
						if activeWeapon.IsBellHammer then
							timer.Simple(0.2, function() if player:IsValid() then
								player:EmitSound("meleesounds/bell.mp3")
							end end)
							
							local entities = ents.FindInSphere(player:GetPos(), 512);
							
							for i, v in ipairs(entities) do
								if v:IsPlayer() and v:Alive() then
									v:Disorient(5);
								end
							end
							
							Clockwork.chatBox:AddInTargetRadius(player, "me", "flagellés"..selfless.." avec un coup de marteau tonitruant sur leur cloche !", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
						else
							Clockwork.chatBox:AddInTargetRadius(player, "me", "flagellés"..selfless.."!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
						end
					else
						Schema:EasyText(player, "firebrick", "Tu ne peux pas te flageller à mort !");
						return false
					end					
					player.nextFlagellate = curTime + (attacktable["delay"] or 1);
				else
					Schema:EasyText(player, "firebrick", "Vous ne pouvez pas flageller avec cette arme !");
				end
			else
				Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous flageller maintenant !");
			end;
		else
			Schema:EasyText(player, "firebrick", "Tu n'as pas la volonté nécessaire pour faire cela !");
		end
		
		player.nextFlagellate = curTime + 1;
	else
		Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous flageller maintenant !");
	end
end;

if CLIENT then
	Clockwork.ConVars.Binds.FLAGELLATE = Clockwork.kernel:CreateClientConVar("cwFlagellateBind", 0, true, true)
	Clockwork.setting:AddKeyBinding("Key Bindings", "Flagellate: ", "cwFlagellateBind", "cwsay /flagellate");
end

COMMAND:Register();

local COMMAND = Clockwork.command:New("Suicide");
COMMAND.tip = "Commets un putain de suicide et mets fin à ta misérable existence de merde.";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player:HasBelief("sol_orthodoxy") then
		if player:GetNetVar("tied") == 0 and !player:IsRagdolled() then
			if player:IsFrozen() or player:GetNWBool("bliz_frozen") then
				Schema:EasyText(player, "firebrick", "Vous ne pouvez pas faire cela maintenant !");
			
				return false;
			--[[elseif player.soulscorchActive then
				Schema:EasyText(player, "firebrick", "Vous ne pouvez pas vous suicider tant que 'Soulscorch' est actif !");
			
				return false;]]--
			end

			player:CommitSuicide()
		else
			Schema:EasyText(player, "firebrick", "Pourquoi tu te foutrais à te suicider maintenant ? Va te faire foutre.");
		end;
	else
		Schema:EasyText(player, "firebrick", "Tu n'as pas la volonté nécessaire pour faire cela !");
	end
end;

COMMAND:Register();

-- Properties
properties.Add("add_faith", {
	MenuLabel = "Add Faith (XP)",
	Order = 10,
	MenuIcon = "icon16/award_star_add.png",
	Filter = function(self, ent, ply)
		if !IsValid(ent) or !IsValid(ply) or !ply:IsAdmin() then return false end
		if !ent:IsPlayer() then
			if Clockwork.entity:IsPlayerRagdoll(ent) then
				ent = Clockwork.entity:GetPlayer(ent);
			else
				return false;
			end
		end

		return ent:Alive();
	end,
	Action = function(self, ent)
		if IsValid(ent) then
			if !ent:IsPlayer() then
				if Clockwork.entity:IsPlayerRagdoll(ent) then
					ent = Clockwork.entity:GetPlayer(ent);
				else
					return false;
				end
			end
		
			Derma_StringRequest(ent:Name(), "How much faith (xp) would you like to add?", nil, function(xp)
				if IsValid(ent) then
					Clockwork.kernel:RunCommand("CharAddExperience", ent:Name(), xp)
				end
			end)
		end
	end,
});

properties.Add("open_belief_tree", {
	MenuLabel = "Open Belief Tree",
	Order = 100,
	MenuIcon = "icon16/bell.png",
	Filter = function(self, ent, ply)
		if !IsValid(ent) or !IsValid(ply) or !ply:IsAdmin() then return false end
		if !ent:IsPlayer() then
			if Clockwork.entity:IsPlayerRagdoll(ent) then
				ent = Clockwork.entity:GetPlayer(ent);
			else
				return false;
			end
		end

		return true;
	end,
	Action = function(self, ent)
		if IsValid(ent) then
			if !ent:IsPlayer() then
				if Clockwork.entity:IsPlayerRagdoll(ent) then
					ent = Clockwork.entity:GetPlayer(ent);
				else
					return false;
				end
			end
		
			Clockwork.kernel:RunCommand("CharOpenBeliefTree", ent:Name())
		end
	end,
});