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
	
	y = Clockwork.kernel:DrawInfo("Portail de l'Enfer", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("La porte vers d'autres mondes.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);

	local subMenu = menu:AddSubMenu("Traverse...");
	local subMenu2 = menu:AddSubMenu("Gaze through the veil...");
	
	if game.GetMap() == "rp_district21" then
		subMenu:AddOption("...vers les Piliers de la Création", function() Clockwork.Client:ConCommand("cw_HellPortalPillars") end);
		subMenu:AddOption("...vers l’Église abandonnée.", function() Clockwork.Client:ConCommand("cw_HellPortalAbandonedChurch") end);
		subMenu2:AddOption("...dans les Piliers de la Création", function() Clockwork.kernel:RunCommand("HellPortalGaze", "Pillars") end);
		subMenu2:AddOption("...dans l’Église abandonnée", function() Clockwork.kernel:RunCommand("HellPortalGaze", "Church") end);
	else
		subMenu:AddOption("...vers l’Arche de la Perdition", function() Clockwork.Client:ConCommand("cw_HellPortalArch") end);
		subMenu:AddOption("...vers les Piliers de la Création", function() Clockwork.Client:ConCommand("cw_HellPortalPillars") end);
		subMenu2:AddOption("...dans l’Arche de la Perdition", function() Clockwork.kernel:RunCommand("HellPortalGaze", "Arch") end);
		subMenu2:AddOption("...dans les Piliers de la Création", function() Clockwork.kernel:RunCommand("HellPortalGaze", "Pillars") end);
	end

	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenHellPortalMenu", function(state)
	CreateMenu(state);
end);