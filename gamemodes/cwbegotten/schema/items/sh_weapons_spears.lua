local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Harpoon";
	ITEM.model = "models/props_junk/harpoon002a.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_spear_harpoon";
	ITEM.category = "Melee";
	ITEM.description = "Un objet pointu muni d'un crochet à son extrémité. Bien que lourd, il peut être utilisé de manière fiable comme une lance. Apprécié par les paysans des régions côtières pour sa polyvalence.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/harpoon.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 10.94);
	ITEM.attachmentOffsetVector = Vector(0, 3, 0);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "meltdown", items = {"wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 200, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Spear";
	ITEM.model = "models/demonssouls/weapons/short spear.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "begotten_spear_ironspear";
	ITEM.category = "Melee";
	ITEM.description = "Une longue hampe en bois surmontée d'une pointe de fer. La lance est une arme mortelle, réputée pour sa rapidité et sa grande portée. Mieux employée par des soldats en temps de guerre, aucune tâche n'est trop ardue pour une solide formation de lanciers.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 8.95);
	ITEM.attachmentOffsetVector = Vector(-2.83, 3, -23.24);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 3000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Short Spear";
	ITEM.model = "models/witcher2soldiers/tw2_shortspear.mdl";
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_spear_ironshortspear";
	ITEM.category = "Melee";
	ITEM.description = "Une lance de fer à manche raccourci pour un combat plus rapide et rapproché.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_shortspear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 279.45);
	ITEM.attachmentOffsetVector = Vector(-7.78, 3, -45.97);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 150;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pitchfork";
	ITEM.model = "models/begotten/weapons/serfpitchfork.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_spear_pitchfork";
	ITEM.category = "Melee";
	ITEM.description = "Un vieil outil de serf, normalement pas destiné au combat, mais mortel malgré tout.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pitchfork.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 279.45, 0);
	ITEM.attachmentOffsetVector = Vector(-4.24, 3, -24.75);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 125, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Spear";
	ITEM.model = "models/demonssouls/weapons/scraping spear.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_spear_satanicspear";
	ITEM.category = "Melee";
	ITEM.description = "Une arme impie forgée dans les flammes de l'Enfer. Elle trouve son utilité au sein des Légions de Lucifer, ces combattants humains qui servent chacun le Prince des Ténèbres pour leurs propres désirs égoïstes. Cette lance en particulier est réputée pour sa capacité à percer les défenses ennemies, déchirant la chair lorsqu'elle est retirée pour un nouvel assaut.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 8.95, 0);
	ITEM.attachmentOffsetVector = Vector(0, 3, -17.85);
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 950, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Scrap Spear";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/poolcue.mdl";
	ITEM.bodygroup1 = 4;
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_spear_scrapspear";
	ITEM.category = "Melee";
	ITEM.description = "Un bâton de bois muni d'une lame à son extrémité, formant une lance. Elle n'est ni aussi longue ni aussi résistante qu'une lance ordinaire, mais elle est rapide.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scrap_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 279.45, 0);
	ITEM.attachmentOffsetVector = Vector(-4.24, 3, -24.75);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 250, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Training Spear";
	ITEM.model = "models/begotten/weapons/training_spear.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_spear_trainingspear";
	ITEM.category = "Melee";
	ITEM.description = "Un poteau en bois pouvant servir à l'entraînement au combat à la lance à faible risque.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/training_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 279.45, 0);
	ITEM.attachmentOffsetVector = Vector(-4.24, 3, -24.75);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Voltspear";
	ITEM.model = "models/begotten/weapons/voltspear.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_spear_voltspear";
	ITEM.category = "Melee";
	ITEM.description = "Une tige électrifiée montée sur un manche en bois pour augmenter sa portée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volt_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 8.95);
	ITEM.attachmentOffsetVector = Vector(-2.83, 3, -23.24);
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood", "scrap", "scrap", "scrap", "scrap", "tech", "tech"}};
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Steel Spear"; 
	ITEM.model = "models/demonssouls/weapons/winged spear.mdl";
	ITEM.weight = 2.3;
	ITEM.uniqueID = "begotten_spear_wingedspear";
	ITEM.category = "Melee";
	ITEM.description = "Une lance en acier raffiné, couramment forgée par la Hiérarchie Sacrée. Elle présente une ailette à son extrémité, utile pour dévier les lames ennemies.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/winged_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 10.94);
	ITEM.attachmentOffsetVector = Vector(-2.12, 3, -18.39);
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 750, supercrateOnly = true};
ITEM:Register();