include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id")
	local colorWhite = Clockwork.option:GetColor("white")
	y = Clockwork.kernel:DrawInfo("Un chaudron en fer noir bouillonnant et chaud. Il contient un trésor du genre viscéral.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);
	local inventory = Clockwork.inventory:GetClient();
	local waterAbleToBeAdded = {
		["dirtywater"] = true,
		["purified_water"] = true,
		["purified_water_bucket"] = true,
		["dirty_water_bucket"] = true,
	}

	menu:AddOption("Inspecter le contenu", function() Clockwork.kernel:RunCommand("CauldronInspect") end);

	local submenu = menu:AddSubMenu("Ajouter de l’eau");
	local submenu2 = menu:AddSubMenu("Ajouter un ingrédient");

	for k, v in pairs(inventory) do
		local itemTable = Clockwork.item:FindByID(k)
		if (itemTable) then
			if waterAbleToBeAdded[itemTable.uniqueID] then
				submenu:AddOption(itemTable.name, function() Clockwork.kernel:RunCommand("CauldronAddWater", itemTable.uniqueID) end);
			end

			if (itemTable.cauldronLiquidity or itemTable.cauldronQuality) then
				if (state == "Wanderer" and !itemTable.cauldronPoison and !itemTable.cauldronPlague) or state == "Satanist" then
					submenu2:AddOption(itemTable.name, function() Clockwork.kernel:RunCommand("CauldronAddIngredient", itemTable.uniqueID) end);
				end
			end
		end
	end

	local dumpMenu = menu:AddSubMenu("Jeter le ragoût");

	dumpMenu:AddOption("Confirmer", function() Clockwork.kernel:RunCommand("CauldronDump") end);
		
	menu:AddOption("Distribuer le ragoût", function() Clockwork.kernel:RunCommand("CauldronDispense") end);

    menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

Clockwork.datastream:Hook("OpenCauldronMenu", function(state)
	CreateMenu(state);
end);