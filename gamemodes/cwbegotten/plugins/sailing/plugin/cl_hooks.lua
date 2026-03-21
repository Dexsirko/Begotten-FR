--[[
	Begotten III: Jesus Wept
--]]

local cwSailing = cwSailing;

function cwSailing:GetProgressBarInfoAction(action, percentage)
	if (action == "burn_longship") then
		return {text = "Vous mettez le feu au drakkar. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "extinguish_longship") then
		return {text = "Vous essayez d’éteindre les flammes. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_longship") then
		return {text = "Vous effectuez des réparations sur le drakkar. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_alarm") then
		return {text = "Vous réparez l’alarme de Gorewatch. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_steam_engine") then
		return {text = "Vous réparez le moteur à vapeur. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	elseif (action == "refuel_ironclad") then
		return {text = "Vous ajoutez du charbon dans le moteur à vapeur du cuirassé. Cliquez pour annuler.", percentage = percentage, flash = percentage < 10};
	end
end

-- Called when the local player's item menu should be adjusted.
function cwSailing:PlayerAdjustItemMenu(itemTable, menuPanel, itemFunctions)
	if (itemTable.uniqueID == "scroll_longship" or itemTable.uniqueID == "scroll_ironclad") then
		if Clockwork.Client:GetFaction() == "Goreic Warrior" and Clockwork.Client:GetZone() == "gore" then
			if (game.GetMap() != "rp_begotten3" and game.GetMap() != "rp_district21") then
				return;
			end;
			
			--[[menuPanel:AddOption("Dock", function()
				Clockwork.inventory:InventoryAction("dock", itemTable.uniqueID, itemTable.itemID);
			end);]]--

			menuPanel:AddOption("Undock", function()
				Clockwork.inventory:InventoryAction("undock", itemTable.uniqueID, itemTable.itemID);
			end);
			
			menuPanel:AddOption("Rename", function()
				Clockwork.inventory:InventoryAction("rename", itemTable.uniqueID, itemTable.itemID);
			end);
		end
	end
end;

function cwSailing:SubModifyItemMarkupTooltip(category, maximumWeight, weight, condition, percentage, name, itemTable, x, y, width, height, frame, bShowWeight)
	if category == "Naval" then
		local health = itemTable:GetData("health");
		
		if health then
			if health > 0 then
				frame:AddText("Santé du Longship :"..tostring(health), Color(110, 30, 30), nil, 0.9);
			end
		end
	end
end

function cwSailing:CreateMenu(data)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
	local isAdmin = Clockwork.Client:IsAdmin();
	local zone = Clockwork.Client:GetZone();
	local map = game.GetMap();
		
	menu:SetMinimumWidth(150);
	
	if !data then
		data = {};
	end
	
	local entity = data.entity;
	
	if !IsValid(entity) then
		return;
	end
	
	local location = data.location;
	
	if data.ignitable then
		if !data.ignited and !data.destination then
			if Clockwork.Client:GetFaction() ~= "Goreic Warrior" then
				local activeWeapon = Clockwork.Client:GetActiveWeapon();
				
				if activeWeapon:IsValid() and activeWeapon:GetClass() == "cw_lantern" and Clockwork.Client:IsWeaponRaised(activeWeapon) then
					local oil = Clockwork.Client:GetNetVar("oil", 0);
				
					--if oil >= 75 then
					if oil >= 1 then
						menu:AddOption("Bruler", function() Clockwork.Client:ConCommand("cw_BurnShip") end);
					end
				end
			end
		end
	end
	
	if isAdmin or data.cargoholdopenable then
		menu:AddOption("Cale", function() Clockwork.Client:ConCommand("cw_CargoHold") end);
	end
	
	menu:AddOption("Examiner", function() Clockwork.Client:ConCommand("cw_CheckShipStatus") end);
	
	if data.ignited then
		menu:AddOption("Éteindre", function() Clockwork.Client:ConCommand("cw_ExtinguishShip") end);
	end
	
	if data.repairable then
		menu:AddOption("Réparer", function() Clockwork.Client:ConCommand("cw_RepairShip") end);
	end
	
	if data.destination and data.location and !string.find(zone, "sea_") then
		menu:AddOption("Annuler la navigation", function() Clockwork.Client:ConCommand("cw_AbortSailing") end);
	end
	
	if data.isOwner then
		if data.entity:GetNWBool("freeSailing") then
			menu:AddOption("Désactiver la navigation libre", function() Clockwork.Client:ConCommand("cw_ShipToggleFreeSailing") end);
		else
			menu:AddOption("Activer la navigation libre", function() Clockwork.Client:ConCommand("cw_ShipToggleFreeSailing") end);
		end
		
		if data.location == "docks" then
			menu:AddOption("Accoster", function() Clockwork.Client:ConCommand("cw_DockLongship") end);
		end
	end
	
	if data.sailable or (isAdmin and Clockwork.player:IsNoClipping(Clockwork.Client) and !data.destination) then
		local location = data.location;
		local submenu = menu:AddSubMenu("Sail", function() end);
			
		if location ~= "docks" then
			if location == "hell" or (location == "wastelandlava" and map == "rp_begotten3") or location == "styx" then
				submenu:AddOption("Naviguez à travers le Styx jusqu’à la Forêt goreic", function() Clockwork.Client:ConCommand("cw_MoveShipGoreForest") end);
			else
				submenu:AddOption("Naviguez en haute mer jusqu’à la Forêt goreic", function() Clockwork.Client:ConCommand("cw_MoveShipGoreForest") end);
			end
		end
			
		if zone ~= "wasteland" then
			if (location == "hell" or location == "styx") and map == "rp_begotten3" then
				submenu:AddOption("Naviguez à travers le Styx jusqu’au Désert glazic", function() Clockwork.Client:ConCommand("cw_MoveShipWasteland") end);
			else
				submenu:AddOption("Naviguez en haute mer jusqu’au Désert glazic", function() Clockwork.Client:ConCommand("cw_MoveShipWasteland") end);
			end
			
			if map == "rp_begotten3" then
				submenu:AddOption("Naviguez à travers le Styx jusqu’à la Côte de lave", function() Clockwork.Client:ConCommand("cw_MoveShipLava") end);
			end
		end
			
		if location ~= "hell" then
			submenu:AddOption("Naviguez à travers le Styx jusqu’en Enfer.", function() Clockwork.Client:ConCommand("cw_MoveShipHell") end);
		end
	end
	
	if isAdmin then
		menu:AddOption("(ADMIN) Toggle River Styx Enchantment", function() Clockwork.Client:ConCommand("cw_ShipToggleEnchantment") end);
	
		if location == "calm" or location == "rough" or location == "styx" then
			menu:AddOption("(ADMIN) Se diriger vers la destination", function() Clockwork.Client:ConCommand("cw_ShipTimerSpeed") end);
			menu:AddOption("(ADMIN) Activer/Désactiver la minuterie", function() Clockwork.Client:ConCommand("cw_ShipTimerPause") end);
		end
	end
	
	menu:Open();
	
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenAlarmMenu", function(alarmEnt)
	if IsValid(alarmEnt) then
		if (IsValid(menu)) then
			menu:Remove();
		end;
		
		local scrW = ScrW();
		local scrH = ScrH();
		local menu = DermaMenu();
		
		menu:SetMinimumWidth(150);
		
		menu:AddOption("Examiner", function()
			Schema:EasyText("skyblue", "Un système d’alarme bricolé équipé de capteurs sismiques réglés pour déclencher une alarme en cas d’arrivée d’un drakkar goreic. Notez que l’alarme n’est pas assez puissante pour être entendue depuis la Tour de Lumière, et ne retentira que si Gorewatch dispose d’une garnison d’occupation.");
		end);
		
		if alarmEnt:GetNWBool("broken") then
			menu:AddOption("Réparer", function() Clockwork.Client:ConCommand("cw_RepairGorewatchAlarm") end);
		end
		
		menu:Open();
		menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
	end
end);

netstream.Hook("OpenLongshipMenu", function(data)
	cwSailing:CreateMenu(data);
end);

netstream.Hook("OpenSteamEngineMenu", function(steamEngineEnt)
	if IsValid(steamEngineEnt) then
		if (IsValid(menu)) then
			menu:Remove();
		end;
		
		local scrW = ScrW();
		local scrH = ScrH();
		local menu = DermaMenu();
		
		menu:SetMinimumWidth(150);
		
		menu:AddOption("Examiner", function()
			if steamEngineEnt:GetNWBool("turnedOn") then
				Schema:EasyText("skyblue", "Un moteur à vapeur récupéré et remis en état de marche par le Clan Shagalax. Il alimente le Cuirassé à vapeur sur lequel il est boulonné. Crachant une fumée âcre et un vacarme assourdissant, il tremble violemment et on le sent ébranler le navire.");
			else
				Schema:EasyText("skyblue", "Un moteur à vapeur récupéré et remis en état de marche par le Clan Shagalax. Il alimente le Cuirassé à vapeur sur lequel il est boulonné, bien qu’il ne soit pas en marche actuellement.");
			end
		end);
		
		if steamEngineEnt:GetNWBool("broken") then
			menu:AddOption("Réparer", function() Clockwork.Client:ConCommand("cw_SteamEngineRepair") end);
		else
			menu:AddOption("Ajouter du carburant", function() Clockwork.Client:ConCommand("cw_SteamEngineFuel refuel") end);
			menu:AddOption("Vérifier le carburant", function() Clockwork.Client:ConCommand("cw_SteamEngineFuel check") end);
		
			if steamEngineEnt:GetNWBool("turnedOn") then
				menu:AddOption("Arrêter le moteur", function() Clockwork.Client:ConCommand("cw_SteamEngine off") end);
			else
				menu:AddOption("Démarrer le moteur", function() Clockwork.Client:ConCommand("cw_SteamEngine on") end);
			end
		end
		
		menu:Open();
		menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
	end
end);

netstream.Hook("DrowningCutscene", function(data)
	CreateSound(Clockwork.Client, "begotten/score5.mp3"):PlayEx(1, 100);
end);