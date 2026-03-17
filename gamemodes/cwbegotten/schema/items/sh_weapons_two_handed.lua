local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Club";
	ITEM.model = "models/demonssouls/weapons/club.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "begotten_2h_great_club";
	ITEM.category = "Melee";
	ITEM.description = "Une arme simple et brutale, un gourdin de bois. Aussi efficace pour fracasser des crânes aujourd'hui qu'il y a dix mille ans.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/club.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 14.92, 0);
	ITEM.attachmentOffsetVector = Vector(-2.83, 4.95, -10.61);
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"cloth", "wood", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 300, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Steel Longsword";
	ITEM.model = "models/begotten/weapons/templarsword.mdl";
	ITEM.skin = 2;
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_exileknightsword";
	ITEM.category = "Melee";
	ITEM.description = "Une longue épée en acier fin assombri, de conception glazique. Jadis tristement célèbre pour avoir été utilisée par les Chevaliers exilés de la Sainte Hiérarchie.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/exile_knight_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(172.04, 74.59, 261.55);
	ITEM.attachmentOffsetVector = Vector(8.49, 1.9, 26.87);
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Inquisitor Sword";
	ITEM.model = "models/demonssouls/weapons/blueblood sword.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_inquisitorsword";
	ITEM.category = "Melee";
	ITEM.description = "Les légendaires épées de la Seconde Inquisition. Facilement reconnaissables à leurs gardes en forme d'étoile, ces armes sont forgées dans l'acier le plus pur. Elles portent le jugement sacré, au grand dam des sorcières comme de la noblesse glazique.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/inquisitor_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(92.49, 183.98, 10.94);
	ITEM.attachmentOffsetVector = Vector(-0.71, 2.69, 3.54);
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Longsword";
	ITEM.model = "models/demonssouls/weapons/long sword.mdl";
	ITEM.skin = 2;
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_longsword";
	ITEM.category = "Melee";
	ITEM.description = "Une redoutable épée longue de fer autrefois utilisée dans les rangs des Gardiens de la Porte.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/longsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(280, 180, 10.94);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.4, 16.51);	
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 7000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pickaxe";
	ITEM.model = "models/begotten/weapons/serfpickaxe.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_great_pickaxe";
	ITEM.category = "Melee";
	ITEM.description = "Un outil minier conçu pour broyer la roche, il peut tout aussi facilement pulvériser armures et chairs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pickaxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(280, 268.11, 140.22);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2.12, 8.49);
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 225, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Sledge";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/sledgehammer.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_sledge";
	ITEM.category = "Melee";
	ITEM.description = "Un lourd et puissant marteau de forgeron, capable de broyer des crânes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/sledge.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(269.5, 267, 174.03);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2, -16.27);
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 425, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Voltsledge";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/sledgehammer.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_voltsledge";
	ITEM.category = "Melee";
	ITEM.description = "Un marteau de forgeron équipé de mécanismes impies amplifiant sa puissance électrique.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/voltsledge.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(269.5, 267, 174.03);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2, -16.27);
	ITEM.bodygroup1 = 3;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "tech", "wood"}};
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Training Longsword";
	ITEM.model = "models/begotten/weapons/training_2h.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_2h_traininglongsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée longue en bois utilisable pour un entraînement au combat à deux mains à faible risque.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/training_longsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(360, 76.57, 92.49);
	ITEM.attachmentOffsetVector = Vector(-4.24, 2.83, 14.85);
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Unholy Sigil Sword";
	ITEM.model = "models/props/begotten/melee/smelter_sword.mdl";
	ITEM.skin = 2;
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_unholysigilsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée runique en fer noir forgée dans les flammes de l'enfer. Son métal vous trouble ; des murmures ténébreux vous incitent à l'imprégner d'énergie impie.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/unholy_sigil_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 185.97, 92.49);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2.83, -35.36);
	ITEM.attachmentSkin = 2;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1250, supercrateOnly = true};
	
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Quarterstaff";
	ITEM.model = "models/begotten/weapons/quarterstaff.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_2h_quarterstaff";
	ITEM.category = "Melee";
	ITEM.description = "Un bâton de bois destiné à servir d'arme de combat.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/quarterstaff.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(183.98, 100.44, 130.28);
	ITEM.attachmentOffsetVector = Vector(-1.41, 3, 4.24);
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 600, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Longsword";
	ITEM.model = "models/skyrim/draugr/greatsword/w_draugrgreatsword.mdl";
	ITEM.weight = 2.6;
	ITEM.uniqueID = "begotten_2h_sataniclongsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée d'acier noir à la conception torsadée. Elle excelle à trancher têtes et autres membres avec des coups habiles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_longsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(187.96, 63.47, 0.95);
	ITEM.attachmentOffsetVector = Vector(5.66, 3, 16.51);
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "The Samurai Sword";
	ITEM.model = "models/demonssouls/weapons/blueblood sword.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_eventsword";
	ITEM.category = "Melee";
	ITEM.description = "Une putain de torche, ou une batte, ou la corde, ou le rat.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/inquisitor_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = false;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(92.49, 183.98, 10.94);
	ITEM.attachmentOffsetVector = Vector(-0.71, 2.69, 3.54);
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Falx";
	ITEM.model = "models/begotten/goreweapons/falx2.mdl";
	ITEM.weight = 3.5;
	ITEM.uniqueID = "begotten_2h_great_falx";
	ITEM.category = "Melee";
	ITEM.description = "Une lame d'acier incurvée vers l'intérieur pour une puissance de pénétration accrue. Elle peut percer le métal et les os à chaque coup dévastateur. La poignée de cette arme est gravée de runes goreiques qui brûlent les mains des faibles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/falx.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(6.46, 273.48, 90);
	ITEM.attachmentOffsetVector = Vector(0, 2.9, 9.09);
	
	ITEM.attributes = {"shieldbreaker"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, supercrateOnly = true};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Skyfallen Sword";
	ITEM.model = "models/bloodborne/weapons/skyfeller.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_skyfallensword";
	ITEM.category = "Melee";
	ITEM.description = "Superacier de lucarne reforgé avec des runes familiales et une forge de maître. Une épée digne d'un Roi.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/skyfallen_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(360, 281.37, 84.32);
	ITEM.attachmentOffsetVector = Vector(5.66, 3.4, 14.14);	
	
	ITEM.requiredFaiths = {"Faith of the Family"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Voltlongsword";
	ITEM.model = "models/begotten/weapons/shishkebab.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_voltlongsword";
	ITEM.category = "Melee";
	ITEM.description = "Une longue lame de ferraille fixée à un mécanisme rudimentaire doté d'une batterie interne.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volt_longsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(280, 180, 10.94);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.4, 16.51);	
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "scrap", "scrap", "tech", "tech", "tech", "tech"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Yeoman Longsword";
	ITEM.model = "models/begotten_apocalypse/items/IronClaymore.mdl";
	ITEM.skin = 2;
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_hilllongsword";
	ITEM.category = "Melee";
	ITEM.description = "Un incontournable des propriétaires terriens du nord, au même titre que le vénérable mousquet ; un symbole de richesse. La lame est ornée de runes Gore-Glazic.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/IronClaymore.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(280, 180, 191.93);
	ITEM.attachmentOffsetVector = Vector(3.54, 4.95, 16.97);
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
ITEM:Register();