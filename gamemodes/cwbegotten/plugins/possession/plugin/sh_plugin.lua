--[[
	Begotten III: Jesus Wept
--]]

PLUGIN:SetGlobalAlias("cwPossession");

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

function cwPossession:StartCommand(player, ucmd)
	if IsValid(player) then
		local plyTab = player:GetTable();
		local possessor;
		local victim;
		
		if SERVER then
			possessor = plyTab.possessor;
			victim = plyTab.victim;
		else
			if plyTab.possessor then
				possessor = plyTab.possessor;
				victim = player;
			elseif plyTab.victim then
				possessor = player;
				victim = plyTab.victim;
			end
		end
		
		if IsValid(victim) then 
			if victim:Alive() then
				plyTab.attacking = ucmd:KeyDown(IN_ATTACK)
				plyTab.blocking = ucmd:KeyDown(IN_ATTACK2);
				plyTab.parrying = ucmd:KeyDown(IN_RELOAD)
				plyTab.changeStance = ucmd:KeyDown(IN_ATTACK2) and ucmd:KeyDown(IN_USE);
				plyTab.use = ucmd:KeyDown(IN_USE);
				plyTab.jumping = ucmd:KeyDown(IN_JUMP)
				plyTab.crouching = ucmd:KeyDown(IN_DUCK)
				plyTab.running = ucmd:KeyDown(IN_SPEED);
				plyTab.forward = ucmd:KeyDown(IN_FORWARD)
				plyTab.backward = ucmd:KeyDown(IN_BACK)
				plyTab.left = ucmd:KeyDown(IN_MOVELEFT)
				plyTab.right = ucmd:KeyDown(IN_MOVERIGHT)
				plyTab.movementForward = ucmd:GetForwardMove()
				plyTab.sidewaysMovement = ucmd:GetSideMove()
				plyTab.upMove = ucmd:GetUpMove()
				plyTab.MouseX = ucmd:GetMouseX()
				plyTab.MouseY = ucmd:GetMouseY()
				
				if SERVER then
					plyTab.demonMove = ucmd
				end

				ucmd:SetViewAngles(victim:EyeAngles())
				player:SetPos(victim:GetPos() + victim:GetAimVector() * 10)
				
				if SERVER then
					ucmd:ClearButtons()
					player:Spectate(OBS_MODE_IN_EYE)
					player:SpectateEntity(victim)
				end
			end
		elseif IsValid(possessor) then
			-- The victim has ceased to be.
			if SERVER and !IsValid(possessor.victim) then
				possessor:Spectate(0);
				possessor:UnSpectate();
		
				cwObserverMode:MakePlayerEnterObserverMode(possessor);
				
				for i = 1, #cwPossession.possessedPlayers do
					if !IsValid(cwPossession.possessedPlayers[i]) then
						table.remove(cwPossession.possessedPlayers, i);
						break;
					end
				end
			end
			
			victim = player;
		end
			
		if player == victim and IsValid(possessor) and victim:Alive() then
			ucmd:ClearButtons();
			ucmd:ClearMovement();
			
			if possessor.attacking then
				ucmd:SetButtons(ucmd:GetButtons() + IN_ATTACK)
			end
			
			if possessor.blocking then
				ucmd:SetButtons(ucmd:GetButtons() + IN_ATTACK2)
			end
			
			if possessor.parrying then
				ucmd:SetButtons(ucmd:GetButtons() + IN_RELOAD)
			end
			
			if SERVER then
				local curTime = CurTime();
				
				if possessor.changeStance then
					local activeWeapon = player:GetActiveWeapon();
					
					if activeWeapon:IsValid() then
						local attacktable = GetTable(activeWeapon.AttackTable);

						if (attackTable and attackTable["canaltattack"] == true) then
							if !possessor.changeStanceTimer or possessor.changeStanceTimer <= curTime then
								possessor.changeStanceTimer = curTime + 1;
								
								if !player:GetNetVar("ThrustStance") then
									if activeWeapon.isJavelin then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to melee stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to melee stance.")
									elseif activeWeapon.isMeleeFirearm then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to firing stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to firing stance.")
									elseif activeWeapon.CanSwipeAttack == true then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to swiping stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to swiping stance.")
									else
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to thrusting stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to thrusting stance.")
									end
									
									player:SetNetVar("ThrustStance", true);
									
									if activeWeapon.OnMeleeStanceChanged then
										activeWeapon:OnMeleeStanceChanged("thrust_swing");
									end
								else
									if activeWeapon.isJavelin then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to throwing stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to throwing stance.")
									elseif activeWeapon.isJavelin then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to melee stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to melee stance.")
									elseif activeWeapon.CanSwipeAttack == true then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to thrusting stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to thrusting stance.")
									elseif attacktable["dmgtype"] == 128 then
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to bludgeoning stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to bludgeoning stance.")
									else
										player:PrintMessage(HUD_PRINTTALK, "*** Switched to slashing stance.")
										possessor:PrintMessage(HUD_PRINTTALK, "*** Switched to slashing stance.")
									end
									
									player:SetNetVar("ThrustStance", false);
									
									if activeWeapon.OnMeleeStanceChanged then
										activeWeapon:OnMeleeStanceChanged("reg_swing");
									end
								end
							end
						end
					end
				end
				
				if possessor.jumping and victim:IsRagdolled() then
					if (victim:GetRagdollState() == RAGDOLL_FALLENOVER and Clockwork.player:GetAction(victim) != "unragdoll") then
						if (hook.Run("PlayerCanGetUp", victim)) then
							local get_up_time = 5;
							
							if cwBeliefs and victim:HasBelief("dexterity") then
								get_up_time = get_up_time * 0.67;
							end
							
							Clockwork.player:SetUnragdollTime(victim, get_up_time);
							hook.Run("PlayerStartGetUp", victim);
						end;
					end;
				end
			end
			
			if(possessor.crouching and !ucmd:KeyDown(IN_DUCK)) and !possessor.changeStance then ucmd:SetButtons(ucmd:GetButtons() + IN_DUCK) end
			if(possessor.jumping and !ucmd:KeyDown(IN_JUMP)) then ucmd:SetButtons(ucmd:GetButtons() + IN_JUMP) end
			if(possessor.running and !ucmd:KeyDown(IN_SPEED)) then ucmd:SetButtons(ucmd:GetButtons() + IN_SPEED) end
			if(possessor.use and !ucmd:KeyDown(IN_USE)) and !possessor.changeStance then ucmd:SetButtons(ucmd:GetButtons() + IN_USE) end
			
			if CLIENT and player == victim then
				possessor.viewAngles = possessor:EyeAngles();
			else
				possessor.viewAngles = Angle(possessor.viewAngles.p + possessor.MouseY / 30, possessor.viewAngles.y - possessor.MouseX / 30, 0)
				ucmd:SetForwardMove(possessor.movementForward)
				ucmd:SetSideMove(possessor.sidewaysMovement)
				ucmd:SetUpMove(possessor.upMove)
			end

			possessor.viewAngles.p = math.Clamp(possessor.viewAngles.p, -89, 89)
			ucmd:SetViewAngles(possessor.viewAngles)
		end
	end
end;

local COMMAND = Clockwork.command:New("DemonHeal");
	COMMAND.tip = "Utilise des pouvoirs démoniaques pour soigner les blessures d'un hôte, à n'utiliser que sur des personnes possédées. C'est un événement très visible.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.optionalArguments = 1;
	COMMAND.types = {"Player"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = player;
		
		if not arguments[1] then
			if player.victim then
				target = player.victim;
			end
		else
			target = Clockwork.player:FindByID(arguments[1]);
		end
		
		if target then
			local curTime = CurTime();
			
			if !player.nextDemonHeal or player.nextDemonHeal < curTime then
				player.nextDemonHeal = curTime + 10;
				
				--local max_poise = target:GetMaxPoise();
				local max_stability = target:GetMaxStability();
				local max_stamina = target:GetMaxStamina();
				
				target:ResetInjuries();
				target:SetHealth(target:GetMaxHealth() or 100);
				target:SetNeed("thirst", 0);
				target:SetNeed("hunger", 0);
				target:SetNeed("sleep", 0);
				target:SetCharacterData("Stamina", max_stamina);
				target:SetNWInt("Stamina", max_stamina);
				target:SetCharacterData("stability", max_stability);
				target:SetNWInt("stability", max_stability);
				--target:SetCharacterData("meleeStamina", max_poise);
				--target:SetNWInt("meleeStamina", max_poise);
				target:SetLocalVar("freeze", 0);
				target:SetBloodLevel(5000);
				target:StopAllBleeding();
				Clockwork.limb:HealBody(target, 100);
				Clockwork.player:SetAction(target, "die", false);
				Clockwork.player:SetAction(target, "die_bleedout", false);
				
				if target:IsRagdolled() then
					Clockwork.player:SetRagdollState(target, RAGDOLL_NONE);
				end
				
				Clockwork.chatBox:AddInTargetRadius(target, "me", "est soudainement et miraculeusement guéri de ses blessures ! Vos yeux semblent presque vous tromper tandis que vous observez ses blessures disparaître.", target:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
			else
				Schema:EasyText(player, "peru", "Vous ne pouvez pas utiliser cette commande avant"..tostring(math.ceil(player.nextDemonHeal - curTime)).." seconds!");
			end
		else
			Schema:EasyText(player, "grey", arguments[1].." is not a valid character!");
		end
	end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonShriek");
COMMAND.tip = "Si vous possédez un joueur, poussez un hurlement à glacer le sang qui désoriente les joueurs proches et draine leur santé mentale.";
COMMAND.access = "s";
COMMAND.alias = {"Shriek"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player.victim or player:GetCharacterData("isThrall") then
		local curTime = CurTime();
	
		if !player.nextDemonShriek or player.nextDemonShriek < curTime then
			player.nextDemonShriek = curTime + 60;
			
			player.victim:EmitSound("possession/caverns_scream.wav", 160);
			
			for k, v in pairs(ents.FindInSphere(player.victim:GetPos(), 512)) do
				if v:IsPlayer() and v:HasInitialized() and v:Alive() then
					v:Disorient(5);
					
					if !v.cwObserverMode and !v.victim and !v.possessor then
						v:HandleSanity(-10);
					end
				end
			end
			
			Clockwork.chatBox:AddInTargetRadius(player.victim, "me", "pousse un cri impie et à glacer le sang !", player.victim:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
		else
			Schema:EasyText(player, "peru", "Vous ne pouvez pas utiliser cette commande avant"..tostring(math.ceil(player.nextDemonShriek - curTime)).." seconds!");
		end
	else
		Schema:EasyText(player, "grey", "Vous devez posséder quelqu'un pour utiliser cette commande !");
	end
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonTalk");
COMMAND.tip = "Envoyer un message à un joueur en tant que démon.";
COMMAND.text = "<string Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local message = string.upper("\""..table.concat(arguments, " ", 2).."\"");

		if target ~= player then
			Clockwork.chatBox:SetMultiplier(1.25);
			Clockwork.chatBox:Add(target, nil, "demontalk", message);
		end
		
		Clockwork.chatBox:SetMultiplier(1.25);
		Clockwork.chatBox:Add(player, nil, "demontalk", message);
		
		Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have demontalked "..message.." to "..target:Name()..".");
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonNiceTalk");
COMMAND.tip = "Envoyer un message à un joueur en prétendant être une entité plus sympathique.";
COMMAND.text = "<string Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local message = string.upper("\""..table.concat(arguments, " ", 2).."\"");

		if target ~= player then
			Clockwork.chatBox:SetMultiplier(1.25);
			Clockwork.chatBox:Add(target, nil, "demonnicetalk", message);
		end
		
		Clockwork.chatBox:SetMultiplier(1.25);
		Clockwork.chatBox:Add(player, nil, "demonnicetalk", message);
		
		Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have demonnicetalked "..message.." to "..target:Name()..".");
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonWhisper");
COMMAND.tip = "Chuchote un message à l'oreille d'un joueur.";
COMMAND.text = "<string Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		local message = table.concat(arguments, " ", 2);

		--if target ~= player then
			Clockwork.chatBox:Add(target, nil, "whispersomeone", message);
		--end
		
		--Clockwork.chatBox:Add(player, nil, "whispersomeone", "[À"..string.upper(target:Name())..":"..message);
		Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have demonwhispered \""..message.."\" to "..target:Name()..".");
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonFakeTalk");
COMMAND.tip = "Faire croire à un joueur qu'un autre joueur dit quelque chose.";
COMMAND.text = "<string Target Name> <string Speaker Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 3;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local speaker = Clockwork.player:FindByID(arguments[2]);
	local message = table.concat(arguments, " ", 3);
	
	if (target) then
		if (speaker) then
			if (message) ~= "" then
				Clockwork.chatBox:Add(target, speaker, "ic", message);
				Clockwork.chatBox:Add(player, speaker, "ic", "[À"..string.upper(target:Name()).." FROM "..string.upper(speaker:Name())..": "..message);
			else
				Schema:EasyText(player, "darkgrey", "["..self.name.."] ".."This is not a valid message!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[2].." is not a valid player!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonFakeWhisper");
COMMAND.tip = "Faire croire à un joueur qu'un autre joueur lui murmure quelque chose.";
COMMAND.text = "<string Target Name> <string Speaker Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 3;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local speaker = Clockwork.player:FindByID(arguments[2]);
	local message = table.concat(arguments, " ", 3);
	
	if (target) then
		if (speaker) then
			if (message) ~= "" then
				Clockwork.chatBox:Add(target, speaker, "whisper", message);
				Clockwork.chatBox:Add(player, speaker, "whisper", "[À"..string.upper(target:Name()).." FROM "..string.upper(speaker:Name())..": "..message);
			else
				Schema:EasyText(player, "darkgrey", "["..self.name.."] ".."This is not a valid message!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[2].." is not a valid player!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;


COMMAND:Register();

local COMMAND = Clockwork.command:New("DemonFakeMe");
COMMAND.tip = "Faire croire à un joueur qu'un autre joueur lui chuchote quelque chose.";
COMMAND.text = "<string Target Name> <string Speaker Name> <string Message>";
COMMAND.access = "s";
COMMAND.arguments = 3;
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local speaker = Clockwork.player:FindByID(arguments[2]);
	local message = table.concat(arguments, " ", 3);
	
	if (target) then
		if (speaker) then
			if (message) ~= "" then
				Clockwork.chatBox:Add(target, speaker, "me", message);
				Clockwork.chatBox:Add(player, speaker, "me", "[À"..string.upper(target:Name()).." FROM "..string.upper(speaker:Name())..": "..message);
			else
				Schema:EasyText(player, "darkgrey", "["..self.name.."] ".."This is not a valid message!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[2].." is not a valid player!");
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("ForceSuicide");
COMMAND.tip = "Force tes ennemis à se foutre en l'air.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"PlyForceSuicide", "CharForceSuicide"};
COMMAND.types = {"Player"}

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		target:CommitSuicide();
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyMakeFreakout");
COMMAND.tip = "Rends un joueur possédé complètement dingue !!! Diminue la santé mentale des joueurs proches. Dure 30 secondes puis assomme le joueur, bien qu'une possession préalable annule cet effet. Argument optionnel pour ignorer la condition de trait.";
COMMAND.text = "<string Name> [bool IgnoreTrait]";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;
COMMAND.alias = {"MakeFreakout", "CharMakeFreakout"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local ignoreTrait = false;
	
	if arguments[2] then
		ignoreTrait = true;
	end
	
	if (target) then
		if target:CanBePossessed(player, ignoreTrait) then
			target:PossessionFreakout();
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlySummonDemon");
COMMAND.tip = "Fait exploser un joueur possédé et un thrall apparaîtra à sa place.";
COMMAND.text = "<string Name> [bool IgnoreTrait]";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"SummonDemon", "CharSummonDemon"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	
	if (target) then
		local targetPos = target:GetPos();
		
		Clockwork.chatBox:AddInTargetRadius(target, "me", "explose soudainement en une pluie de feu et de viscères alors qu'un putain de démon jaillit de sa propre chair !", targetPos, config.Get("talk_radius"):Get() * 2);
		
		target:Kill();
		
		if cwGore then
			if (target:GetRagdollEntity()) then
				cwGore:SplatCorpse(target:GetRagdollEntity(), 60, nil, true);
			end;
		end
		
		local thrall;

		if target:HasTrait("marked") then
			thrall = ents.Create("npc_bgt_otis");
		else
			thrall = ents.Create("npc_bgt_brute");
		end
		
		ParticleEffect("teleport_fx",targetPos,Angle(0,0,0),thrall)
		sound.Play("misc/summon.wav",targetPos,100,100)
		thrall:EmitSound(cwPossession.laughs[math.random(1, #cwPossession.laughs)]);
		
		--[[timer.Simple(0.75, function()
			if IsValid(thrall) then]]--
				thrall:CustomInitialize();
				thrall:SetPos(targetPos);
				thrall:Spawn();
				thrall:Activate();
			--end
		--end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyMakeSay");
COMMAND.tip = "Parle à travers un autre joueur. Place le texte entre guillemets. Tu peux utiliser /me, /y, etc. dans le texte. Exemple : /plymakesay aaron"/me begins convulsing.\"";
COMMAND.text = "<string Name> <string Text>";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.alias = {"MakeSay", "CharMakeSay"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) then
		Clockwork.player:MakeSay(target, arguments[2]);
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyPossess");
COMMAND.tip = "Possédez un joueur, vous ne devriez probablement faire cela que s'il a le trait 'Possédé'. Argument optionnel pour ignorer l'exigence de trait.";
COMMAND.text = "<string Name> [bool IgnoreTrait]";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;
COMMAND.alias = {"Possess", "CharPossess"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local ignoreTrait = false;
	
	if arguments[2] then
		ignoreTrait = true;
	end

	if (target) then
		if target:CanBePossessed(player, ignoreTrait) then
			if IsValid(player.victim) then
				player.victim:Unpossess();
			end
			
			target:Possess(player);
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyUnPossess");
COMMAND.tip = "Libère le joueur que tu possèdes actuellement.";
COMMAND.access = "s";
COMMAND.alias = {"UnPossess", "CharUnPossess"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player.victim then
		if IsValid(player.victim) then
			player.victim:Unpossess();
		else
			player:Spectate(0);
			player:UnSpectate();
			
			cwObserverMode:MakePlayerEnterObserverMode(player);
			
			for i = 1, #cwPossession.possessedPlayers do
				if !IsValid(cwPossession.possessedPlayers[i]) then
					table.remove(cwPossession.possessedPlayers, i);
					break;
				end
			end
		end
	else
		Schema:EasyText(player, "grey", "Vous ne possédez actuellement aucun joueur !");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyTrack");
COMMAND.tip = "Définir un joueur à suivre activement.";
COMMAND.text = "<string Name>";
COMMAND.access = "o";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);

	if (target) and (not target:IsBot()) then
		player:SetNetVar("tracktarget", target:SteamID());
		target:SetNetVar("trackedby", player:SteamID());
		Schema:EasyText(player, "cornflowerblue", "Suivi en cours"..target:Name()..".");
	else
		Schema:EasyText(player, "grey", "Aucun argument de cible valide trouvé.");
		if player:GetNetVar("tracktarget") then 
			for _, v in _player.Iterator() do
				local steamID = v:SteamID();
				if steamID == player:GetNetVar("tracktarget") then
					
					Schema:EasyText(player, "cornflowerblue", "En cours de suivi"..v:Name()..".");
					return;
				end
			end
			Schema:EasyText(player, "darkgrey", "Cible actuelle non connectée.");
		end
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyClearTrack");
COMMAND.tip = "Effacez votre cible définie.";
COMMAND.text = "";
COMMAND.access = "o";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if player:GetNetVar("tracktarget") then 
		for _, v in _player.Iterator() do
			local steamID = v:SteamID();
			if steamID == player:GetNetVar("tracktarget") then
				player:SetNetVar("trackedby", nil);
			end
		end
		player:SetNetVar("tracktarget", nil)
		Schema:EasyText(player, "cornflowerblue", "Cible actuelle effacée.");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("PlyTrackGoTo");
COMMAND.tip = "Allez vers votre cible actuellement suivie.";
COMMAND.text = "";
COMMAND.access = "o";
COMMAND.arguments = 0;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	Schema:EasyText(player, "grey", "Aucun argument de cible valide trouvé.");
	if player:GetNetVar("tracktarget") then 
		for _, v in _player.Iterator() do
			local steamID = v:SteamID();
			if steamID == player:GetNetVar("tracktarget") then
				
				Clockwork.player:SetSafePosition(player, v:GetPos());
				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Moved to "..v:Name().."'s position.");
				return;
			end
		end
		
		Schema:EasyText(player, "grey", "Joueur suivi invalide.");
	end;
end;

COMMAND:Register();