--[[
	Begotten III: Jesus Wept
--]]

-- Tech and Technocraft have been moved to the medical plugin's items since they use the medical plugin and need to be registered after that plugin has initialized.

local ITEM = Clockwork.item:New();
	ITEM.name = "Breakdown Kit";
	ITEM.category = "Tools";
	ITEM.model = "models/mosi/fallout4/props/junk/modcrate.mdl";
	ITEM.weight = 0.7;
	ITEM.uniqueID = "breakdown_kit";
	ITEM.description = "Un kit d'outils permettant de décomposer des objets en leurs composants élémentaires.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/breakdown_kit.png";
	ITEM.stackable = false;
	
	ITEM.itemSpawnerInfo = {category = "Repair Kits", rarity = 300, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cloth";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/cloth.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "cloth";
	ITEM.description = "Un rouleau de tissu assemblé, il peut être utilisé pour créer des vêtements ou des bandages.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	ITEM.fireplaceFuel = 20;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 25, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Charcoal";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/begotten/misc/charcoal.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "charcoal";
	ITEM.description = "Fragments de bois carbonisés pouvant servir de combustible pour l'artisanat.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	ITEM.fireplaceFuel = 120;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Fertilizer";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/fertilizer.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "fertilizer";
	ITEM.description = "Un bocal contenant des excréments sucrés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 35, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Gunpowder";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/props_lab/box01a.mdl";
	ITEM.weight = 0.1;
	ITEM.uniqueID = "gunpowder";
	ITEM.description = "Une boîte contenant une substance poudreuse explosive pouvant être conditionnée dans des munitions.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 95, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Wrought Iron Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/lead.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "wrought_iron_ingot";
	ITEM.description = "Un lingot de fer de basse qualité qui peut être fondu pour produire des métaux supérieurs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Iron Chunks";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/lead.mdl";
	ITEM.weight = 0.1;
	ITEM.uniqueID = "iron_chunks";
	ITEM.description = "Morceaux de métal fondus. Ils devraient être transformés en lingot.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/wrought_iron_ingot.png";
	ITEM.stackable = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"wrought_iron_ingot"}};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Steel Chunks";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/steel.mdl";
	ITEM.weight = 0.1;
	ITEM.uniqueID = "steel_chunks";
	ITEM.description = "Morceaux de métal fondus. Ils devraient être retraités en lingot.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/crude_iron_ingot.png";
	ITEM.stackable = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_ingot"}};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Fine Steel Chunks";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/silver.mdl";
	ITEM.weight = 0.1;
	ITEM.uniqueID = "fine_steel_chunks";
	ITEM.description = "Morceaux de métal fondus. Ils devraient être refondus en lingot.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steel_ingot.png";
	ITEM.stackable = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_ingot"}};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();
	
local ITEM = Clockwork.item:New();
	ITEM.name = "Iron Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/lead.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "iron_ingot";
	ITEM.description = "Un lingot de fer de basse qualité qui peut être forgé en arme ou en armure.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/wrought_iron_ingot.png";
	ITEM.stackable = true;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Steel Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/steel.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "steel_ingot";
	ITEM.description = "Un lingot d'acier pouvant être forgé en arme ou en armure.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/crude_iron_ingot.png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Fine Steel Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/silver.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "fine_steel_ingot";
	ITEM.description = "Un lingot d'acier raffiné et plus résistant, pouvant être forgé en arme ou en armure.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steel_ingot.png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 650, supercrateOnly = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Hellforged Steel Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/silver.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "hellforged_steel_ingot";
	ITEM.description = "Un lingot d'acier noir forgé dans les fournaises de l'Enfer lui-même. Il possède une durabilité et une résistance surnaturelles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/fine_steel_ingot.png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 800, supercrateOnly = true};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_ingot", "fine_steel_ingot"}};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Maximilian Steel Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/silver.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "maximilian_steel_ingot";
	ITEM.description = "Considéré par les fidèles de la Lumière comme une sainte représentation de la puissance du Seigneur Maximus en raison de sa solidité et de sa pureté, l'acier légendaire Maximilian est la forme d'acier la plus pure que l'on puisse imaginer. Forgé à une époque ancienne, on lui prête de nombreuses propriétés mystiques.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/fine_steel_ingot.png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 800, supercrateOnly = true};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_ingot", "fine_steel_ingot"}};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Shagalaxian Steel Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/silver.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "shagalaxian_steel_ingot";
	ITEM.description = "Forgée par les maîtres forgerons du Clan Shagalax, l'acier Shagalaxien est d'une qualité légendaire et constitue le matériau le plus résistant accessible aux Gores. On lui prête de nombreuses propriétés mystiques.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/fine_steel_ingot.png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 800, supercrateOnly = true};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_ingot", "fine_steel_ingot"}};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Gold Ingot";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/gold.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "gold_ingot";
	ITEM.description = "Un lingot d'Or, autrefois considéré comme d'une valeur considérable. S'il peut encore valoir une belle somme s'il est rapporté à la Hiérarchie, il pourrait être encore plus précieux pour la forge d'armes et d'armures ornementales.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 800, supercrateOnly = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Hide";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/hide.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "hide";
	ITEM.description = "Une peau d'animal roulée, utile pour fabriquer des objets nécessitant des fourrures ou des peaux animales.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Bone";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/Gibs/HGIBS_rib.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "human_bone";
	ITEM.description = "Un fragment d'os pouvant être utilisé dans la fabrication d'armes ou d'armures.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Iron Ore";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/props_junk/rock001a.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "iron_ore";
	ITEM.description = "Un morceau de minerai de fer qui doit être raffiné avant de pouvoir en tirer quelque chose d'utile.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Gold Ore";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/props_junk/rock001a.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "gold_ore";
	ITEM.description = "Un morceau de roche contenant des pépites d'or scintillantes qui captent la lumière. Serait-ce vraiment possible ?";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

ITEM = Clockwork.item:New();
	ITEM.name = "Blood Diamond";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/props_clutter/garnet_flawed.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "uncut_blood_diamond";
	ITEM.description = "Une magnifique gemme brute d'un rouge sang. Sa beauté captive les sens les plus profonds de l'appréciation en vous.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

ITEM = Clockwork.item:New();
	ITEM.name = "The Golden Phallus";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/begotten/thegoldenphallus.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "thegoldenphallus";
	ITEM.description = "Un objet phallique moulé en or pur. Il est gravé des marques d'un Empereur des Ténèbres disparu depuis longtemps. Par tradition, ses exploits pervers se perpétuent éternellement.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = false;

	ITEM.components = {breakdownType = "meltdown", items = {"gold_ingot", "gold_ingot"}};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Leather";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/leather.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "leather";
	ITEM.description = "Un morceau de cuir pouvant être utilisé pour fabriquer des vêtements ou des boucliers.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	ITEM.fireplaceFuel = 30;

	ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth"}};
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 65, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Scrap";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/modbox.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "scrap";
	ITEM.description = "Une myriade de composants technologiques anciens et de ferraille pouvant être utilisés dans la construction de nombreux objets.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 25, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Stone";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/props_mining/rock_caves01b.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "stone";
	ITEM.description = "Un morceau de pierre pouvant être utilisé pour fabriquer des armes contondantes, ou comme arme contondante.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	ITEM.weaponClass = "begotten_javelin_throwing_stone";
	ITEM.isJavelin = true;
	ITEM.canUseShields = true;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 200, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Wood";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/mosi/fallout4/props/junk/components/wood.mdl";
	ITEM.weight = 0.4;
	ITEM.uniqueID = "wood";
	ITEM.description = "Un ensemble de bois pouvant être utilisé dans la fabrication d'armes ou de boucliers.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.stackable = true;
	ITEM.cauldronQuality = 0;
	ITEM.fireplaceFuel = 60;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 25, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Spice";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/items/magic/jewels/purses/big_purse.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "spice";
	ITEM.description = "Un sachet d'épices variées. Il a probablement été pris à une caravane marchande des Terres Sombres.";
	ITEM.iconoverride = "begotten/ui/itemicons/big_purse.png";
	ITEM.stackable = true;
	ITEM.cauldronQuality = 1;
	
	ITEM.itemSpawnerInfo = {category = "Crafting Materials", rarity = 95, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Bearskin";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/begotten/headgroup_props/bearskin.mdl";
	ITEM.weight = 0.4;
	ITEM.uniqueID = "bearskin";
	ITEM.description = "Peau et fourrure prélevées sur une grande bête mutante. Un trophée digne d'un chasseur suprême.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bearskin.png";
	ITEM.stackable = true;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Familial Lifeseed";
	ITEM.category = "Crafting Materials";
	ITEM.model = "models/begotten/taproot.mdl";
	ITEM.weight = 0.6;
	ITEM.uniqueID = "lifeseed";
	ITEM.description = "Une graine de vie d'un Arbre-Monde Familial. Elle a été bénie (ou souillée) par une magie extraterrestre paranormale. Capable de relancer la civilisation, ou peut-être, avec les bons moyens, d'anéantir toute vie.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/lifeseed.png";
	ITEM.stackable = true;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();
