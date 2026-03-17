--[[
	Begotten III: Jesus Wept
--]]


PLUGIN:SetGlobalAlias("cwCharacterNeeds");

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sh_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

local COMMAND = Clockwork.command:New("Drink");
COMMAND.tip = "Buvez dans les plans d'eau restants. À utiliser avec parcimonie, car les eaux sont souillées et en boire épuisera votre santé mentale.";
COMMAND.text = "<none>";
COMMAND.important = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local waterLevel = player:WaterLevel();

	if (waterLevel >= 1) then
		local lastZone = player:GetCharacterData("LastZone");
		local thirst = player:GetNeed("thirst", 0);
		
		if player:GetSubfaction() == "Varazdat" then
			if game.GetMap() == "rp_district21" and player:GetPos():WithinAABox(Vector(11202, -6080, -686), Vector(12083, -5412, -897)) then
				player:HandleNeed("thirst", -25);
				player:HandleNeed("corruption", 5);
				
				player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
				Schema:EasyText(player, "olivedrab", "Cette étrange flaque d'eau déborde de délicatesse, c'est certain...");
			else
				Schema:EasyText(player, "chocolate", "Il n'y a pas de sang dans ces eaux, en boire serait inutile.");
			
				return;
			end
		end;
		
		if cwBeliefs and (player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm")) then
			Schema:EasyText(player, "maroon", "Tu lèches l'eau de ton réceptacle, mais elle commence à court-circuiter tes entrailles !");
			player:TakeDamage(25);
			
			return;
		end
		
		if thirst <= 10 then
			Schema:EasyText(player, "chocolate", "Tu n'as pas assez soif pour boire ici.");
			
			return;
		end
		
		if lastZone == "gore" then
			player:HandleNeed("thirst", -25);
			player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
			Schema:EasyText(player, "olivedrab", "Tu bois aux eaux pures de la Gore Forest, étanchant ta soif.");
		elseif lastZone == "hotspring" then
			player:HandleNeed("thirst", -25);
			player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
			Schema:EasyText(player, "olivedrab", "Tu bois aux eaux pures de la source chaude, étanchant ta soif.");
		else
			if cwRituals and player.drownedKingActive then
				player:HandleNeed("thirst", -25);
				player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
				Schema:EasyText(player, "olivedrab", "Tu bois aux eaux des Engendrés, mais la protection du Roi Noyé te garde en sécurité.");
			else
				if cwBeliefs and player:HasBelief("savage_animal") then
					player:HandleNeed("thirst", -25);
					player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
					Schema:EasyText(player, "olivedrab", "Tu bois des délicieuses eaux des Engendrés.");
				else
					if cwMedicalSystem then
						if cwBeliefs and player:HasBelief("sanitary") then
							player:HandleDiseaseChance("water", 33);
						else
							player:HandleDiseaseChance("water", 80);
						end
					end
				
					player:HandleSanity(-10);
					player:HandleNeed("thirst", -25);
					player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
					Schema:EasyText(player, "olive", "Tu bois aux eaux des Engendrés. Qui sait quelle infamie tu viens d'ingurgiter ? Tu sens ta raison se vider.");
				end
			end
		end
		
		if cwBeliefs then
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		end
	else
		if cwWeather then
			local lastZone = player:GetCharacterData("LastZone");
			local zoneTable = zones:FindByID(lastZone);
			
			if zoneTable.hasWeather then
				local weather = cwWeather.weather;
				
				if weather == "acidrain" or weather == "bloodstorm" or weather == "thunderstorm" then
					local thirst = player:GetNeed("thirst", 0);
					
					if !cwWeather:IsOutside(player:EyePos()) then
						Schema:EasyText(player, "chocolate", "Tu dois être sous la pluie pour boire de celle-ci !");
						
						return;
					end
					
					if cwBeliefs and (player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm")) then
						Schema:EasyText(player, "maroon", "Tu lèches de l'eau dans ton réceptacle, mais cela commence à court-circuiter tes circuits internes !");
						player:TakeDamage(25);
						
						return;
					end

					if weather == "acidrain" then
						if player:GetSubfaction() == "Varazdat" then
							Schema:EasyText(player, "chocolate", "Il n'y a pas de sang dans cette pluie, en boire serait inutile.");
							
							return;
						end;
						
						if thirst <= 10 then
							Schema:EasyText(player, "chocolate", "Tu n'as pas assez soif pour boire l'eau de pluie.");
							
							return;
						end
					
						Schema:EasyText(player, "olive", "Tu recueilles une petite quantité de pluie polluée dans le creux de ta main, la bois et te brûles la gorge au passage !");
						player:HandleSanity(-5);
						player:HandleNeed("thirst", -15);
						player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
						
						local d = DamageInfo()
						d:SetDamage(math.random(1, 3));
						d:SetDamageType(DMG_BURN);
						d:SetDamagePosition(player:GetPos() + Vector(0, 0, 48));
						
						player:TakeDamageInfo(d);
						
						Clockwork.kernel:PrintLog(LOGTYPE_MAJOR, player:Name().." has taken "..tostring(d:GetDamage()).." damage from drinking acid rain, leaving them at "..player:Health().." health.");
						
						if cwBeliefs then
							player:HandleXP(cwBeliefs.xpValues["drink"]);
						end
						
						return;
					elseif weather == "bloodstorm" then
						if thirst <= 10 then
							Schema:EasyText(player, "chocolate", "Tu n'as pas assez soif pour boire l'eau de pluie.");
							
							return;
						end
					
						if cwBeliefs and player:HasBelief("savage_animal") then
							player:HandleNeed("thirst", -25);
							player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
							Schema:EasyText(player, "olive", "Tu recueilles une petite quantité de délicieux sang dans le creux de ta main et le bois avec ravissement !");
						else
							player:HandleSanity(-20);
							player:HandleNeed("thirst", -15);
							player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
							Schema:EasyText(player, "olive", "Tu saisis une petite quantité de liquide à l'odeur fétide dans le creux de ta main, le buvant à contrecœur. Il a un goût très riche en fer.");
						end
						
						if cwBeliefs then
							player:HandleXP(cwBeliefs.xpValues["drink"]);
						end
						
						return;
					elseif weather == "thunderstorm" then
						if player:GetSubfaction() == "Varazdat" then
							Schema:EasyText(player, "chocolate", "Il n'y a pas de sang dans cette pluie, en boire serait inutile.");
							
							return;
						end;
						
						if thirst <= 10 then
							Schema:EasyText(player, "chocolate", "Tu n'as pas assez soif pour boire l'eau de pluie.");
							
							return;
						end
						
						player:HandleNeed("thirst", -15);
						player:EmitSound("npc/barnacle/barnacle_gulp1.wav");
						Schema:EasyText(player, "olive", "Tu recueilles une petite quantité de pluie dans le creux de ta main et la bois. Elle a un goût étonnamment frais.");
						
						if cwBeliefs then
							player:HandleXP(cwBeliefs.xpValues["drink"]);
						end
						
						return;
					end
				end
			end
		end
		
		Schema:EasyText(player, "firebrick", "Vous devez être près d'une source d'eau pour boire !");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("Sleep");
COMMAND.tip = "Fais de ton mieux pour dormir. Note que tu gagneras de la faim et de la soif, et que dormir au sol sera moins efficace que dans un lit approprié.";
COMMAND.text = "<none>";
COMMAND.important = true;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if cwBeliefs and player:HasBelief("yellow_and_black") then
		Schema:EasyText(player, "peru", "Ton enveloppe charnelle n'a plus besoin de sommeil !");
	
		return false;
	end

	if (player:GetNeed("sleep") >= 40) then
		if player.OverEncumbered then
			Schema:EasyText(player, "peru", "Vous ne pouvez pas dormir en étant surchargé !");
			
			return false;
		end
	
		if cwShacks and cwShacks.shacks then
			for k, v in pairs(cwShacks.shacks) do
				if player:GetPos():WithinAABox(v.pos1, v.pos2) then
					if v.bedTier >= 2 then
						player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
					else
						player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
					end
					
					--player:HandleSanity(10);
					--player:HandleNeed("sleep", rest);
					
					Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 300);
					
					if v.owner == player:GetCharacterKey() then
						Schema:EasyText(player, "olivedrab", "Tu grimpes dans ton lit et prends un peu de repos.");
					else
						Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
					end
					
					return;
				end
			end
		end
		
		local faction = player:GetNetVar("kinisgerOverride") or player:GetFaction();
		local playerPos = player:GetPos();
		
		--if faction == "Gatekeeper" or faction == "Holy Hierarchy" then
			--print(cwCharacterNeeds.bedZones["gatekeeper"].pos1);
			--print(cwCharacterNeeds.bedZones["gatekeeper"].pos2);
			--print(playerPos);
			--print(playerPos:WithinAABox(cwCharacterNeeds.bedZones["gatekeeper"].pos2, cwCharacterNeeds.bedZones["gatekeeper"].pos1));
		
			if cwCharacterNeeds.bedZones["gatekeeper"] and playerPos:WithinAABox(cwCharacterNeeds.bedZones["gatekeeper"].pos2, cwCharacterNeeds.bedZones["gatekeeper"].pos1) then
				player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
				--player:HandleSanity(25);
				--player:HandleNeed("hunger", 10);
				--player:HandleNeed("thirst", 20);
				--player:HandleNeed("sleep", -60);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
				Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et prends un peu de repos.");
				return;
			end
			--elseif faction == "Holy Hierarchy" then
				if cwCharacterNeeds.bedZones["ministers"] then
					if playerPos:WithinAABox(cwCharacterNeeds.bedZones["ministers"].pos1, cwCharacterNeeds.bedZones["ministers"].pos2) then
						player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
						--player:HandleSanity(50);
						--player:HandleNeed("hunger", 5);
						--player:HandleNeed("thirst", 10);
						--player:HandleNeed("sleep", -100);
						
						Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
						Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
						return;
					end
				end
				
				if cwCharacterNeeds.bedZones["ministers2"] then
					if playerPos:WithinAABox(cwCharacterNeeds.bedZones["ministers2"].pos1, cwCharacterNeeds.bedZones["ministers2"].pos2) then
						player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
						--player:HandleSanity(50);
						--player:HandleNeed("hunger", 5);
						--player:HandleNeed("thirst", 10);
						--player:HandleNeed("sleep", -100);
						
						Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
						Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
						return;
					end
				end
				
				if cwCharacterNeeds.bedZones["hierarchy"] and playerPos:WithinAABox(cwCharacterNeeds.bedZones["hierarchy"].pos1, cwCharacterNeeds.bedZones["hierarchy"].pos2) then
					player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
					--player:HandleSanity(50);
					--player:HandleNeed("hunger", 5);
					--player:HandleNeed("thirst", 10);
					--player:HandleNeed("sleep", -100);
					
					Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
					Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
					return;
				end
			--end
		--elseif faction == "Goreic Warrior" and cwCharacterNeeds.bedZones["gores"] then
		if cwCharacterNeeds.bedZones["gores"] then
			if playerPos:WithinAABox(cwCharacterNeeds.bedZones["gores"].pos1, cwCharacterNeeds.bedZones["gores"].pos2) then
				player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
				--player:HandleSanity(25);
				--player:HandleNeed("hunger", 10);
				--player:HandleNeed("thirst", 20);
				--player:HandleNeed("sleep", -60);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
				Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et prends un peu de repos.");
				return;
			elseif playerPos:WithinAABox(cwCharacterNeeds.bedZones["gorehut"].pos1, cwCharacterNeeds.bedZones["gorehut"].pos2) then
				player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
				--player:HandleSanity(25);
				--player:HandleNeed("hunger", 10);
				--player:HandleNeed("thirst", 20);
				--player:HandleNeed("sleep", -60);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
				Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et prends un peu de repos.");
				return;
			end
		end
		-- GetFaction() check incase they're disguised.
		--elseif player:GetFaction() == "Children of Satan" and cwCharacterNeeds.bedZones["satanists"] then
		if cwCharacterNeeds.bedZones["satanists"] then
			if playerPos:WithinAABox(cwCharacterNeeds.bedZones["satanists"].pos1, cwCharacterNeeds.bedZones["satanists"].pos2) then
				player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
				--player:HandleSanity(50);
				--player:HandleNeed("hunger", 5);
				--player:HandleNeed("thirst", 10);
				--player:HandleNeed("sleep", -100);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
				Schema:EasyText(player, "olivedrab", "Tu montes dans un lit et te reposes un peu.");
				return;
			end
		end
		--elseif faction == "Smog City Pirate" then
			if cwCharacterNeeds.bedZones["scrapper1"] then
				if playerPos:WithinAABox(cwCharacterNeeds.bedZones["scrapper1"].pos1, cwCharacterNeeds.bedZones["scrapper1"].pos2) then
					player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
					--player:HandleSanity(50);
					--player:HandleNeed("hunger", 5);
					--player:HandleNeed("thirst", 10);
					--player:HandleNeed("sleep", -100);
					
					Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
					Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
					return;
				end
			end
		
			if cwCharacterNeeds.bedZones["scrapper2"] then
				if playerPos:WithinAABox(cwCharacterNeeds.bedZones["scrapper2"].pos1, cwCharacterNeeds.bedZones["scrapper2"].pos2) then
					player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
					--player:HandleSanity(50);
					--player:HandleNeed("hunger", 5);
					--player:HandleNeed("thirst", 10);
					--player:HandleNeed("sleep", -100);
					
					Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
					Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit et te reposes un peu.");
					return;
				end
			end
		--elseif (faction == "The Third Inquisition" or game.GetMap() == "rp_scraptown") and cwCharacterNeeds.bedZones["third_inquisition"] then
		if cwCharacterNeeds.bedZones["third_inquisition"] then
			if playerPos:WithinAABox(cwCharacterNeeds.bedZones["third_inquisition"].pos1, cwCharacterNeeds.bedZones["third_inquisition"].pos2) then
				player.sleepData = {health = 50, hunger = 5, thirst = 10, rest = -100, sanity = 50};
				--player:HandleSanity(50);
				--player:HandleNeed("hunger", 5);
				--player:HandleNeed("thirst", 10);
				--player:HandleNeed("sleep", -100);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 100);
				Schema:EasyText(player, "olivedrab", "Tu montes dans un lit et te reposes un peu.");
				return;
			end
		end
		
		if cwCharacterNeeds.bedZones["hillkeeper"] then
			if cwCharacterNeeds.bedZones["hillkeeper"] and playerPos:WithinAABox(cwCharacterNeeds.bedZones["hillkeeper"].pos2, cwCharacterNeeds.bedZones["hillkeeper"].pos1) then
				player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
				--player:HandleSanity(25);
				--player:HandleNeed("hunger", 10);
				--player:HandleNeed("thirst", 20);
				--player:HandleNeed("sleep", -60);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
				Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et prends un peu de repos.");
				return;
			end
		end
		
		if cwCharacterNeeds.bedZones["gorewatch"] then
			if cwCharacterNeeds.bedZones["gorewatch"] and playerPos:WithinAABox(cwCharacterNeeds.bedZones["gorewatch"].pos2, cwCharacterNeeds.bedZones["gorewatch"].pos1) then
				player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
				--player:HandleSanity(25);
				--player:HandleNeed("hunger", 10);
				--player:HandleNeed("thirst", 20);
				--player:HandleNeed("sleep", -60);
				
				Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
				Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et prends un peu de repos.");
				return;
			end
		end
	
		if cwCharacterNeeds.bedZones["castle"] and playerPos:WithinAABox(cwCharacterNeeds.bedZones["castle"].pos2, cwCharacterNeeds.bedZones["castle"].pos1) then
			player.sleepData = {health = 25, hunger = 10, thirst = 20, rest = -60, sanity = 25};
			--player:HandleSanity(25);
			--player:HandleNeed("hunger", 10);
			--player:HandleNeed("thirst", 20);
			--player:HandleNeed("sleep", -60);
			
			Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 150);
			Schema:EasyText(player, "olivedrab", "Tu grimpes dans un lit de camp et te reposes un peu.");
			return;
		end
		
		player.sleepData = {health = 10, hunger = 15, thirst = 30, rest = -30};
		--player:HandleNeed("hunger", 15);
		--player:HandleNeed("thirst", 30);
		--player:HandleNeed("sleep", -30);
		
		Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 300);
		Schema:EasyText(player, "olivedrab", "Tu grimpes sur le sol et tentes de te reposer un peu.");
	else
		Schema:EasyText(player, "firebrick", "Vous n'êtes pas assez fatigué pour dormir !");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetStamina");
COMMAND.tip = "Définir le niveau d'endurance d'un joueur.";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.alias = {"SetStamina", "PlySetStamina"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1]);
	local amount = tonumber(arguments[2]);
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		target:SetCharacterData("Stamina", amount);
		target:SetNWInt("Stamina", amount);
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s stamina to "..amount..".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have set your own stamina to "..amount..".");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetCorruption");
COMMAND.tip = "Définir le niveau de Corruption d'un joueur. (0 = Non Corrompu, 100 = Possédé)";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.alias = {"SetCorruption", "PlySetCorruption"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] )
	local amount = tonumber(arguments[2]);
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		target:SetNeed("corruption", amount);
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s corruption to "..amount..".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have set your own corruption to "..amount..".");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetHunger");
COMMAND.tip = "Définir le niveau de Faim d'un joueur. (0 = Rassasié, 100 = Affamé)";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.alias = {"SetHunger", "PlySetHunger"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] )
	local amount = tonumber(arguments[2]);
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		target:SetNeed("hunger", amount);
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s hunger to "..amount..".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have set your own Hunger to "..amount..".");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetThirst");
COMMAND.tip = "Définir le niveau de Soif d'un joueur. (0 = Hydraté, 100 = Déshydraté)";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.alias = {"SetThirst", "PlySetThirst"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] )
	local amount = tonumber(arguments[2]);
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		target:SetNeed("thirst", amount);
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s thirst to "..amount..".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have set your own thirst to "..amount..".");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetSleep");
COMMAND.tip = "Définir le niveau de fatigue d'un joueur. (0 = Reposé, 100 = Épuisé)";
COMMAND.text = "<string Name> <number Amount>";
COMMAND.access = "o";
COMMAND.arguments = 2;
COMMAND.alias = {"SetSleep", "PlySetSleep", "SetFatigue", "CharSetFatigue", "PlySetFatigue"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID( arguments[1] )
	local amount = tonumber(arguments[2]);
	
	if (!amount) then
		amount = 100;
	end;
	
	if (target) then
		target:SetNeed("sleep", amount);
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..player:Name().." has set "..target:Name().."'s sleep to "..amount..".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have set your own sleep to "..amount..".");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGetNeeds");
	COMMAND.tip = "Affiche la liste des besoins d'un personnage et leur état actuel. Les valeurs de 0 représentent l'état par défaut, indépendamment de ce qui peut s'afficher dans l'interface.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"GetNeeds", "PlyGetNeeds"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized() and target:Alive()) then
			local hunger = target:GetNeed("hunger", 0);
			local thirst = target:GetNeed("thirst", 0);
			local fatigue = target:GetNeed("sleep", 0);
			local corruption = target:GetNeed("corruption", 0);
			local needsStr = "Hunger: "..hunger.."  Thirst: "..thirst.."  Fatigue: "..fatigue.."  Corruption: "..corruption;

			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] "..target:Name().." has the following needs: "..needsStr);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();