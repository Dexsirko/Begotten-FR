--[[
	Begotten III: Jesus Wept
--]]

PLUGIN:SetGlobalAlias("cwMedicalSystem");

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sh_diseases.lua");
Clockwork.kernel:IncludePrefixed("sh_injuries.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_plugin.lua");

game.AddDecal("BloodLarge", "decals/bloodstain_002");

-- this is shit, i'm replacing it with a ModifyPlayerSpeed hook
-- Called when the player's move data should be manipulated.
--[[function cwMedicalSystem:Move(player, moveData)
	local action, percentage = Clockwork.player:GetAction(player, true);
	
	if (action == "heal" or action == "healing" or action == "performing_surgery") then
		return true;
	end;
end;]]--

--[[local COMMAND = Clockwork.command:New("CharHeal");
COMMAND.tip = "Soigne un personnage si tu possèdes un objet médical.";
COMMAND.text = "<string Item>";
COMMAND.flags = CMD_DEFAULT;
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	if (player:GetNetVar("tied") == 0) then
		local itemTable = player:FindItemByID(arguments[1]);
		local entity = player:GetEyeTraceNoCursor().Entity;
		local target = Clockwork.entity:GetPlayer(entity);
		
		if (target) then
			if (entity:GetPos():Distance( player:GetShootPos() ) <= 192) then
				if (itemTable and itemTable.customFunctions and table.HasValue(itemTable.customFunctions, "Give")) then
					if (player:HasItemByID(itemTable.uniqueID)) then
						cwMedicalSystem:HealPlayer(player, target, itemTable);
					else
						Schema:EasyText(player, "lightslateblue","Vous ne possédez pas de"..itemTable.name.."!");
					end;
				else
					Schema:EasyText(player, "lightslateblue","Ceci n'est pas un objet valide !");
				end;
			else
				Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
			end;
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage !");
		end;
	else
		Schema:EasyText(player, "lightslateblue","Vous n'avez pas la permission de faire cela pour le moment !");
	end;
end;

COMMAND:Register();]]--

local COMMAND = Clockwork.command:New("CharStopBleeding");
COMMAND.tip = "Arrête tout saignement sur un personnage.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"StopBleeding", "PlyStopBleeding"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	
	if (target) then
		target:StopAllBleeding();
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a arrêté tout saignement pour "..target:Name()..".");
		else
			Schema:EasyText(player, "cornflowerblue","["..self.name.."] Vous avez arrêté tout saignement pour vous-même.");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharResetInjuries");
COMMAND.tip = "Retirer toutes les blessures d'un personnage.";
COMMAND.text = "<string Name>";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.alias = {"ResetInjuries", "PlyResetInjuries"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	
	if (target) then
		target:ResetInjuries();
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), _team.GetColor(player:Team()), player:Name(), "cornflowerblue", " a réinitialisé toutes les blessures pour ", _team.GetColor(target:Team()), target:Name(), "cornflowerblue", ".");
		else
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous avez réinitialisé toutes vos blessures.");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGetInjuries");
	COMMAND.tip = "Afficher la liste des blessures d'un personnage.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"GetInjuries", "PlyGetInjuries"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local injuries = cwMedicalSystem:GetInjuries(target);
			local injuryStr = "";
			
			if injuries then 
				for k, v in pairs(injuries) do
					for k2, v2 in pairs(v) do
						if v2 == true then
							local injury = cwMedicalSystem.cwInjuryTable[k2];
						
							if injury and injury.symptom then
								injuryStr = injuryStr.." Their "..cwMedicalSystem.cwHitGroupToString[k]..injury.symptom;
							end
						end
					end
				end
			end
			
			Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." présente les blessures suivantes: "..injuryStr);
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGiveInjury");
	COMMAND.tip = "Inflige une blessure spécifique à un personnage.";
	COMMAND.text = "<string Name> <string Injury> <string Limb>";
	COMMAND.access = "s";
	COMMAND.arguments = 3;
	COMMAND.alias = {"GiveInjury", "PlyGiveInjury"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local injury = string.gsub(string.lower(arguments[2]), " ", "_");
			
			if cwMedicalSystem.cwInjuryTable[injury] then
				local limb;
				local formattedLimb = string.gsub(string.lower(arguments[3]), "_", " ");
			
				for k, v in pairs(cwMedicalSystem.cwHitGroupToString) do
					if v == formattedLimb then
						limb = v;
						break;
					end
				end
				
				if !limb then
					Schema:EasyText(player, "grey",arguments[3].." n’est pas un membre valide!");
				
					return false;
				end
				
				local limbNumber = cwMedicalSystem.cwStringToHitGroup[limb];
				local injuries = cwMedicalSystem:GetInjuries(target);
			
				if injuries then
					for k, v in pairs(injuries) do
						for k2, v2 in pairs(v) do
							if v2 == true then
								if k2 == injury and k == limbNumber then
									Schema:EasyText(player, "darkgrey",target:Name().." possède déjà "..injury.." blessure!");
									
									return false;
								end
							end
						end
					end
				end
				
				target:AddInjury(limbNumber, injury);
				
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a donné "..target:Name().." un "..injury.." blessure à son "..limb.."!");
			else
				Schema:EasyText(player, "grey",arguments[2].." n’est pas une blessure valide!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeInjury");
	COMMAND.tip = "Inflige une blessure spécifique à un personnage.";
	COMMAND.text = "<string Name> <string Injury> <string Limb>";
	COMMAND.access = "s";
	COMMAND.arguments = 3;
	COMMAND.alias = {"TakeInjury", "PlyTakeInjury"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local injury = string.gsub(string.lower(arguments[2]), " ", "_");
			
			if cwMedicalSystem.cwInjuryTable[injury] then
				local limb;
				local formattedLimb = string.gsub(string.lower(arguments[3]), "_", " ");
			
				for k, v in pairs(cwMedicalSystem.cwHitGroupToString) do
					if v == formattedLimb then
						limb = v;
						break;
					end
				end
				
				if !limb then
					Schema:EasyText(player, "grey",arguments[3].." n’est pas un membre valide!");
				
					return false;
				end

				target:RemoveInjury(cwMedicalSystem.cwStringToHitGroup[limb], injury);
				
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a subi une "..injury.." blessure de la part de "..target:Name().."'s "..limb.."!");
			else
				Schema:EasyText(player, "grey",arguments[2].." n’est pas une blessure valide!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharClearInjuries");
	COMMAND.tip = "Effacer toutes les blessures d'un personnage.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"ClearInjuries", "PlyClearInjuries"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			target:ResetInjuries();
			
			Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a effacé tout/tous les "..target:Name().."'s blessures!");
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharSetBloodLevel");
COMMAND.tip = "Définir le niveau de sang d'un personnage (0-5000).";
COMMAND.text = "<string Name> <number Blood>";
COMMAND.access = "s";
COMMAND.arguments = 2;
COMMAND.alias = {"SetBloodLevel", "PlySetBloodLevel"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	
	if (target) then
		local bloodLevel = tonumber(arguments[2]);
		local oldBloodLevel = target:GetCharacterData("BloodLevel");
		
		if bloodLevel then
			target:SetBloodLevel(bloodLevel);
			
			if (player != target) then
				Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a défini "..target:Name().."son niveau de sang à "..tostring(bloodLevel)..".");
			else
				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous avez défini votre propre niveau de sang à "..tostring(bloodLevel)..".");
			end;
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
	end;
end;

COMMAND:Register();

local COMMAND = Clockwork.command:New("CharDiagnose");
	COMMAND.tip = "Diagnostique un personnage pour ses blessures.";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.alias = {"Diagnose", "PlyDiagnose"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		if cwBeliefs and !player:HasBelief("doctor") then
			Schema:EasyText(player, "chocolate","Vous n'avez pas la foi nécessaire pour faire cela !");
			return false;
		end
		
		local target = Clockwork.entity:GetPlayer(player:GetEyeTraceNoCursor().Entity);
		
		if (target) then
			if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
				local bloodLevel = target:GetCharacterData("BloodLevel", cwMedicalSystem.maxBloodLevel);
				local diagnoseString = "You take a good look at "..target:Name()..".";
				local health = target:Health();
				local maxHealth = target:GetMaxHealth();
				local textColorScale = 0;
				
				if target:Alive() then
					if health < maxHealth then
						if health <= maxHealth * 0.25 then
							diagnoseString = diagnoseString.." Ils semblent être proches de la mort.";
							
							textColorScale = math.min(textColorScale + 0.8, 1);
						elseif health <= maxHealth * 0.55 then
							diagnoseString = diagnoseString.." Ils semblent être grièvement blessés.";
							
							textColorScale = math.min(textColorScale + 0.5, 1);
						elseif health <= maxHealth * 0.75 then
							diagnoseString = diagnoseString.." Ils semblent être blessés.";
							
							textColorScale = math.min(textColorScale + 0.25, 1);
						elseif health <= maxHealth * 0.9 then
							diagnoseString = diagnoseString.." Ils semblent avoir des blessures mineures.";
							
							textColorScale = math.min(textColorScale + 0.05, 1);
						end
					end
				
					if target.bleeding then
						local bleedingLimbsData = target:GetCharacterData("BleedingLimbs", {});
						local bleedingLimbs = {};
						
						for k, v in pairs(bleedingLimbsData) do
							if v == true then
								table.insert(bleedingLimbs, k);
								
								textColorScale = math.min(textColorScale + 0.1, 1);
							end
						end
						
						if #bleedingLimbs > 0 then
							if #bleedingLimbs == 1 then
								diagnoseString = diagnoseString.." Ils saignent de leur "..bleedingLimbs[1]..".";
							else
								diagnoseString = diagnoseString.." Ils saignent de leur ";
								
								for i = 1, #bleedingLimbs do
									if i == 1 then
										diagnoseString = diagnoseString..bleedingLimbs[i];
									elseif i == #bleedingLimbs then
										diagnoseString = diagnoseString..", et "..bleedingLimbs[i];
									else
										diagnoseString = diagnoseString..", "..bleedingLimbs[i];
									end
								end
								
								diagnoseString = diagnoseString..".";
							end
						end
					end
					
					local injuries = cwMedicalSystem:GetInjuries(target);
					
					if injuries then
						for k, v in pairs(injuries) do
							for k2, v2 in pairs(v) do
								if v2 == true then
									local injury = cwMedicalSystem.cwInjuryTable[k2];
								
									if injury and injury.symptom then
										diagnoseString = diagnoseString.." Leur "..cwMedicalSystem.cwHitGroupToString[k]..injury.symptom;
										
										textColorScale = math.min(textColorScale + 0.1, 1);
									end
								end
							end
						end
					end
					
					if bloodLevel < cwMedicalSystem.maxBloodLevel - 1250 then
						diagnoseString = diagnoseString.." Ils ont l’air très pâles à cause de la perte de sang.";
						
						textColorScale = math.min(textColorScale + 0.2, 1);
					end
					
					local symptoms = target:GetNetVar("symptoms", {});
					local symptomText;
					
					for i = 1, #symptoms do
						local symptom = symptoms[i];
						
						if symptom == "Paleness" then
							if symptomText then
								symptomText = symptomText.." Ils ont l’air très pâles et maladifs.";
							else
								symptomText = " Ils ont l’air très pâles et maladifs.";
							end
						elseif symptom == "Pustules" then
							if symptomText then
								symptomText = symptomText.." Ils sont couverts de pustules et de bubons, un symptôme classique de la Peste de Begotten.";
							else
								symptomText = " Ils sont couverts de pustules et de bubons, un symptôme classique de la Peste de Begotten.";
							end
						elseif symptom == "Deformities" then
							if symptomText then
								symptomText = symptomText.." Leur peau est déformée et décolorée, et leurs yeux sont exorbités.";
							else
								symptomText = " Leur peau est déformée et décolorée, et leurs yeux sont exorbités.";
							end
						elseif symptom == "Coughing" then
							if symptomText then
								symptomText = symptomText.." Ils toussent énormément.";
							else
								symptomText = " Ils toussent énormément.";
							end
						elseif symptom == "Nausea" then
							if symptomText then
								symptomText = symptomText.." Ils semblent légèrement désorientés, comme frappés de nausée.";
							else
								symptomText = " Ils semblent légèrement désorientés, comme frappés de nausée.";
							end
						end
						
						textColorScale = math.min(textColorScale + 0.2, 1);
					end
					
					if symptomText then
						diagnoseString = diagnoseString..symptomText;
					end
					
					if diagnoseString == "Vous regardez attentivement "..target:Name().."." then
						diagnoseString = diagnoseString.." Ils semblent en parfaite santé.";
					end
					
					Schema:EasyText(player, Color(255 * textColorScale, 255 * (1 - textColorScale), 0), diagnoseString);
				else
					Schema:EasyText(player, "indianred", diagnoseString.." Ils semblent être décédés, vous ne pouvez plus rien faire pour eux.");
				end
			else
				Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
			end;
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage !");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGiveDisease");
	COMMAND.tip = "Donne une maladie à un personnage. Argument optionnel pour le stade. (Par défaut = 1)";
	COMMAND.text = "<string Name> <string DiseaseID> [int Stage]";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.optionalArguments = 1;
	COMMAND.alias = {"GiveDisease", "PlyGiveDisease"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local diseaseID = arguments[2];
		
		if (target and target:HasInitialized()) then
			if diseaseID then
				local diseaseTable = cwMedicalSystem:FindDiseaseByID(diseaseID);
				
				if diseaseTable then
					local stage = tonumber(arguments[3]);
					
					if stage then	
						if not target:HasDisease(diseaseID, stage) then
							if stage > 0 and stage <= #diseaseTable.stages then
								target:GiveDisease(diseaseID, arguments[3]);
								Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..target:Name().." a reçu le/la '"..diseaseID.."' maladie (Stage "..tostring(stage)..") par "..player:Name().."!", nil);
							else
								Schema:EasyText(player, "grey", "["..self.name.."] Vous devez spécifier un stade valide pour "..diseaseID.."! (1 - "..#diseaseTable.stages..")");
							end
						else
							Schema:EasyText(player, "firebrick","["..self.name.."] "..target:Name().." a déjà cette maladie à ce stade!");
						end
					else
						if not target:HasDisease(diseaseID) then
							target:GiveDisease(diseaseID);
							Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", "["..self.name.."] "..target:Name().." a reçu le/la '"..diseaseID.."' maladie par "..player:Name().."!", nil);
						else
							Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." a déjà cette maladie!");
						end
					end
				else
					Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..diseaseID.." n’est pas une maladie valide!");
				end
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Vous devez spécifier une maladie valide!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeDisease");
	COMMAND.tip = "Retirer une maladie d'un personnage.";
	COMMAND.text = "<string Name> <string DiseaseID>";
	COMMAND.access = "s";
	COMMAND.arguments = 2;
	COMMAND.alias = {"TakeDisease", "PlyRemoveDisease", "CharRemoveDisease", "RemoveDisease", "PlyRemoveDisease"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local diseaseID = arguments[2];
		
		if (target and target:HasInitialized()) then
			if diseaseID then
				if cwMedicalSystem:FindDiseaseByID(diseaseID) then
					if target:HasDisease(diseaseID) then
						target:TakeDisease(diseaseID);
						Schema:EasyText(Schema:GetAdmins(), "cornflowerblue", player:Name().." a pris le/la '"..diseaseID.."' maladie de la part de "..target:Name().."!", nil);
					else
						Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." n’a pas cette maladie!");
					end
				else
					Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..diseaseID.." n’est pas une maladie valide!");
				end
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Vous devez spécifier une maladie valide!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharTakeAllDiseases");
	COMMAND.tip = "Retirer toutes les maladies d'un personnage.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"TakeAllDiseases", "PlyRemoveAllDiseases", "CharRemoveAllDiseases", "RemoveAllDiseases", "PlyRemoveAllDiseases"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		local diseaseID = arguments[2];
		
		if (target and target:HasInitialized()) then
			target:TakeAllDiseases();
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharGetDiseases");
	COMMAND.tip = "Afficher la liste des maladies d'un personnage.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "o";
	COMMAND.arguments = 1;
	COMMAND.alias = {"GetDiseases", "PlyGetDiseases"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target and target:HasInitialized()) then
			local diseases = target:GetCharacterData("diseases");
			
			if diseases and not table.IsEmpty(diseases) then
				local diseasesStr = "";
				
				for i = 1, #diseases do
					local disease = diseases[i];
					
					if disease then
						local diseaseTable = cwMedicalSystem:FindDiseaseByID(disease.uniqueID);
						
						if diseaseTable then
							diseasesStr = diseasesStr..diseaseTable.name.." (Stage: "..(disease.stage or "1")..") ";
						end
					end
				end
				
				if diseasesStr ~= "" then
					Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." présente les maladies suivantes: "..diseasesStr);
				else
					Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." n’a aucune maladie!");
				end
			else
				Schema:EasyText(player, "cornflowerblue","["..self.name.."] "..target:Name().." n’a aucune maladie!");
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
		end;
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CharForceVomit");
COMMAND.tip = "Forcer un personnage à vomir.";
COMMAND.text = "<string Name> [bool VomitBlood]";
COMMAND.access = "s";
COMMAND.arguments = 1;
COMMAND.optionalArguments = 1;
COMMAND.alias = {"ForceVomit", "PlyForceVomit", "MakeVomit", "CharMakeVomit", "PlyMakeVomit"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])
	
	if (target) then
		if arguments[2] then
			target:Vomit(true);
		else
			target:Vomit();
		end
		
		if (player != target) then
			Schema:EasyText(Schema:GetAdmins(), "olive", "["..self.name.."] "..player:Name().." a fait "..target:Name().." vomir.");
		else
			Schema:EasyText(player, "olive", "["..self.name.."] Vous vous avez fait vomir.");
		end;
	else
		Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide!");
	end;
end;

COMMAND:Register();