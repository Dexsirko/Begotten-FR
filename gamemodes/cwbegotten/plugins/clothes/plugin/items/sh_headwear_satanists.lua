local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Ballroom Mask"
	ITEM.model = "models/begotten/headgroup_props/ballroommask.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ballroom_mask_plebian.png"
	ITEM.concealsFace = true;
	ITEM.weight = 0.2
	ITEM.uniqueID = "ballroom_mask"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 1
	ITEM.headSuffix = "_satanist";
	ITEM.skin = 1
	ITEM.description = "Un masque de bal pour l'événement social le plus important auquel participent les Enfants de Satan : le bal masqué. Ce masque est simple et fissuré, indiquant un manque de statut social."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.faction = "Children of Satan";
	
	ITEM.insulation = 35;
	
	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Ornate Ballroom Mask"
	ITEM.model = "models/begotten/headgroup_props/ballroommask.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ballroom_mask.png"
	ITEM.concealsFace = true;
	ITEM.weight = 0.2
	ITEM.uniqueID = "ballroom_mask_ornate"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 2
	ITEM.headSuffix = "_satanist";
	ITEM.skin = 2
	ITEM.description = "Un masque de bal pour l'événement social le plus important auquel participent les Enfants de Satan : le bal masqué. Ce masque est orné de gravures dorées, symbole de richesse et de prestige."
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.faction = "Children of Satan";
	
	ITEM.insulation = 35;
	
	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Skullshield"
	ITEM.model = "models/begotten/headgroup_props/skullshield.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/skullshield.png"
	ITEM.concealsFace = true;
	ITEM.weight = 1.5
	ITEM.uniqueID = "skullshield"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 3
	ITEM.headSuffix = "_satanist";
	ITEM.description = "Un masque en plaque métallique rembourré à porter sur le visage. Il est vaguement stylisé pour évoquer un crâne humain. Une pièce d'armure imposante que l'on trouve au sein de nombreux cultes obscurs. Une aura oppressante vous empêche de le porter si vous n'en êtes pas digne."
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/skullshield";
	ITEM.faction = "Children of Satan";

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 47
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 40;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "scrap", "scrap"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Hellplate Helmet"
	ITEM.model = "models/begotten/headgroup_props/hellplatehelm.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/hellplate_helmet.png"
	ITEM.weight = 1.5
	ITEM.uniqueID = "hellplate_helmet"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 4
	ITEM.headSuffix = "_satanist";
	ITEM.description = "Autrefois le digne heaume des Sentinelles Blanches et l'emblème de la Maison Philimaxio, ce casque a depuis été reforgé maintes fois dans les flammes infernales, ne conservant qu'une lointaine ressemblance avec sa forme originelle. Son existence est une honte pour l'Ordre des Gardiens et une insulte ouverte à la Lumière."
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/hellplatehelmet";
	ITEM.faction = "Children of Satan";
	ITEM.requiredbeliefs = {"hauberk"};

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 72
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Blackplate Helmet"
	ITEM.model = "models/begotten/items/cc_ebony_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/cc_ebony_helm.png"
	ITEM.weight = 1.8
	ITEM.uniqueID = "blackplate_helmet"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 5
	ITEM.headSuffix = "_satanist";
	ITEM.description = "Un casque qui ne ressemble que de loin à son dessin d'origine. Il a été reforgé d'innombrables fois dans les feux de l'Enfer et porte les cicatrices de la bataille. Fut-il jadis le heaume d'un Philimaxio honoré, ou d'un gladiateur des fosses des Ténèbres ?"
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/hellplatehelmet";
	ITEM.faction = "Children of Satan";

	ITEM.conditionScale = 1.5 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 67
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.65; -- reduces slash damage by 35%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks"}};
ITEM:Register();