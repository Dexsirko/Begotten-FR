--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local requiredWorkshopAddons = {
	"2442758302",
	"2443016109",
	"2443045596",
	"2442796233",
	"2442809967",
	"2442244710",
	"2465148067",
	"2594063203",
	"2790936125",
	"3456524237",
};

if game.GetMap() == "rp_district21" then
	table.insert(requiredWorkshopAddons, "3121268073");
	table.insert(requiredWorkshopAddons, "3126101449");
end

-- Disabled these for now since gabs added their content to the Begotten III content.
Schema.requiredMounts = {
	--["episodic"] = "Half-Life 2: Episode 1",
	--["ep2"] = "Half-Life 2: Episode 2",
	--["cstrike"] = "Counter-Strike: Source",
};

Schema.cheapleMessages = {"Je dois m'éloigner de cette putain de chose !", "Ça se rapproche !", "Qu'est-ce que cette chose veut de moi !?", "Pourquoi personne d'autre ne le voit !?", "Merde, ça se rapproche !", "Faut continuer à bouger... faut continuer à bouger..."};
if !Schema.contentVerified then
	Schema.contentVerified = "unverified";
end

function Schema:Initialize()
	if (!file.Exists("b3", "DATA")) then
		file.CreateDir("b3")
	end
	
	if (self.tempTextures) then
		for i = 1, #self.tempTextures do
			self:DownloadMaterial(self.tempTextures[i].url, self.tempTextures[i].path);
		end;
	end;
	
	--if render.GetHDREnabled() == false and game.GetMap() == "rp_begotten3" then
		--RunConsoleCommand("mat_hdr_enabled", "1");
		--RunConsoleCommand("retry");
	--end
	
	--RunConsoleCommand("fps_max", "300");
	RunConsoleCommand("hud_draw_fixed_reticle", "0");
	--RunConsoleCommand("mat_hdr_level", "2");
	RunConsoleCommand("mat_motion_blur_enabled", "1");
end

-- A function to start a sound.
function Schema:StartSound(soundStr, volume, pitch, dsp)
    if (!soundStr or type(soundStr) != "string") then
        return;
    end;
    
    if (Clockwork.Client.customSound) then
        Clockwork.Client.customSound:Stop();
        Clockwork.Client.customSound = nil;
        
        if (Clockwork.Client.customSoundOldDSP) then
            Clockwork.Client.customSoundOldDSP = nil;
        end;
    end;
    
    local pitch = math.Clamp(tonumber(pitch), 30, 255) or 100;
    local volume = tonumber(volume) or 1;
    local dsp = tonumber(dsp) or 0;
    
    if (volume > 1) then
        volume = volume / 100;
    end;
    
    if (!Clockwork.Client.customSound) then
        if not string.find(soundStr, "http") then
            Clockwork.Client.customSound = CreateSound(Clockwork.Client, soundStr);
            
            if (Clockwork.Client.customSound and !Clockwork.Client.customSound:IsPlaying()) then
                Clockwork.Client.customSound:SetDSP(dsp);
                Clockwork.Client.customSound:PlayEx(volume, pitch);
            end;
        else
            if pitch then
                if tonumber(pitch or 0) > 1 then
                    pitch = pitch / 100
                end
            end
            sound.PlayURL(soundStr, "noplay noblock", function(station)
                if (IsValid(station)) then
                    Clockwork.Client.customSound = station

                    station:SetPos(LocalPlayer():GetPos())

                    station:SetVolume(volume)
                    station:SetPlaybackRate(pitch)
                    station:Play()
                end
            end)
        end
    end;
end;

-- A function to stop a sound.
function Schema:StopSound()
	if (!Clockwork.Client.customSound) then
		return;
	else
		if (Clockwork.Client.customSound:IsPlaying()) then
			Clockwork.Client.customSound:Stop();
			Clockwork.Client.customSound = nil;
		
			if (Clockwork.Client.customSoundOldDSP) then
				Clockwork.Client.customSoundOldDSP = nil;
			end;
		end;
	end;
end;

-- A function to fade out a sound.
function Schema:FadeOut(duration)
	local duration = tonumber(duration) or 3;
	
	if (!Clockwork.Client.customSound or Clockwork.Client.customSoundFadingOut) then
		return;
	else
		if (Clockwork.Client.customSound:IsPlaying()) then
			Clockwork.Client.customSound:FadeOut(duration);
			Clockwork.Client.customSoundFadingOut = true;
			
			timer.Simple(duration, function()
				Clockwork.Client.customSound = nil;
				Clockwork.Client.customSoundFadingOut = nil;
				
				if (Clockwork.Client.customSoundOldDSP) then
					Clockwork.Client.customSoundOldDSP = nil;
				end;
			end);
		end;
	end;
end;

-- A function to change the volume of a sound.
function Schema:ChangeVolume(newVolume, delta)
	local newVolume = tonumber(newVolume) or 0;
	local delta = tonumber(delta) or 3;
	
	if (!Clockwork.Client.customSound or Clockwork.Client.customSoundChangingVolume) then
		return;
	else
		if (Clockwork.Client.customSound:IsPlaying() and Clockwork.Client.customSound:GetVolume() != newVolume) then
			Clockwork.Client.customSound:ChangeVolume(newVolume, delta);
			Clockwork.Client.customSoundChangingVolume = true;
			
			timer.Simple(delta, function()
				Clockwork.Client.customSoundChangingVolume = nil;
			end);
		end;
	end;
end;

-- A function to change the pitch of a sound.
function Schema:ChangePitch(newPitch, delta)
	local newPitch = tonumber(newPitch) or 0;
	local delta = tonumber(delta) or 3;
	
	if (!Clockwork.Client.customSound or Clockwork.Client.customSoundChangingPitch) then
		return;
	else
		if (Clockwork.Client.customSound:IsPlaying() and Clockwork.Client.customSound:GetPitch() != newPitch) then
			Clockwork.Client.customSound:ChangePitch(newPitch, delta);
			Clockwork.Client.customSoundChangingPitch = true;
			
			timer.Simple(delta, function()
				Clockwork.Client.customSoundChangingPitch = nil;
			end);
		end;
	end;
end;

-- A function to change the pitch of a sound.
function Schema:SetDSP(newDSP, reset)
	if (Clockwork.Client.customSoundOldDSP) then
		Clockwork.Client.customSoundOldDSP = nil;
	end;
	
	if (!Clockwork.Client.customSound) then
		return;
	else
		Clockwork.Client.customSoundOldDSP = Clockwork.Client.customSound:GetDSP();
		
		if (Clockwork.Client.customSound:IsPlaying() and Clockwork.Client.customSound:GetDSP() != newDSP) then
			if (!reset) then
				Clockwork.Client.customSound:SetDSP(tonumber(newDSP));
			else
				Clockwork.Client.customSound:SetDSP(Clockwork.Client.customSoundOldDSP);
			end;
		end;
	end;
end;

function Schema:Think()
	if Clockwork.Client:HasTrait("followed") and Clockwork.Client:Alive() and not self.caughtByCheaple then
		if IsValid(statichitman) then
			if Clockwork.Client.LoadingText then
				return;
			end
			
			local position = Clockwork.Client:GetPos();
			local cheaplePosition = statichitman:GetPos();
			local distance = cheaplePosition:DistToSqr(position);
			local yaw = (position - cheaplePosition):Angle().yaw;
			local forward = statichitman:GetForward();
			local zDifference = position.z - cheaplePosition.z;
			
			if Clockwork.Client:HasTrait("marked") then
				if !statichitman.flaming then
					statichitman.flaming = true;
					
					statichitman:ResetSequence("run_all");
					ParticleEffectAttach("env_fire_large", 1, statichitman, 1);
					
					statichitman:EmitSound("ambient/fire/fire_small1.wav");
				end
			end
				
			if statichitman.flaming then
				statichitman:SetPos(cheaplePosition + (forward * 1.5) + Vector(0, 0, zDifference * FrameTime()));
			else
				statichitman:SetPos(cheaplePosition + (forward * 0.325) + Vector(0, 0, zDifference * FrameTime()));
			end
			
			statichitman:SetAngles(Angle(0, yaw, 0));
			statichitman:FrameAdvance();
			
			if (distance <= 512 * 512) and Clockwork.Client:GetRagdollState() ~= RAGDOLL_KNOCKEDOUT then
				local curTime =  CurTime();
			
				if Clockwork.HeartbeatSound and Clockwork.HeartbeatSound:IsPlaying() then
					Clockwork.HeartbeatSound:Stop();
				end 
			
				if not Schema.HeartbeatSound then
					Schema.HeartbeatSound = CreateSound(Clockwork.Client, "vj_player/heartbeat.wav");
					Schema.HeartbeatSound:Play();
				end
				
				if !self.nextCheapleMessage or self.nextCheapleMessage < curTime then
					self.nextCheapleMessage = curTime + math.random(30, 90);
					
					Clockwork.chatBox:Add(nil, nil, Color(255, 255, 150, 255), "***' "..self.cheapleMessages[math.random(1, #self.cheapleMessages)]);
				end
			else
				if Schema.HeartbeatSound then
					Schema.HeartbeatSound:FadeOut(3);
					Schema.HeartbeatSound = nil;
				end
			end
				
			if !self.nextCheapleSave or self.nextCheapleSave < CurTime() then
				self.nextCheapleSave = CurTime() + 1.5;
				
				netstream.Start("SaveCheaplePos", statichitman:GetPos());
			end
				
			if (distance < 64 * 64) then
				Schema:CheapleCaught();
			end
		end
		
		if Schema.caughtByCheaple and Schema.cheapleLight then
			local dynamicLight = DynamicLight(Clockwork.Client:EntIndex());
			
			dynamicLight.Pos = Vector(260, 4995, -10915); 
			dynamicLight.r = 255;
			dynamicLight.g = 160;
			dynamicLight.b = 160;
			dynamicLight.Brightness = 0.5;
			dynamicLight.Size = 1024;
			dynamicLight.DieTime = curTime + 0.1;
			dynamicLight.Style = 4;
		end
	elseif IsValid(statichitman) then
		self:ClearCheaple();
	elseif !Clockwork.Client:Alive() and Schema.caughtByCheaple then
		Schema.caughtByCheaple = false;
	end
end

netstream.Hook("CheaplePos", function(data)
	if Clockwork.Client:HasTrait("followed") and Clockwork.Client:Alive() and not Schema.caughtByCheaple then
		if IsValid(statichitman) and data then
			statichitman:SetPos(data);
		else
			Schema:CheapleFollows(data);
		end
	end
end);

netstream.Hook("PlayerCustomSoundCheck", function(data)
	local soundPlaying = false;
	
	if (Clockwork.Client.customSound and Clockwork.Client.customSound:IsPlaying()) then
		soundPlaying = true;
	end;
	
	netstream.Start("ConfirmCustomSoundCheck", {soundPlaying});
end);

netstream.Hook("StartCustomSound", function(data)
	local sound = data[1];
	local volume = data[2];
	local pitch = data[3];
	local dsp = data[4] or 0;
	
	Schema:StartSound(sound, volume, pitch, dsp)
end);

netstream.Hook("StopCustomSound", function(data)
	Schema:StopSound();
end);

netstream.Hook("FadeOutCustomSound", function(data)
	if (type(data) == "table") then
		data = data[1];
	end;
	
	Schema:FadeOut(data);
end);

netstream.Hook("CustomSoundChangeVolume", function(data)
	local newVolume = data[1];
	local delta = data[2];

	Schema:ChangeVolume(newVolume, delta);
end);

netstream.Hook("CustomSoundChangePitch", function(data)
	local newPitch = data[1];
	local delta = data[2];

	Schema:ChangePitch(newPitch, delta);
end);

netstream.Hook("CustomSoundChangeDSP", function(data)
	local newDSP = data;
	local reset = false;
	
	if (type(data) == "table") then
		newDSP = data[1];
		reset = data[2] or false;
	end;

	Schema:SetDSP(newDSP, reset);
end);


-- A function to print chatbox text without using RGB color.
function Schema:EasyText(...)
	local args = {...};
	local icon;
	
	for k, v in pairs (args) do
		-- IsColor() doesn't work in all cases.
		if (isentity(v) or (istable(v) and (!v.r and !v.g and !v.b))) then
			args[k] = nil;
			continue;
		end

		if isstring(v) and (string.find(v, ".png")) then
			icon = v;
			args[k] = nil
			continue;
		end;
		
		if (colors[v]) then
			args[k] = colors[v];
		end;
	end;
	
	Clockwork.chatBox:Add(nil, icon, unpack(args));
end;

netstream.Hook("EasyText", function(varargs)
	Schema:EasyText(unpack(varargs))
end);

-- Called when a player's footstep sound should be played.
function Schema:PlayerFootstep(player, position, foot, soundString, volume, recipientFilter)
	local running = nil;
	
	if (player:IsRunning()) then
		running = true;
	end;
	
	if cwPowerArmor and player:IsWearingPowerArmor()then
		if running then
			local runSounds = {
				"npc/dog/dog_footstep1.wav",
				"npc/dog/dog_footstep2.wav",
				"npc/dog/dog_footstep3.wav",
				"npc/dog/dog_footstep4.wav",
			}; 
			
			player:EmitSound(runSounds[math.random(1, #runSounds)]);
		else
			local walkSounds = {
				"npc/dog/dog_footstep_walk01.wav",
				"npc/dog/dog_footstep_walk02.wav",
				"npc/dog/dog_footstep_walk03.wav",
				"npc/dog/dog_footstep_walk04.wav",
				"npc/dog/dog_footstep_walk05.wav",
				"npc/dog/dog_footstep_walk06.wav",
				"npc/dog/dog_footstep_walk07.wav",
				"npc/dog/dog_footstep_walk08.wav",
				"npc/dog/dog_footstep_walk09.wav",
				"npc/dog/dog_footstep_walk10.wav"
			};
			
			player:EmitSound(walkSounds[math.random(1, #walkSounds)]);
		end
		
		return true;
	end
	
	if (player:Crouching() and player:GetNetVar("hasNimble")) or player:GetCharmEquipped("urn_silence") or player:GetColor().a <= 0 then
		return true;
	end;

	local clothesItem = player:GetClothesEquipped();
	
	if (clothesItem) then
		if (running) then
			if (clothesItem.runSound) then
				if (type(clothesItem.runSound) == "table") then
					player:EmitSound(clothesItem.runSound[math.random(1, #clothesItem.runSound)], 65, math.random(95, 100), 0.5);
				else
					player:EmitSound(clothesItem.runSound, 65, math.random(95, 100), 0.50);
				end;
			end;
		elseif (clothesItem.walkSound) then
			if (type(clothesItem.walkSound) == "table") then
				player:EmitSound(clothesItem.walkSound[math.random(1, #clothesItem.walkSound)], 65, math.random(95, 100), 0.5);
			else
				player:EmitSound(clothesItem.walkSound, 65, math.random(95, 100), 0.5);
			end;
		end;
	end;
	
	player:EmitSound(soundString);

	return true;
end;

-- Called when the local player attempts to zoom.
function Schema:PlayerCanZoom()
	return false;
end

local animalModels = {
	"models/animals/deer1.mdl",
	"models/animals/goat.mdl",
	"models/animals/bear.mdl",
	"models/animal_ragd/piratecat_leopard.mdl",
	"models/begotten/creatures/wolf.mdl",
};

-- Called when an entity's menu options are needed.
function Schema:GetEntityMenuOptions(entity, options)
	if Clockwork.Client:Alive() then
		local curTime = CurTime();
		local clientFaction = Clockwork.Client:GetNetVar("kinisgerOverride") or Clockwork.Client:GetFaction();
	
		if entity:IsPlayer() then
			local entFaction = entity:GetNetVar("kinisgerOverride") or entity:GetFaction();
			
			if entity:Alive() and (clientFaction == "Hillkeeper" or clientFaction == "Holy Hierarchy") and (entFaction ~= "Hillkeeper" and entFaction ~= "Holy Hierarchy") and entity:GetNetVar("tied") != 0 then
				for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
					if v:GetClass() == "cw_salesman" and v:GetNetworkedString("Name") == "The Headsman" then
						options["Vendre en esclavage"] = "cw_sellSlave";
						
						break;
					end
				end
			elseif entity:Alive() and clientFaction == "Goreic Warrior" and entFaction ~= "Goreic Warrior" and entity:GetNetVar("tied") != 0 then
				for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
					if v:GetClass() == "cw_salesman" and v:GetNetworkedString("Name") == "Reaver Despoiler" then
						options["Vendre en esclavage"] = "cw_sellSlave";
						
						break;
					end
				end
			elseif entity:IsWanted() and entity:GetNetVar("tied") != 0 then
				for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
					if v:GetClass() == "cw_bounty_board" then
						options["Dénoncer"] = "cw_turnInBounty";
						
						break;
					end
				end
			end
		elseif (entity:GetClass() == "prop_ragdoll") then
			local player = Clockwork.entity:GetPlayer(entity);

			if player then
				local playerFaction = player:GetNetVar("kinisgerOverride") or player:GetFaction();

				if player:Alive() and (clientFaction == "Hillkeeper" or clientFaction == "Holy Hierarchy") and (entFaction ~= "Hillkeeper" and entFaction ~= "Holy Hierarchy") and player:GetNetVar("tied") != 0 then
					for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
						if v:GetClass() == "cw_salesman" and v:GetNetworkedString("Name") == "The Headsman" then
							options["Vendre en esclavage"] = "cw_sellSlave";
							
							break;
						end
					end
				elseif player:Alive() and clientFaction == "Goreic Warrior" and playerFaction ~= "Goreic Warrior" and player:GetNetVar("tied") != 0 then
					for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
						if v:GetClass() == "cw_salesman" and v:GetNetworkedString("Name") == "Reaver Despoiler" then
							options["Vendre en esclavage"] = "cw_sellSlave";
							
							break;
						end
					end
				elseif player:IsWanted() and player:GetNetVar("tied") != 0 then
					for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
						if v:GetClass() == "cw_bounty_board" then
							options["Dénoncer"] = "cw_turnInBounty";
							
							break;
						end
					end
				end
			end
				
			if (!player or (player and (!player:Alive() or player:GetMoveType() ~= MOVETYPE_OBSERVER))) then
				local model = entity:GetModel();
				
				if table.HasValue(animalModels, entity:GetModel()) then
					--local activeWeapon = Clockwork.Client:GetActiveWeapon();
					
					--if activeWeapon:IsValid() and activeWeapon.isDagger then
						options["Mutiler"] = "cwCorpseMutilate";
						options["Dépouiller"] = "cwCorpseSkin";
					--else
						--if !self.skinNotificationTimer or self.skinNotificationTimer < curTime then
							--Clockwork.chatBox:Add(nil, "icon16/error.png", Color(200, 175, 200, 255), "You must have a dagger equipped in order to skin or mutilate this animal!");
							
							--self.skinNotificationTimer = curTime + 0.5;
						--end
					--end
				elseif entity:GetNWEntity("Player"):IsPlayer() or entity:GetNWEntity("Player") == game.GetWorld() then
					options["Piller"] = "cw_corpseLoot";
					
					if entity:GetNWInt("bountyKey") then
						for k, v in pairs(ents.FindInSphere(Clockwork.Client:GetPos(), 512)) do
							if v:GetClass() == "cw_bounty_board" then
								options["Dénoncer"] = "cw_turnInBounty";
								
								break;
							end
						end
					end
				end
			end;
			
			if IsValid(entity:GetNWEntity("CinderBlock")) then
				options["Détacher la corde"] = "cwUntieCinderBlock"
			end
		elseif (entity:GetClass() == "cw_belongings") then
			options["Ouvrir"] = "cw_belongingsOpen";
		elseif (entity:GetClass() == "prop_physics") then
			local model = entity:GetModel();
			
			if entity:GetNWBool("BIsCinderBlock") == true then
				options["Détacher la corde"] = "cwUntieCinderBlock"
			elseif model == "models/animals/bear.mdl" then
				--local activeWeapon = Clockwork.Client:GetActiveWeapon();
				
				--if activeWeapon:IsValid() and activeWeapon.isDagger then
					options["Mutiler"] = "cwCorpseMutilate";
					options["Dépouiller"] = "cwCorpseSkin";
				--[[else
					if !self.skinNotificationTimer or self.skinNotificationTimer < curTime then
						Clockwork.chatBox:Add(nil, "icon16/error.png", Color(200, 175, 200, 255), "You must have a dagger equipped in order to skin or mutilate this animal!");
						
						self.skinNotificationTimer = curTime + 0.5;
					end
				end]]--
			end
		elseif (entity:GetClass() == "cw_radio") then
			if (!entity:IsCrazy()) then
				if (!entity:IsOff()) then
					options["Éteindre"] = "cw_radioToggle";
				else
					options["Allumer"] = "cw_radioToggle";
				end;
				
				if !entity:IsStatic() or (entity:IsStatic() and Clockwork.Client:IsAdmin()) then
					options["Régler la fréquence"] = function()
						Derma_StringRequest("Frequency", "À quelle fréquence souhaitez-vous régler ?", frequency, function(text)
							if ( IsValid(entity) ) then
								Clockwork.entity:ForceMenuOption(entity, "Régler la Fréquence", text);
							end;
						end);
					end;
					
					options["Prendre"] = "cw_radioTake";
				end
			end;
		elseif (entity.tracks and entity.IsOff) then
			if (!entity:IsOff()) then
				options["Éteindre"] = "cwToggleGramophone";
			else
				options["Allumer"] = "cwToggleGramophone";
			end;
		elseif (entity:GetClass() == "cw_hound_cage_next") then
			options["Examiner"] = "cwItemExamine";
			options["Pick Up"] = "cwItemHoundPickup";
		
			if entity:GetNWBool("houndunleashed",0) == 0 then
				options["Attaquer tout"] = "cwHoundCageAttackAll";
				options["Épargner les vagabonds"] = "cwHoundCageSpareWanderers";
			end
		elseif (entity:GetClass() == "cw_siege_ladder") then
			if entity:GetNWEntity("owner") == Clockwork.Client then
				options["Démolir"] = "cwTearDownSiegeLadder";
			end
		elseif (entity:GetClass() == "cw_bear_trap") then
			options["Examiner"] = "cwItemExamine";
		
			if entity:GetNWString("state") == "trap" then
				if !cwBeliefs or Clockwork.Client:HasBelief("ingenious") then
					options["Réinitialiser"] = "cwResetBearTrap";
				end
			else
				if !cwBeliefs or Clockwork.Client:HasBelief("ingenious") then
					options["Définir"] = "cwSetBearTrap";
				end
				
				options["Prendre"] = "cwTakeBearTrap";
			end
		end;
	end;
end;

-- Called when a player's character screen info should be adjusted.
function Schema:PlayerAdjustCharacterScreenInfo(character, info)
	info.clothes = character.clothes;
	info.helmet = character.helmet;
	info.shield = character.shield;
	info.kills = character.kills or 0;
	info.kinisgerOverride = character.kinisgerOverride;
	info.kinisgerOverrideSubfaction = character.kinisgerOverrideSubfaction;
	info.rank = character.rank;
	info.rankOverride = character.rankOverride;
	info.faith = character.faith;
	info.subfaith = character.subfaith;
	info.location = character.location;
end

-- Called when the post progress bar info is needed.
function Schema:GetProgressBarInfoAction(action, percentage)
	if (action == "mutilating") then
		return {text = "Vous récoltez de la viande d'un cadavre. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	elseif (action == "skinning") then
		return {text = "Vous dépouillez la peau d'un cadavre d'animal. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	elseif (action == "reloading") then
		local weaponName = Clockwork.Client:GetNetVar("cwProgressBarVerb") or "shot";
		local ammoName = Clockwork.Client:GetNetVar("cwProgressBarItem") or "weapon";
		
		return {text = "Vous rechargez votre "..weaponName.." avec "..ammoName..". Cliquez pour annuler.", percentage = percentage, flash = percentage < 0}
		--return {text = "You are reloading your weapon. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	elseif (action == "building") then
		return {text = "You are erecting a siege ladder. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	elseif (action == "bloodTest") then
		return {text = "Vous testez le sang de quelqu'un pour détecter la corruption. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	elseif (action == "hell_teleporting") then
		return {text = "Vous utilisez la magie noire pour vous téléporter en Enfer. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "filling_bucket") then
		return {text = "Vous remplissez un seau. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "filling_bottle") then
		return {text = "Vous remplissez une bouteille. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "tie") then
		return {text = "Vous êtes en train d'attacher quelqu'un.", percentage = percentage, flash = percentage < 10};
	elseif (action == "untie") then
		return {text = "Vous détachez quelqu'un.", percentage = percentage, flash = percentage < 10};
	end;
end;

function Schema:PlayerCanSeeDateTime()
    return false;
end;

function Schema:GetTargetPlayerName(player)
	if Clockwork.Client:IsAdmin() and Clockwork.player:IsNoClipping(Clockwork.Client) then
		return player:Name();
	end
	
	local subfaction = player:GetSubfaction();

	if subfaction == "Praeventor" or subfaction == "Outrider" then
		local clientFaction = Clockwork.Client:GetFaction();
		
		if clientFaction ~= "Gatekeeper" and clientFaction ~= "Hillkeeper" and clientFaction ~= "Holy Hierarchy" then
			return player:Name(true);
		end
	end
	
	return player:Name()
end

function Schema:OverrideTeamColor(player, bRecognized)
	local clientFaction = Clockwork.Client:GetFaction();
	local playerFaction = player:GetFaction();
	local clothesItem = player:GetClothesEquipped();
	local helmetItem = player:GetHelmetEquipped();
	local teamColor;
	
	if Clockwork.Client:IsAdmin() and Clockwork.player:IsNoClipping(Clockwork.Client) then
		return;
	end

	if bRecognized then
		if playerFaction == "Gatekeeper" and clientFaction ~= "Gatekeeper" and clientFaction ~= "Holy Hierarchy" then
			if player:GetSubfaction() == "Praeventor" then
				if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
					teamColor = Color(200, 200, 200, 255);
				end
			end
		elseif playerFaction == "Hillkeeper" and clientFaction ~= "Hillkeeper" and clientFaction ~= "Holy Hierarchy" then
			if player:GetSubfaction() == "Outrider" then
				if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
					teamColor = Color(200, 200, 200, 255);
				end
			end
		elseif playerFaction == "Children of Satan" and clientFaction ~= "Children of Satan" then
			if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
				local kinisgerOverride = player:GetNetVar("kinisgerOverride");
				
				if kinisgerOverride then
					local classTable = Clockwork.class:GetStored()[kinisgerOverride];
					
					if classTable then
						teamColor = _team.GetColor(classTable.index) or Color(200, 200, 200, 255);
					else
						teamColor = Color(200, 200, 200, 255);
					end
				else
					teamColor = Color(200, 200, 200, 255);
				end
			end
		end
	else
		if playerFaction == "Gatekeeper" and clientFaction ~= "Gatekeeper" and clientFaction ~= "Holy Hierarchy" then
			if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
				teamColor = Color(200, 200, 200, 255);
			end
		elseif playerFaction == "Hillkeeper" and clientFaction ~= "Hillkeeper" and clientFaction ~= "Holy Hierarchy" then
			if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
				teamColor = Color(200, 200, 200, 255);
			end
		elseif playerFaction == "Children of Satan" and clientFaction ~= "Children of Satan" then
			if (!clothesItem or !clothesItem.faction or (clothesItem.faction and clothesItem.faction ~= playerFaction)) and (!helmetItem or !helmetItem.faction or (helmetItem.faction and helmetItem.faction ~= playerFaction)) then
				local kinisgerOverride = player:GetNetVar("kinisgerOverride");
				
				if kinisgerOverride then
					local classTable = Clockwork.class:GetStored()[kinisgerOverride];
					
					if classTable then
						teamColor = _team.GetColor(classTable.index) or Color(200, 200, 200, 255);
					else
						teamColor = Color(200, 200, 200, 255);
					end
				else
					teamColor = Color(200, 200, 200, 255);
				end
			end
		end
	end
	
	return teamColor;
end

-- Called when an entity's target ID HUD should be painted.
function Schema:HUDPaintEntityTargetID(entity, info)
	local colorTargetID = Clockwork.option:GetColor("target_id");
	local colorWhite = Clockwork.option:GetColor("white");
	
	if (entity:GetClass() == "prop_physics") then
		local physDesc = entity:GetNetworkedString("physDesc");
		
		if (physDesc != "") then
			info.y = Clockwork.kernel:DrawInfo(physDesc, info.x, info.y, colorWhite, info.alpha);
		end;
	elseif (entity:IsNPC() or entity:IsNextBot()) then
		local name = entity:GetNetworkedString("cw_Name");
		local title = entity:GetNetworkedString("cw_Title");
		
		if (name != "" and title != "") then
			info.y = Clockwork.kernel:DrawInfo(name, info.x, info.y, Color(255, 255, 100, 255), info.alpha);
			info.y = Clockwork.kernel:DrawInfo(title, info.x, info.y, Color(255, 255, 255, 255), info.alpha);
		end;
	end;
end;

-- Called when the target's status should be drawn.
function Schema:DrawTargetPlayerStatus(target, alpha, x, y)
	local informationColor = Clockwork.option:GetColor("information");
	local thirdPerson = "him";
	local mainStatus;
	local untieText;
	local gender = "He";
	local action = Clockwork.player:GetAction(target);
	
	if (target:GetGender() == GENDER_FEMALE) then
		thirdPerson = "her";
		gender = "She";
	end;
	
	if (target:Alive()) then
		if (action == "die") then
			mainStatus = gender.." est dans un état critique et meurt lentement.";
		elseif (action == "die_bleedout") then
			mainStatus = gender.." se vide de son sang et meurt lentement.";
		elseif (target:GetRagdollState() == RAGDOLL_KNOCKEDOUT) then
			mainStatus = gender.." est clairement inconscient.";
		end;
		
		if (target:GetNetVar("tied") != 0) then
			if (Clockwork.player:GetAction(Clockwork.Client) == "untie") then
				mainStatus = gender.. " est en train d'être détaché.";
			else
				local untieText;
				
				if (target:GetShootPos():Distance(Clockwork.Client:GetShootPos()) <= 192) then
					if (Clockwork.Client:GetNetVar("tied") == 0) then
						mainStatus = "Appuyez sur :+gm_showspare1: pour détacher "..thirdPerson..".";
						
						untieText = true;
					end;
				end;
				
				if (!untieText) then
					mainStatus = gender.." a été attaché.";
				end;
			end;
		elseif (Clockwork.player:GetAction(Clockwork.Client) == "tie") then
			mainStatus = gender.." est en train d'être attaché.";
		end;
		
		if (mainStatus) then
			y = Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(mainStatus), x, y, informationColor, alpha);
		end;
		
		return y;
	end;
end;

-- Called when the target's subfaction should be drawn.
function Schema:DrawTargetPlayerSubfaction(target, alpha, x, y)
	local playerSubfaction = Clockwork.Client:GetNetVar("kinisgerOverrideSubfaction") or Clockwork.Client:GetNetVar("subfaction");
	local targetSubfaction = target:GetNetVar("kinisgerOverrideSubfaction") or target:GetNetVar("subfaction");
	local subfactionText;

	if(target:GetSharedVar("isThrall")) then return; end
	
	if targetSubfaction and targetSubfaction ~= "" and targetSubfaction ~= "N/A" then
		local playerFaction = Clockwork.Client:GetNetVar("kinisgerOverride") or Clockwork.Client:GetFaction();
		local targetFaction = target:GetNetVar("kinisgerOverride") or target:GetFaction();
		local textColor = Color(150, 150, 150, 255);

		if playerFaction == "Goreic Warrior" and targetFaction == "Goreic Warrior" then
			local FACTION = Clockwork.faction:FindByID(playerFaction)
			local SUBFACTION = nil;
			
			if FACTION.subfactions then
				for i = 1, #FACTION.subfactions do
					if FACTION.subfactions[i].name == playerSubfaction then
						SUBFACTION = FACTION.subfactions[i];
						break;
					end
				end
			end
			
			if SUBFACTION and SUBFACTION.rivalry == targetSubfaction then
				subfactionText = "Un membre rival de "..targetSubfaction..".";
				textColor = Color(255, 0, 0, 255);
			elseif playerSubfaction == targetSubfaction then
				subfactionText = "Un compagnon de "..targetSubfaction..".";
				textColor = Color(0, 255, 0, 255);
			else
				subfactionText = "Un membre de "..targetSubfaction..".";
			end
		-- GetFaction() checks incase they're disguised.
		elseif Clockwork.Client:GetFaction() == "Children of Satan" and target:GetFaction() == "Children of Satan" then
			if target:GetModel() == "models/begotten/satanists/lordvasso/male_56.mdl" then
				subfactionText = "L'élu de Satan, le Seigneur de la Terreur lui-même!";
				textColor = Color(0, 255, 0, 255);
			elseif Clockwork.Client:GetNetVar("subfaction") == target:GetNetVar("subfaction") or Clockwork.Client:GetNetVar("subfaction") == "Kinisger" and target:GetNetVar("kinisgerOverrideSubfaction") then
				local brother = "brother";
				
				if target:GetGender() == GENDER_FEMALE then
					brother = "sister";
				end
				
				if target:GetNetVar("kinisgerOverrideSubfaction") then
					subfactionText = "Un "..brother.." de la lignée Kinisger, se faisant passer pour un "..targetSubfaction..".";
				else
					subfactionText = "Un "..brother.." de "..targetSubfaction.." lignée.";
				end
				
				textColor = Color(0, 255, 0, 255);
			else
				if target:GetNetVar("kinisgerOverrideSubfaction") then
					subfactionText = "Un membre de la lignée Kinisger, se faisant passer pour un "..targetSubfaction..".";
				else
					subfactionText = "Un membre de "..targetSubfaction.." lignée.";
				end
			end
		elseif targetFaction ~= "Children of Satan" and targetFaction ~= "Goreic Warrior" then
			if targetSubfaction == "Ministry" then
				if playerSubfaction == targetSubfaction then
					subfactionText = "Un compagnon ministre de la Sainte Hiérarchie.";
					textColor = Color(0, 255, 0, 255);
				else
					subfactionText = "Un ministre de la Sainte Hiérarchie.";
				end
			elseif targetSubfaction == "Low Ministry" then
				local wordstouse = "Clergyman"
				
				if target:GetGender() == GENDER_FEMALE then
					wordstouse = "Clergywoman"
				end

				local brother = "brother";
				
				if target:GetGender() == GENDER_FEMALE then
					brother = "sister";
				end

				if playerSubfaction == targetSubfaction then
					subfactionText = "Un compagnon " .. brother ..  " de l'église.";
					textColor = Color(0, 255, 0, 255);

					local nameshield = string.lower(target:GetName())
					local ismaiden = string.find(nameshield, "shieldmaiden")

					if ismaiden == 1 then
						subfactionText = "La Vierge au Bouclier de la Sainte Hiérarchie. Une sœur."
					end
				else
					subfactionText = "Un laïc " .. wordstouse .. " du bas Ministère.";

					local nameshield = string.lower(target:GetName())
					local ismaiden = string.find(nameshield, "shieldmaiden")

					if ismaiden == 1 then
						subfactionText = "La Vierge au Bouclier de la Sainte Hiérarchie."
					end
				end
			elseif targetSubfaction == "Inquisition" then
				if playerSubfaction == targetSubfaction then
					subfactionText = "Un compagnon inquisiteur de la Sainte Hiérarchie.";
					textColor = Color(0, 255, 0, 255);
				else
					subfactionText = "Un inquisiteur de la Sainte Hiérarchie.";
				end
			elseif targetSubfaction == "Knights of Sol" then
				if playerSubfaction == targetSubfaction then
					subfactionText = "Un compagnon chevalier de la Sainte Hiérarchie.";
					textColor = Color(0, 255, 0, 255);
				else
					subfactionText = "Un chevalier de la Sainte Hiérarchie.";
				end
			elseif playerFaction == "Gatekeeper" or playerFaction == "Holy Hierarchy" or playerFaction == "Hillkeeper" then
				if targetSubfaction == "Auxiliary" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon auxiliaire du Saint Ordre des Gardiens.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un auxiliaire du Saint Ordre des Gardiens.";
					end
				elseif targetSubfaction == "Legionary" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon légionnaire du Saint Ordre des Gardiens.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un légionnaire du Saint Ordre des Gardiens.";
					end
				elseif targetSubfaction == "Praeventor" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon praeventor du Saint Ordre des Gardiens.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un praeventor du Saint Ordre des Gardiens.";
					end
				elseif targetSubfaction == "Watchman" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "A fellow watchman of the Hill of Light.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un garde de la Colline de Lumière du nord.";
					end
				elseif targetSubfaction == "Servus" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon serviteur de la Colline de Lumière.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un serviteur de la Colline de Lumière du nord.";
					end
				elseif targetSubfaction == "Outrider" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon éclaireur de la Colline de Lumière.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un éclaireur de la Colline de Lumière du nord.";
					end
				end
			elseif playerFaction == "Smog City Pirate" then
				if targetSubfaction == "Voltists" then
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon Voltiste de Smog City.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un membre des Voltistes de Smog City.";
					end
				else
					if playerSubfaction == targetSubfaction then
						subfactionText = "Un compagnon pirate de Smog City.";
						textColor = Color(0, 255, 0, 255);
					else
						subfactionText = "Un membre des pirates de Smog City.";
					end
				end
			elseif playerFaction ~= "Wanderer" and playerFaction == targetFaction then
				if playerSubfaction == targetSubfaction then
					subfactionText = "Un compagnon membre de "..targetSubfaction..".";
					textColor = Color(0, 255, 0, 255);
				else
					subfactionText = "Un membre de "..targetSubfaction..".";
				end
			end
		end
		
		if subfactionText then
			return Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(subfactionText), x, y, textColor, alpha);
		end
	end
end

-- Called when the target's subfaction should be drawn.
function Schema:DrawTargetPlayerLevel(target, alpha, x, y)
	local playerFaction = Clockwork.Client:GetFaction();
	local targetFaction = target:GetNetVar("kinisgerOverride") or target:GetFaction();
	local levelText;

	if(target:GetSharedVar("isThrall")) then return; end
	
	if playerFaction == "Children of Satan" and targetFaction ~= "Children of Satan" then
		local level = target:GetNetVar("level", 1)
		local textColor = Color(255, 100, 100, 255);
		
		if level < 10 then
			local thirdPerson = "him"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "her"
			end
			
			levelText = "Un petit cochonnet tout frais, l'âme de celui-ci n'a aucun pouvoir. Sacrifier "..thirdPerson.." serait un affront au Seigneur Obscur.";
		elseif level >= 10 and level < 20 then
			local thirdPerson = "His"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "Her"
			end

			textColor = Color(200, 150, 150, 255);
			levelText = "Une petite aura de pouvoir entoure celui-ci. "..thirdPerson.." l'âme ne vaudrait pas grand-chose pour le Seigneur Obscur.";
		elseif level >= 20 and level < 30 then
			textColor = Color(150, 200, 150, 255);
			levelText = "Une âme mûre en effet, l'âme de celui-ci vaudrait beaucoup pour le Seigneur Obscur.";
		elseif level >= 30 then
			local thirdPerson = "His"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "Her"
			end
		
			textColor = Color(100, 255, 100, 255);
			levelText = "Une forte aura de pouvoir entoure celui-ci. "..thirdPerson.." l'âme serait un régal splendide en effet!";
		end
		
		if levelText then
			return Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(levelText), x, y, textColor, alpha);
		end
	--elseif Clockwork.Client:GetNetVar("subfaction") == "Clan Reaver" and targetFaction ~= "Goreic Warrior" then
	elseif playerFaction == "Goreic Warrior" and targetFaction ~= "Goreic Warrior" then
		local level = target:GetNetVar("level", 1)
		local textColor = Color(255, 100, 100, 255);
		
		if level < 10 then
			local thirdPerson = "He"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "She"
			end
			
			levelText = thirdPerson.." ne semble pas fort et ferait un esclave pathétique.";
		elseif level >= 10 and level < 20 then
			local thirdPerson = "His"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "Her"
			end

			textColor = Color(200, 150, 150, 255);
			levelText = "Celui-ci est faible et ne se vendrait pas cher aux marchés aux esclaves.";
		elseif level >= 20 and level < 30 then
			textColor = Color(150, 200, 150, 255);
			levelText = "Valide, celui-ci se vendrait à un prix honnête aux marchés aux esclaves.";
		elseif level >= 30 then
			local thirdPerson = "He"
			
			if (target:GetGender() == GENDER_FEMALE) then
				thirdPerson = "She"
			end
		
			textColor = Color(100, 255, 100, 255);
			levelText = thirdPerson.." a l'air très fort et se vendrait à un prix élevé aux marchés aux esclaves!";
		end
		
		if levelText then
			return Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(levelText), x, y, textColor, alpha);
		end
	end
end

-- Called when the target's sanity level should be drawn.
function Schema:DrawTargetSanityLevel(target, alpha, x, y)
	local targetSanity = target:GetNetVar("sanity", 100)
	local playerHasBelief = Clockwork.Client:HasBelief("blank_stare")

	if(target:GetSharedVar("isThrall")) or !playerHasBelief then return; end
	
	local sanityText
	local textColor

	if targetSanity > 90 then
		sanityText = "Celui-ci est parfaitement sain d'esprit."
		textColor = Color(255, 0, 0, 255);
	elseif targetSanity <= 90 and targetSanity > 80 then
		sanityText = "Celui-ci est légèrement troublé."
		textColor = Color(225, 30, 0, 255);
	elseif targetSanity <= 80 and targetSanity > 70 then
		sanityText = "Celui-ci remet en question ses pensées."
		textColor = Color(195, 60, 0, 255);
	elseif targetSanity <= 70 and targetSanity > 60 then
		sanityText = "Celui-ci est assez perturbé."
		textColor = Color(165, 90, 0, 255);
	elseif targetSanity <= 60 and targetSanity > 50 then
		sanityText = "Celui-ci gambade vers la folie."
		textColor = Color(135, 120, 0, 255);
	elseif targetSanity <= 50 and targetSanity > 40 then
		sanityText = "Celui-ci est fou."
		textColor = Color(105, 150, 0, 255);
	elseif targetSanity <= 40 and targetSanity > 30 then
		sanityText = "Celui-ci est complètement dingue!"
		textColor = Color(75, 180, 0, 255);
	elseif targetSanity <= 30 and targetSanity > 20 then
		sanityText = "Celui-ci est délicieusement dément!"
		textColor = Color(45, 210, 0, 255);
	elseif targetSanity <= 20 and targetSanity > 10 then
		sanityText = "L'esprit de celui-ci a transcendé!"
		textColor = Color(15, 240, 0, 255);
	elseif targetSanity <= 10 then
		sanityText = "Celui-ci danse au clair de lune!"
		textColor = Color(0, 255, 0, 255);
	end
		
	if sanityText then
		return Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(sanityText), x, y, textColor, alpha);
	end
end

-- Called when a player's scoreboard options are needed.
function Schema:GetPlayerScoreboardOptions(player, options, menu)
	--[[if (Clockwork.command:FindByID("CharSetCustomClass")) then
		if (Clockwork.player:HasFlags(Clockwork.Client, Clockwork.command:FindByID("CharSetCustomClass").access)) then
			options["Custom Class"] = {};
			options["Custom Class"]["Set"] = function()
				Derma_StringRequest(player:Name(), "What would you like to set their custom class to?", player:GetNetVar("customClass"), function(text)
					Clockwork.kernel:RunCommand("CharSetCustomClass", player:Name(), text);
				end);
			end;
			
			if (player:GetNetVar("customClass")) then
				options["Custom Class"]["Take"] = function()
					Clockwork.kernel:RunCommand("CharTakeCustomClass", player:Name());
				end;
			end;
		end;
	end;]]--
	
	if (Clockwork.command:FindByID("CharPermaKill")) then
		if (Clockwork.player:HasFlags(Clockwork.Client, Clockwork.command:FindByID("CharPermaKill").access)) then
			options["Perma-Kill"] = function()
				RunConsoleCommand("aura", "CharPermaKill", player:Name());
			end;
		end;
	end;
	
	if (Clockwork.command:FindByID("CharUnPermaKill")) then
		if (Clockwork.player:HasFlags(Clockwork.Client, Clockwork.command:FindByID("CharUnPermaKill").access)) then
			options["Un-Perma-Kill"] = function()
				RunConsoleCommand("aura", "UnCharPermaKill", player:Name());
			end;
		end;
	end;
end;

-- Called when the local player's colorify should be adjusted.
function Schema:PlayerAdjustColorModify(colorModify)
	local frameTime = FrameTime();
	local interval = FrameTime() / 10;
	local curTime = CurTime();
	
	if (!self.colorModify) then
		self.colorModify = {
			brightness = colorModify["$pp_colour_brightness"],
			contrast = colorModify["$pp_colour_contrast"],
			color = colorModify["$pp_colour_colour"]
		};
	end;

	self.colorModify.brightness = math.Approach(self.colorModify.brightness, colorModify["$pp_colour_brightness"], interval);
	self.colorModify.contrast = math.Approach(self.colorModify.contrast, colorModify["$pp_colour_contrast"], interval);
	self.colorModify.color = math.Approach(self.colorModify.color, colorModify["$pp_colour_colour"], interval);

	colorModify["$pp_colour_brightness"] = self.colorModify.brightness;
	colorModify["$pp_colour_contrast"] = self.colorModify.contrast;
	colorModify["$pp_colour_colour"] = self.colorModify.color;
end;

-- Called to get if local player can get the screen text info.
function Schema:CanGetScreenTextInfo()
	if Clockwork.Client.LoadingText then
		return false;
	end
	
	if self.caughtByCheaple then
		return false;
	end
end

-- Called to get the screen text info.
function Schema:GetScreenTextInfo()
	local blackFadeAlpha = Clockwork.kernel:GetBlackFadeAlpha();
	
	--[[if (Clockwork.Client:GetNetVar("permaKilled")) then
		return {
			alpha = blackFadeAlpha,
			title = "THIS CHARACTER IS PERMANENTLY KILLED",
			text = "Go to the character menu to make a new one."
		};
	else]]if (Clockwork.Client:GetNetVar("beingChloro")) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = "QUELQU'UN UTILISE DU CHLOROFORME SUR VOUS"
		};
	elseif (Clockwork.Client:GetNetVar("beingTied")) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = "VOUS ÊTES EN TRAIN D'ÊTRE ATTACHÉ"
		};
	elseif (Clockwork.Client:GetNetVar("tied") != 0) then
		return {
			alpha = 255 - blackFadeAlpha,
			title = "VOUS AVEZ ÉTÉ ATTACHÉ"
		};
	end;
end;

-- Called when the local player's character screen faction is needed.
function Schema:GetPlayerCharacterScreenFaction(character)
	--[[if (character.customClass and character.customClass != "") then
		return character.customClass;
	end;]]--
end;

-- Called when the cinematic intro info is needed.
--[[function Schema:GetCinematicIntroInfo()
	return {
		credits = "Designed and developed by "..self:GetAuthor()..".",
		title = Clockwork.config:Get("intro_text_big"):Get(),
		text = Clockwork.config:Get("intro_text_small"):Get()
	};
end;]]--

function Schema:ModifyStatusEffects(tab)
	if Clockwork.Client:HasTrait("clumsy") then
		table.insert(tab, {text = "(-) Maladroit", color = Color(200, 40, 40)});
	end

	if Clockwork.Client:HasTrait("crosseyed") then
		table.insert(tab, {text = "(-) Bigleux", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:GetNetVar("IsDrunk") then
		if Clockwork.Client:GetNetVar("IsDrunk") < 3 then
			table.insert(tab, {text = "(-) Légèrement Ivre", color = Color(200, 40, 40)});
		else
			table.insert(tab, {text = "(-) Ivre", color = Color(200, 40, 40)});
		end
	end
	
	if Clockwork.Client:HasTrait("followed") then
		table.insert(tab, {text = "(-) Suivi", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:HasTrait("gluttony") then
		table.insert(tab, {text = "(-) Gourmand", color = Color(200, 40, 40)});
	end

	if Clockwork.Client:HasTrait("imbecile") then
		table.insert(tab, {text = "(-) Imbécile", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:HasTrait("marked") then
		table.insert(tab, {text = "(-) Marqué", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:HasTrait("pacifist") then
		table.insert(tab, {text = "(-) Pacifiste", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:HasTrait("possessed") then
		table.insert(tab, {text = "(-) Possédé", color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client:HasTrait("scavenger") then
		table.insert(tab, {text = "(+) Fouilleur", color = Color(0, 225, 0)});
	end
	
	if Clockwork.Client:HasTrait("winded") then
		table.insert(tab, {text = "(-) Essoufflé", color = Color(200, 40, 40)});
	end
end

function Schema:GetAdminESPInfo(info)
	if (Clockwork.ConVars.NPCSPAWNESP and Clockwork.ConVars.NPCSPAWNESP:GetInt() == 1) then
		if (self.npcSpawns) then
			if (table.IsEmpty(self.npcSpawns)) then
				self.npcSpawns = nil;
				
				return;
			end;
			
			for k, v in pairs (self.npcSpawns) do
				for i, v2 in ipairs(v) do
					if (!v2 or !isvector(v2.pos)) then
						self.npcSpawns[k][i] = nil;
						
						continue;
					end;

					info[#info + 1] = {
						position = v2.pos,
						text = k;
						color = Color(255, 150, 150);
					};
				end
			end;
		end;
	end;
end

-- Called when a text entry has gotten focus.
function Schema:OnTextEntryGetFocus(panel)
	self.textEntryFocused = panel;
end;

-- Called when a text entry has lost focus.
function Schema:OnTextEntryLoseFocus(panel)
	self.textEntryFocused = nil;
end;

-- Called when the top screen HUD should be painted.
function Schema:HUDPaintTopScreen(info) end;

-- Called when the player info text is needed.
function Schema:GetPlayerInfoText(playerInfoText) end;

-- Called to check if a player does have an flag.
function Schema:PlayerDoesHaveFlag(player, flag) end;

-- Called to check if a player does recognise another player.
function Schema:PlayerDoesRecognisePlayer(target, status, isAccurate, realValue)
	local playerFaction = Clockwork.Client:GetNetVar("kinisgerOverride") or Clockwork.Client:GetFaction();
	local targetFaction = target:GetNetVar("kinisgerOverride") or target:GetFaction();

	if targetFaction == "Holy Hierarchy" then
		return true;
	elseif targetFaction == "Gatekeeper" or targetFaction == "Pope Adyssa's Gatekeepers" or targetFaction == "Hillkeeper" then
		if playerFaction == "Gatekeeper" or playerFaction == "Pope Adyssa's Gatekeepers" or playerFaction == "Hillkeeper" or playerFaction == "Holy Hierarchy" then
			return true;
		end
	elseif targetFaction == "Goreic Warrior" and playerFaction == "Goreic Warrior" then
		return true;
	elseif targetFaction == "Smog City Pirate" and playerFaction == "Smog City Pirate" then
		return true;
	elseif targetFaction == "The Third Inquisition" and playerFaction == "The Third Inquisition" then
		return true;
	-- GetFaction() checks incase they're disguised.
	elseif target:GetFaction() == "Children of Satan" and Clockwork.Client:GetFaction() == "Children of Satan" then
		return true;
	end
end;

-- Called each tick.
function Schema:Tick()
	local curTime = CurTime();
	
	-- This should stop people from loweirng their FPS to make lockpicking easier, at least w/o external programs.
	if !self.nextFPSCheck or curTime >= self.nextFPSCheck then
		self.nextFPSCheck = curTime + 0.05;
		
		--RunConsoleCommand("fps_max", "300");
		RunConsoleCommand("hud_draw_fixed_reticle", "0");
		RunConsoleCommand("mat_motion_blur_enabled", "1");
	end
	
	RunConsoleCommand("r_3dsky", "1");
	--RunConsoleCommand("r_pixelfog", "1");
	RunConsoleCommand("mat_monitorgamma_tv_enabled", "0");

	-- Something is fucked with our SWEPs that is causing clientside models to build up and tank FPS.
	if !self.nextClientsideModelCheck or curTime >= self.nextClientsideModelCheck then
		self.nextClientsideModelCheck = curTime + 10;

		if Clockwork.character:IsPanelOpen() then
			return;
		end
		
		-- dunno why this check is needed but it apparently is
		if IsValid(Clockwork.Client) and Clockwork.Client.GetNW2Bool then
			if Clockwork.Client:GetNW2Bool("pac_in_editor") then
				return;
			end
		end
		
		for k, v in pairs(ents.GetAll()) do
			if string.find(v:GetClass(), "class C_BaseFlex") and v:GetModel() then
				if IsValid(v) and IsValid(Clockwork.Client) and v:GetPos() == Vector(0, 0, 0) then
					if v:GetModel() == Clockwork.Client:GetModel() or v.noDelete then
						continue;
					end
					
					v:Remove();
				end
			end
		end
		
		--[[if IsValid(Clockwork.inventory.panel) then
			if Clockwork.inventory.panel:IsVisible() then
				Clockwork.inventory.panel:Rebuild();
			end
		end]]--
	end
	
	if self.crows then
		local position = Clockwork.Client:GetPos();
		local trace = {};
			trace.start = Clockwork.Client:GetPos();
			trace.endpos = trace.start + Vector(0, 0, 100000);
			trace.filter = {Clockwork.Client};
		local traceLine = util.TraceLine(trace);
		local soundPlayed = false;

		if (!traceLine.HitSky) then
			for k, v in pairs(self.crows) do
				if (IsValid(v)) then
					v:Remove();
					self.crows[k] = nil;
				end;
			end;
		else
			for k, v in pairs(self.crows) do 
				if (IsValid(v)) then 
					local pitchCheck = v:GetAngles().pitch < 10
					
					if ((v.nextFly or 0) < curTime and pitchCheck) then
						v.nextFly = curTime + math.Rand(0.2, 0.3);
						v:ResetSequence(0);
					end;
					
					local crowPosition = v:GetPos();
					crowPosition.z = position.z;
					
					local forward = v:GetPos() + v:GetForward();
					forward.z = math.Clamp(forward.z, v.position.z - 500, v.position.z + 200);
					
					v:SetPos(forward);
					
					local newPosition = (forward.z < v.position.z - 400);
					local forward = (newPosition and 0 or 6);
					local newAngle = v:GetAngles() + Angle(math.Rand(-30, forward), math.Rand(-10, 10), 0);
					
					if (math.random(1, 10) == 2) then 
						v.angle = newAngle;
					end;
					
					local angle = v.angle or newAngle;
					v.newAngle = v.newAngle or angle;
					local frameTime = FrameTime();
					
					v.newAngle.p = math.Approach(v.newAngle.p, angle.p, frameTime * 164);
					v.newAngle.y = math.Approach(v.newAngle.y, angle.y, frameTime * 34);
					
					local finalAngle = v.newAngle or angle;
					finalAngle.pitch = math.Clamp(finalAngle.pitch, -20, 20);
					
					v:SetAngles(finalAngle);
					
					if not soundPlayed then
						if math.random(1, 1000) == 1 then
							soundPlayed = true;

							v:EmitSound("crow"..math.random(3, 4)..".wav", math.random(20, 30));
						end
					end;
					
					if ((crowPosition - position):Length() > 2000) then
						v:Remove();
						self.crows[k] = nil;
					end;
				else
					self.crows[k] = nil;
				end;
			end;
		end;
		
		if table.IsEmpty(self.crows) then
			self.crows = nil;
		end
	end;
end;

function Schema:PlayerCanSeeCommand(commandTable)
	if commandTable.faith then
		local faith = Clockwork.Client:GetNetVar("faith");
		
		if istable(commandTable.faith) and !table.HasValue(commandTable.faith, faith) then
			return false;
		elseif isstring(commandTable.faith) and commandTable.faith ~= faith then
			return false;
		end
	end
	
	if commandTable.subfaith then
		local subfaith = Clockwork.Client:GetNetVar("subfaith");
		
		if istable(commandTable.subfaith) and !table.HasValue(commandTable.subfaith, subfaith) then
			return false;
		elseif isstring(commandTable.subfaith) and commandTable.subfaith ~= subfaith then
			return false;
		end
	end
end

-- Called when the local player attempts to see a class.
function Schema:PlayerCanSeeClass(class) end;

-- Called when the local player's motion blurs should be adjusted.
function Schema:PlayerAdjustMotionBlurs(motionBlurs) end;

-- Called when the scoreboard's class players should be sorted.
function Schema:ScoreboardSortClassPlayers(class, a, b) end;

-- Called when a player's scoreboard class is needed.
function Schema:GetPlayerScoreboardClass(player) end;

-- Called when the target player's fade distance is needed.
function Schema:GetTargetPlayerFadeDistance(player) end;

-- Called when the scoreboard's player info should be adjusted.
function Schema:ScoreboardAdjustPlayerInfo(info) end;

-- Called when the local player's class model info should be adjusted.
function Schema:PlayerAdjustClassModelInfo(class, info) end;

-- Called when the chat box info should be adjusted.
function Schema:ChatBoxAdjustInfo(info) end;

-- Called when a Clockwork ConVar has changed.
function Schema:ClockworkConVarChanged(name, previousValue, newValue)
	if (name == "cwWakeupSequence" and newValue) then
		if newValue == "0" then
			if Clockwork.Client.LoadingText then
				self:FinishWakeupSequence();
			end
		end
	end
end

-- Called to get whether the local player's character screen is visible.
function Schema:GetPlayerCharacterScreenVisible()
	if Schema.contentVerified ~= "verified" then
		return false;
	end
end

function Schema:CanShowTabMenu()
	if self.caughtByCheaple then
		return false;
	end
	
	if (Clockwork.Client:HasInitialized() and !Clockwork.Client:Alive()) then
		return false;
	end;
end

-- Called when the scoreboard should be shown.
function Schema:ScoreboardShow()
	if (Clockwork.Client:HasInitialized() and !Clockwork.Client:Alive()) then
		Clockwork.character:SetPanelOpen(true);
		netstream.Start("RefreshCharacterMenu");
	end;
end;

function Schema:PlayerCanSeeBars(class)
	if self.caughtByCheaple then
		return false
	end
end

function Schema:CanPaintChatbox()
	if self.caughtByCheaple then
		return false;
	end;
end;

local noDisplayClasses = {
	"dwf",
	"dw ",
	"dwd",
	"dar",
	"rav",
	"rs ",
	"rsc",
	"rsf",
	"rel",
	"re ",
	"adm",
	"ad ",
	"su ",
	"op ",
};

function Schema:ShouldNotDisplayTyping(text)
	local prefix = config.Get("command_prefix"):Get()
	
	if string.sub(text, 1, 1) == prefix then
		local stringsub = string.sub(text, 2, 4);
		
		if table.HasValue(noDisplayClasses, stringsub) then
			return false;
		end
	end
end

-- Called to get whether the character menu should be created.
function Schema:ShouldCharacterMenuBeCreated()
	if Schema.contentVerified ~= "verified" then
		if Schema.contentVerified == "unverified" then
			for i = 1, #requiredWorkshopAddons do
				local addon = requiredWorkshopAddons[i];
			
				if !steamworks.IsSubscribed(addon) or !steamworks.ShouldMountAddon(addon) then
					local contentPanel = vgui.Create("cwContentNotification");
					
					contentPanel.missingWorkshop = true;
					contentPanel:Rebuild();
					
					Schema.contentVerified = "missing";
					
					return false;
				end
			end
			
			for k, v in pairs(Schema.requiredMounts) do
				if !IsMounted(k) then
					local contentPanel = vgui.Create("cwContentNotification");
					
					contentPanel:Rebuild();
					
					Schema.contentVerified = "missing";
					
					return false;
				end
			end
			
			Schema.contentVerified = "verified";
		end
	
		return false;
	end
end

-- A function to modify an item's markup tooltip.
function Schema:ModifyItemMarkupTooltip(category, maximumWeight, weight, condition, percentage, name, itemTable, x, y, width, height, frame, bShowWeight)
	if (category == "Melee") then
		local damageTypes = {[2] = "Bullet", [4] = "Slash", [16] = "Pierce", [128] = "Blunt"};
		local meleeMax = GetTable("meleemax");
		local meleeMin = GetTable("meleemin");
		local weaponClass = itemTable.uniqueID;
		local weaponStats = {["attack"] = nil, ["defense"] = nil};
		local weaponTable;
		
		if weaponClass then
			weaponTable = _G.weapons.Get(weaponClass);
			
			if weaponTable then
				category = weaponTable.Category or "Melee";
			end
		end
		
		if string.find(category, "(Begotten)") then
			category = string.sub(category, 12)
		end
		
		if category == "Fisted" then
			category = "Fisted Weapon";
		end
		
		if category == "Sacrificial" then
			category = "Sacrificial Weapon";
		end
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end
		
		if itemTable.requiredbeliefs and #itemTable.requiredbeliefs > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.requiredbeliefs do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.requiredbeliefs[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.requiredbeliefs[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances requises :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if itemTable.onerequiredbelief and #itemTable.onerequiredbelief > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.onerequiredbelief do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.onerequiredbelief[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.onerequiredbelief[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances Requises (Une des Suivantes) :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end

		if weaponTable then
			if weaponTable.AttackTable then
				weaponStats["attack"] = GetTable(weaponTable.AttackTable);
			end
			
			if weaponTable.BlockTable then
				weaponStats["defense"] = GetTable(weaponTable.BlockTable);
			end
			
			if weaponStats["attack"] and weaponStats["defense"] then
				frame:AddText("Attributs de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);

				if weaponStats["attack"].canaltattack then
					if weaponTable.CanSwipeAttack then
						frame:AddText("Attaque alternative : Balayage", Color(110, 30, 30), nil, 0.9);
					elseif weaponTable.ChoppingAltAttack then
						frame:AddText("Attaque alternative : Tranchant", Color(110, 30, 30), nil, 0.9);
					elseif weaponTable.PummelingAltAttack then
						frame:AddText("Attaque alternative : Frappe", Color(110, 30, 30), nil, 0.9);
					else
						frame:AddText("Attaque alternative : Percer", Color(110, 30, 30), nil, 0.9);
					end
				end
				
				--[[if weaponStats["defense"].blockdamagetypes then
					local blockDamageTypes = "";
					
					for i = 1, #weaponStats["defense"].blockdamagetypes do
						local blockDamageType = weaponStats["defense"].blockdamagetypes[i];
						
						blockDamageTypes = blockDamageTypes..damageTypes[blockDamageType];
						
						if i < #weaponStats["defense"].blockdamagetypes then
							blockDamageTypes = blockDamageTypes..", ";
						end
					end
					
					if blockDamageTypes ~= "" then
						frame:AddText("Types de dégâts bloqués :"..blockDamageTypes, Color(110, 30, 30), nil, 0.9);
					end
				end]]--
			
				--[[if weaponStats["defense"].canparry then
					frame:AddText("Peut Parer", Color(110, 30, 30), nil, 0.9);
				end]]--
				
				if itemTable.canUseShields then
					frame:AddText("Peut utiliser des boucliers", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.isSacrifical then
					frame:AddText("Corrompt le Porteur", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.isPolearm then
					frame:AddText("Arme d'hast : Jusqu'à +60% de dégâts supplémentaires selon la distance à la cible.", Color(110, 30, 30), nil, 0.9);
				end
				
				if weaponTable.hasSwordplay then
					frame:AddText("Escrime : Après avoir dévié ou paré un adversaire, votre prochaine attaque dans les 0,5s suivantes aura un temps de frappe plus rapide. Ce trait ne fonctionne que si vous avez débloqué 'Maître Lame'.", Color(110, 30, 30), nil, 0.9);
				end
				
				if weaponTable.hasPuncture then
					frame:AddText("Ponction : Double les dégâts de condition contre l'armure. Ce trait ne fonctionne que si vous avez débloqué la compétence 'Might'.", Color(110, 30, 30), nil, 0.9);
				end
				
				if weaponTable.MultiHit then
					frame:AddText("Multi-Frappe : Peut toucher jusqu'à"..tostring(weaponTable.MultiHit).." targets in a single swing.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.hasMinimumRange then
					frame:AddText("Portée minimale efficace : Les cibles situées à moins de 60% de votre portée maximale subiront des dégâts non-létaux inefficaces.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.hasIncreasedDeflectionWindow then
					frame:AddText("Fenêtre de déviation augmentée (0,25s)", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.huntingValue == 3 then
					frame:AddText("Dague de chasse : Dépouiller et mutiler les cadavres offre des récoltes de meilleure qualité et est bien plus rapide.", Color(110, 30, 30), nil, 0.9);
				end

				if weaponStats["defense"].parrydifficulty and weaponStats["defense"].parrydifficulty > 0.2 then
					frame:AddText("A augmenté la fenêtre de parade", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.unrepairable then
					frame:AddText("Irréparable : Cette arme ne peut pas être réparée et subira toujours des dégâts de condition, quelles que soient les croyances.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.attributes then
					if table.HasValue(itemTable.attributes, "barbed") then
						frame:AddText("Barbelé : Inflige des dégâts de poison et des dégâts de sang supplémentaires aux victimes qui ne sont pas de la Foi des Ténèbres.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "mark_of_perdition") then
						frame:AddText("Marque de la Perdition : Inflige une terreur existentielle aux victimes qui ne sont pas de la Foi des Ténèbres.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "disciplined") then
						frame:AddText("Discipliné : Accorde un bonus de vitesse de 15% à vous-même et aux victimes qui sont de la Foi des Ténèbres.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "blood_of_kings") then
						frame:AddText("Sang des Rois : Équipable par la sous-faction Varazdat sans les croyances requises.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "last_stand") then
						frame:AddText("Bénédiction Impie : Lorsque votre santé atteint 60% de son maximum, cette arme s'imprègne de feu ou de glace, et inflige des dégâts élémentaires.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "cursed") then
						frame:AddText("Maudit : Inflige de la corruption au porteur à chaque coup si vous n'êtes pas un Fidèle des Ténèbres.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "aoebuff") then
						frame:AddText("Zone d'effet bénéfique : +15% de Dégâts d'Attaque (sauf armes à feu), -25% de Dégâts Reçus, Régénération d'Endurance ×1.25, +2 de Récupération de Santé Mentale Résiduelle, Immunité aux Affaiblissements de Cri de Guerre sur la Santé Mentale et la Désorientation", Color(110, 30, 30), nil, 0.9);
					end
				
					if table.HasValue(itemTable.attributes, "concealable") then
						frame:AddText("Dissimulable (Ne se voit pas sur la personne)", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "conditionless") then
						frame:AddText("Sans usure : Cet objet ne subira pas de dégâts d'usure.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "fear") then
						frame:AddText("Peur : Les personnages des factions adverses seront désorientés et perdront leur santé mentale à votre proximité.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "ice") then
						frame:AddText("Frigid : Gèle les ennemis dans un bloc de glace au contact.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "grounded") then
						frame:AddText("À terre : Impossible d'attaquer en courant, mais toucher des ennemis à portée efficace les désoriente, les empêchant de courir pendant les 3 prochaines secondes.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "fire") then
						frame:AddText("Incendiaire : Enflamme les ennemis au contact.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "flail") then
						frame:AddText("Ne peut pas être utilisé à deux mains", Color(110, 30, 30), nil, 0.9);
						frame:AddText("Confiance en Dieu : À chaque coup, il y a 10% de chance d'effectuer une attaque plongeante infligeant +70% de dégâts bruts, de stabilité et d'endurance. La croyance 'Favorisé' augmente cette chance à 20%.", Color(110, 30, 30), nil, 0.9);
						frame:AddText("Téméraire : À chaque coup manqué, il y a 25 % de chances que vous vous frappiez vous-même pour la moitié des dégâts. La croyance 'Favorisé' réduit cette probabilité à 10 %.", Color(100, 9, 0), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "punisher") then
						frame:AddText("Punisher : Double l'endurance obtenue par la flagellation.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "versatile") then
						frame:AddText("Polyvalent : Efficace aussi bien en minage qu'en abattage, et ne subit aucune perte de condition lors de la récolte de ces nœuds.", Color(110, 30, 30), nil, 0.9);
					end
				
					if table.HasValue(itemTable.attributes, "rage") then
						frame:AddText("Rage (Sans bouclier) : La vitesse de déplacement est augmentée de 7 %.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "shieldbreaker") then
						frame:AddText("Brise-bouclier : Inflige 6 fois plus de dégâts de condition aux boucliers.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "splinter") then
						frame:AddText("Splinter : Inflige 3,5 fois plus de dégâts de condition aux boucliers.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "bell") then
						frame:AddText("Pour Qui Sonne le Glas : Désoriente tout personnage à proximité à chaque frappe sacrée.", Color(110, 30, 30), nil, 0.9);
					end
				end
			
				if weaponStats["attack"].dmgtype then
					frame:AddText("Type de dégâts :"..damageTypes[weaponStats["attack"].dmgtype] or "Unknown", Color(110, 30, 30), nil, 0.9);
				end
				
				if weaponStats["defense"].partialbulletblock then
					frame:AddText("Possède une résistance aux balles", Color(110, 30, 30), nil, 0.9);
				end
				
				if string.find(weaponClass, "begotten_spear") or string.find(weaponClass, "begotten_polearm") or string.find(weaponClass, "begotten_scythe") then
					frame:AddText("Dégâts de Contre : +70% de Bonus de Dégâts contre les ennemis en course lorsqu'ils sont attaqués de face.", Color(110, 30, 30), nil, 0.9);
				elseif weaponTable.isDagger then
					frame:AddText("Coup dans le dos : Inflige des dégâts doublés et 100% de dégâts de PA dans le dos des ennemis.", Color(110, 30, 30), nil, 0.9);
					frame:AddText("Coup de Grâce : Inflige des dégâts doublés et 100% de dégâts de pénétration d'armure aux ennemis à terre. Chaque coup augmente légèrement le temps nécessaire aux ennemis à terre pour se relever.", Color(110, 30, 30), nil, 0.9);
					frame:AddText("Ne peut infliger qu'un seul point de dégâts d'endurance, quel que soit le coût de blocage minimum des ennemis.", Color(100, 9, 0), nil, 0.9);
				end
				
				if itemTable.requiredFactions and not table.IsEmpty(itemTable.requiredFactions) and itemTable.requiredFactions[1] ~= "Wanderer" then
					frame:AddText("Faction requise :"..table.concat(itemTable.requiredFactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.requiredFaiths and not table.IsEmpty(itemTable.requiredFaiths) then
					frame:AddText("Foi requise :"..table.concat(itemTable.requiredFaiths, " or "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.requiredSubfactions and not table.IsEmpty(itemTable.requiredSubfactions) then
					frame:AddText("Sous-faction requise :"..table.concat(itemTable.requiredSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.excludedFactions and not table.IsEmpty(itemTable.excludedFactions) then
					frame:AddText("Factions exclues :"..table.concat(itemTable.excludedFactions, ", "), Color(110, 30, 30), nil, 0.9);
					
					if table.HasValue(itemTable.excludedFactions, Clockwork.Client:GetFaction()) and itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
						frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
					end
				end
				
				if itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
					frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				frame:AddText("Statistiques de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				if weaponStats["attack"].takeammo then
					local percentage = math.min(weaponStats["attack"].takeammo / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Coût de l'Attaque", Color(110, 30, 30), nil, 1);
						frame:AddText("Le coût en endurance de chaque attaque au corps à corps. Peut être affecté par des modificateurs comme les blessures ou les convictions.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].takeammo).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût d'Attaque", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].delay then
					local max_value = meleeMax.delay;
					local min_value = meleeMin.delay;
					local percentage = 1 - ((weaponStats["attack"].delay - min_value) / (max_value - min_value));
					local toolTip = function(frame)
						frame:AddText("Délai d'attaque", Color(110, 30, 30), nil, 1);
						frame:AddText("Le délai avant de pouvoir lancer une autre attaque après un coup.", Color(225, 200, 200), nil, 0.8);
					end
				
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].delay).."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Délai d'Attaque", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].striketime then
					local max_value = meleeMax.striketime;
					local min_value = meleeMin.striketime;
					local percentage = 1 - ((weaponStats["attack"].striketime - min_value) / (max_value - min_value));
					local toolTip = function(frame)
						frame:AddText("Vitesse de Frappe", Color(110, 30, 30), nil, 1);
						frame:AddText("Le délai avant que votre coup ne touche un adversaire potentiel.", Color(225, 200, 200), nil, 0.8);
					end
				
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].striketime).."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Vitesse d'Impact", Color(110, 30, 30), toolTip, true);
				end
			
				--[[if weaponStats["attack"].delay and weaponStats["attack"].striketime then
					local min_value = 0.75;
					local max_value = 3.5;
					local attack_speed = weaponStats["attack"].delay + weaponStats["attack"].striketime;
					local percentage = 1 - ((attack_speed - min_value) / (max_value - min_value));

					frame:AddBar(12, {{text = tostring(weaponStats["attack"].delay + weaponStats["attack"].striketime).."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Attack Speed", Color(110, 30, 30), toolTip, true);
				end]]--
			
				if weaponStats["attack"].armorpiercing then
					local armorpiercing = weaponStats["attack"].armorpiercing;
					local damagetype = weaponStats["attack"].dmgtype;
					local originalAP = armorpiercing;
					
					if armorpiercing then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.7, 1));
						else
							armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.5, 1));
						end
					
						local percentage = math.min(armorpiercing / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts perforants", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts perforants reflètent la capacité de votre arme à percer l'armure de vos ennemis. Des valeurs plus élevées signifient qu'une plus faible partie de vos dégâts principaux sera absorbée par leur armure.", Color(225, 200, 200), nil, 0.8);
						end
			
						if armorpiercing < originalAP then
							frame:AddBar(12, {{text = tostring(armorpiercing).." / "..tostring(originalAP), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Pénétration d'Armure", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(armorpiercing), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Pénétration d'Armure", Color(110, 30, 30), toolTip, true);
						end
					end
				end
			
				if weaponStats["attack"].primarydamage and !weaponTable.isJavelin then
					local damage = weaponStats["attack"].primarydamage;
					local damagetype = weaponStats["attack"].dmgtype;
					local originalDamage = damage;
					
					if damage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							damage = math.Round(damage * Lerp(scalar, 0.75, 1));
						elseif damagetype == DMG_SLASH then
							damage = math.Round(damage * Lerp(scalar, 0.4, 1));
						else
							damage = math.Round(damage * Lerp(scalar, 0.5, 1));
						end

						local percentage = math.min(damage / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts principaux", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts infligés par votre arme à la santé de votre adversaire. Peuvent être réduits par une armure proportionnellement à la valeur de pénétration d'armure de votre arme.", Color(225, 200, 200), nil, 0.8);
						end
			
						if damage < originalDamage then
							frame:AddBar(12, {{text = tostring(damage).." / "..tostring(originalDamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Principaux", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(damage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Principaux", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponStats["attack"].stabilitydamage then
					local percentage = math.min(weaponStats["attack"].stabilitydamage / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Dégâts de stabilité", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts infligés à la stabilité de votre adversaire par votre arme. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].stabilitydamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Stabilité", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].poisedamage then
					local percentage = math.min(weaponStats["attack"].poisedamage / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Dégâts d'endurance", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts d'endurance infligés à votre adversaire par votre arme. Infliger des dégâts d'endurance réduit la résistance d'un ennemi au combat ou sa capacité à fuir. Peut être neutralisé par les boucliers ennemis, bien que les dégâts d'endurance se combinent avec les dégâts principaux pour infliger des dégâts de condition aux boucliers ou aux armes de parade.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].poisedamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts d'Endurance", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].meleearc then
					local percentage = math.min(weaponStats["attack"].meleearc / 60, 60);
					local toolTip = function(frame)
						frame:AddText("Arc de l'arme", Color(110, 30, 30), nil, 1);
						frame:AddText("L'arc de votre arme détermine l'amplitude de vos attaques. Soyez prudent avec les armes à grand arc, car vous pourriez involontairement toucher vos alliés.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].meleearc).."°", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Arc de l'Arme", Color(110, 30, 30), toolTip, true);
				end

				if weaponStats["attack"].meleerange then
					local percentage = math.min((weaponStats["attack"].meleerange - 425) / (1500 - 425), (1500 - 425));
					local toolTip = function(frame)
						frame:AddText("Portée de Mêlée", Color(110, 30, 30), nil, 1);
						frame:AddText("La portée de mêlée de votre arme détermine la distance à laquelle vous pouvez frapper. Certaines armes, comme les armes d'hast et les lances, infligent également des dégâts variables selon votre distance par rapport à l'ennemi touché.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].meleerange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée de l'Arme", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].canaltattack then
					--frame:AddSpacer(4, Color(40, 40, 40, 120));
					
					if weaponStats["attack"].alttakeammo then
						local percentage = math.min(weaponStats["attack"].alttakeammo / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Coût de l'Attaque Alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("Le coût en endurance de chaque attaque de mêlée de la posture alternative. Peut être affecté par des modificateurs tels que blessures ou convictions.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].alttakeammo).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût d'Attaque Alternative", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["attack"].altarmorpiercing and weaponStats["attack"].altarmorpiercing != weaponStats["attack"].armorpiercing then
						local armorpiercing = weaponStats["attack"].altarmorpiercing;
						local damagetype;
						local originalAP = armorpiercing;
						
						if weaponTable.CanSwipeAttack then
							damagetype = DMG_CLUB;
						else
							damagetype = DMG_VEHICLE;
						end
						
						if armorpiercing then
							local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
						
							if damagetype == DMG_CLUB then
								armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.7, 1));
							else
								armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.5, 1));
							end
					
							local percentage = math.min(armorpiercing / 100, 100);
							local toolTip = function(frame)
								frame:AddText("Dégâts perforants alternatifs", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts perforants reflètent la capacité de l'attaque secondaire de votre arme à percer l'armure de vos ennemis. Des valeurs plus élevées signifient qu'une plus faible partie des dégâts principaux de votre arme sera absorbée par leur armure.", Color(225, 200, 200), nil, 0.8);
							end
				
							if armorpiercing < originalAP then
								frame:AddBar(12, {{text = tostring(armorpiercing).." / "..tostring(originalAP), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Pénétration d'Armure de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(armorpiercing), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Pénétration d'Armure de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
							end
						end
					end
				
					if weaponStats["attack"].primarydamage and weaponStats["attack"].altattackdamagemodifier then
						local damage = weaponStats["attack"].primarydamage;
						local damagetype;
						local originalDamage = damage;
						
						if weaponTable.CanSwipeAttack then
							damagetype = DMG_CLUB;
						else
							damagetype = DMG_VEHICLE;
						end
						
						if damage then
							local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
						
							if damagetype == DMG_CLUB then
								damage = math.Round(damage * Lerp(scalar, 0.75, 1));
							elseif damagetype == DMG_VEHICLE then
								damage = math.Round(damage * Lerp(scalar, 0.5, 1));
							end
					
							local percentage = math.min((damage / 100) * weaponStats["attack"].altattackdamagemodifier, 100);
							local toolTip = function(frame)
								frame:AddText("Dégâts de l'attaque alternative", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts infligés à la santé de votre adversaire par l'attaque secondaire de votre arme. Peuvent être réduits par l'armure proportionnellement à la valeur de pénétration d'armure de votre arme.", Color(225, 200, 200), nil, 0.8);
							end
				
							if damage < originalDamage then
								frame:AddBar(12, {{text = tostring(math.Round(damage * weaponStats["attack"].altattackdamagemodifier)).." / "..tostring(math.Round(originalDamage * weaponStats["attack"].altattackdamagemodifier)), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(math.Round(damage * weaponStats["attack"].altattackdamagemodifier)), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
							end
						end
					end
					
					if weaponStats["attack"].stabilitydamage and weaponStats["attack"].altattackstabilitydamagemodifier then
						local percentage = math.min((weaponStats["attack"].stabilitydamage / 100) * weaponStats["attack"].altattackstabilitydamagemodifier, 100);
						local toolTip = function(frame)
							frame:AddText("Stabilité de l'attaque secondaire Dégâts", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts à la stabilité de votre adversaire infligés par l'attaque alternative de votre arme. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].stabilitydamage * weaponStats["attack"].altattackstabilitydamagemodifier), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Stabilité de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["attack"].poisedamage and weaponStats["attack"].altattackpoisedamagemodifier then
						local percentage = math.min((weaponStats["attack"].poisedamage / 100) * weaponStats["attack"].altattackpoisedamagemodifier, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts d'endurance de l'attaque alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts d'endurance infligés par l'attaque alternative de votre arme à un adversaire. Infliger des dégâts d'endurance réduit la résistance d'un ennemi au combat ou sa capacité à fuir. Peut être neutralisé par les boucliers ennemis.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].poisedamage * weaponStats["attack"].altattackpoisedamagemodifier), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts d'Endurance de l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["attack"].altmeleearc then
						local percentage = math.min(weaponStats["attack"].altmeleearc / 60, 60);
						local toolTip = function(frame)
							frame:AddText("Arc d'arme d'attaque alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("L'arc de votre arme d'attaque secondaire détermine l'amplitude de son mouvement circulaire. Soyez prudent avec les armes à large arc, car elles peuvent toucher vos alliés par inadvertance.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].altmeleearc).."°", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Weapon Arc", Color(110, 30, 30), toolTip, true);
					end

					if weaponStats["attack"].meleerange then
						local newRange = weaponStats["attack"].meleerange;
						
						if weaponStats["attack"].altmeleerange then
							newRange = weaponStats["attack"].altmeleerange;
						--[[else
							if weaponTable.CanSwipeAttack then
								newRange = math.Round(newRange * 0.8);
							else
								newRange = math.Round(newRange * 1.2);
							end]]--
						end
						
						if newRange ~= weaponStats["attack"].meleerange then
							local percentage = math.min((newRange - 425) / (1500 - 425), (1500 - 425));
							local toolTip = function(frame)
								frame:AddText("Portée de Mêlée d'Attaque Alternative", Color(110, 30, 30), nil, 1);
								frame:AddText("La portée de mêlée de l'attaque alternative de votre arme détermine la distance à laquelle vous pouvez frapper en posture alternative. Certaines armes comme les armes d'hast et les lances infligent également des dégâts variables selon votre distance par rapport à l'ennemi touché.", Color(225, 200, 200), nil, 0.8);
							end
			
							frame:AddBar(12, {{text = tostring(newRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée de l'Arme pour l'Attaque Alternative", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponStats["defense"].blockcone then
					local percentage = math.min(weaponStats["defense"].blockcone / 270, 270);
					local toolTip = function(frame)
						frame:AddText("Cône de Blocage", Color(110, 30, 30), nil, 1);
						frame:AddText("Le cône de blocage de votre arme ou bouclier détermine les angles auxquels la parade est efficace, lorsque vous faites face à un adversaire.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(weaponStats["defense"].blockcone).."°", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", noDisplay = true}}, "Cône de Blocage", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["defense"].guardblockamount then
					local percentage = math.min(weaponStats["defense"].guardblockamount / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Coût de Bloc (Minimum)", Color(110, 30, 30), nil, 1);
						frame:AddText("Le coût minimal en endurance pour bloquer avec votre arme ou bouclier, si une attaque ennemie inflige des dégâts d'endurance.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(weaponStats["defense"].guardblockamount).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût de Blocage (Minimum)", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["defense"].poiseresistance then
					local percentage = math.min(weaponStats["defense"].poiseresistance / 50, 50);
					local toolTip = function(frame)
						frame:AddText("Résistance aux dégâts d'endurance de blocage", Color(110, 30, 30), nil, 1);
						frame:AddText("La résistance de votre arme ou bouclier aux dégâts d'endurance supplémentaires au-delà du coût minimum lors d'un blocage.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(weaponStats["defense"].poiseresistance).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts d'Endurance en Blocage", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["defense"].canparry then
					if weaponStats["defense"].parrytakestamina then
						local percentage = math.min(weaponStats["defense"].parrytakestamina / 40, 40);
						local toolTip = function(frame)
							frame:AddText("Coût de Parade", Color(110, 30, 30), nil, 1);
							frame:AddText("Le coût en endurance pour tenter une parade. Parer un adversaire avec succès remboursera la moitié de ce coût.", Color(225, 200, 200), nil, 0.8);
						end

						frame:AddBar(12, {{text = tostring(weaponStats["defense"].parrytakestamina).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût de Parade", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["defense"].parrydifficulty then
						local percentage = math.Clamp(weaponStats["defense"].parrydifficulty / 0.3, 0, 1);
						local toolTip = function(frame)
							frame:AddText("Fenêtre de Parade", Color(110, 30, 30), nil, 1);
							frame:AddText("Le temps en secondes après une parade pendant lequel votre parade reste active. Des valeurs plus élevées facilitent la parade en élargissant la fenêtre de temps.", Color(225, 200, 200), nil, 0.8);
						end

						frame:AddBar(12, {{text = tostring(weaponStats["defense"].parrydifficulty).."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Fenêtre de Parade", Color(110, 30, 30), toolTip, true);
					end
				end
			end
		end
		
		return true;
	elseif (category == "Throwables") then
		local damageTypes = {[2] = "Bullet", [4] = "Slash", [16] = "Pierce", [128] = "Blunt", [1073741824] = "Pierce"};
		local weaponClass = itemTable.uniqueID;
		local weaponStats = {["attack"] = nil, ["defense"] = nil};
		local weaponTable;

		if weaponClass then
			weaponTable = _G.weapons.Get(weaponClass);
			category = weaponTable.Category;
		end
		
		if string.find(category, "(Begotten)") then
			category = string.sub(category, 12)
		end
		
		if category == "Throwables" then
			category = "Throwable";
		end
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end
		
		if itemTable.requiredbeliefs and #itemTable.requiredbeliefs > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.requiredbeliefs do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.requiredbeliefs[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.requiredbeliefs[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances requises :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if itemTable.onerequiredbelief and #itemTable.onerequiredbelief > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.onerequiredbelief do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.onerequiredbelief[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.onerequiredbelief[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances Requises (L'une des suivantes) :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end

		if weaponTable then
			if weaponTable.AttackTable then
				weaponStats["attack"] = GetTable(weaponTable.AttackTable);
			end
			
			if weaponTable.BlockTable then
				weaponStats["defense"] = GetTable(weaponTable.BlockTable);
			end
			
			if weaponStats["attack"] and weaponStats["defense"] then
				frame:AddText("Attributs de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				frame:AddText("Facilement Réparable : Nécessite moins de condition de kit de réparation de mêlée pour être réparé.", Color(110, 30, 30), nil, 0.9);
				frame:AddText("Arme à distance : Vous serez désarmé en subissant des dégâts avec cette arme.", Color(110, 30, 30), nil, 0.9);
				frame:AddText("Dégâts variables : Les dégâts augmentent ou diminuent en fonction de la distance de la cible. Les cibles plus éloignées subiront davantage de dégâts.", Color(110, 30, 30), nil, 0.9);
				
				if !weaponStats["defense"].candeflect then
					frame:AddText("Impossible de Dévier", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.isSacrifical then
					frame:AddText("Corrompt le Porteur", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.attributes then
					if table.HasValue(itemTable.attributes, "concealable") then
						frame:AddText("Dissimulable (Ne se voit pas sur la personne)", Color(110, 30, 30), nil, 0.9);
					end
				
					if table.HasValue(itemTable.attributes, "ice") then
						frame:AddText("Frigide : Gèle les ennemis dans un bloc de glace au contact.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "fire") then
						frame:AddText("Incendiaire : Enflamme les ennemis au contact.", Color(110, 30, 30), nil, 0.9);
					end
				
					if table.HasValue(itemTable.attributes, "rage") then
						frame:AddText("Rage (Sans bouclier) : La vitesse de déplacement est augmentée de 7 %.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "malleable") then
						frame:AddText("Malléable : Se brise au contact, indépendamment de toute croyance, pour empêcher qu'il ne soit ramassé et renvoyé.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "shieldbreaker") then
						frame:AddText("Brise-bouclier : Inflige des dégâts de condition supplémentaires aux boucliers.", Color(110, 30, 30), nil, 0.9);
					end
				end
			
				if weaponStats["attack"].dmgtype then
					frame:AddText("Type de dégâts :"..damageTypes[weaponStats["attack"].dmgtype] or "Unknown", Color(110, 30, 30), nil, 0.9);
				end
				
				frame:AddText("Statistiques de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				if weaponStats["attack"].takeammo then
					local percentage = math.min(weaponStats["attack"].takeammo / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Coût de l'Attaque", Color(110, 30, 30), nil, 1);
						frame:AddText("Le coût en endurance de chaque lancer de javelot. Peut être affecté par des modificateurs comme les blessures ou les convictions.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].takeammo).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Attack Cost", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].armorpiercing then
					local armorpiercing = weaponStats["attack"].armorpiercing;
					local damagetype = weaponStats["attack"].dmgtype;
					local originalAP = armorpiercing;
					
					if armorpiercing then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.7, 1));
						else
							armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.5, 1));
						end
					
						local percentage = math.min(armorpiercing / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts perforants", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts perforants reflètent la capacité de votre arme à percer l'armure de vos ennemis. Des valeurs plus élevées signifient qu'une moindre partie de vos dégâts principaux sera absorbée par leur armure. Pour les javelots, cela s'applique à la fois aux dégâts du projectile et en combat rapproché. Cependant, la perte de condition n'affectera que les dégâts en mêlée.", Color(225, 200, 200), nil, 0.8);
						end
			
						if armorpiercing < originalAP then
							frame:AddBar(12, {{text = tostring(armorpiercing).." / "..tostring(originalAP), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Armor-Piercing Damage", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(armorpiercing), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Armor-Piercing Damage", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponStats["attack"].mimimumdistancedamage then
					local damagetype = weaponStats["attack"].dmgtype;
					local mimimumdistancedamage = weaponStats["attack"].mimimumdistancedamage;
					local originalDamage = mimimumdistancedamage;
					
					if mimimumdistancedamage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							mimimumdistancedamage = math.Round(mimimumdistancedamage * Lerp(scalar, 0.75, 1));
						elseif damagetype == DMG_SLASH then
							mimimumdistancedamage = math.Round(mimimumdistancedamage * Lerp(scalar, 0.4, 1));
						else
							mimimumdistancedamage = math.Round(mimimumdistancedamage * Lerp(scalar, 0.5, 1));
						end

						local percentage = math.min(mimimumdistancedamage / 200, 200);
						local toolTip = function(frame)
							frame:AddText("Dégâts minimum des projectiles", Color(110, 30, 30), nil, 1);
							frame:AddText("Le montant minimal de dégâts que votre projectile peut infliger. Ce montant est appliqué lors d'un impact à bout portant, et augmente progressivement avec la distance de la cible.", Color(225, 200, 200), nil, 0.8);
						end
			
						if mimimumdistancedamage < originalDamage then
							frame:AddBar(12, {{text = tostring(mimimumdistancedamage).." / "..tostring(originalDamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Minimum Projectile Damage", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(mimimumdistancedamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Minimum Projectile Damage", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponStats["attack"].maximumdistancedamage then
					local damagetype = weaponStats["attack"].dmgtype;
					local maximumdistancedamage = weaponStats["attack"].maximumdistancedamage;
					local originalDamage = maximumdistancedamage;
					
					if maximumdistancedamage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							maximumdistancedamage = math.Round(maximumdistancedamage * Lerp(scalar, 0.75, 1));
						elseif damagetype == DMG_SLASH then
							maximumdistancedamage = math.Round(maximumdistancedamage * Lerp(scalar, 0.4, 1));
						else
							maximumdistancedamage = math.Round(maximumdistancedamage * Lerp(scalar, 0.5, 1));
						end

						local percentage = math.min(maximumdistancedamage / 200, 200);
						local toolTip = function(frame)
							frame:AddText("Dégâts Maximum des Projectiles", Color(110, 30, 30), nil, 1);
							frame:AddText("La quantité maximale de dégâts que votre projectile peut infliger. La distance maximale est atteinte à environ 12 mètres de votre cible, et toute distance supplémentaire n'augmentera pas les dégâts.", Color(225, 200, 200), nil, 0.8);
						end
			
						if maximumdistancedamage < originalDamage then
							if string.find(weaponClass, "begotten_javelin_throwing_axe") or string.find(weaponClass, "begotten_javelin_throwing_dagger") then
									frame:AddBar(12, {{text = tostring(maximumdistancedamage).." / "..tostring(originalDamage).." (At 30 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Maximum Projectile Damage", Color(110, 30, 30), toolTip, true);
								else
									frame:AddBar(12, {{text = tostring(maximumdistancedamage).." / "..tostring(originalDamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Maximum Projectile Damage", Color(110, 30, 30), toolTip, true);
								end
						else
							if string.find(weaponClass, "begotten_javelin_throwing_axe") or string.find(weaponClass, "begotten_javelin_throwing_dagger") then
								frame:AddBar(12, {{text = tostring(maximumdistancedamage).." (At 30 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Maximum Projectile Damage", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(maximumdistancedamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Maximum Projectile Damage", Color(110, 30, 30), toolTip, true);
							end
						end
					end
				end
				
				if weaponStats["attack"].stabilitydamage then
					local percentage = math.min(weaponStats["attack"].stabilitydamage / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Dégâts de stabilité", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts de stabilité infligés à votre adversaire par votre arme. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie. Pour les javelots, cela varie selon la distance : les cibles éloignées subiront considérablement plus de dégâts de stabilité, tandis que les cibles proches en subiront considérablement moins. À portée maximale, le projectile infligera le double de ces dégâts de stabilité.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].stabilitydamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Stability Damage", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].poisedamage then
					local percentage = math.min(weaponStats["attack"].poisedamage / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Dégâts d'endurance", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts infligés à l'endurance de votre adversaire par votre arme. Infliger des dégâts d'endurance réduit la résistance d'un ennemi au combat ou sa capacité à fuir. Peut être neutralisé par les boucliers ennemis.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponStats["attack"].poisedamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Stamina Damage", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponStats["attack"].canaltattack then
					--frame:AddSpacer(4, Color(40, 40, 40, 120));
					
					if weaponStats["attack"].alttakeammo then
						local percentage = math.min(weaponStats["attack"].alttakeammo / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Coût de l'Attaque Alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("Le coût en endurance de chaque attaque de mêlée de la posture alternative. Peut être affecté par des modificateurs tels que les blessures ou les convictions.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].alttakeammo).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Cost", Color(110, 30, 30), toolTip, true);
					end
					
				if weaponStats["attack"].primarydamage then -- Uses the "primarydamage" value but only applies to the melee attack of throwable weapons
					local damage = weaponStats["attack"].primarydamage;
					local damagetype = weaponStats["attack"].dmgtype;
					local originalDamage = damage;
					
					if damage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						if damagetype == DMG_CLUB then
							damage = math.Round(damage * Lerp(scalar, 0.75, 1));
						elseif damagetype == DMG_SLASH then
							damage = math.Round(damage * Lerp(scalar, 0.4, 1));
						else
							damage = math.Round(damage * Lerp(scalar, 0.5, 1));
						end

						local percentage = math.min(damage / 100, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts de l'attaque alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts infligés à la santé de votre adversaire par votre attaque de mêlée. Peuvent être réduits par l'armure proportionnellement à la valeur de pénétration d'armure de votre arme.", Color(225, 200, 200), nil, 0.8);
						end
			
						if damage < originalDamage then
							frame:AddBar(12, {{text = tostring(damage).." / "..tostring(originalDamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Damage", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(damage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Damage", Color(110, 30, 30), toolTip, true);
						end
					end
				end
					
					if weaponStats["attack"].altarmorpiercing then
						local armorpiercing = weaponStats["attack"].altarmorpiercing;
						local damagetype;
						local originalAP = armorpiercing;
						
						if weaponTable.CanSwipeAttack then
							damagetype = DMG_CLUB;
						else
							damagetype = DMG_VEHICLE;
						end
						
						if armorpiercing then
							local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
						
							if damagetype == DMG_CLUB then
								armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.7, 1));
							else
								armorpiercing = math.Round(armorpiercing * Lerp(scalar, 0.5, 1));
							end
					
							local percentage = math.min(armorpiercing / 100, 100);
							local toolTip = function(frame)
								frame:AddText("Dégâts perforants alternatifs", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts perforants reflètent la capacité de l'attaque secondaire de votre arme à percer l'armure de vos ennemis. Des valeurs plus élevées signifient qu'une plus faible partie des dégâts principaux de votre arme sera absorbée par leur armure.", Color(225, 200, 200), nil, 0.8);
							end
				
							if armorpiercing < originalAP then
								frame:AddBar(12, {{text = tostring(armorpiercing).." / "..tostring(originalAP), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Armor-Piercing Damage", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(armorpiercing), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Armor-Piercing Damage", Color(110, 30, 30), toolTip, true);
							end
						end
					end
				
					if weaponStats["attack"].primarydamage and weaponStats["attack"].altattackdamagemodifier then
						local damage = weaponStats["attack"].primarydamage;
						local damagetype;
						local originalDamage = damage;
						
						if weaponTable.CanSwipeAttack then
							damagetype = DMG_CLUB;
						else
							damagetype = DMG_VEHICLE;
						end
						
						if damage then
							local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
						
							if damagetype == DMG_CLUB then
								damage = math.Round(damage * Lerp(scalar, 0.75, 1));
							elseif damagetype == DMG_VEHICLE then
								damage = math.Round(damage * Lerp(scalar, 0.5, 1));
							end
						
							local percentage = math.min((damage / 100) * weaponStats["attack"].altattackdamagemodifier, 100);
							local toolTip = function(frame)
								frame:AddText("Dégâts de l'attaque alternative", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts infligés à la santé de votre adversaire par l'attaque secondaire de votre arme. Peuvent être réduits par l'armure proportionnellement à la valeur de pénétration d'armure de votre arme.", Color(225, 200, 200), nil, 0.8);
							end
				
							if damage < originalDamage then
								frame:AddBar(12, {{text = tostring(math.Round(damage * weaponStats["attack"].altattackdamagemodifier)).." / "..tostring(math.Round(originalDamage * weaponStats["attack"].altattackdamagemodifier)), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Damage", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(math.Round(damage * weaponStats["attack"].altattackdamagemodifier)), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Damage", Color(110, 30, 30), toolTip, true);
							end
						end
					end
					
					if weaponStats["attack"].stabilitydamage and weaponStats["attack"].altattackstabilitydamagemodifier and weaponStats["attack"].altattackstabilitydamagemodifier != 0 then
						local percentage = math.min((weaponStats["attack"].stabilitydamage / 100) * weaponStats["attack"].altattackstabilitydamagemodifier, 100);
						local toolTip = function(frame)
							frame:AddText("Stabilité de l'attaque alternative Dégâts", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts à la stabilité de votre adversaire infligés par l'attaque alternative de votre arme. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].stabilitydamage * weaponStats["attack"].altattackstabilitydamagemodifier), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Stability Damage", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["attack"].poisedamage and weaponStats["attack"].altattackpoisedamagemodifier then
						local percentage = math.min((weaponStats["attack"].poisedamage / 100) * weaponStats["attack"].altattackpoisedamagemodifier, 100);
						local toolTip = function(frame)
							frame:AddText("Dégâts d'endurance de l'attaque alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("Les dégâts d'endurance infligés par l'attaque alternative de votre arme à un adversaire. Infliger des dégâts d'endurance réduit la résistance d'un ennemi au combat ou sa capacité à fuir. Peut être neutralisé par les boucliers ennemis.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].poisedamage * weaponStats["attack"].altattackpoisedamagemodifier), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Stamina Damage", Color(110, 30, 30), toolTip, true);
					end
					
					if weaponStats["attack"].altmeleearc then
						local percentage = math.min(weaponStats["attack"].altmeleearc / 60, 60);
						local toolTip = function(frame)
							frame:AddText("Arc d'arme d'attaque alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("L'arc de votre arme d'attaque secondaire détermine l'amplitude de son mouvement. Soyez prudent avec les armes à grand arc, car elles peuvent toucher vos alliés par inadvertance.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(weaponStats["attack"].altmeleearc).."°", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Weapon Arc", Color(110, 30, 30), toolTip, true);
					end

					if weaponStats["attack"].meleerange then
						local newRange = weaponStats["attack"].meleerange;
						
						if weaponStats["attack"].altmeleerange then
							newRange = weaponStats["attack"].altmeleerange;
						--[[else
							if weaponTable.CanSwipeAttack then
								newRange = math.Round(newRange * 0.8);
							else
								newRange = math.Round(newRange * 1.2);
							end]]--
						end
						
						local percentage = math.min((newRange - 425) / (1500 - 425), (1500 - 425));
						local toolTip = function(frame)
							frame:AddText("Portée de Mêlée d'Attaque Alternative", Color(110, 30, 30), nil, 1);
							frame:AddText("La portée de mêlée de l'attaque alternative de votre arme détermine la distance à laquelle vous pouvez frapper en posture alternative. Certaines armes comme les armes d'hast et les lances infligent également des dégâts variables selon votre distance par rapport à l'ennemi touché.", Color(225, 200, 200), nil, 0.8);
						end
			
						frame:AddBar(12, {{text = tostring(newRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Alternate Attack Weapon Range", Color(110, 30, 30), toolTip, true);
					end
				end
			end
		end
		
		return true;
	elseif (category == "Shields") then
		local damageTypes = {[2] = "Bullet", [4] = "Slash", [16] = "Pierce", [128] = "Blunt", [DMG_BUCKSHOT] = "Grapeshot"};
		local shieldClass = itemTable.uniqueID;
		local shieldStats = nil;
		
		category = "Shield";
		
		if itemTable.requiredbeliefs then
			if table.HasValue(itemTable.requiredbeliefs, "defender") then
				category = "Great Shield";
			end
		end

		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end;
		
		if itemTable.requiredbeliefs and #itemTable.requiredbeliefs > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.requiredbeliefs do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.requiredbeliefs[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.requiredbeliefs[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances requises :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if itemTable.onerequiredbelief and #itemTable.onerequiredbelief > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.onerequiredbelief do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.onerequiredbelief[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.onerequiredbelief[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances Requises (Une des suivantes) :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if shieldClass then
			shieldStats = GetTable(shieldClass);
	
			if shieldStats then
				frame:AddText("Attributs du Bouclier :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);

				if shieldStats.blockdamagetypes then
					local blockDamageTypes = "";
					
					for i = 1, #shieldStats.blockdamagetypes do
						local blockDamageType = shieldStats.blockdamagetypes[i];
						
						if damageTypes[blockDamageType] then
							blockDamageTypes = blockDamageTypes..damageTypes[blockDamageType];
							
							if i < #shieldStats.blockdamagetypes then
								blockDamageTypes = blockDamageTypes..", ";
							end
						end
					end
					
					if blockDamageTypes ~= "" then
						frame:AddText("Types de dégâts bloqués :"..blockDamageTypes, Color(110, 30, 30), nil, 0.9);
					end
				end
			
				if shieldStats.canparry then
					frame:AddText("Peut Parer", Color(110, 30, 30), nil, 0.9);
				end
				
				if !shieldStats.candeflect then
					frame:AddText("Impossible de Dévier", Color(110, 30, 30), nil, 0.9);
				end
				
				if shieldStats.partialbulletblock then
					frame:AddText("Possède une résistance aux balles", Color(110, 30, 30), nil, 0.9);
				end
				
				if shieldStats.parrydifficulty and shieldStats.parrydifficulty > 0.2 then
					frame:AddText("A augmenté la fenêtre de parade", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.hasIncreasedDeflectionWindow then
					frame:AddText("Fenêtre de déviation augmentée (0,25s)", Color(110, 30, 30), nil, 0.9);
				end
				
				if category == "Great Shield" then
					frame:AddText("Grand Bouclier : Réduit la vitesse de course de 10 % lorsqu'il est tenu.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.unrepairable then
					frame:AddText("Irréparable : Ce bouclier ne peut être réparé et subira toujours des dégâts de condition, quelles que soient les croyances.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.attributes then
					if table.HasValue(itemTable.attributes, "conditionless") then
						frame:AddText("Sans usure : Cet objet ne subira pas de dégâts de condition.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "electrified") then
						frame:AddText("Électrifié : Inflige des dégâts de choc aux personnages qui frappent votre bouclier avec des armes en métal ou à mains nues s'ils portent une armure métallique.", Color(110, 30, 30), nil, 0.9);
					end
					
					if table.HasValue(itemTable.attributes, "spiked") then
						frame:AddText("Piquant : Subir des dégâts avec la plupart des armes de poing inflige une faible quantité de dégâts en retour à l'attaquant.", Color(110, 30, 30), nil, 0.9);
					end

					if table.HasValue(itemTable.attributes, "unbreakable") then
						frame:AddText("Résistance parfaite aux dégâts d'endurance : Vous êtes immunisé aux dégâts d'endurance pendant les blocages, et ne subirez que le coût de blocage minimum.", Color(110, 30, 30), nil, 0.9);
					end
				end
				
				if itemTable.requiredFactions and not table.IsEmpty(itemTable.requiredFactions) and itemTable.requiredFactions[1] ~= "Wanderer" then
					frame:AddText("Faction requise :"..table.concat(itemTable.requiredFactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.requiredFaiths and not table.IsEmpty(itemTable.requiredFaiths) then
					frame:AddText("Foi requise :"..table.concat(itemTable.requiredFaiths, " or "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.requiredSubfactions and not table.IsEmpty(itemTable.requiredSubfactions) then
					frame:AddText("Sous-faction requise :"..table.concat(itemTable.requiredSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.excludedFactions and not table.IsEmpty(itemTable.excludedFactions) then
					frame:AddText("Factions exclues :"..table.concat(itemTable.excludedFactions, ", "), Color(110, 30, 30), nil, 0.9);
					
					if table.HasValue(itemTable.excludedFactions, Clockwork.Client:GetFaction()) and itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
						frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
					end
				end
				
				if itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
					frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
				end
				
				frame:AddText("Statistiques du Bouclier :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				if itemTable.conditionScale then
					local shieldDurabilityRawValue = math.Round(500 + (50 - 500) * ((itemTable.conditionScale - 0.25) / (1.3 - 0.25)))
					local shieldDurability = math.min(500, math.max(25, shieldDurabilityRawValue))
					local percentage = shieldDurability / 500
					local toolTip = function(frame)
						frame:AddText("Durabilité du Bouclier", Color(110, 30, 30), nil, 1);
						frame:AddText("Plus cette statistique est élevée, plus votre bouclier peut encaisser de coups avant de se briser.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(shieldDurability).." / 500", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Durabilité du Bouclier", Color(110, 30, 30), toolTip, true);
				end
				
				if shieldStats.blockcone then
					local percentage = math.min(shieldStats.blockcone / 270, 270);
					local toolTip = function(frame)
						frame:AddText("Cône de Blocage", Color(110, 30, 30), nil, 1);
						frame:AddText("Le cône de blocage de votre arme ou bouclier détermine les angles auxquels la parade est efficace, lorsque vous faites face à un adversaire.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(shieldStats.blockcone).."°", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Cône de Blocage", Color(110, 30, 30), toolTip, true);
				end
				
				if shieldStats.guardblockamount then
					local percentage = math.min(shieldStats.guardblockamount / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Coût de Bloc (Minimum)", Color(110, 30, 30), nil, 1);
						frame:AddText("Le coût minimal en endurance pour bloquer avec votre arme ou bouclier, si une attaque ennemie inflige des dégâts d'endurance.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(shieldStats.guardblockamount).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût de Blocage (Minimum)", Color(110, 30, 30), toolTip, true);
				end
				
				if shieldStats.poiseresistance then
					local percentage = math.min(shieldStats.poiseresistance / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Résistance aux dégâts d'endurance de blocage", Color(110, 30, 30), nil, 1);
						frame:AddText("La résistance de votre arme ou bouclier aux dégâts d'endurance supplémentaires au-delà du coût minimum lors d'un blocage.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring(shieldStats.poiseresistance).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts d'Endurance en Blocage", Color(110, 30, 30), toolTip, true);
				end
				
				if shieldStats.canparry then
					if shieldStats.parrytakestamina then
						local percentage = math.min(shieldStats.parrytakestamina / 40, 40);
						local toolTip = function(frame)
							frame:AddText("Coût de Parade", Color(110, 30, 30), nil, 1);
							frame:AddText("Le coût en endurance pour tenter une parade. Une parade réussie contre un adversaire remboursera la moitié de ce coût.", Color(225, 200, 200), nil, 0.8);
						end

						frame:AddBar(12, {{text = tostring(shieldStats.parrytakestamina).." Stamina", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Coût de Parade", Color(110, 30, 30), toolTip, true);
					end
					
					if shieldStats.parrydifficulty then
						local percentage = 1 - math.min(shieldStats.parrydifficulty / 0.3, 0.3);
						local toolTip = function(frame)
							frame:AddText("Fenêtre de Parade", Color(110, 30, 30), nil, 1);
							frame:AddText("Le temps en secondes après une parade pendant lequel votre parade reste active. Des valeurs plus élevées facilitent la parade en élargissant la fenêtre de temps.", Color(225, 200, 200), nil, 0.8);
						end

						frame:AddBar(12, {{text = tostring(shieldStats.parrydifficulty).."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Fenêtre de Parade", Color(110, 30, 30), toolTip, true);
					end
				end
				
				if shieldStats.damagereduction then
					local percentage = math.min(1 - shieldStats.damagereduction, 0.3);
					local toolTip = function(frame)
						frame:AddText("Réduction des dégâts des armes", Color(110, 30, 30), nil, 1);
						frame:AddText("Les boucliers équipés peuvent réduire les dégâts des armes équipées jusqu'à une valeur de 30% pour les boucliers les plus lourds.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = tostring((1 - shieldStats.damagereduction) * 100).."%", percentage = percentage * 333.33, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Réduction des Dégâts de l'Arme", Color(110, 30, 30), toolTip, true);
				end
			end
		end
		
		return true;
	elseif (category == "Armor" or category == "Helms") then
		local damageTypes = {[2] = "Bullet", [4] = "Slash", [16] = "Pierce", [128] = "Blunt"};
		local limbs = {[1] = "Tête", [2] = "Poitrine", [3] = "Ventre", [4] = "Bras gauche", [5] = "Bras droit", [6] = "Jambe gauche", [7] = "Jambe droite"};		local name = itemTable:GetName();
		
		if category == "Helms" then
			category = "Helmet";
		end
		
		if itemTable.weightclass and itemTable.type then
			local material = string.upper(string.sub(itemTable.type, 1, 1))..string.sub(itemTable.type, 2);
			
			frame:AddText(name.." - "..itemTable.weightclass.." "..material.." "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		elseif itemTable.type then
			local material = string.upper(string.sub(itemTable.type, 1, 1))..string.sub(itemTable.type, 2);
		
			frame:AddText(name.." - "..material.." "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		else
			frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		end
		
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end;
		
		if itemTable.requiredbeliefs and #itemTable.requiredbeliefs > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.requiredbeliefs do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.requiredbeliefs[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.requiredbeliefs[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances requises :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if itemTable.onerequiredbelief and #itemTable.onerequiredbelief > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.onerequiredbelief do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.onerequiredbelief[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.onerequiredbelief[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances Requises (Une des Suivantes) :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		frame:AddText("Attributs de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);

		if itemTable.effectiveLimbs then
			local effectiveLimbsText = "Effective Limbs: ";
			
			for i = 1, 7 do
				if itemTable.effectiveLimbs[i] then
					if effectiveLimbsText ~= "Effective Limbs: " then
						effectiveLimbsText = effectiveLimbsText..", ";
					end
					
					effectiveLimbsText = effectiveLimbsText..limbs[i];
				end
			end
		
			frame:AddText(effectiveLimbsText, Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.unrepairable then
			frame:AddText("Irréparable : Cette armure ne peut pas être réparée et subira toujours des dégâts de condition, quelles que soient les croyances.", Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.attributes then
			if table.HasValue(itemTable.attributes, "conditionless") then
				frame:AddText("Sans usure : Cet objet ne subira pas de dégâts d'usure.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "disease_resistance") then
				frame:AddText("Résistance aux maladies : Cet objet vous protège des maladies transmises par voie aérienne.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "double_jump") then
				frame:AddText("Double Saut : Cet objet vous permet d'effectuer un double saut en appuyant sur votre touche de saut en plein élan.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "electrified") then
				frame:AddText("Électrifié : Inflige des dégâts de choc aux personnages qui vous frappent avec des armes en métal ou à mains nues s'ils portent une armure métallique.", Color(110, 30, 30), nil, 0.9);
			end
		
			if table.HasValue(itemTable.attributes, "fear") then
				frame:AddText("Peur : Les personnages des factions adverses seront désorientés et perdront de la santé mentale à votre proximité.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "increased_regeneration") then
				frame:AddText("Régénération Accrue : Triple la régénération de santé conférée par le 'Don du Grand Arbre'.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "lifeleech") then
				frame:AddText("Lifeleech (Sans bouclier) : 100 % des dégâts infligés sont convertis en points de vie", Color(110, 30, 30), nil, 0.9);
			end

			if(table.HasValue(itemTable.attributes, "banner_blessing")) then
				frame:AddText("Bénédiction de la Bannière (Sans Bouclier) : Lorsqu'une bannière de soutien est équipée, il n'est pas nécessaire de la tenir pour bénéficier de ses effets.", Color(110, 30, 30), nil, 0.9)
			end
			
			if table.HasValue(itemTable.attributes, "mothers_blessing") then
				frame:AddText("Bénédiction de la Mère : Réduit de 50% l'acquisition de corruption.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "night_vision") then
				frame:AddText("Vision Nocturne : La vision nocturne peut être activée en faisant un clic droit avec les Sens lorsque cette armure est équipée.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "not_unequippable") then
				frame:AddText("Non déséquipable : Cet objet ne peut être retiré une fois porté et restera équipé jusqu'à votre mort.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "rage") then
				frame:AddText("Rage (Sans bouclier) : La vitesse de déplacement est augmentée de 7 %. Les cris de guerre restaurent +15 points d'endurance.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "godless") then
				frame:AddText("Sans Dieu (Sans Bouclier) : Augmente les dégâts de mêlée, d'endurance et de stabilité de 25% lorsque la santé mentale est à 40% ou moins. Augmente les dégâts de stabilité des pierres de jet de 25%.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "iconoclast") then
				frame:AddText("Iconoclaste (Sans Bouclier) : Votre cri de guerre bénit tous les membres du Clan Grock à portée de voix, leur conférant +25 d'endurance, 25% de résistance aux dégâts et +15% de vitesse de déplacement pendant 15 secondes. Les cibles affectées par ce bonus sont surlignées en gris, et vous perdez 5 points de santé mentale par cri de guerre.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "lesserlifeleech") then
				frame:AddText("Lesser Lifeleech (Sans Bouclier) : 70 % des dégâts en Armure Légère, 50 % en Armure Moyenne, 30 % en Armure Lourde sont convertis en points de vie.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "wastelord") then
				frame:AddText("Seigneur des Déchets : Cette armure ne convient qu'à ceux sans emblème, et ne peut être portée par les factions.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "seafarer") then
				frame:AddText("Marin : La vitesse de déplacement est augmentée de 3%, et les projectiles infligent 10% de dégâts supplémentaires.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "thermal_vision") then
				frame:AddText("Vision thermique : La vision thermique remplace les sens tant que cette armure est équipée.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "solblessed") then
				--frame:AddText("Béni par la Haine : L'équiper octroie la barre de 'Haine', qui se remplit en infligeant ou en subissant des dégâts. À 100%, la 'Haine' empêche la mort par dégâts mais retombe à 0%.", Color(110, 30, 30), nil, 0.9);
				frame:AddText("Béni par la Haine : L'équiper octroie la barre de 'Haine', qui se remplit en subissant des dégâts. À 100%, la 'Haine' empêche la mort par dégâts mais retombe à 0%.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "deathknell") then
				frame:AddText("Deathknell : Subir des dégâts à la tête désoriente à la fois vous et votre agresseur.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "bloodtoll") then
				frame:AddText("Tollé Sanguin : Tout dommage à la tête provoquera systématiquement une blessure hémorragique.", Color(100, 9, 0), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "spiked") then
				frame:AddText("Épineux : Subir des dégâts de la plupart des armes de poing infligera une faible quantité de dégâts en retour à l'attaquant.", Color(110, 30, 30), nil, 0.9);
			end
			
			if table.HasValue(itemTable.attributes, "practitioner") then
				frame:AddText("Pratiquant : Augmente l'efficacité des objets de soin utilisés sur vous-même et sur les autres de 25%.", Color(110, 30, 30), nil, 0.9);
			end

			if table.HasValue(itemTable.attributes, "miracle_doctor") then
				frame:AddText("Miracle Doctor : Tout objet de soin qui soignerait normalement uniquement les saignements guérira désormais également les entailles.", Color(110, 30, 30), nil, 0.9);
			end
		end
		
		--if itemTable.weight then
			if itemTable.weightclass == "Medium" then
				frame:AddText("Réduction de vitesse de sprint : 15%", Color(110, 30, 30), nil, 0.9);
			elseif itemTable.weightclass == "Heavy" then
				frame:AddText("Réduction de vitesse de sprint : 35%", Color(110, 30, 30), nil, 0.9);
			end
		--end
		
		if itemTable.requiredFactions and not table.IsEmpty(itemTable.requiredFactions) and itemTable.requiredFactions[1] ~= "Wanderer" then
			frame:AddText("Faction requise :"..table.concat(itemTable.requiredFactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.requiredFaiths and not table.IsEmpty(itemTable.requiredFaiths) then
			frame:AddText("Foi requise :"..table.concat(itemTable.requiredFaiths, " or "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.requiredSubfactions and not table.IsEmpty(itemTable.requiredSubfactions) then
			frame:AddText("Sous-faction requise :"..table.concat(itemTable.requiredSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.excludedFactions and not table.IsEmpty(itemTable.excludedFactions) then
			frame:AddText("Factions exclues :"..table.concat(itemTable.excludedFactions, ", "), Color(110, 30, 30), nil, 0.9);
			
			if table.HasValue(itemTable.excludedFactions, Clockwork.Client:GetFaction()) and itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
				frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
			end
		end
		
		if itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
			frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		local addedStats = false;
		
		if itemTable.protection then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
			
			local protection = itemTable.protection;
			local originalProtection = protection;
			
			if (condition < 90) then
				protection = math.Round(protection * (condition / 100));
			end
			
			local percentage = math.min(protection, 100);
			local toolTip = function(frame)
				frame:AddText("Efficacité de l'armure", Color(110, 30, 30), nil, 1);
				frame:AddText("Efficacité de l'armure, comme son nom l'indique, affecte la performance de votre armure contre les attaques ennemies. Des valeurs d'efficacité plus élevées réduisent les dégâts des attaques adverses, mais peuvent à leur tour être diminuées par les dégâts perforants de l'ennemi. Notez que plus l'état de votre armure est bas, plus votre protection sera faible.", Color(225, 200, 200), nil, 0.8);
			end

			if protection < originalProtection then
				frame:AddBar(12, {{text = tostring(protection).."% / "..originalProtection.."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Efficacité de l'Armure", Color(110, 30, 30), toolTip, true);
			else
				frame:AddBar(12, {{text = tostring(protection).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Efficacité de l'Armure", Color(110, 30, 30), toolTip, true);
			end
		end
		
		if itemTable.bluntScale then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
		
			local percentage = (1 - itemTable.bluntScale) * 100;
			local toolTip = function(frame)
				frame:AddText("Résistance aux Dégâts Contondants", Color(110, 30, 30), nil, 1);
				frame:AddText("Réduit les dégâts contondants d'un montant fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
			end

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts Contondants", Color(110, 30, 30), toolTip, true);
		end
		
		if itemTable.bulletScale then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
		
			local percentage = (1 - itemTable.bulletScale) * 100;
			local toolTip = function(frame)
				frame:AddText("Résistance aux dégâts de balle", Color(110, 30, 30), nil, 1);
				frame:AddText("Réduit les dégâts des balles d'une valeur fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
			end

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts de Balles", Color(110, 30, 30), toolTip, true);
		end
		
		--[[if itemTable.damageTypeScales and itemTable.damageTypeScales[DMG_FALL] then
			local percentage = -itemTable.damageTypeScales[DMG_FALL];

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Fall Damage Resistance", Color(110, 30, 30), toolTip, true);
		end]]--
		
		if itemTable.pierceScale then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
			
			local percentage = (1 - itemTable.pierceScale) * 100;
			local toolTip = function(frame)
				frame:AddText("Résistance aux dégâts perforants", Color(110, 30, 30), nil, 1);
				frame:AddText("Réduit les dégâts de perforation d'une valeur fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
			end

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts Perforants", Color(110, 30, 30), toolTip, true);
		end
		
		if itemTable.slashScale then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
			
			local percentage = (1 - itemTable.slashScale) * 100;
			local toolTip = function(frame)
				frame:AddText("Résistance aux dégâts de taille", Color(110, 30, 30), nil, 1);
				frame:AddText("Réduit les dégâts de taille d'une valeur fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
			end

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts Tranchants", Color(110, 30, 30), toolTip, true);
		end
		
		if itemTable.stabilityScale then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end	
			
			local percentage = (1 - itemTable.stabilityScale) * 100;
			local toolTip = function(frame)
				frame:AddText("Résistance aux dégâts de stabilité", Color(110, 30, 30), nil, 1);
				frame:AddText("Réduit les dégâts de stabilité d'une valeur fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
			end

			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts de Stabilité", Color(110, 30, 30), toolTip, true);
		else
			local armorClass = itemTable.weightclass;
			
			if armorClass then
				if !addedStats then
					frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
					
					addedStats = true;
				end	
			
				local percentage = 0;
			
				if armorClass == "Heavy" then
					percentage = 0.4;
				elseif armorClass == "Medium" then
					percentage = 0.3;
				elseif armorClass == "Light" then
					percentage = 0.25;
				end
				
				percentage = percentage * 100;
				
				local toolTip = function(frame)
					frame:AddText("Résistance aux dégâts de stabilité", Color(110, 30, 30), nil, 1);
					frame:AddText("Réduit les dégâts de stabilité d'une valeur fixe, indépendamment de l'efficacité de l'armure.", Color(225, 200, 200), nil, 0.8);
				end
				
				frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Résistance aux Dégâts de Stabilité", Color(110, 30, 30), toolTip, true);
			end
		end
		
		if cwWarmth and cwWarmth.systemEnabled and itemTable.insulation then
			if !addedStats then
				frame:AddText("Statistiques de l'armure :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				addedStats = true;
			end
			
			local percentage = itemTable.insulation;

			if(category == "Helmet") then percentage = percentage * 0.20;
			elseif(!itemTable.hasHelmet) then percentage = percentage * 0.80; end
		
			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Isolation", Color(110, 30, 30), true);
		end
		
		return true;
	elseif (category == "Crossbows") or (category == "Firearms") then
		local weaponAmmo = itemTable:GetData("Ammo");
		local weaponClass = itemTable.uniqueID;
		local weaponTable;

		if string.find(category, "(Begotten)") then
			category = string.gsub(category, "(Begotten) ", "");
		end
		
		if itemTable.firearmType then
			category = itemTable.firearmType;
		end
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end
		
		if itemTable.requiredFaiths and not table.IsEmpty(itemTable.requiredFaiths) then
			frame:AddText("Foi requise :"..table.concat(itemTable.requiredFaiths, " or "), Color(110, 30, 30), nil, 0.9);
		end

		if weaponClass then
			weaponTable = _G.weapons.Get(weaponClass);
			
			if weaponTable then
				frame:AddText("Attributs de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);

				if !weaponTable.MisfireChance or weaponTable.MisfireChance == 0 then
					frame:AddText("Ne peut pas rater", Color(110, 30, 30), nil, 0.9);
				end
				
				frame:AddText("Arme à distance : Vous serez désarmé en subissant des dégâts avec cette arme.", Color(110, 30, 30), nil, 0.9);
				
				if itemTable.unrepairable then
					frame:AddText("Irréparable : Cette arme ne peut pas être réparée et subira toujours des dégâts de condition, indépendamment des croyances.", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.attributes then
					if table.HasValue(itemTable.attributes, "melee") then
						frame:AddText("Posture de Mêlée : Peut être utilisée comme arme de corps à corps en changeant de posture.", Color(110, 30, 30), nil, 0.9);
					elseif table.HasValue(itemTable.attributes, "sundering_shot") then
						frame:AddText("Tir Fracassant : Se déplaçant à des vitesses supersoniques, le Longshot de l'Ancien Monde ignore complètement les armures et les boucliers.", Color(110, 30, 30), nil, 0.9);
					elseif table.HasValue(itemTable.attributes, "sundering_shot_grapeshot") then
						frame:AddText("Tir Fracassant : Se déplaçant à des vitesses supersoniques, la mitraille de l'Ancien Monde ignore complètement les armures et les boucliers.", Color(110, 30, 30), nil, 0.9);
					elseif table.HasValue(itemTable.attributes, "variable_damage") then
						frame:AddText("Dégâts variables : Les dégâts augmentent ou diminuent en fonction de la distance de la cible. Les cibles plus éloignées subiront davantage de dégâts.", Color(110, 30, 30), nil, 0.9);
					elseif table.HasValue(itemTable.attributes, "suppressed") then
						frame:AddText("Supprimé : Lors de l'utilisation de Pop-a-Shot, cette arme à feu sera plus silencieuse que la plupart et ne peut être entendue à longue distance.", Color(110, 30, 30), nil, 0.9);
					end
				end

				if itemTable.usesMagazine then
					frame:AddText("Utilise des chargeurs amovibles", Color(110, 30, 30), nil, 0.9);
				elseif itemTable.isRevolver then
					frame:AddText("Dispose de Barils Tournants", Color(110, 30, 30), nil, 0.9);
				elseif itemTable.ammoCapacity and itemTable.ammoCapacity > 1 then
					frame:AddText("Magazine fixe", Color(110, 30, 30), nil, 0.9);
				else
					frame:AddText("Tir unique", Color(110, 30, 30), nil, 0.9);
				end
				
				if weaponTable.IgnoresBulletResistance then
					frame:AddText("Ignore la Résistance aux Balles", Color(110, 30, 30), nil, 0.9);
				end
				
				if itemTable.ammoTypes then
					if itemTable.ammoTypes and #itemTable.ammoTypes > 0 then
						local ammoIcons = {};
						
						for i, v in ipairs(itemTable.ammoTypes) do
							local ammoItemTable = item.FindByID(string.lower(v));
							
							if ammoItemTable then
								table.insert(ammoIcons, {itemTable = ammoItemTable});
							end
						end
						
						frame:AddText("Polyvalence de tir :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
						frame:AddIconRow(ammoIcons, 48);
					end
					
					--[[if itemTable.ammoTypesNice then
						for i = 1, #itemTable.ammoTypesNice do
							frame:AddText("Contexte : Texte de cadre"..itemTable.ammoTypesNice[i], Color(110, 30, 30), nil, 0.9);
						end
					else
						for i = 1, #itemTable.ammoTypes do
							frame:AddText("Contexte : Texte de cadre"..itemTable.ammoTypes[i], Color(110, 30, 30), nil, 0.9);
						end
					end]]--
				end
				
				frame:AddText("Statistiques de l'arme :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				
				if weaponTable.Primary.IronAccuracy and !weaponTable.Primary.MaximumDistanceDamage then
					local accuracy = weaponTable.Primary.IronAccuracy;
					local originalAccuracy = accuracy;
					
					if condition and condition < 100 then
						accuracy = math.Truncate(accuracy * Lerp(condition / 90, 1.5, 1), 5);
					end
				
					local percentage = 1 - math.min(accuracy * 2, 1);
					local toolTip = function(frame)
						frame:AddText("Précision (Visée)", Color(110, 30, 30), nil, 1);
						frame:AddText("La précision de votre arme en visée. Peut être améliorée en s'accroupissant et par la croyance 'Marksman'.", Color(225, 200, 200), nil, 0.8);
					end
		
					if accuracy > originalAccuracy then
						frame:AddBar(12, {{text = tostring(accuracy).." / "..tostring(originalAccuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Visée)", Color(110, 30, 30), toolTip, true);
					else
						frame:AddBar(12, {{text = tostring(accuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Visée)", Color(110, 30, 30), toolTip, true);
					end
				end
				
				if weaponTable.Primary.Spread and !weaponTable.Primary.MaximumDistanceDamage then
					local accuracy = weaponTable.Primary.Spread;
					local originalAccuracy = accuracy;
					
					if condition and condition < 100 then
						accuracy = math.Truncate(accuracy * Lerp(condition / 90, 1.5, 1), 5);
					end
				
					local percentage = 1 - math.min(accuracy * 2, 1);
					local toolTip = function(frame)
						frame:AddText("Précision (Tir à la hanche)", Color(110, 30, 30), nil, 1);
						frame:AddText("La précision de votre arme en tir à la hanche. Peut être améliorée en s'accroupissant.", Color(225, 200, 200), nil, 0.8);
					end
		
					if accuracy > originalAccuracy then
						frame:AddBar(12, {{text = tostring(accuracy).." / "..tostring(originalAccuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Tir à la Hanche)", Color(110, 30, 30), toolTip, true);
					else
						frame:AddBar(12, {{text = tostring(accuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Tir à la Hanche))", Color(110, 30, 30), toolTip, true);
					end
				end
				
				if weaponTable.Primary.NumShots > 1 then
					local percentage = math.min(weaponTable.Primary.NumShots, 32) / 32;
					local toolTip = function(frame)
						frame:AddText("Quantité de Pellets", Color(110, 30, 30), nil, 1);
						frame:AddText("Le nombre de projectiles tirés par cette arme.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponTable.Primary.NumShots), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Quantité de Plombs", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponTable.Primary.RPM and weaponTable.Primary.ClipSize > 1 then
					local percentage = math.min(weaponTable.Primary.RPM, 650) / 650;
					local toolTip = function(frame)
						frame:AddText("Cadence de tir", Color(110, 30, 30), nil, 1);
						frame:AddText("La cadence de tir de cette arme en coups par minute.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponTable.Primary.RPM), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Cadence de Tir", Color(110, 30, 30), toolTip, true);
				end
				
				if itemTable.reloadTime then
					local percentage = math.min(itemTable.reloadTime, 10);
					local toolTip = function(frame)
						frame:AddText("Temps de rechargement", Color(110, 30, 30), nil, 1);
						frame:AddText("Le temps en secondes nécessaire pour recharger cette arme.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(itemTable.reloadTime).."s", percentage = percentage * 10, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Temps de Rechargement", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponTable.Primary.MaximumDistanceDamage then
					local maximumdistancedamage = weaponTable.Primary.MaximumDistanceDamage;
					local originalDamage = maximumdistancedamage;
					
					if maximumdistancedamage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						maximumdistancedamage = math.Round(maximumdistancedamage * Lerp(scalar, 0.7, 1));

						local percentage = math.min(maximumdistancedamage / 150, 150);
						local toolTip = function(frame)
							frame:AddText("Dégâts Maximum des Projectiles", Color(110, 30, 30), nil, 1);
							frame:AddText("La quantité maximale de dégâts que votre projectile peut infliger. La distance maximale est atteinte à environ 12 mètres de votre cible, et toute distance supplémentaire n'augmentera pas les dégâts.", Color(225, 200, 200), nil, 0.8);
						end
			
						if maximumdistancedamage < originalDamage then
							frame:AddBar(12, {{text = tostring(maximumdistancedamage).." / "..tostring(originalDamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(maximumdistancedamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponTable.Primary.MinimumDistanceDamage then
					local minimumdistancedamage = weaponTable.Primary.MinimumDistanceDamage;
					local originalDamage = minimumdistancedamage;
					
					if minimumdistancedamage then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						minimumdistancedamage = math.Round(minimumdistancedamage * Lerp(scalar, 0.7, 1));

						local percentage = math.min(minimumdistancedamage / 150, 150);
						local toolTip = function(frame)
							frame:AddText("Dégâts Minimum des Projectiles", Color(110, 30, 30), nil, 1);
							frame:AddText("Le montant minimal de dégâts que votre projectile peut infliger. Ce montant est appliqué lors d'un impact à bout portant, et augmente progressivement avec la distance de la cible.", Color(225, 200, 200), nil, 0.8);
						end
			
						if minimumdistancedamage < originalDamage then
							frame:AddBar(12, {{text = tostring(minimumdistancedamage).." / "..tostring(originalDamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Minimum du Projectile", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(minimumdistancedamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Minimum du Projectile", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponTable.Primary.StabilityDamage then
					local percentage = math.min(weaponTable.Primary.StabilityDamage / 100, 100);
					local toolTip = function(frame)
						frame:AddText("Dégâts de stabilité", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts de stabilité infligés à votre adversaire par vos projectiles tirés. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie. Pour les carreaux, cela varie selon la distance : les cibles éloignées subiront nettement plus de dégâts de stabilité, tandis que les cibles proches en subiront nettement moins. À portée maximale, le projectile infligera le double de ces dégâts de stabilité.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponTable.Primary.StabilityDamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Stabilité", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponTable.Primary.BoltRange then
					local boltRange = weaponTable.Primary.BoltRange;
					local originalBoltRange = boltRange;
					
					if boltRange then
						local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
					
						boltRange = math.Round(boltRange * Lerp(scalar, 0.5, 1));

						local percentage = math.min(boltRange / 200, 200);
						local toolTip = function(frame)
							frame:AddText("Portée des boulons", Color(110, 30, 30), nil, 1);
							frame:AddText("La vitesse et la distance maximale de votre carreau tiré. Si vous souhaitez toucher une cible plus éloignée, visez plus haut !", Color(225, 200, 200), nil, 0.8);
						end
			
						if boltRange < originalBoltRange then
							frame:AddBar(12, {{text = tostring(boltRange).." / "..tostring(originalBoltRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée du Carreau", Color(110, 30, 30), toolTip, true);
						else
							frame:AddBar(12, {{text = tostring(boltRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée du Carreau", Color(110, 30, 30), toolTip, true);
						end
					end
				end
				
				if weaponTable.Primary.Damage and !weaponTable.Primary.MaximumDistanceDamage then
					local percentage = math.min(weaponTable.Primary.Damage / 80, 80);
					local toolTip = function(frame)
						frame:AddText("Dégâts par tir", Color(110, 30, 30), nil, 1);
						frame:AddText("Les dégâts du tir de cette arme. Notez que les armes à feu percent 100% de l'armure.", Color(225, 200, 200), nil, 0.8);
					end
		
					frame:AddBar(12, {{text = tostring(weaponTable.Primary.Damage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts par Tir", Color(110, 30, 30), toolTip, true);
				end
				
				if weaponAmmo then
					if #weaponAmmo > 0 then
						if itemTable.ammoCapacity > 1 then
							if itemTable.usesMagazine then
								frame:AddText("Tir chargé :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
								
								local clipItem = Clockwork.item:FindByID(string.gsub(string.lower(weaponAmmo[1]), " ", "_"));
								
								if clipItem then
									frame:AddText(weaponAmmo[1].." ("..tostring(#weaponAmmo).."/"..tostring(clipItem.ammoMagazineSize or weaponTable.Primary.ClipSize)..")", Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
								else
									frame:AddText(weaponAmmo[1].." ("..tostring(#weaponAmmo).."/"..tostring(weaponTable.Primary.ClipSize)..")", Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
								end
							else
								-- Likely is multi-barreled gun.
								frame:AddText("Tir chargé :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
								
								for i = 1, weaponTable.Primary.ClipSize do
									if i <= #weaponAmmo then
										frame:AddText(tostring(i)..") "..weaponAmmo[i], Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
									else
										frame:AddText(tostring(i)..") Empty Chamber", Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
									end
								end
							end
						else
							frame:AddText("Tir chargé :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
							frame:AddText(weaponAmmo[1], Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
						end
					else
						frame:AddText("Cette arme est vide.", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
					end
				end
			end
		end
		
		return true;
	elseif (category == "Charms") then
		frame:AddText(name.." - Charm", Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end;
		
		if itemTable.requiredFactions and not table.IsEmpty(itemTable.requiredFactions) and itemTable.requiredFactions[1] ~= "Wanderer" then
			frame:AddText("Faction requise :"..table.concat(itemTable.requiredFactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.requiredFaiths and not table.IsEmpty(itemTable.requiredFaiths) then
			frame:AddText("Foi requise :"..table.concat(itemTable.requiredFaiths, " or "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.requiredSubfactions and not table.IsEmpty(itemTable.requiredSubfactions) then
			frame:AddText("Sous-faction requise :"..table.concat(itemTable.requiredSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.excludedFactions and not table.IsEmpty(itemTable.excludedFactions) then
			frame:AddText("Factions exclues :"..table.concat(itemTable.excludedFactions, ", "), Color(110, 30, 30), nil, 0.9);
			
			if table.HasValue(itemTable.excludedFactions, Clockwork.Client:GetFaction()) and itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
				frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
			end
		end
		
		if itemTable.excludedSubfactions and not table.IsEmpty(itemTable.excludedSubfactions) then
			frame:AddText("Sous-factions exclues :"..table.concat(itemTable.excludedSubfactions, ", "), Color(110, 30, 30), nil, 0.9);
		end
		
		frame:AddText("Effets :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable.charmEffects, Color(110, 30, 30), nil, 0.9);
		
		return true;
	elseif (category == "Shot") then
		if itemTable.ammoMagazineSize then
			local magazineAmmo = itemTable:GetAmmoMagazine();
			
			if magazineAmmo and magazineAmmo <= 0 then
				frame:AddText("Vide"..itemTable.name.." - Magazine", Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
			else
				frame:AddText(itemTable.name.." - Magazine", Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
			end
		else
			frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		end
		
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		if itemTable.attributes then
			frame:AddText("Attributs du tir :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
		
			if table.HasValue(itemTable.attributes, "fire") then
				frame:AddText("Incendiaire : Enflamme les ennemis au contact.", Color(110, 30, 30), nil, 0.9);
			end
		end
		
		if frame.parent then
			local parent = frame.parent:GetParent():GetParent():GetParent():GetParent():GetParent();

			if IsValid(parent) and parent.itemTable then
				local weaponItemTable = parent.itemTable;
				local weaponClass = weaponItemTable.uniqueID;
				local weaponTable;

				if weaponClass then
					weaponTable = _G.weapons.Get(weaponClass);
				end
				
				if weaponTable and weaponTable.AmmoTypes and weaponTable.AmmoTypes[itemTable.ammoType] then				
					local ammoStats = weaponTable.AmmoTypes[itemTable.ammoType];
					
					if ammoStats then
						ammoStats(weaponTable);
					
						frame:AddText("Statistiques de tir :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
						
						if weaponTable.Primary.IronAccuracy and !weaponTable.Primary.MaximumDistanceDamage then
							local accuracy = weaponTable.Primary.IronAccuracy;
							local originalAccuracy = accuracy;
							
							if condition and condition < 100 then
								accuracy = math.Truncate(accuracy * Lerp(condition / 90, 1.5, 1), 5);
							end
						
							local percentage = 1 - math.min(accuracy * 2, 1);
							local toolTip = function(frame)
								frame:AddText("Précision (Visée)", Color(110, 30, 30), nil, 1);
								frame:AddText("La précision de votre arme lorsque vous visez avec la lunette. Peut être améliorée en s'accroupissant et grâce à la croyance 'Marksman'.", Color(225, 200, 200), nil, 0.8);
							end
				
							if accuracy > originalAccuracy then
								frame:AddBar(12, {{text = tostring(accuracy).." / "..tostring(originalAccuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Visée)", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(accuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Visée)", Color(110, 30, 30), toolTip, true);
							end
						end
						
						if weaponTable.Primary.Spread and !weaponTable.Primary.MaximumDistanceDamage then
							local accuracy = weaponTable.Primary.Spread;
							local originalAccuracy = accuracy;
							
							if condition and condition < 100 then
								accuracy = math.Truncate(accuracy * Lerp(condition / 90, 1.5, 1), 5);
							end
						
							local percentage = 1 - math.min(accuracy * 2, 1);
							local toolTip = function(frame)
								frame:AddText("Précision (Tir à la hanche)", Color(110, 30, 30), nil, 1);
								frame:AddText("La précision de votre arme en tir à la hanche. Peut être améliorée en s'accroupissant.", Color(225, 200, 200), nil, 0.8);
							end
				
							if accuracy > originalAccuracy then
								frame:AddBar(12, {{text = tostring(accuracy).." / "..tostring(originalAccuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Tir à la Hanche)", Color(110, 30, 30), toolTip, true);
							else
								frame:AddBar(12, {{text = tostring(accuracy), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Précision (Tir à la Hanche)", Color(110, 30, 30), toolTip, true);
							end
						end
						
						if weaponTable.Primary.NumShots > 1 then
							local percentage = math.min(weaponTable.Primary.NumShots, 32) / 32;
							local toolTip = function(frame)
								frame:AddText("Quantité de Pellets", Color(110, 30, 30), nil, 1);
								frame:AddText("Le nombre de projectiles tirés par cette arme.", Color(225, 200, 200), nil, 0.8);
							end
				
							frame:AddBar(12, {{text = tostring(weaponTable.Primary.NumShots), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Quantité de Plombs", Color(110, 30, 30), toolTip, true);
						end
						
						if weaponTable.Primary.RPM and weaponTable.Primary.ClipSize > 1 then
							local percentage = math.min(weaponTable.Primary.RPM, 650) / 650;
							local toolTip = function(frame)
								frame:AddText("Cadence de tir", Color(110, 30, 30), nil, 1);
								frame:AddText("La cadence de tir de cette arme en coups par minute.", Color(225, 200, 200), nil, 0.8);
							end
				
							frame:AddBar(12, {{text = tostring(weaponTable.Primary.RPM), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Cadence de Tir", Color(110, 30, 30), toolTip, true);
						end
						
						if weaponTable.Primary.MaximumDistanceDamage then
							local maximumdistancedamage = weaponTable.Primary.MaximumDistanceDamage;
							local originalDamage = maximumdistancedamage;
							
							if maximumdistancedamage then
								local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
							
								maximumdistancedamage = math.Round(maximumdistancedamage * Lerp(scalar, 0.7, 1));

								local percentage = math.min(maximumdistancedamage / 150, 150);
								local toolTip = function(frame)
									frame:AddText("Dégâts Maximum des Projectiles", Color(110, 30, 30), nil, 1);
									frame:AddText("La quantité maximale de dégâts que votre projectile peut infliger. La distance maximale est atteinte à environ 12 mètres de votre cible, et toute distance supplémentaire n'augmentera pas les dégâts.", Color(225, 200, 200), nil, 0.8);
								end
					
								if maximumdistancedamage < originalDamage then
									frame:AddBar(12, {{text = tostring(maximumdistancedamage).." / "..tostring(originalDamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
								else
									frame:AddBar(12, {{text = tostring(maximumdistancedamage).." (At 40 Feet)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
								end
							end
						end
						
						if weaponTable.Primary.MinimumDistanceDamage then
							local minimumdistancedamage = weaponTable.Primary.MinimumDistanceDamage;
							local originalDamage = minimumdistancedamage;
							
							if minimumdistancedamage then
								local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
							
								minimumdistancedamage = math.Round(minimumdistancedamage * Lerp(scalar, 0.7, 1));

								local percentage = math.min(minimumdistancedamage / 150, 150);
								local toolTip = function(frame)
									frame:AddText("Dégâts Minimum des Projectiles", Color(110, 30, 30), nil, 1);
									frame:AddText("Le montant minimal de dégâts que votre projectile peut infliger. Ce montant est appliqué lors d'un impact à bout portant, et augmente progressivement avec la distance de la cible.", Color(225, 200, 200), nil, 0.8);
								end
					
								if minimumdistancedamage < originalDamage then
									frame:AddBar(12, {{text = tostring(minimumdistancedamage).." / "..tostring(originalDamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
								else
									frame:AddBar(12, {{text = tostring(minimumdistancedamage).." (Point-Blank)", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts Maximum du Projectile", Color(110, 30, 30), toolTip, true);
								end
							end
						end
						
						if weaponTable.Primary.StabilityDamage then
							local percentage = math.min(weaponTable.Primary.StabilityDamage / 100, 100);
							local toolTip = function(frame)
								frame:AddText("Dégâts de stabilité", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts de stabilité infligés à votre adversaire par vos projectiles tirés. En infliger suffisamment fera temporairement tomber votre ennemi au sol. Peut être annulé par l'armure ennemie. Pour les carreaux, cela varie selon la distance ; les cibles éloignées subiront considérablement plus de dégâts de stabilité, et les cibles proches en subiront considérablement moins. À portée maximale, le projectile infligera le double de ces dégâts de stabilité.", Color(225, 200, 200), nil, 0.8);
							end
				
							frame:AddBar(12, {{text = tostring(weaponTable.Primary.StabilityDamage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts de Stabilité", Color(110, 30, 30), toolTip, true);
						end
						
						if weaponTable.Primary.BoltRange then
							local boltRange = weaponTable.Primary.BoltRange;
							local originalBoltRange = boltRange;
							
							if boltRange then
								local scalar = Lerp(condition / 90, 0, 1); -- Make it so damage does not start deterioriating until below 90% condition.
							
								boltRange = math.Round(boltRange * Lerp(scalar, 0.5, 1));

								local percentage = math.min(boltRange / 200, 200);
								local toolTip = function(frame)
									frame:AddText("Portée des boulons", Color(110, 30, 30), nil, 1);
									frame:AddText("La vitesse et la distance maximale de votre carreau tiré. Si vous souhaitez toucher une cible plus éloignée, visez plus haut !", Color(225, 200, 200), nil, 0.8);
								end
					
								if boltRange < originalBoltRange then
									frame:AddBar(12, {{text = tostring(boltRange).." / "..tostring(originalBoltRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée du Carreau", Color(110, 30, 30), toolTip, true);
								else
									frame:AddBar(12, {{text = tostring(boltRange), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Portée du Carreau", Color(110, 30, 30), toolTip, true);
								end
							end
						end
						
						if weaponTable.Primary.Damage and !weaponTable.Primary.MaximumDistanceDamage then
							local percentage = math.min(weaponTable.Primary.Damage / 80, 80);
							local toolTip = function(frame)
								frame:AddText("Dégâts par tir", Color(110, 30, 30), nil, 1);
								frame:AddText("Les dégâts d'un tir de cette arme. Notez que les armes à feu ont 100% de pénétration d'armure.", Color(225, 200, 200), nil, 0.8);
							end
				
							frame:AddBar(12, {{text = tostring(weaponTable.Primary.Damage), percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Dégâts par Tir", Color(110, 30, 30), toolTip, true);
						end
					end
				end
			end
		end
		
		if itemTable.ammoMagazineSize then
			local magazineAmmo = itemTable:GetAmmoMagazine();
			
			if magazineAmmo and magazineAmmo > 0 then
				frame:AddText("Tir chargé :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
				frame:AddText(itemTable.ammoName.." ("..tostring(magazineAmmo).."/"..tostring(itemTable.ammoMagazineSize)..")", Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
			else
				frame:AddText("Ce chargeur est vide.", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			end
		end
		
		return true;
	elseif (category == "Medical") then
		local hitgroupToString = {
			[HITGROUP_CHEST] = "Poitrine",
			[HITGROUP_HEAD] = "Tête",
			[HITGROUP_STOMACH] = "Ventre",
			[HITGROUP_LEFTARM] = "Bras gauche",
			[HITGROUP_RIGHTARM] = "Bras droit",
			[HITGROUP_LEFTLEG] = "Jambe gauche",
			[HITGROUP_RIGHTLEG] = "Jambe droite",
		};

		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
			frame:AddSpacer(2, Color(0, 0, 0, 0));
		end
		
		frame:AddText("Attributs médicaux :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);

		if itemTable.applicable then
			frame:AddText("Applicable", Color(110, 30, 30), nil, 0.9);
		elseif itemTable.ingestible then
			frame:AddText("Ingérable", Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.canSave then
			frame:AddText("Peut Ressusciter en État Critique", Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.curesInjuries then
			frame:AddText("Soigne les blessures :", Color(110, 30, 30), nil, 0.9);
			
			for i = 1, #itemTable.curesInjuries do
				local injury = cwMedicalSystem.cwInjuryTable[itemTable.curesInjuries[i]];
				
				if injury then
					frame:AddText("Contexte : Texte de cadre"..injury.name, Color(110, 30, 30), nil, 0.9);
				end
			end
		end
		
		if itemTable.stopsBleeding then
			frame:AddText("Arrête l'hémorragie", Color(110, 30, 30), nil, 0.9);
		end
		
		if itemTable.limbs then
			if itemTable.limbs == "all" then
				frame:AddText("Membres pris en charge : Soigne tous", Color(110, 30, 30), nil, 0.9);
			elseif #itemTable.limbs > 0 then
				frame:AddText("Membres pris en charge :", Color(110, 30, 30), nil, 0.9);
				
				for i = 1, #itemTable.limbs do
					frame:AddText("Contexte : Texte de cadre"..hitGroupToString[itemTable.limbs[i]], Color(110, 30, 30), nil, 0.9);
				end
			end
		end

		if itemTable.healAmount or itemTable.restoresBlood then
			frame:AddText("Statistiques médicales :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
		
			if itemTable.healAmount and itemTable.healRepetition then	
				local healAmount = itemTable.healAmount;
				local healRepetition = itemTable.healRepetition;
				local healDelay = itemTable.healDelay;
				local percentage = math.min(healAmount / 100, 100);
				local toolTip = function(frame)
					frame:AddText("Quantité de soins", Color(110, 30, 30), nil, 1);
					frame:AddText("La quantité de santé que cet objet restaurera à chaque répétition.", Color(225, 200, 200), nil, 0.8);
				end

				frame:AddBar(12, {{text = healAmount.." Health", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Quantité de Soin", Color(110, 30, 30), toolTip, true);
				
				percentage = math.min(healRepetition / 8, 8);
				toolTip = function(frame)
					frame:AddText("Répétitions de Soin", Color(110, 30, 30), nil, 1);
					frame:AddText("Le nombre de fois que cet objet restaurera la santé.", Color(225, 200, 200), nil, 0.8);
				end

				frame:AddBar(12, {{text = healRepetition, percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Répétitions de Soin", Color(110, 30, 30), toolTip, true);
				
				if itemTable.healDelay then
					percentage = math.min(healDelay / 8, 8);
					toolTip = function(frame)
						frame:AddText("Délai de soin", Color(110, 30, 30), nil, 1);
						frame:AddText("Le délai entre chaque répétition de soin de cet objet.", Color(225, 200, 200), nil, 0.8);
					end

					frame:AddBar(12, {{text = healDelay.."s", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Délai de Soin", Color(110, 30, 30), toolTip, true);
				end
			end
			
			if itemTable.restoresBlood then	
				local healAmount = itemTable.restoresBlood;
				local percentage = math.min(healAmount / 2500, 2500);
				local toolTip = function(frame)
					frame:AddText("Restaure le Sang", Color(110, 30, 30), nil, 1);
					frame:AddText("La quantité totale de sang que cet objet médical va restaurer.", Color(225, 200, 200), nil, 0.8);
				end

				frame:AddBar(12, {{text = healAmount.." Blood", percentage = percentage * 100, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Restaure le Sang", Color(110, 30, 30), toolTip, true);
			end
		end
		
		return true;
	end
	
	if category == "Helms" then -- For helms that don't have armor like hats and hoods.
		category = "Headwear";
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		if cwWarmth and cwWarmth.systemEnabled and itemTable.insulation then
			local percentage = itemTable.insulation * 0.20;
		
			frame:AddBar(12, {{text = tostring(percentage).."%", percentage = percentage, color = Color(110, 30, 30), font = "DermaDefault", textless = false, noDisplay = true}}, "Isolation", Color(110, 30, 30), true);
		end
		
		return true;
	elseif category == "Catalysts" then
		category = "Catalyst";
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		return true;
	elseif category == "Backpacks" then
		category = "Backpack";
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		if itemTable.invSpace then
			frame:AddText("Attributs de l'objet :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddText("Augmente le Poids Maximum Transportable : +"..tostring(itemTable.invSpace).."kg", Color(110, 30, 30), nil, 0.9);
		end
		
		return true;
	elseif category == "Scripture" and cwScriptures then
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		if cwScriptures.booksRead then
			if table.HasValue(cwScriptures.booksRead, itemTable.uniqueID) then
				frame:AddText("Déjà lu !", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1);
			end
		end
		
		if cwScriptures.booksCopied then
			if table.HasValue(cwScriptures.booksCopied, itemTable.uniqueID) then
				frame:AddText("Déjà copié !", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1);
			end
		end
		
		return true;
	elseif category == "Food" or category == "Drinks" or category == "Alcohol" then
		
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if itemTable.needs.hunger then frame:AddText("Faim :"..itemTable.needs.hunger, Color(110, 30, 30), "nov_IntroTextSmallDETrooper", 0.8); end
		if itemTable.needs.thirst then frame:AddText("Soif :"..itemTable.needs.thirst, Color(110, 30, 30), "nov_IntroTextSmallDETrooper", 0.8); end
		if itemTable.needs.sleep then frame:AddText("Sommeil :"..itemTable.needs.sleep, Color(110, 30, 30), "nov_IntroTextSmallDETrooper", 0.8); end
		if itemTable.needs.stamina then frame:AddText("Endurance :"..itemTable.needs.stamina, Color(110, 30, 30), "nov_IntroTextSmallDETrooper", 0.8); end
		if itemTable.needs.health then frame:AddText("Santé :"..itemTable.needs.health, Color(110, 30, 30), "nov_IntroTextSmallDETrooper", 0.8); end
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
		
		return true;
	else
		if itemTable.GetCustomName then
			name = itemTable:GetCustomName();
		end
	
		frame:AddText(name.." - "..category, Color(180, 20, 20), "nov_IntroTextSmallDETrooper", 1.15);
		frame:AddText(itemTable("description"), Color(180, 170, 170), "nov_IntroTextSmallDETrooper", 0.8);
		
		if (bShowWeight) then
			frame:AddBar(20, {{text = weight.."kg", percentage = percentage * 100, color = Color(96, 96, 128), font = "DermaDefault", leftTextAlign = false, noDisplay = true}}, "Poids", Color(170, 170, 180));
		end;
	
		if itemTable.requiredbeliefs and #itemTable.requiredbeliefs > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.requiredbeliefs do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.requiredbeliefs[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.requiredbeliefs[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances requises :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		if itemTable.onerequiredbelief and #itemTable.onerequiredbelief > 0 then
			local beliefIcons = {};
			
			for i = 1, #itemTable.onerequiredbelief do
				local beliefTable = cwBeliefs:FindBeliefByID(itemTable.onerequiredbelief[i]);
				
				if beliefTable then
					local tooltip = function(frame)
						frame:AddText(beliefTable.name, cwBeliefs:FindBeliefTreeByBelief(beliefTable.uniqueID).color, "Civ5ToolTip4");
						
						if beliefTable.quote then
							frame:AddText(beliefTable.description.."\n", Color(225, 200, 200));
							frame:AddText(beliefTable.quote, Color(128, 90, 90, 240));
						else
							frame:AddText(beliefTable.description, Color(225, 200, 200));
						end
					end
					
					if beliefTable.iconOverride then
						table.insert(beliefIcons, {icon = beliefTable.iconOverride, tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					else
						table.insert(beliefIcons, {icon = "begotten/ui/belieficons/"..itemTable.onerequiredbelief[i]..".png", tooltip = tooltip, button = function() cwBeliefs:OpenTree(nil, nil, nil, nil, nil, nil, beliefTable.uniqueID) end});
					end
				end
			end
			
			frame:AddText("Croyances Requises (Une des Suivantes) :", Color(225, 225, 225), "nov_IntroTextSmallDETrooper", 1.15);
			frame:AddIconRow(beliefIcons, 40);
		end
		
		hook.Run("SubModifyItemMarkupTooltip", category, maximumWeight, weight, condition, percentage, name, itemTable, x, y, width, height, frame, bShowWeight);
		
		return true;
	end
end

function Schema:ClockworkInitialized()
	Clockwork.directory:AddCategory("Faiths", "La foi est une partie intégrante de Begotten III, car presque tous les éléments de gameplay et l'histoire de Begotten tournent autour d'elle. Dieu s'est suicidé, et aucun survivant n'est pur, mais cela n'a pas empêché ce qu'il reste de l'humanité de se tourner vers ses dieux dans l'espoir du salut. Après tout, ceux qui en sont dépourvus ont été ciblés par le Dieu-Dessous, et ensuite par les Begotten. Chaque foi a ses propres rituels et sa ou ses factions majeures associées.")
	Clockwork.directory:AddCategory("Mechanics", "Ce qui distingue Begotten III de ses pairs basés sur le texte est sa myriade de mécaniques de jeu. Les besoins du personnage tels que la faim et la soif constituent l'épine dorsale de l'objectif de votre personnage pour rester en vie. Le système de croyances récompense ceux qui survivent le plus longtemps avec un moyen d'augmenter leur puissance et leurs capacités. L'artisanat et la collecte de ressources forment le moteur de l'économie de chaque faction. Le système médical simule les maladies et les blessures des personnages.\n\nBegotten III propose également un système de combat de mêlée complet.\n\nEn fin de compte, bien que vous soyez libre de jouer à Begotten de presque toutes les manières que vous jugez appropriées, maîtriser toutes ses mécaniques est essentiel pour survivre dans les Terres Désolées.")
end

function Schema:DirectoryOpenHomePage(panel)
	local WIPLabel = vgui.Create("DLabel", panel);
	
	WIPLabel:SetText("LE MANIFESTE EST UN TRAVAIL EN COURS !");
	WIPLabel:SetFont("manifestoContentHeader");
	WIPLabel:SetTextColor(Color(255, 20, 20));
	WIPLabel:SizeToContents();
	
	panel.panelList:AddItem(WIPLabel);
	
	local videoLabel = vgui.Create("DLabel", panel);
	
	videoLabel:SetText("Vidéo à la une :");
	videoLabel:SetFont("manifestoContentHeader");
	videoLabel:SizeToContents();
	
	panel.panelList:AddItem(videoLabel)
	
	local video = vgui.Create("cwVideoPanel");
	
	video:SetSize(720, 380);
	video:SetURL();
	
	panel.panelList:AddItem(video)

	local beginnersLabel = vgui.Create("DLabel", panel);
	
	beginnersLabel:SetText("Guide du Débutant :");
	beginnersLabel:SetFont("manifestoContentHeader");
	beginnersLabel:SizeToContents();
	
	panel.panelList:AddItem(beginnersLabel);
end

netstream.Hook("Archives", function(data)
	Schema.archivesBookList = data;
end);

netstream.Hook("CheapleCutscene", function(data)
	Schema:CheapleCutscene();
end);

netstream.Hook("GoreWarhorn", function(data)
	if cwMusic then
		cwMusic:FadeOutAmbientMusic(2, 1);
	end
	
	Clockwork.Client:EmitSound("warhorns/warhorn_gore.mp3", 60, 100);
	
	util.ScreenShake(Clockwork.Client:GetPos(), 2, 5, 15, 1024);
end);

netstream.Hook("NPCSpawnESPInfo", function(data)
	if data then
		if data[1] then
			Schema.npcSpawns = data[1];
		end
	end
end);

-- Save data icon in top right.
local pentaFade;
local pentaAlpha = 0;
local pentaRotate = 0;
local mPentagram = Material("begotten/pentagram_red.png");

net.Receive("ServerSaveData", function()
	if net.ReadBool() then
		hook.Add("DrawOverlay", "DrawOverlayServerSaveData", function()
			if pentaFade then
				pentaAlpha = math.Approach(pentaAlpha, 0, FrameTime() * 400);
			else
				pentaAlpha = math.Approach(pentaAlpha, 255, FrameTime() * 400);
			end
			
			pentaRotate = (pentaRotate + (FrameTime() * 50)) % 360;
			
			local scrW = ScrW()
			local pentaSize = scrW * 0.032;
			
			surface.SetDrawColor(Color(139, 64, 0, pentaAlpha));
			surface.SetMaterial(mPentagram);
			surface.DrawTexturedRectRotated(scrW - pentaSize, pentaSize, pentaSize, pentaSize, pentaRotate);
		end);
	else
		pentaFade = true;
	
		timer.Simple(4, function()
			pentaFade = nil;
			pentaAlpha = 0;
			pentaRotate = 0;
			hook.Remove("DrawOverlay", "DrawOverlayServerSaveData");
		end);
	end
end);
