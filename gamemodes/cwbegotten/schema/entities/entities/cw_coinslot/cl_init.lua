--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id")
	local colorWhite = Clockwork.option:GetColor("white")
	
	y = Clockwork.kernel:DrawInfo("Distributeur", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("Une machine ancienne avec une multitude de manivelles et d'engrenages. Elle a une fente à pièces bien visible.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);
	
	if state ~= "Gore" then
		menu:AddOption("Collecter la ration", function() Clockwork.Client:ConCommand("cw_CoinslotRation") end);
		
		if state == "Gatekeeper" then
			if !Clockwork.Client:GetNetVar("collectedGear") then
				menu:AddOption("Collecter le kit du Gardien", function() Clockwork.Client:ConCommand("cw_CoinslotGear") end);
			end
		end
		
		menu:AddOption("Donner", function() 
			Derma_StringRequest("Coinslot", "Combien de pièces souhaitez-vous offrir à la Fente à pièces?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotDonate", text);
			end)
		end);
		
		if cwShacks.shacks and cwShacks.shackData and Clockwork.Client:GetFaction() ~= "Holy Hierarchy" then
			local playerShack = Clockwork.Client:GetNetVar("shack");
			
			if !playerShack then
				local subMenu = menu:AddSubMenu("Acheter une propriété");
				
				if cwShacks.shackData["market"] then
					local marketMenu = subMenu:AddSubMenu("Zone du marché");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["market"], "name") do
						if not cwShacks.shacks[k].owner then
							marketMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							marketMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
				
				if cwShacks.shackData["floor1"] then
					local groundFloorMenu = subMenu:AddSubMenu("Rez-de-chaussée");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["floor1"], "name") do
						if not cwShacks.shacks[k].owner then
							groundFloorMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							groundFloorMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
				
				if cwShacks.shackData["floor2"] then
					local secondFloorMenu = subMenu:AddSubMenu("Deuxième étage");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["floor2"], "name") do
						if not cwShacks.shacks[k].owner then
							secondFloorMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							secondFloorMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
				
				if cwShacks.shackData["floor3"] then
					local thirdFloorMenu = subMenu:AddSubMenu("Troisième étage");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["floor3"], "name") do
						if not cwShacks.shacks[k].owner then
							thirdFloorMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							thirdFloorMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
				
				if cwShacks.shackData["floor4"] then
					local fourthFloorMenu = subMenu:AddSubMenu("Quatrième étage");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["floor4"], "name") do
						if not cwShacks.shacks[k].owner then
							fourthFloorMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							fourthFloorMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
				
				if cwShacks.shackData["shacks"] then
					local shacksMenu = subMenu:AddSubMenu("Baraques");
					
					for k, v in SortedPairsByMemberValue(cwShacks.shackData["shacks"], "name") do
						if not cwShacks.shacks[k].owner then
							shacksMenu:AddOption("("..tostring(v.price)..") "..v.name, function() Clockwork.kernel:RunCommand("CoinslotPurchase", k) end);
						else
							shacksMenu:AddOption("(VENDU) "..v.name, function() end);
						end
					end
				end
			else
				local subMenu = menu:AddSubMenu("Vendre la propriété");
				
				for k, v in pairs(cwShacks.shackData) do
					for k2, v2 in pairs(v) do
						if k2 == playerShack then
							subMenu:AddOption("("..tostring(v2.price / 2)..") "..v2.name, function() Clockwork.kernel:RunCommand("CoinslotSell", k2) end);
							
							local ownerData = cwShacks.shacks[k2];
							
							if ownerData then
								if !ownerData.coowners or (table.Count(ownerData.coowners) < cwShacks.maxCoowners) then
									menu:AddOption("Ajouter un copropriétaire", function() Clockwork.kernel:RunCommand("CoinslotAddCoowner") end);
								end

								if ownerData.coowners and table.Count(ownerData.coowners) > 0 then
									local removeMenu = menu:AddSubMenu("Remove Co-Owner");
									
									for k3, v3 in pairs(ownerData.coowners) do
										removeMenu:AddOption(v3, function() Clockwork.kernel:RunCommand("CoinslotRemoveCoowner", k3) end);
									end
								end
							end
						
							break;
						end
					end
				end
			end
		end
	end
	
	if state == "Gatekeeper" then
		local subMenu = menu:AddSubMenu("Salaire");
		
		subMenu:AddOption("Vérifier", function() Clockwork.Client:ConCommand("cw_CoinslotSalaryCheck") end);
		subMenu:AddOption("Collecter", function() Clockwork.Client:ConCommand("cw_CoinslotSalary") end);
	end
	
	local subMenu = menu:AddSubMenu("Trésorerie");
	
	subMenu:AddOption("Vérifier le taux d’imposition", function() Clockwork.Client:ConCommand("cw_CheckTaxRate") end);
	
	if state == "Hierarchy" then
		subMenu:AddOption("Vérifier", function() Clockwork.Client:ConCommand("cw_CoinslotTreasury") end);
		subMenu:AddOption("Définir le taux d’imposition", function() 
			Derma_StringRequest("Coinslot", "Quel taux d’imposition souhaitez-vous définir pour "..(game.GetMap() == "rp_district21" and "Hill" or "Tower").."? (1-99)", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotTax", text);
			end) 
		end);
	elseif Clockwork.Client:IsAdmin() then
		local subMenu = menu:AddSubMenu("(ADMIN) Treasury");
		
		subMenu:AddOption("Vérifier", function() Clockwork.Client:ConCommand("cw_CoinslotTreasury") end);
		subMenu:AddOption("Collect", function() 
			Derma_StringRequest("Coinslot", "Combien de pièces souhaitez-vous collecter dans la Fente à pièces?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotCollect", text);
			end) 
		end);
		subMenu:AddOption("Modify", function() 
			Derma_StringRequest("Coinslot", "De combien de pièces souhaitez-vous modifier la trésorerie?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotDonate", text, "true");
			end) 
		end);
		subMenu:AddOption("Définir le taux d’imposition", function() 
			Derma_StringRequest("Coinslot", "Quel taux d’imposition souhaitez-vous définir pour la Tour? (1-99)", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotTax", text);
			end) 
		end);
	end
	
	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenCoinslotMenu", function(state)
	CreateMenu(state);
end);