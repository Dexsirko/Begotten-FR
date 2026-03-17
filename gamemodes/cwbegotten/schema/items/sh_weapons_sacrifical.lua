local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hellfire Sword";
	ITEM.model = "models/items/weapons/sword_of_fire/sword_of_fire.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_sacrificial_hellfiresword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée infernale antique, encore imprégnée d'un catalyseur ténébreux. Elle brûle au creux de ta main, et plus encore dans la chair de ton ennemi.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/hellfire_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(110.39, 337.13, 2.98);
	ITEM.attachmentOffsetVector = Vector(2.12, 4.95, -0.71);
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"fire"};
	ITEM.requiredbeliefs = {"murder_artform"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Blessed Druid Sword";
	ITEM.model = "models/begotten/weapons/sword1_unique.mdl";
	ITEM.weight = 0.7;
	ITEM.uniqueID = "begotten_sacrificial_blesseddruidsword";
	ITEM.category = "Melee";
	ITEM.description = "Une lame de fer grossière. Elle est gravée de divers glyphes Goréens qui la font briller d'une chaleur ardente.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/blessed_druid_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(294.63, 288.95, 0);
	ITEM.attachmentOffsetVector = Vector(2.83, 3, 0);	
	ITEM.canUseShields = true;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"fire"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.requiredbeliefs = {"mother"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Unholy Sigil Sword (Fire)";
	ITEM.model = "models/props/begotten/melee/smelter_sword.mdl";
	ITEM.skin = 0;
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_sacrificial_unholysigilsword_fire";
	ITEM.category = "Melee";
	ITEM.description = "Une épée runique en fer noir forgée dans les flammes de l'enfer. Elle est imprégnée d'un catalyseur ténébreux qui la fait rugir d'un brasier infernal.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/unholy_sigil_sword_fire.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 185.97, 92.49);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2.83, -35.36);
	ITEM.attachmentSkin = 0;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"fire"};
	ITEM.requiredbeliefs = {"murder_artform", "strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Unholy Sigil Sword (Ice)";
	ITEM.model = "models/props/begotten/melee/smelter_sword.mdl";
	ITEM.skin = 1;
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_sacrificial_unholysigilsword_ice";
	ITEM.category = "Melee";
	ITEM.description = "Une épée runique en fer noir forgée dans les flammes de l'enfer, marquée de cicatrices. Elle est imprégnée d'un catalyseur ténébreux qui la fait gronder d'un froid mortel et glacial.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/unholy_sigil_sword_ice.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 185.97, 92.49);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2.83, -35.36);
	ITEM.attachmentSkin = 1;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"ice"};
	ITEM.requiredbeliefs = {"murder_artform", "strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Enchanted Longsword";
	ITEM.model = "models/begotten/weapons/irithyll_straight_sword.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_sacrificial_enchantedlongsword_ice";
	ITEM.category = "Melee";
	ITEM.description = "Une épée longue apparemment faite de glace, dont la poignée diffuse un froid glacial.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/enchanted_longsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(176.02, 281.44, 88.51);
	ITEM.attachmentOffsetVector = Vector(-3.54, 2.9, 16.97);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"ice"};
	ITEM.requiredbeliefs = {"the_light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Dark Ice Dagger";
	ITEM.model = "models/items/weapons/dg_ash_hammer/daggers_ash_hammer_on.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_sacrificial_darkdagger_ice";
	ITEM.category = "Melee";
	ITEM.description = "Une petite dague imprégnée du pouvoir de la glace.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/dark_ice_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(76.57, 355.03, 355.03);
	ITEM.attachmentOffsetVector = Vector(-2.9, 1.41, -3.54);
	ITEM.huntingValue = 3; -- Affects speed of skinning and mutilating corpses as well as the condition of the hides and meat, 1 = terrible, 3 = great
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1500, supercrateOnly = true};

	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"ice"};
	ITEM.requiredbeliefs = {"murder_artform"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Dark Fire Dagger";
	ITEM.model = "models/items/weapons/dg_ash_hammer/daggers_ash_hammer.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_sacrificial_darkdagger_fire";
	ITEM.category = "Melee";
	ITEM.description = "Une petite dague imprégnée du pouvoir du feu.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/dark_fire_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(76.57, 355.03, 355.03);
	ITEM.attachmentOffsetVector = Vector(-2.9, 1.41, -3.54);
	ITEM.huntingValue = 3; -- Affects speed of skinning and mutilating corpses as well as the condition of the hides and meat, 1 = terrible, 3 = great
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1500, supercrateOnly = true};

	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"fire"};
	ITEM.requiredbeliefs = {"murder_artform"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Glazic Sword + Sol Shield";
	ITEM.model = "models/demonssouls/weapons/rune sword.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "begotten_sacrificial_glazicsword_glazicshield";
	ITEM.category = "Melee";
	ITEM.description = "Une lame Maximillian dorée et un bouclier étoilé enchantés par le feu et des sceaux de richesse.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/glazic_sword_sol_shield.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_L_Thigh";
	ITEM.attachmentOffsetAngles = Angle(14.92, 0, 20.88);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 0);
	ITEM.bulletConditionScale = 0.2;
	ITEM.conditionScale = 0.45;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"gold_ingot"}}; -- use "breakdown" for other type
	ITEM.attributes = {"fire"};
	ITEM.requiredbeliefs = {"the_light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bell Hammer";
	ITEM.model = "models/props/begotten/melee/sacred_chime_hammer.mdl";
	ITEM.weight = 13;
	ITEM.uniqueID = "begotten_2h_great_bellhammer";
	ITEM.category = "Melee";
	ITEM.description = "Une bête colossale en fonte de jugement divin. Elle confère aux justes la force nécessaire pour la manier sans chanceler. Un coup véritable fera sonner la cloche de l'église, convoquant une assemblée de colère sacrée pour que tous l'entendent.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bellhammer.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(287.4, 0, 347);
	ITEM.attachmentOffsetVector = Vector(-2.12, 1.41, -20.51);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};

	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.attributes = {"bell"};
	ITEM.requiredbeliefs = {"strength", "repentant"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Demonslayer Greataxe";
	ITEM.model = "models/props/begotten/melee/drakekeeper_great_axe.mdl";
	ITEM.weight = 7.5;
	ITEM.uniqueID = "begotten_2h_great_demonslayerhammer";
	ITEM.category = "Melee";
	ITEM.description = "Une énorme hache de guerre en acier shagalaxien, gravée de runes goréiques anciennes qui repoussent l'influence démoniaque. Si elle est maniée par un utilisateur suffisamment fort, cette arme a le potentiel de briser les os en un seul coup.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/demonslayer_greataxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0.99, 339.12, 88.51);
	ITEM.attachmentOffsetVector = Vector(7.78, 2.83, -24.04);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, supercrateOnly = true};

	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
	ITEM.onerequiredbelief = {"father", "mother", "old_son", "young_son", "sister"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Ordained Gorefeller";
	ITEM.model = "models/props/begotten/melee/ordained_gorefeller.mdl";
	ITEM.weight = 7.5;
	ITEM.uniqueID = "begotten_2h_great_ordainedgorefeller";
	ITEM.category = "Melee";
	ITEM.description = "Une gigantesque hache de guerre en acier Maximillian, paradoxalement ornée de runes du Nord. On dit qu'elle fut maniée par les premiers guerriers du nord, ce modèle ayant été reforgé par les pieux Gore-Glazics du District 21. Elle présente une ressemblance frappante avec l'antique tueuse de dieux de Maximus, forgée à son image. On la croit aussi capable d'abattre les païens avec la même efficacité que la hache en l'honneur de laquelle elle fut forgée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ordained_gorefeller.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0.99, 339.12, 88.51);
	ITEM.attachmentOffsetVector = Vector(7.78, 2.83, -24.04);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength", "the_light"};
	ITEM.requiredFaiths = {"Faith of the Light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Dreadaxe";
	ITEM.model = "models/props/begotten/melee/black_knight_greataxe.mdl";
	ITEM.weight = 7.5;
	ITEM.uniqueID = "begotten_2h_great_dreadaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une grande hache d'acier noir à la conception malveillante. Une arme offerte uniquement aux plus talentueux des bourreaux parmi les Enfants de Satan.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/black_knight_greataxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0.99, 339.12, 88.51);
	ITEM.attachmentOffsetVector = Vector(7.78, 2.83, -24.04);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, supercrateOnly = true};

	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"murder_artform", "strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Frozen Fatherland Axe";
	ITEM.model = "models/begotten/weapons/gore_ice_axe.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_sacrificial_frozenfatherlandaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de guerre maudite par les dieux, dont la poigne glaciale ne se relâche jamais. Elle cherche un porteur digne de geler le sang des indignes.";
	ITEM.iconoverride = "begotten/ui/itemicons/gore_ice_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(360, 193.92, 94.48);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2, -7.07);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, supercrateOnly = true};

	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "ice_catalyst", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.attributes = {"ice"};
	ITEM.requiredbeliefs = {"strength"};
	ITEM.onerequiredbelief = {"father", "mother", "old_son", "young_son", "sister"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Demon Knight Sword";
	ITEM.model = "models/prelude/demonknightsword.mdl";
	ITEM.weight = 2.7;
	ITEM.uniqueID = "begotten_2h_demonknightsword";
	ITEM.category = "Melee";
	ITEM.description = "Une colossale épée large forgée dans les flammes de l'Enfer, réservée aux plus élites des chevaliers de Satan. Sa lame en Aciernoir infernal renforcé brûle et gèle simultanément au toucher. La garde a été maudite par un millier d'ermites Rekh-khet-sa et corrompt lentement ceux qui ne suivent pas le Seigneur des Ténèbres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/demonknightsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90.5, 180, 76.22);
	ITEM.attachmentOffsetVector = Vector(5.66, 2.9, 17.68);

	ITEM.attributes = {"last_stand", "cursed"};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Whip";
	ITEM.model = "models/begotten/weapons/whip.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_1h_whip";
	ITEM.category = "Melee";
	ITEM.description = "Un fouet de cuir à pointes, couramment utilisé par les rois Varazdat pour tourmenter leurs esclaves.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_whip.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isSacrifical = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(74.59, 360, 0);
	ITEM.attachmentOffsetVector = Vector(-6.14, -7.78, -2.83);	
	ITEM.canUseShields = true;

	ITEM.attributes = {"barbed", "mark_of_perdition", "disciplined", "blood_of_kings"};
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "bindings", "leather", "leather", "leather"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"murder_artform"};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.allowedSubfactions = {"Varazdat"};
ITEM:Register();