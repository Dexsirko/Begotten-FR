local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Elegant Dagger";
	ITEM.model = "models/demonssouls/weapons/geri's geristiletto.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_elegantdagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague élégante de fabrication ancienne, probablement une relique précieuse issue de la collection de la Hiérarchie Sacrée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/elegant_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 355.03, 0);
	ITEM.attachmentOffsetVector = Vector(-3.54, 0.71, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3; -- Affects speed of skinning and mutilating corpses as well as the condition of the hides and meat, 1 = terrible, 3 = great
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 666, supercrateOnly = true};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Gore Hunting Dagger";
	ITEM.model = "models/demonssouls/weapons/secret dagger.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_gorehuntingdagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague de fer gravée utilisée pour les chasses cérémonielles dans la Forêt de Goreic.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_hunting_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(353.04, 86.52, 14.21);
	ITEM.attachmentOffsetVector = Vector(-3.54, 1.41, -2.12);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Clan Reaver Dagger";
	ITEM.model = "models/props_sr_weapons/ebony_dagger.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_clanreaverdagger";
	ITEM.category = "Melee";
	ITEM.description = "Un poignard cérémoniel du Clan Reaver, conçu pour la torture et les mises à mort rituelles des esclaves dans la Salle des Larmes. Les runes spéciales du Clan Reaver ouvrent de sanglantes blessures sur les mains de ceux qui ne sont pas nés sous le regard haineux de la Sœur.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/Ebony_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(1.11, 180, 1.11);
	ITEM.attachmentOffsetVector = Vector(-3.433, 0.71, -3);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2220, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}};
	ITEM.repairCostModifier = 0.3;
	ITEM.requiredSubfactions = {"Clan Reaver"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Dagger";
	ITEM.model = "models/demonssouls/weapons/dagger.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_irondagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague en fer de fabrication bon marché.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 355.03, 0);
	ITEM.attachmentOffsetVector = Vector(-3.54, 0.71, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, bNoSupercrate = true};
	ITEM.repairCostModifier = 0.8;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Bone Dagger";
	ITEM.model = "models/begotten/weapons/bonedagger.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "begotten_dagger_bonedagger";
	ITEM.category = "Melee";
	ITEM.description = "Un os aiguisé, probablement utilisé par des sauvages primitifs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bonedagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(0, 355.03, 0);
	ITEM.attachmentOffsetVector = Vector(-3.54, 0.71, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 1;
	
	ITEM.components = {breakdownType = "breakdown", items = {"human_bone"}};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Knightsbane";
	ITEM.model = "models/demonssouls/weapons/mail breaker.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_knightsbane";
	ITEM.category = "Melee";
	ITEM.description = "Une dague bien forgée, conçue pour percer les armures à courte distance.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/knightsbane.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(335.14, 355.03, 0);
	ITEM.attachmentOffsetVector = Vector(-2.83, 1.69, -3.71);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 2;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, supercrateOnly = true};
	ITEM.repairCostModifier = 0.8;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Parrying Dagger";
	ITEM.model = "models/demonssouls/weapons/parrying dagger.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_parryingdagger";
	ITEM.category = "Melee";
	ITEM.description = "Une petite dague conçue pour accrocher les lames adverses et faciliter leur parade.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/parrying_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.hasIncreasedDeflectionWindow = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(329.17, 355.03, 4.97);
	ITEM.attachmentOffsetVector = Vector(-2.83, 2.12, -3.54);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 2;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 550, supercrateOnly = true};
	ITEM.repairCostModifier = 0.8;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Quickshank";
	ITEM.model = "models/mosi/fallout4/props/weapons/melee/switchblade.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "begotten_dagger_quickshank";
	ITEM.category = "Melee";
	ITEM.description = "Un shiv rouillé, fabriqué à partir de ferraille récupérée dans les terres désolées.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/quickshank.png"
	ITEM.meleeWeapon = true;
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 1;
	
	ITEM.attributes = {"concealable"};
	ITEM.components = {breakdownType = "breakdown", items = {"scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 100, bNoSupercrate = true};
	ITEM.repairCostModifier = 0.4;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "House Rekh-khet-sa Ancestral Dagger";
	ITEM.model = "models/items/weapons/daggers_kryss/daggers_kryss.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_houserekhkhetsaancestraldagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague serpentine appartenant à une lignée sanguine ancestrale. Le métal émet un sifflement lorsqu'il est exposé à la lumière du soleil. Une magie tordue empêche quiconque n'étant pas de la lignée appropriée de manier cette dague.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/rekh_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(252.95, 2.98, 0.95);
	ITEM.attachmentOffsetVector = Vector(-3.54, 2, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.requiredSubfactions = {"Rekh-khet-sa"};
	ITEM.requiredFactions = {"Children of Satan"};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "House Varazdat Ancestral Dagger";
	ITEM.model = "models/items/weapons/daggers_shadow/daggers_shadow.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_housevarazdatancestraldagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague des Ténèbres autrefois employée par un culte de mange-chair. Une magie perverse empêche quiconque n'appartient pas à la lignée adéquate de manier cette lame.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/varazdat_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(252.95, 2.98, 0.95);
	ITEM.attachmentOffsetVector = Vector(-3.54, 2, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.requiredSubfactions = {"Varazdat"};
	ITEM.requiredFactions = {"Children of Satan"};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "House Philimaxio Ancestral Dagger";
	ITEM.model = "models/items/weapons/daggers/daggers.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_housephilimaxioancestraldagger";
	ITEM.category = "Melee";
	ITEM.description = "Une dague de noble Glazic tombée en tentation. Une magie tordue empêche quiconque n'étant pas du lignage approprié de manier cette lame.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/philimaxio_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(249.16, 2.84, 2.84);
	ITEM.attachmentOffsetVector = Vector(-3.54, 2.12, 1.41);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2500, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.requiredSubfactions = {"Philimaxio"};
	ITEM.requiredFactions = {"Children of Satan"};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "House Kinisger Ancestral Dagger";
	ITEM.model = "models/items/weapons/daggers_collector/daggers_collector.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_housekinisgerancestraldagger";
	ITEM.category = "Melee";
	ITEM.description = "L'outil de meurtre d'un assassin des ténèbres. Il a probablement ôté bien des vies, du serf à l'Empereur. Une magie perverse empêche quiconque n'appartient pas à la lignée adéquate de manier cette dague.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/kinisger_dagger.png"
	ITEM.meleeWeapon = true;
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 3000, supercrateOnly = true};
	
	ITEM.attributes = {"concealable"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.requiredSubfactions = {"Kinisger"};
	ITEM.requiredFactions = {"Children of Satan"};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hill Dagger";
	ITEM.model = "models/begotten_apocalypse/items/GuardDagger.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "begotten_dagger_hilldagger";
	ITEM.category = "Melee";
	ITEM.description = "Une lame de chasse conçue pour dépecer et écorcher les animaux. La poignée est gravée de runes Gore-Glazic.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/guarddagger.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(353.04, 179.05, 14.21);
	ITEM.attachmentOffsetVector = Vector(-3.54, 1.41, -2.12);
	ITEM.canUseOffhand = true;
	ITEM.huntingValue = 3;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.repairCostModifier = 0.3;
ITEM:Register();