--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local CLASS = Clockwork.class:New("Wanderer");
	CLASS.color = Color(200, 200, 200, 255);
	CLASS.factions = {FACTION_WANDERER};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 0;
CLASS_WANDERER = CLASS:Register();

local CLASS = Clockwork.class:New("Gatekeeper");
	CLASS.color = Color(100, 100, 100, 255);
	CLASS.factions = {FACTION_GATEKEEPER};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 25;
CLASS_GATEKEEPER = CLASS:Register();

local CLASS = Clockwork.class:New("Pope Adyssa's Gatekeepers");
	CLASS.color = Color(0, 0, 0, 255);
	CLASS.factions = {FACTION_GATEKEEPER_ADYSSA};
	CLASS.isDefault = true;
	CLASS.description = "Ceux qui s'accrochent à la foi dans un monde sans espoir.";
	CLASS.defaultPhysDesc = "Une figure enveloppée dans une robe sombre, elle semble folle et agressive.";
	CLASS.wagesName = "Church Salary";
	CLASS.coinslotWages = 0;
CLASS_GATEKEEPER = CLASS:Register();

local CLASS = Clockwork.class:New("Holy Hierarchy");
	CLASS.color = Color(255, 180, 0, 255);
	CLASS.factions = {FACTION_HIERARCHY};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 100;
CLASS_HOLYHIERARCHY = CLASS:Register();

local CLASS = Clockwork.class:New("Goreic Warrior");
	CLASS.color = Color(50, 30, 20, 255);
	CLASS.factions = {FACTION_GOREIC};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 0;
CLASS_GOREIC = CLASS:Register();

local CLASS = Clockwork.class:New("Children of Satan");
	CLASS.color = Color(170, 0, 0, 255);
	CLASS.factions = {FACTION_SATANIST};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 0;
CLASS_SATANIST = CLASS:Register();

local CLASS = Clockwork.class:New("The Third Inquisition");
	CLASS.color = Color(255, 180, 0, 255);
	CLASS.factions = {FACTION_THIRD_INQUISITION};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 0;
CLASS_THIRD_INQUISITION = CLASS:Register();

local CLASS = Clockwork.class:New("Smog City Pirate");
	CLASS.color = Color(0, 0, 0, 255);
	CLASS.factions = {FACTION_SMOG_CITY_PIRATES};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 0;
CLASS_SMOG_CITY_PIRATES = CLASS:Register();

local CLASS = Clockwork.class:New("Hillkeeper");
	CLASS.color = Color(103, 142, 180);
	CLASS.factions = {FACTION_HILLKEEPER};
	CLASS.isDefault = true;
	CLASS.description = "Un survivant de l'apocalypse.";
	CLASS.defaultPhysDesc = "Portant des vêtements sales et une petite sacoche";
	CLASS.coinslotWages = 25;
CLASS_HILLKEEPER = CLASS:Register();