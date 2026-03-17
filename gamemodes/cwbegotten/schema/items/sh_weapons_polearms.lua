local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Poleaxe";
	ITEM.model = "models/witcher2soldiers/tw2_halberd.mdl";
	ITEM.weight = 3.5;
	ITEM.uniqueID = "begotten_polearm_gatekeeperpoleaxe";
	ITEM.category = "Melee";
	ITEM.description = "Une hache d'armes en acier courte et bien ouvragée. Un excellent égalisateur et arme de garde, capable de maintenir l'ordre et de tenir à distance les horreurs de grande taille.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gatekeeper_poleaxe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 279.45);
	ITEM.attachmentOffsetVector = Vector(-7.78, 3, -45.97);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "wood", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Billhook";
	ITEM.model = "models/bill_guisarme.mdl";
	ITEM.weight = 3.5;
	ITEM.uniqueID = "begotten_polearm_billhook";
	ITEM.category = "Melee";
	ITEM.description = "Une arme d'hast en fer de fabrication rudimentaire, étonnamment efficace pour mettre à égalité les adversaires cuirassés. Même un chevalier peut être humilié par le modeste porteur de hallebarde.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/billhook.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(98.45, 0, 279.45);
	ITEM.attachmentOffsetVector = Vector(-0.34, -21.89, -21.22);
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 9000, bNoSupercrate = true};
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "wood", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Lucerne";
	ITEM.model = "models/bec_de_corbin.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_polearm_lucerne";
	ITEM.category = "Melee";
	ITEM.description = "Une arme en acier fin, à la fois pratique et élégante dans sa conception. Son bec de corbeau excelle à percer les plaques de métal.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/lucerne.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(98.45, 0, 279.45);
	ITEM.attachmentOffsetVector = Vector(4.24, -47.58, -21.22);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "wood", "wood", "leather"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Halberd";
	ITEM.model = "models/demonssouls/weapons/halberd.mdl";
	ITEM.weight = 6;
	ITEM.uniqueID = "begotten_polearm_halberd";
	ITEM.category = "Melee";
	ITEM.description = "Une longue arme d'hast en métal. Elle possède une lame d'acier pour trancher et une pointe acérée pour percer les armures. Une arme typiquement trouvée dans les rangs des modestes Gardiens de Porte, car elle peut donner même à un simple imbécile une chance de se battre contre de terribles horreurs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/halberd.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(88.51, 0, 8.95);
	ITEM.attachmentOffsetVector = Vector(0, 3, -17.68);
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 850, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pike";
	ITEM.model = "models/props/begotten/melee/pike.mdl";
	ITEM.weight = 6;
	ITEM.uniqueID = "begotten_polearm_pike";
	ITEM.category = "Melee";
	ITEM.description = "Une longue arme d'hast en fer dotée d'une pointe acérée simple mais efficace à son extrémité. Une arme réputée pour sa portée impressionnante et son pouvoir de pénétration, qu'il est préférable d'utiliser au sein d'une formation avec d'autres armes similaires.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pike.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 8.95, 180);
	ITEM.attachmentOffsetVector = Vector(0, 3, -7.07);
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 350, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Polehammer";
	ITEM.model = "models/demonssouls/weapons/mirdan hammer.mdl";
	ITEM.weight = 8;
	ITEM.uniqueID = "begotten_polearm_polehammer";
	ITEM.category = "Melee";
	ITEM.description = "Une arme d'hast Glazic de belle facture. Elle présente une tête de marteau en acier brutale et une pointe mortelle. Un excellent égalisateur contre les ennemis cuirassés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/polehammer.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 10.94);
	ITEM.attachmentOffsetVector = Vector(0, 3, -1.41);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, supercrateOnly = true};
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "War Spear";
	ITEM.model = "models/witcher2soldiers/tw2_spear.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_polearm_warspear";
	ITEM.category = "Melee";
	ITEM.description = "Un pieu de bois renforcé surmonté d'une pointe en acier Shagalaxien. Une arme de chasse remarquablement longue transformée en instrument de guerre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/war_spear.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 277.46);
	ITEM.attachmentOffsetVector = Vector(-3.54, 3, -35.36);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 850, supercrateOnly = true};
	
	ITEM.attributes = {"grounded"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Glazic Banner";
	ITEM.model = "models/begoyten/glazicbanner/glazicbanner.mdl";
	ITEM.weight = 8.5;
	ITEM.uniqueID = "begotten_polearm_glazicbanner";
	ITEM.category = "Melee";
	ITEM.description = "Un drapeau arborant l'insigne de l'Ordre Sacré des Gardiens. Il sert d'inspiration au combat, et le perdre serait extrêmement grave.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/newglazicbanner.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 178);
	ITEM.attachmentOffsetVector = Vector(0.71, 4.24, -3.54);	

	ITEM.attributes = {"aoebuff"};
	ITEM.components = {breakdownType = "meltdown", items = {"leather", "leather", "leather", "leather", "steel_chunks", "steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hillkeeper Signum";
	ITEM.model = "models/begotten_apocalypse/items/cla_rome_standard_signum_1.mdl";
	ITEM.weight = 8.5;
	ITEM.uniqueID = "begotten_polearm_hillkeepersignum";
	ITEM.category = "Melee";
	ITEM.description = "Un étendard lourd en fer et argent, arborant un aigle et le nom majestueux de MAXIMUS sur une plaque. Il évoque un profond sentiment de force et le perdre serait assurément grave.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/cla_rome_standard_signum_1.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isLongPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(114.36, 271.49, 152.15);
	ITEM.attachmentOffsetVector = Vector(0, 6, -38.74);
	
	ITEM.attributes = {"aoebuff"};
	ITEM.components = {breakdownType = "meltdown", items = {"leather", "leather", "leather", "leather", "steel_chunks", "steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Light"};
	ITEM.kinisgerOverride = true;
ITEM:Register();