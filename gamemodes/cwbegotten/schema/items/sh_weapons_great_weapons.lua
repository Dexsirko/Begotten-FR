local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Claymore";
	ITEM.model = "models/demonssouls/weapons/claymore.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_2h_claymore";
	ITEM.category = "Melee";
	ITEM.description = "Une grande épée d'acier. Sa garde est gravée de symboles glaziques appartenant à une noble maison éteinte depuis longtemps.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/claymore.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90.5, 180, 347.07);
	ITEM.attachmentOffsetVector = Vector(5.66, 2.9, 17.68);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1300, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Cleaver";
	ITEM.model = "models/begotten/weapons/2h_axe3.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_gorecleaver";
	ITEM.category = "Melee";
	ITEM.description = "Une arme particulièrement lourde et brutale. Une arme prisée des Chefs de Carnage, pour sa capacité à inspirer la terreur et à trancher des têtes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_cleaver.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 288.9, 0);
	ITEM.attachmentOffsetVector = Vector(-4.95, 2.83, -23.34);
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Club";
	ITEM.model = "models/begotten/weapons/2h_mace1.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_goreclub";
	ITEM.category = "Melee";
	ITEM.description = "Un gourdin robuste taillé dans le bois de la Forêt de Goreic. Il est renforcé de renforts et de pointes en fer pour percer les armures de plaques.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_club.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(8.95, 287.05, 0);
	ITEM.attachmentOffsetVector = Vector(-5.66, 2.12, -21.22);
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood", "wood", "wood"}};
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore War Axe";
	ITEM.model = "models/begotten/weapons/2h_axe1.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_gorewaraxe";
	ITEM.category = "Melee";
	ITEM.description = "Une lourde hache de guerre d'un artisanat grossier. Elle porte les marques distinctives du Clan Gore.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_war_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(22.87, 283.43, 339.12);
	ITEM.attachmentOffsetVector = Vector(-2.12, 1.41, -17.68);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Grockling Sacred Stone Maul";
	ITEM.model = "models/begotten/weapons/2h_mace3.mdl";
	ITEM.weight = 7;
	ITEM.uniqueID = "begotten_2h_great_grocklingsacredstonemaul";
	ITEM.category = "Melee";
	ITEM.description = "Une rune bénie, gravée par les premiers Druides des Lames avec un savoir ancestral. Utiliser une telle arme est considéré comme une insulte par les autres Clans du Givre, car c'est un affront aux Dieux. Seuls ceux du Clan Grock oseraient braver la colère des Dieux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/grockling_sacred_stone_maul.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 283.26, 0);
	ITEM.attachmentOffsetVector = Vector(-4.95, 3.54, -21.22);
	
	ITEM.components = {breakdownType = "breakdown", items = {"stone", "stone", "stone", "wood", "wood"}};
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.includedSubfactions = {"Clan Grock"};
	ITEM.kinisgerOverride = true;
ITEM:Register(); 

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Grockling Stone Maul";
	ITEM.model = "models/begotten/weapons/2h_mace2.mdl";
	ITEM.weight = 6.5;
	ITEM.uniqueID = "begotten_2h_great_grocklingstonemaul";
	ITEM.category = "Melee";
	ITEM.description = "Un empilement de runes goreiques martelées sur un gourdin de bois gravé. Une arme typiquement utilisée par les Grocklings sans-dieu, pour son excellence à égaliser les adversaires cuirassés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/grockling_stone_maul.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 287.05, 0);
	ITEM.attachmentOffsetVector = Vector(-2.12, 2.83, -17.68);
	
	ITEM.components = {breakdownType = "breakdown", items = {"stone", "stone", "stone", "stone", "wood", "wood"}};
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.includedSubfactions = {"Clan Grock"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Haralder War Axe";
	ITEM.model = "models/witcher2soldiers/tw2_bigaxe.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_haralderwaraxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de guerre ornée forgée en acier Shagalaxien. Cette hache est souvent utilisée par les pillards des mers du Clan Harald. Une ancienne malédiction empêche les faibles de saisir fermement son manche.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/haralder_war_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 281.37);
	ITEM.attachmentOffsetVector = Vector(-5.66, 2.83, -30.41);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Heavy Battle Axe";
    ITEM.model = "models/weapons/doubleaxe.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_heavybattleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de fer noir et lourd. Une arme grossière et brutale. Il est incertain pour quelle sombre armée cette arme fut forgée.";
	ITEM.iconoverride = "begotten/ui/itemicons/doubleaxe.png"
	ITEM.meleeWeapon = true;
    ITEM.isAttachment = true;
    ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
    ITEM.attachmentOffsetAngles = Angle(0, 16.25, 358.05);
    ITEM.attachmentOffsetVector = Vector(-2.83, 2.23, -16.17);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Reaver War Axe";
	ITEM.model = "models/begotten/weapons/2h_axe2.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_reaverwaraxe";
	ITEM.category = "Melee";
	ITEM.description = "Une lourde hache dentelée forgée pour les sinistres esclavagistes des mers du Clan Reaver. Celui qui a façonné cette arme l'a probablement fait avec rancœur et mépris.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/reaver_war_axe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 283.26, 0);
	ITEM.attachmentOffsetVector = Vector(-4.95, 2.83, -26.87);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Scraphammer";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/rockethammer.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_great_scraphammer";
	ITEM.category = "Melee";
	ITEM.description = "Un marteau de fortune, assemblé à partir de divers débris de la Zone Dévastée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scraphammer.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 291.38, 267.51);
	ITEM.attachmentOffsetVector = Vector(-4.24, 4.24, -9.19);
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "scrap"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Skylight Sword";
	ITEM.model = "models/doom/weapons/templar_sword.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_2h_skylightsword";
	ITEM.category = "Melee";
	ITEM.description = "Un équipement d'une technologie avancée. Le niveau de prouesse technique investi dans la perfection des qualités matérielles extra-terrestres de cette arme est à couper le souffle. Une arme capable de trancher avec rapidité et élégance d'innombrables horreurs, tout en conservant son tranchant de rasoir dans une forme parfaite. Il ne reste que quelques-unes de ces armes, vestiges du glorieux District One au cœur même de la Sainte Hiérarchie.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/skylight_sword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 192.32, 0);
	ITEM.attachmentOffsetVector = Vector(2.83, 3.54, 13.44);
	
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Volthammer";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/rockethammer.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_2h_great_volthammer";
	ITEM.category = "Melee";
	ITEM.description = "Un marteau de fortune chargé électriquement, utilisé par les Voltistes pour ses capacités anti-blindage.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volthammer.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 291.38, 267.51);
	ITEM.attachmentOffsetVector = Vector(-4.24, 4.24, -9.19);
	ITEM.bodygroup1 = 4;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "scrap", "scrap", "scrap", "tech", "tech"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength", "wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "War Club";
	ITEM.model = "models/demonssouls/weapons/great club.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_warclub";
	ITEM.category = "Melee";
	ITEM.description = "Un grand gourdin en bois renforcé de cerclages et de pointes en fer. Un design simpliste qui a conféré du pouvoir à bien des seigneurs de guerre et tyrans à travers les âges.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/war_club.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 12.32, 0);
	ITEM.attachmentOffsetVector = Vector(0, 3.54, -12.02);
	ITEM.fireplaceFuel = 240;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, bNoSupercrate = true};
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Satanic Maul";
	ITEM.model = "models/skyrim/daedric/warhammer/w_daedricwarhammer.mdl";
	ITEM.weight = 3.2;
	ITEM.uniqueID = "begotten_2h_great_satanicmaul";
	ITEM.category = "Melee";
	ITEM.description = "Un maillet d'acier noir à la conception tordue. Il excelle à enfoncer les agneaux dans la terre, cuirassés ou non.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/satanic_maul.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(10.42, 275.68, 353.37);
	ITEM.attachmentOffsetVector = Vector(0.71, 2.83, -9.19);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Maximus Wrath";
	ITEM.model = "models/begotten/weapons/maximus_wrath.mdl";
	ITEM.weight = 2.7;
	ITEM.uniqueID = "begotten_2h_great_maximuswrath";
	ITEM.category = "Melee";
	ITEM.description = "Superacier du District Un, chargé de technologie avancée ; une arme glorieuse digne d'un demi-dieu. CONTEMPLEZ ! La Colère de Maximus !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/maximus_wrath.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 2.5, 269.5);
	ITEM.attachmentOffsetVector = Vector(0, 6.36, 12.02);	
	
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Darklander Bardiche";
	ITEM.model = "models/demonssouls/weapons/crescent axe.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_darklanderbardiche";
	ITEM.category = "Melee";
	ITEM.description = "Une grande hache en croissant ornée de motifs des Terres Sombres. Arme d'hast efficace, elle excelle à briser les murailles de boucliers.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bardiche.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(92.49, 0, 10.94);
	ITEM.attachmentOffsetVector = Vector(-2.83, 3.59, -24.75);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	
	ITEM.attributes = {"shieldbreaker"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Evening Star";
	ITEM.model = "models/begotten/weapons/eveningstar.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_2h_great_eveningstar";
	ITEM.category = "Melee";
	ITEM.description = "Une boule d'acier noir de l'expiation fixée sur un poteau de bois renforcé. Elle est incroyablement instable et inflige un châtiment brutal à quiconque ose tenter de bloquer son jugement. Une arme typiquement fabriquée par l'Orthodoxie en proie à la haine de soi.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/eveningstar.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(345.08, 265.52, 0);
	ITEM.attachmentOffsetVector = Vector(-1.41, 2.9, -2.83);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};

	ITEM.attributes = {"punisher"};
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "steel_chunks", "wood", "leather"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Long Axe";
	ITEM.model = "models/begotten_apocalypse/items/2HAxe2.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_hilllongaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache de bûcheron modifiée pour franchir les murs de boucliers. La lame est affûtée, et ce qui jadis tranchait les bûches tranche désormais la chair. Le manche de bois a été béni par trois fois et brûle désormais les mains des hérétiques.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/2HAxe2.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetVector = Vector(0.71, 2.83, -6.36);
	ITEM.attachmentOffsetAngles = Angle(90, 2.84, 201.79);
	
	ITEM.attributes = {"splinter"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Grockling Stone Sword";
	ITEM.model = "models/begotten/weapons/grocklingsword.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "begotten_2h_great_grocklingsword";
	ITEM.category = "Melee";
	ITEM.description = "Une épée massive taillée dans des roches à forte densité minérale. Ceux qui suivent les Anciennes Voies utilisaient ces lames bien avant que le Clan Shagalax ne découvre le fer malléable contenu dans ces pierres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/grocklingsword.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(172.04, 74.59, 261.55);
	ITEM.attachmentOffsetVector = Vector(8.49, 1.9, 26.87);
	
	ITEM.components = {breakdownType = "breakdown", items = {"stone", "stone", "stone", "stone", "stone", "stone"}};
	ITEM.requiredbeliefs = {"strength"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.includedSubfactions = {"Clan Grock"};
	ITEM.kinisgerOverride = true;
ITEM:Register();