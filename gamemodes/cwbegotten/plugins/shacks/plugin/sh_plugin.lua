--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

PLUGIN:SetGlobalAlias("cwShacks");

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

cwShacks.maxCoowners = 10;

-- Called when the Clockwork shared variables are added.
function cwShacks:ClockworkAddSharedVars(globalVars, playerVars)
	playerVars:Number("shack");
end;

local coinslotSounds = {"buttons/lever1.wav", "buttons/lever4.wav"};

local COMMAND = Clockwork.command:New("CoinslotPurchase");
	COMMAND.tip = "Achetez une propriété depuis le distributeur de jetons.";
	COMMAND.text = "<string Shack>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local trace = player:GetEyeTrace();

		if (trace.Entity) then
			local entity = trace.Entity;

			if (entity:GetClass() == "cw_coinslot") then
				if player:GetFaction() == "Holy Hierarchy" then
					Schema:EasyText(player, "peru", "La Hiérarchie Sacrée ne peut pas acquérir de propriété !");
					return false;
				end
				
				if cwShacks then
					cwShacks:ShackPurchased(player, arguments[1]);
					
					entity:EmitSound(coinslotSounds[math.random(#coinslotSounds)]);
					
					timer.Simple(0.5, function()
						if IsValid(entity) then
							entity:EmitSound("ambient/levels/labs/coinslot1.wav");
						end
					end);
					
					return;
				end
			end;
		end;
		
		Schema:EasyText(player, "peru", "Vous devez regarder le distributeur pour acheter une propriété !");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CoinslotSell");
	COMMAND.tip = "Vendez votre propriété au Distributeur de pièces.";
	COMMAND.text = "<string Shack>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local trace = player:GetEyeTrace();

		if (trace.Entity) then
			local entity = trace.Entity;

			if (entity:GetClass() == "cw_coinslot") then
				if cwShacks then
					cwShacks:ShackSold(player, arguments[1]);
					
					entity:EmitSound(coinslotSounds[math.random(#coinslotSounds)]);
					
					timer.Simple(0.5, function()
						if IsValid(entity) then
							entity:EmitSound("ambient/levels/labs/coinslot1.wav");
						end
					end);
					
					return;
				end
			end;
		end;
		
		Schema:EasyText(player, "peru", "Vous devez regarder le distributeur pour vendre une propriété !");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CoinslotAddCoowner");
	COMMAND.tip = "Ajoutez un personnage comme copropriétaire à votre propriété pour 100 pièces.";
	COMMAND.flags = CMD_DEFAULT;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local trace = player:GetEyeTrace();

		if (trace.Entity) then
			local entity = trace.Entity;

			if (entity:GetClass() == "cw_coinslot") then
				if cwShacks then
					local shack = player:GetOwnedShack();
					
					if shack then
						Clockwork.dermaRequest:RequestString(player, "Add Co-Owner (100 Coin Charge)", "Who would you like to add as a co-owner for this property?", "", function(result)
							local target = Clockwork.player:FindByID(result);
							
							if target and target:Alive() and target ~= player then
								local characterKey = target:GetCharacterKey();
								local faction = target:GetNetVar("kinisgerOverride") or target:GetFaction();
								local targetShack = target:GetOwnedShack();
								
								if faction == "Holy Hierarchy" or faction == "Goreic Warrior" then
									Schema:EasyText(player, "peru", "Vous n'avez pas assez de pièces pour ajouter un co-propriétaire !");
								
									return;
								end;
								
								if targetShack then
									Schema:EasyText(player, "peru", target:Name().." is already an owner of another property!");
								
									return;
								end
								
								for k, v in pairs(cwShacks.shacks) do
									if v.coowners then
										for k2, v2 in pairs(v.coowners) do
											if k2 == characterKey then
												Schema:EasyText(player, "peru", target:Name().." is already a co-owner of another property!");
											
												return;
											end;
										end
									end
								end
								
								if Clockwork.player:CanAfford(player, 100) then
									Clockwork.player:GiveCash(player, -100, "Added Co-Owner");
									Schema:ModifyTowerTreasury(100);

									cwShacks:ShackCoownerAdded(target, shack);
									
									Schema:EasyText(player, "olivedrab", "Vous avez ajouté"..target:Name().." as a co-owner to your property.");
									Schema:EasyText(target, "olivedrab", "Vous avez été ajouté comme copropriétaire d'une propriété ("..shack..") by: "..player:Name()..".");
									
									entity:EmitSound(coinslotSounds[math.random(#coinslotSounds)]);
									
									timer.Simple(0.5, function()
										if IsValid(entity) then
											entity:EmitSound("ambient/levels/labs/coinslot1.wav");
										end
									end);
									
								else
									Schema:EasyText(player, "peru", "Vous n'avez pas assez de pièces pour ajouter un co-propriétaire !");
								end
							else
								Schema:EasyText(player, "peru", result.." is not a valid character!");
							end
						end);
						
						return;
					else
						Schema:EasyText(player, "peru", "Vous ne possédez aucune propriété !");
					end
				end
			end;
		end;
		
		Schema:EasyText(player, "peru", "Vous devez regarder le distributeur pour vendre une propriété !");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("CoinslotRemoveCoowner");
	COMMAND.tip = "Retirer un co-propriétaire de votre propriété.";
	COMMAND.text = "<string Character>";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.arguments = 1;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local trace = player:GetEyeTrace();

		if (trace.Entity) then
			local entity = trace.Entity;

			if (entity:GetClass() == "cw_coinslot") then
				if cwShacks then
					local shack = player:GetOwnedShack();
					
					if shack then
						cwShacks:ShackCoownerRemoved(tonumber(arguments[1]), shack);
						
						Schema:EasyText(player, "olivedrab", "Vous avez retiré"..target:Name().." as a co-owner from your property.");
						Schema:EasyText(target, "olivedrab", "Vous avez été retiré en tant que copropriétaire d'une propriété ("..shack..") by: "..player:Name()..".");
						
						entity:EmitSound(coinslotSounds[math.random(#coinslotSounds)]);
						
						return;
					else
						Schema:EasyText(player, "peru", "Vous ne possédez aucune propriété !");
					end
				end
			end;
		end;
		
		Schema:EasyText(player, "peru", "Vous devez regarder le distributeur de jetons pour vendre une propriété !");
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("OpenStash");
	COMMAND.tip = "Ouvre le coffre de votre propriété. Votre coffre n'est accessible à personne d'autre, sauf aux administrateurs et à l'Inquisition.";
	COMMAND.flags = CMD_DEFAULT;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		cwShacks:ShackStashOpen(player);
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("ClearProperty");
	COMMAND.tip = "Efface une propriété que vous regardez ou dans laquelle vous vous trouvez.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local playerPos = player:GetPos();
		local trace = player:GetEyeTrace();
		local entity = trace.Entity;
		local shack;
	
		for k, v in pairs(cwShacks.shacks) do
			if (playerPos:WithinAABox(v.pos1, v.pos2)) or (IsValid(entity) and v.doorEnt == entity) then
				shack = v;
				break;
			end
		end
		
		if shack then
			for _, v in _player.Iterator() do
				if v:GetCharacterKey() == shack.owner then
					v:SetNetVar("shack", nil);
					
					if v:GetFaction() ~= "Holy Hierarchy" then
						Clockwork.player:TakeSpawnWeapon(v, "cw_keys");
					end
				end
			end
			
			shack.owner = nil;
			shack.stash = nil;
			shack.stashCash = nil;
			
			Clockwork.entity:ClearProperty(shack.doorEnt);
			
			cwShacks:NetworkShackData(PlayerCache or _player.GetAll());
			--cwShacks:SaveShackData();
			Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have cleared this property.");
		else
			Schema:EasyText(player, "grey", "Aucune propriété valide n'a pu être trouvée !");
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("GetPropertyInfo");
	COMMAND.tip = "Obtenez des informations sur une propriété en regardant la porte d'entrée ou en vous tenant à l'intérieur. Fonctionne uniquement pour la Sainte Hiérarchie.";
	COMMAND.flags = CMD_DEFAULT;

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		cwShacks:GetPropertyInfo(player);
	end;
COMMAND:Register();