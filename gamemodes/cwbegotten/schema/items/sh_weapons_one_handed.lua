local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bat";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl";
	ITEM.skin = 3;
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_bat";
	ITEM.category = "Melee";
	ITEM.description = "Une simple batte en bois.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bat.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(4.24, -1.41, 31.12);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 75, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Spiked Bat";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl";
	ITEM.skin = 3;
	ITEM.bodygroup1 = 6;
	ITEM.bodygroup2 = 2;
	ITEM.weight = 1.1;
	ITEM.uniqueID = "begotten_1h_spikedbat";
	ITEM.category = "Melee";
	ITEM.description = "Une batte en bois avec des clous plantés pour plus de brutalité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/spiked_bat.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(4.24, -1.41, 31.12);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bladed Bat";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl";
	ITEM.skin = 3;
	ITEM.bodygroup1 = 10;
	ITEM.bodygroup2 = 2;
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_bladedbat";
	ITEM.category = "Melee";
	ITEM.description = "Une batte en bois équipée de deux lames de scie. Elle est désormais une arme tranchante primitive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bladed_bat.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(4.24, -1.41, 31.12);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Battle Axe";
    ITEM.model = "models/weapons/ironaxe.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_1h_battleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache double en fer noir massif. Une arme grossière pour des hommes grossiers.";
	ITEM.iconoverride = "begotten/ui/itemicons/ironaxe.png"
	ITEM.meleeWeapon = true;
    ITEM.isAttachment = true;
    ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
    ITEM.attachmentOffsetAngles = Angle(276.17, 0, 180);
    ITEM.attachmentOffsetVector = Vector(3.54, 1.41, 26.87);
    ITEM.canUseOffhand = true;
    ITEM.canUseShields = true;
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Steel Gore Battle Axe";
	ITEM.model = "models/weapons/goresteelaxe/goresteelaxe.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_steelgorebattleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de guerre en acier d'une grande praticité et finement ouvragée. Cette hache fut forgée pour les Guerriers Goreic, à travers de nombreux clans, qu'ils soient révérés ou tombés dans l'oubli. Les gravures familiales renferment une énergie catalytique qui brûle les mains des faibles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/goresteelaxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(94.48, 68.62, 180);
	ITEM.attachmentOffsetVector = Vector(3.54, -2, 22.63);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(94.48, 68.62, 180);
	ITEM.attachmentOffsetVectorOffhand = Vector(-3.54, -2, 22.63);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Board";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/board.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_board";
	ITEM.category = "Melee";
	ITEM.description = "Une planche en bois, un outil de guerre courant dans le Wasteland.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/board.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(291.38, 269.5, 156.13);
	ITEM.attachmentOffsetVector = Vector(1.41, 2.83, -27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 50, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Spiked Board";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/board.mdl";
	ITEM.bodygroup1 = 2;
	ITEM.weight = 1.1;
	ITEM.uniqueID = "begotten_1h_spikedboard";
	ITEM.category = "Melee";
	ITEM.description = "Une planche en bois avec des clous plantés pour plus de brutalité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/spiked_board.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(291.38, 269.5, 156.13);
	ITEM.attachmentOffsetVector = Vector(1.41, 2.83, -27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bladed Board";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/board.mdl";
	ITEM.bodygroup1 = 4;
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_bladedboard";
	ITEM.category = "Melee";
	ITEM.description = "Une planche en bois équipée de deux lames de scie. Elle constitue désormais une arme tranchante primitive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bladed_board.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(291.38, 269.5, 156.13);
	ITEM.attachmentOffsetVector = Vector(1.41, 2.83, -27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Broken Sword";
	ITEM.model = "models/demonssouls/weapons/broken sword.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_1h_brokensword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée pitoyable, rouillée au point d'être presque inutilisable, avec la lame brisée en deux. Mais quelque chose vaut toujours mieux que rien...";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/broken_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 50, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Voltsword";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/chineeseofficersword.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_1h_voltsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée militaire antique équipée de pointes et de pylônes voltistes. Elle peut infliger des dégâts considérables aux imbéciles blindés, si vous êtes capable de la manier sans vous électrocuter.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/voltsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(279.47, 285.16, 264.32);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, -6.36);
	ITEM.bodygroup1 = 5;
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "scrap", "scrap", "tech"}};
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Voltprod";
	ITEM.model = "models/newvegasprops/voltprod.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_voltprod";
	ITEM.category = "Melee";
	ITEM.description = "Une trique autrefois utilisée sur le bétail, désormais rechargée de gadgets technohérétiques pour infliger des décharges électriques quasi mortelles aux affligés de chair qui cherchent indûment protection derrière des plaques de métal.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volt_prod.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 4.97, 189.94);
	ITEM.attachmentOffsetVector = Vector(3.54, 2.12, 4.95);
	ITEM.bodygroup1 = 5;
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "scrap", "scrap", "tech", "tech"}};
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Druid Sword";
	ITEM.model = "models/begotten/weapons/sword1.mdl";
	ITEM.weight = 0.7;
	ITEM.uniqueID = "begotten_1h_druidsword";
	ITEM.category = "Melee";
	ITEM.description = "Une lame de fer grossière gravée de divers glyphes goréens. Les gravures ancestrales renferment une énergie catalytique qui brûle les mains des faibles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/druid_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(294.63, 288.95, 0);
	ITEM.attachmentOffsetVector = Vector(2.83, 3, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Familial Sword";
	ITEM.model = "models/begotten/weapons/sword2_unique.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_familialsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée courte en acier finement ouvragée, forgée en l'honneur de la Famille. Les gravures familiales renferment une énergie catalytique qui brûle les mains des faibles.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/familial_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(98.45, 252.95, 18.9);
	ITEM.attachmentOffsetVector = Vector(3.54, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Flanged Mace";
	ITEM.model = "models/demonssouls/weapons/mace.mdl";	
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_flangedmace";
	ITEM.category = "Melee";
	ITEM.description = "Une masse d'acier lourde avec une pointe à son extrémité. Conçue avec expertise pour percer les armures, quelle que soit leur résistance.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/flanged_mace.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 180, 349.06);
	ITEM.attachmentOffsetVector = Vector(3.71, -3.54, 27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 600, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Glazicus";
	ITEM.model = "models/demonssouls/weapons/broad sword.mdl";
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_1h_glazicus";
	ITEM.category = "Melee";
	ITEM.description = "Une courte épée glazique commune, forgée dans un fer bon marché.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/glazicus.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(-14.92, 0, 20.88);
	ITEM.attachmentOffsetVectorOffhand = Vector(-2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Spatha";
	ITEM.model = "models/begotten/weapons/spatha.mdl";
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_spatha";
	ITEM.category = "Melee";
	ITEM.description = "Une épée droite en fer des Légions Glazic. Forgée dans le but de civiliser les sauvages.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/spatha.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Ornate Glazicus";
	ITEM.model = "models/begotten/weapons/ornateglazicus.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_ornateglazicus";
	ITEM.category = "Melee";
	ITEM.description = "Un Glazicus en acier finement ouvragé avec des incrustations décoratives. Glorieux à contempler.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ornateglazicus.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 950, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Shortsword";
	ITEM.model = "models/aoc_weapon/w_shortsword_evil.mdl";
	ITEM.weight = 0.7;
	ITEM.uniqueID = "begotten_1h_satanicshortsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée courte infernale qui incarne la suprématie de l'expression sanglante. D'une agilité exceptionnelle, elle peut transpercer les armures grâce à ses attaques successives mortelles à courte portée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanicshortsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(285.41, 225.75, 0);
	ITEM.attachmentOffsetVector = Vector(3, 1.41, 2.12);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 700, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Gore Battle Axe";
	ITEM.model = "models/begotten/weapons/axe1.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_gorebattleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de guerre en fer brut. Les marques du Clan Gore sont gravées sur son manche.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_battle_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(94.48, 68.62, 180);
	ITEM.attachmentOffsetVector = Vector(3.54, -2, 22.63);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(94.48, 68.62, 180);
	ITEM.attachmentOffsetVectorOffhand = Vector(-3.54, -2, 22.63);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Falchion";
	ITEM.model = "models/begotten/weapons/sword4.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_gorefalchion";
	ITEM.category = "Melee";
	ITEM.description = "Une lame de taille en acier sur une poignée Goréique finement sculptée. Une arme de guerrier, excellente pour sa capacité à trancher les membres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_falchion.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(98.45, 252.95, 18.9);
	ITEM.attachmentOffsetVector = Vector(3.54, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Mace";
	ITEM.model = "models/begotten/weapons/mace2.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_goremace";
	ITEM.category = "Melee";
	ITEM.description = "Une massue en bois hérissée de pointes, surmontée d'une lourde tête de pierre, d'une construction grossière mais efficace au combat.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_mace.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(98.45, 80.55, 6.96);
	ITEM.attachmentOffsetVector = Vector(3.54, -0.71, 21.22);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"stone", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Seax";
	ITEM.model = "models/begotten/weapons/sword3.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_goreseax";
	ITEM.category = "Melee";
	ITEM.description = "Une lame d'acier à l'extrémité recourbée, gravée de diverses runes goréennes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_seax.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(92.49, 255.58, 6.96);
	ITEM.attachmentOffsetVector = Vector(3.54, 1.41, 4.24);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "cloth"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Shortsword";
	ITEM.model = "models/begotten/weapons/sword2.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_goreshortsword";
	ITEM.category = "Melee";
	ITEM.description = "Une courte lame de fer tout aussi adaptée pour trancher que pour poignarder, ornée de motifs Goréens.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_shortsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(98.45, 252.95, 18.9);
	ITEM.attachmentOffsetVector = Vector(3.54, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Arming Sword";
	ITEM.model = "models/demonssouls/weapons/knight sword.mdl";	
	ITEM.weight = 1.1;
	ITEM.uniqueID = "begotten_1h_ironarmingsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée de fer grossièrement forgée mais robuste, aussi efficace pour trancher que pour percer.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_arming_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 360, 22.87);
	ITEM.attachmentOffsetVector = Vector(2.12, 5.66, -3.54);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 4500, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Steel Arming Sword";
	ITEM.model = "models/aoc_weapon/sword_01_static.mdl";	
	ITEM.weight = 1.2;
	ITEM.uniqueID = "begotten_1h_steelarmingsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée de guerre en acier bien équilibrée, aussi efficace pour trancher que pour estocquer.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steelarmingsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(110.39, 150.63, 0);
	ITEM.attachmentOffsetVector = Vector(3, 2.12, 4);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 500, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Shortsword";
	ITEM.model = "models/demonssouls/weapons/short sword.mdl";
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_1h_ironshortsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée courte commune forgée dans un fer de basse qualité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_shortsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 4000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Machete";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/machete.mdl";	
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_machete";
	ITEM.category = "Melee";
	ITEM.description = "Une large lame rouillée qui tranche la chair sans effort.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/machete.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(289.39, 291.38, 273.48);
	ITEM.attachmentOffsetVector = Vector(2, 6.36, -4.24);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 150, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Morning Star";
	ITEM.model = "models/demonssouls/weapons/morning star.mdl";	
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_morningstar";
	ITEM.category = "Melee";
	ITEM.description = "Une boule de fer lourde hérissée de pointes, montée sur un manche en bois et métal ; cette arme garantit une combinaison mortelle de force contondante et de capacité de perforation d'armure.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/morningstar.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 180, 349.06);
	ITEM.attachmentOffsetVector = Vector(3.71, -3.54, 27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 6000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bone Mace";
	ITEM.model = "models/begotten/weapons/bonemace.mdl";	
	ITEM.weight = 0.6;
	ITEM.uniqueID = "begotten_1h_bonemace";
	ITEM.category = "Melee";
	ITEM.description = "Un outil de frappe primitif façonné à partir des os de vos semblables.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bonemace.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 180, 349.06);
	ITEM.attachmentOffsetVector = Vector(3.71, -3.54, 27.58);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"human_bone", "human_bone", "human_bone"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pipe";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/leadpipe.mdl";
	ITEM.bodygroup1 = 1;
	ITEM.weight = 0.6;
	ITEM.uniqueID = "begotten_1h_pipe";
	ITEM.category = "Melee";
	ITEM.description = "Un court mais lourd morceau de tuyau en plomb, idéal pour servir de gourdin.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pipe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(3.71, 0.34, 13.81);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 60, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pipe Mace";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/leadpipe.mdl";
	ITEM.bodygroup1 = 2;
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_1h_pipemace";
	ITEM.category = "Melee";
	ITEM.description = "Un tuyau en plomb garni de boulons de fortune. Une masse primitive, fréquemment utilisée aussi bien par les forces de maintien de l'ordre du District du Comté que par les délinquants.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pipe_mace.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(3.71, 0.34, 13.81);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Tire Iron";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/tireiron.mdl";
	ITEM.weight = 0.6;
	ITEM.uniqueID = "begotten_1h_tireiron";
	ITEM.category = "Melee";
	ITEM.description = "Un outil ancien fait de ferraille rouillée. C'est une arme convenable pour frapper les ennemis à la tête.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/tireiron.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(3.71, 0.34, 13.81);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 70, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Scrap Axe";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/tireiron.mdl";
	ITEM.bodygroup1 = 2;
	ITEM.weight = 0.9;
	ITEM.uniqueID = "begotten_1h_scrapaxe";
	ITEM.category = "Melee";
	ITEM.description = "Un pied-de-biche soudé à une hache de fortune. Une arme typique des bandits du Désert.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/tire_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(100.44, 80.55, 90);
	ITEM.attachmentOffsetVector = Vector(3.71, 0.34, 13.81);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "scrap"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Reaver Battle Axe";
	ITEM.model = "models/begotten/weapons/axe3.mdl";
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_reaverbattleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de combat en fer à une main, dotée d'une lame large. Elle est couramment utilisée par les Gores du Clan Reaver pour sa capacité à trancher les têtes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/reaver_battle_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetVector = Vector(4.4, 0.71, 22.63);
	ITEM.attachmentOffsetAngles = Angle(303.31, 98.45, 16.91);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Scimitar";
	ITEM.model = "models/demonssouls/weapons/scimitar.mdl";
	ITEM.weight = 0.9;
	ITEM.uniqueID = "begotten_1h_scimitar";
	ITEM.category = "Melee";
	ITEM.description = "Une épée de fer incurvée, inspirée des modèles des lointaines Terres Sombres de l'Est, rapportée par les soldats en campagne sous les ordres de Lord Maximus. Ce type d'épée excelle dans l'art de la taille.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scimitar.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(187.96, 360, 335.14);
	ITEM.attachmentOffsetVector = Vector(2.83, 2.12, -0.71);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(172.04, 0, 335.14);
	ITEM.attachmentOffsetVectorOffhand = Vector(-2.83, 2.12, -0.71);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 600, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Warped Sword";
	ITEM.model = "models/props/begotten/melee/warped_sword.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_warpedsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée d'une étrangeté impie. Son métal a été déformé par un démon sadique au sens de l'humour morbide. Elle excelle à trancher la chair au détriment de la pénétration d'armure.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/warped_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(283.43, 30.83, 84.53);
	ITEM.attachmentOffsetVector = Vector(2.83, 2.12, -0.71);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Twisted Club";
	ITEM.model = "models/props/begotten/melee/barbed_club.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_twistedclub";
	ITEM.category = "Melee";
	ITEM.description = "Une massue déformée par une énergie démoniaque. Elle excelle à punir les ennemis cuirassés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/barbed_club.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(187.96, 360, 166.08);
	ITEM.attachmentOffsetVector = Vector(3.54, -0.71, 13.44);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Scrap Blade";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/shishkebab.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_scrapblade";
	ITEM.category = "Melee";
	ITEM.description = "Un amalgame de ferraille bricolé ressemblant à une épée. Il pourrait être plus dangereux pour son porteur que pour sa cible désignée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scrap_blade.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(360, 269.5, 24.86);
	ITEM.attachmentOffsetVector = Vector(2.83, 2.83, 0.71);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(360, 269.5, -24.86);
	ITEM.attachmentOffsetVectorOffhand = Vector(-2.83, 2.83, 0.71);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hatchet";
	ITEM.model = "models/begotten/weapons/serfhatchet.mdl";
	ITEM.weight = 0.9;
	ITEM.uniqueID = "begotten_1h_hatchet";
	ITEM.category = "Melee";
	ITEM.description = "Une petite hachette idéale pour couper du bois. Elle excelle aussi à trancher la chair...";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/hatchet.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(215.05, 88.11, 31.26);
	ITEM.attachmentOffsetVector = Vector(2.83, 2.83, 3.54);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(170, 88.11, 31.26);
	ITEM.attachmentOffsetVectorOffhand = Vector(-2.83, 2.83, 3.54);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 200, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Training Sword";
	ITEM.model = "models/begotten/weapons/training_1h.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_trainingsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée en bois utilisable pour l'entraînement au combat à une main à faible risque.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/training_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(283.26, 287.4, 84.53);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, -4.24);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Twisted Machete";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/machete.mdl";	
	ITEM.weight = 0.9;
	ITEM.bodygroup2 = 3;
	ITEM.uniqueID = "begotten_1h_twistedmachete";
	ITEM.category = "Melee";
	ITEM.description = "Une lame incurvée semblable à une machette, utilisée par de nombreux adeptes du Seigneur des Ténèbres pour leurs sacrifices.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/twisted_machete.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(289.39, 291.38, 273.48);
	ITEM.attachmentOffsetVector = Vector(2, 6.36, -4.24);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Mace";
	ITEM.model = "models/skyrim/daedric/mace/w_daedricmace.mdl";	
	ITEM.weight = 1.3;
	ITEM.uniqueID = "begotten_1h_satanicmace";
	ITEM.category = "Melee";
	ITEM.description = "Une masse d'acier noir à la conception torsadée. Elle excelle à punir les imbéciles cuirassés et à mettre les ennemis au pas.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_mace.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(118.34, 66.63, 360);
	ITEM.attachmentOffsetVector = Vector(5, -2, 13.44);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Sword";
	ITEM.model = "models/skyrim/daedric/sword/w_daedricsword.mdl";	
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_1h_satanicsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée d'acier noir à la conception torsadée. Elle excelle à déchiqueter la chair et trancher les os.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(277.46, 287.4, 360);
	ITEM.attachmentOffsetVector = Vector(3.54, 2.12, 0.71);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;

	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Shard";
	ITEM.model = "models/items/weapons/sword_souldrinker/sword_souldrinker.mdl";	
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_1h_shard";
	ITEM.category = "Melee";
	ITEM.description = "Un éclat lumineux de conception impie. Il clignote en rouge lorsqu'il a faim de chair.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/shard.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(269.5, 28.84, 347.07);
	ITEM.attachmentOffsetVector = Vector(1.41, 4.24, -1.41);
	ITEM.attachmentBoneOffhand = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAnglesOffhand = Angle(269.5, 28.84, 12.93);
	ITEM.attachmentOffsetVectorOffhand = Vector(-1.41, 4.24, -1.41);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1200, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "down_catalyst"}}; -- use "breakdown" for other type
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "War Hammer";
	ITEM.model = "models/begotten/weapons/warhammer.mdl";	
	ITEM.weight = 1.2;
	ITEM.uniqueID = "begotten_1h_warhammer";
	ITEM.category = "Melee";
	ITEM.description = "Une tête et une pointe en acier sur un manche en bois. Une arme excellente contre les ennemis blindés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/warhammer.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(287.4, 102.43, 187.96);
	ITEM.attachmentOffsetVector = Vector(3.54, 0, 12.02);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "leather"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 650, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Flail";
	ITEM.model = "models/weapons/ageofchivalry/w_begotten_flail_prop.mdl";	
	ITEM.weight = 1.4;
	ITEM.uniqueID = "begotten_1h_ironflail";
	ITEM.category = "Melee";
	ITEM.description = "Un manche en bois enchaîné à une boule de fer. Une arme de piètre facture, synonyme de fous et de fanatiques ; ceux qui placent leur foi dans des puissances supérieures pour que leurs coups portent juste.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_flail.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(104.42, 349.06, 273.48);
	ITEM.attachmentOffsetVector = Vector(5.05, -1.01, 16.97);
	ITEM.canUseOffhand = false;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.attributes = {"flail", "punisher"};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 5000, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Flail of Atonement";
	ITEM.model = "models/weapons/ageofchivalry/w_begotten_solflail_prop.mdl";	
	ITEM.weight = 1.6;
	ITEM.uniqueID = "begotten_1h_solflail";
	ITEM.category = "Melee";
	ITEM.description = "Un instrument béni de bronze et d'acier portant un brûle-encens trempé par trois fois dans l'eau bénite. Une telle arme n'est employée que par l'Orthodoxie Solaire, car elle brûle les mains des non-haineux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/sol_flail.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(38.78, 353.04, 273.48);
	ITEM.attachmentOffsetVector = Vector(5.05, 2.83, 10.44);
	ITEM.canUseOffhand = false;
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.attributes = {"flail", "punisher"};
	ITEM.requiredbeliefs = {"repentant"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Blackclaw";
	ITEM.model = "models/begotten/weapons/uniquegoresword.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_1h_blackclaw";
	ITEM.category = "Melee";
	ITEM.description = "Une épée d'acier Shagalaxien noir, forgée d'une manière ou d'une autre dans les feux de l'enfer. Elle est maudite par les âmes de ses victimes, des milliers d'ennemis déchus errant dans un néant noir sans leurs têtes. Cette arme n'est clairement pas destinée à être tenue entre vos mains.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/blackclaw.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isUnique = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine1";
	ITEM.attachmentOffsetAngles = Angle(273.48, 6.96, 251.6);
	ITEM.attachmentOffsetVector = Vector(-8.49, -12.02, -19.09);
	ITEM.canUseShields = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Shortsword";
	ITEM.model = "models/begotten_apocalypse/items/RiftenSword.mdl";
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_1h_hillshortsword";
	ITEM.category = "Melee";
	ITEM.description = "Une lame bien équilibrée avec une courte garde recouverte de gravures d'origine Gore-Glazic, aussi adaptée pour trancher que pour poignarder.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/riftensword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 207.47);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Spatha";
	ITEM.model = "models/begotten_apocalypse/items/1hsword1.mdl";	
	ITEM.weight = 1.2;
	ITEM.uniqueID = "begotten_1h_hillarmingsword";
	ITEM.category = "Melee";
	ITEM.description = "Une lame droite de facture nordique, forgée avec soin, conçue principalement pour l'estoc. Ses tranchants sont aiguisés et sa pointe est acérée.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/1hsword1.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 207.47);
	ITEM.attachmentOffsetVector = Vector(3, 2.12, 4);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Crackaxe";
	ITEM.model = "models/begotten_apocalypse/items/DawnstarAxe.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_1h_hillcrackaxe";
	ITEM.category = "Melee";
	ITEM.description = "Un outil finement ouvragé, doté d'une hache conçue pour trancher la chair et le bois, et d'un pic pour fendre la roche. Souvent utilisé par les mineurs du Nord pour l'utilité et la défense.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/DawnstarAxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetVector = Vector(4.24, -2.83, 10.61);
	ITEM.attachmentOffsetAngles = Angle(20.88, 0, 22.87);
	ITEM.canUseOffhand = true;
	ITEM.canUseShields = true;
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.attributes = {"versatile"};
ITEM:Register();