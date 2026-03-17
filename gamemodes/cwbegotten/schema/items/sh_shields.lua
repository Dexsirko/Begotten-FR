local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Buckler";
	ITEM.model = "models/demonssouls/shields/buckler.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "shield4";
	ITEM.description = "Pour son impressionnante métallurgie, il est clair que ce bouclier offensif fut forgé il y a longtemps par la Sainte Hiérarchie. Une arme autrefois tristement célèbre, utilisée par les mercenaires et voyous glaziques pour sa capacité à parer les coups et à étourdir les adversaires.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/buckler.png"
	ITEM.isAttachment = true;
	ITEM.hasIncreasedDeflectionWindow = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(287.4, 360, 0);
	ITEM.attachmentOffsetVector = Vector(0, 0, 4.95);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 1.3; -- 0.25 minimum, 2 maximum, higher is better
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 700, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Car Door Shield";
	ITEM.model = "models/props_vehicles/carparts_door01a.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "shield3";
	ITEM.description = "Une pièce métallique lourde provenant d'une machine antique. Elle ne devrait être utilisée que par les combattants les plus désespérés, ou les guerriers les plus puissants.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/car_door_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(355.03, 229.72, 0.99);
	ITEM.attachmentOffsetVector = Vector(0, 2.12, 5.66);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.8;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1600, bNoSupercrate = true};
	ITEM.requiredbeliefs = {"defender"};	
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Clan Shield";
	ITEM.model = "models/begotten/weapons/goreroundshield.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "shield14";
	ITEM.description = "Un bouclier robuste fabriqué à partir du bois anormalement résistant de la Forêt de Gore. Il est orné et protégé par les sceaux du clan Goreic.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/clan_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(360, 309.28, 0);
	ITEM.attachmentOffsetVector = Vector(0, 0, 0);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 1;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood", "wood", "wood"}};
	ITEM.requiredFaiths = {"Faith of the Family"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Dreadshield";
	ITEM.model = "models/props/begotten/melee/drakekeeper_greatshield.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "shield13";
	ITEM.description = "Un bouclier forgé dans les flammes infernales, bien qu'il soit désormais d'une froideur glaciale au toucher. La simple présence de cette création maléfique éveille un sentiment de funeste présage.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/dreadshield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 359.01, 0);
	ITEM.attachmentOffsetVector = Vector(0, 2.12, -4.95);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.5;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Gatekeeper Shield";
	ITEM.model = "models/props/begotten/melee/twin_dragon_greatshield.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "shield11";
	ITEM.description = "Un bouclier tour bien ouvragé, arborant une gravure représentant le Glaze.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gatekeeper_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
	ITEM.attachmentOffsetVector = Vector(0, 0, 0);
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.bulletConditionScale = 0.4;
	ITEM.conditionScale = 0.75;
	ITEM.fireplaceFuel = 300;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Gore Guardian Shield";
	ITEM.model = "models/demonssouls/shields/large brushwood shield.mdl";
	ITEM.weight = 9;
	ITEM.uniqueID = "shield10";
	ITEM.description = "Une relique ancienne, forgée par les Druides de la Lame bien avant que les futurs Gores ne posent le pied près du Grand Arbre. Elle sert désormais les protecteurs de l'ordre naturel contre la seule menace qui pèse sur lui : l'humanité. La structure métallique du bouclier gagne en solidité à mesure qu'elle se rapproche de sa source de pouvoir, le Grand Arbre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_guardian_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(88.51, 201.79, 268.11);
	ITEM.attachmentOffsetVector = Vector(0, 0.71, -4.24);
	ITEM.bulletConditionScale = 0.15;
	ITEM.conditionScale = 0.25;
	
	ITEM.attributes = {"unbreakable"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}};
	ITEM.requiredbeliefs = {"defender"};
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 850, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Iron Shield";
	ITEM.model = "models/demonssouls/shields/soldier's shield.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "shield6";
	ITEM.description = "Rayée et brûlée, ce bouclier de métal a servi bien des soldats avant de vous trouver.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(98.45, 181.99, 176.02);
	ITEM.attachmentOffsetVector = Vector(0, -1.41, 0);
	ITEM.bulletConditionScale = 0.3;
	ITEM.conditionScale = 0.65;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 900, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Knight's Shield";
	ITEM.model = "models/demonssouls/shields/knight's shield.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "shield7";
	ITEM.description = "Un bouclier de métal purifié touché par Sol. Quiconque le porte doit le servir autant qu'il le sert, car son métal brûlera la main de tout cœur hérétique. Si un véritable héros de la Glace devait manier ce bouclier, il s'embraserait d'une grande flamme sacrée, mais cela reste à voir par les Chevaliers de Sol.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/knights_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90.5, 201.88, 269.5);
	ITEM.attachmentOffsetVector = Vector(0, -0.71, 0);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.35;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks"}};
	ITEM.requiredbeliefs = {"manifesto"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Leather Shield";
	ITEM.model = "models/props/begotten/melee/large_leather_shield.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "shield17";
	ITEM.description = "Un bouclier circulaire de construction en bois, son visage recouvert de cuir.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/leather_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(270, 0, 0);
	ITEM.attachmentOffsetVector = Vector(0, 1.6, 0);
	ITEM.bulletConditionScale = 0.45;
	ITEM.conditionScale = 1;
	ITEM.fireplaceFuel = 240;
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 750, bNoSupercrate = true};
	ITEM.components = {breakdownType = "breakdown", items = {"wood", "wood", "wood", "leather", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Old Soldier Shield";
	ITEM.model = "models/begotten/thralls/skellyshield.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "shield20";
	ITEM.description = "Jadis portés par les fantassins des armées de l'Empire de la Lumière, ces boucliers servent désormais une cause bien plus sinistre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/old_soldier_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 180, 0);
	ITEM.attachmentOffsetVector = Vector(0, 2, 0);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.5;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 750, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Rusted Kite Shield";
	ITEM.model = "models/props/begotten/melee/red_rust_shield.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "shield19";
	ITEM.description = "Un bouclier cabossé et rouillé, témoin d'un usage intensif. Un précédent propriétaire y a gravé le décompte de ses victimes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/rusted_kite_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 180, 0);
	ITEM.attachmentOffsetVector = Vector(0, 2, 0);
	ITEM.bulletConditionScale = 0.3;
	ITEM.conditionScale = 0.6;
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 5000};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Scrap Shield";
	ITEM.model = "models/props_bebris/metal_panel02a.mdl";
	ITEM.weight = 5;
	ITEM.uniqueID = "shield1";
	ITEM.description = "Un bouclier en tôle, orné de divers fétiches illustrant la foi de son porteur.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scrap_shield_new.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 275, 180.15);
	ITEM.attachmentOffsetVector = Vector(0, 3, -1);
	ITEM.bulletConditionScale = 0.55;
	ITEM.conditionScale = 1.15;
	
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "scrap"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 600, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Slaveshield";
	ITEM.model = "models/demonssouls/shields/slave's shield.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "shield2";
	ITEM.description = "Un terrible bouclier de bois autrefois utilisé par une grande armée d'esclaves.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/slaveshield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(114.36, 183.98, 181.99);
	ITEM.attachmentOffsetVector = Vector(0, 0.71, 4.24);
	ITEM.bulletConditionScale = 0.6;
	ITEM.fireplaceFuel = 60;
	ITEM.conditionScale = 2;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 80, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Sol Sentinel Shield";
	ITEM.model = "models/demonssouls/shields/tower shield.mdl";
	ITEM.weight = 10;
	ITEM.uniqueID = "shield9";
	ITEM.description = "Un grand bouclier qui fut utilisé par la garde rapprochée de Lord Maximus en personne. Une pièce massive, désormais employée par les Hauts Gardiens pour défendre les derniers sanctuaires de la Lumière.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/sol_sentinel_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90.5, 158.12, 88.51);
	ITEM.attachmentOffsetVector = Vector(0, -1.41, 0);
	ITEM.bulletConditionScale = 0.1;
	ITEM.conditionScale = 0.25;
	
	ITEM.attributes = {"unbreakable"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	ITEM.requiredbeliefs = {"defender"};
	ITEM.requiredSubfaiths = {"Sol Orthodoxy", "Hard-Glazed"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Spiked Shield";
	ITEM.model = "models/demonssouls/shields/spiked shield.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "shield8";
	ITEM.description = "Une chose haineuse faite de métal tordu et de pointes. Une chose forgée en Enfer même, destinée aux adeptes humains du Prince des Ténèbres pour assouvir leurs désirs sanguinaires. Il semble qu'une âme terrible soit piégée dans le métal, prenant un plaisir lubrique à chaque mise à mort causée par son utilisateur. Si le porteur déçoit ou vénère une autre divinité que Lucifer lui-même, le métal se tordra et se contorsionnera autour de ses mains, le vidant de son sang avec ses pointes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/spiked_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(74.59, 183.98, 360);
	ITEM.attachmentOffsetVector = Vector(0, 0.34, 0);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.55;

	ITEM.attributes = {"spiked"};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 800, supercrateOnly = true};
	ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Steel Gatekeeper Shield";
	ITEM.model = "models/props/begotten/melee/tower_shield.mdl";
	ITEM.weight = 8;
	ITEM.uniqueID = "shield18";
	ITEM.description = "Un grand bouclier d'acier finement ouvragé, arborant une personnification de la Glaze.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steel_gatekeeper_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 180, 0);
	ITEM.attachmentOffsetVector = Vector(0, 2, 0);
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.4;
	
	ITEM.requiredbeliefs = {"defender"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Steel Tower Shield";
	ITEM.model = "models/props/begotten/melee/pate_shield.mdl";
	ITEM.weight = 6;
	ITEM.uniqueID = "shield16";
	ITEM.description = "Un grand bouclier de bois renforcé de plaques d'acier noirci ; son design intègre des éléments couramment observés sur l'équipement des Ténébreux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steel_tower_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 180, 0);
	ITEM.attachmentOffsetVector = Vector(0, 2, -1);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.45;

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "wood", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Voltshield";
	ITEM.model = "models/props_vebris/metal_panel02a.mdl";
	ITEM.weight = 5.5;
	ITEM.uniqueID = "shield15";
	ITEM.description = "Un bouclier de fortune renforcé par une batterie de voiture de récupération qui alimente le bouclier en électricité. Tout ennemi qui entre en contact avec ce bouclier à l'aide d'une arme métallique le regrettera assurément.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volt_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 275, 180.15);
	ITEM.attachmentOffsetVector = Vector(0, 9, -4.95);
	ITEM.bulletConditionScale = 0.45;
	ITEM.conditionScale = 1.1;
	
	ITEM.attributes = {"electrified"};
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "scrap", "tech"}}; -- use "breakdown" for other type
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Warfighter Shield";
	ITEM.model = "models/props/begotten/melee/pursuer_greatshield.mdl";
	ITEM.weight = 6;
	ITEM.uniqueID = "shield12";
	ITEM.description = "Un bouclier extrêmement lourd forgé dans l'acier des Druides de la Lame. Conçu pour protéger les Guerriers des grêles de tirs lâches des trompeurs Glaziques.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/warfighter_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
	ITEM.attachmentOffsetVector = Vector(0, 0, 0);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.45;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "iron_chunks", "iron_chunks"}};
	ITEM.requiredFactions = {"Goreic Warrior"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Wooden Shield";
	ITEM.model = "models/skyrim/shield_stormcloaks.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "shield5";
	ITEM.description = "Un bouclier standard capable d'encaisser un bon nombre de coups.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/wooden_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(273.48, 360, 90);
	ITEM.attachmentOffsetVector = Vector(0, 1.6, 0);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 1.25;
	ITEM.fireplaceFuel = 180;
	
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 600, bNoSupercrate = true};
	ITEM.components = {breakdownType = "breakdown", items = {"wood", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Red Wolf Shield";
	ITEM.model = "models/begotten/weapons/uniquegoreshield.mdl";
	ITEM.weight = 9;
	ITEM.uniqueID = "shieldunique1";
	ITEM.description = "Un mur impie d'acier noir forgé dans les flammes de l'enfer. Il est orné de la chair desséchée de victimes écorchées. Un bouclier destiné aux Loups Rouges, une confrérie guerrière pervertie du Clan Reaver.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/red_wolf_shield.png"
	ITEM.isAttachment = true;
	ITEM.isUnique = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 360, 0);
	ITEM.attachmentOffsetVector = Vector(0, 4.24, -4.95);
	ITEM.bulletConditionScale = 0.15;
	ITEM.conditionScale = 0.25;

	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks"}};
	ITEM.attributes = {"unbreakable"};
	ITEM.requiredbeliefs = {"defender"};
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.requiredSubfactions = {"Clan Reaver"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Hillkeeper Kite Shield";
	ITEM.model = "models/begotten_apocalypse/items/hill_kite_shield.mdl";
	ITEM.weight = 5.5;
	ITEM.uniqueID = "shieldhill";
	ITEM.description = "Un bouclier en larme finement ouvragé, arborant une représentation peinte de Sol, aux couleurs de la Colline.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hill_kite_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
	ITEM.attachmentOffsetVector = Vector(0, -2.3, 0);
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.conditionScale = 0.7;
	ITEM.bulletConditionScale = 0.4;
	ITEM.fireplaceFuel = 300;
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Steel Hillkeeper Shield";
	ITEM.model = "models/props/begotten/melee/defender_shield.mdl";
	ITEM.weight = 8;
	ITEM.uniqueID = "shieldhillsteel";
	ITEM.description = "Un bouclier d'acier finement forgé, orné sur sa face de gravures runiques représentant guerriers et héros glaziques.";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/defender_shield.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 180, 180);
	ITEM.attachmentOffsetVector = Vector(0, -2, 0);
	ITEM.excludedFactions = {"Goreic Warrior"};
	ITEM.bulletConditionScale = 0.3;
	ITEM.conditionScale = 0.45;
	
	ITEM.requiredbeliefs = {"defender"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Shagalax Tower Shield";
	ITEM.model = "models/begotten_prelude/items/goreshield_shagalax.mdl";
	ITEM.weight = 7;
	ITEM.uniqueID = "shieldhathood1";
	ITEM.description = "Un grand bouclier forgé par les experts du Clan Shagalax. Il a été méthodiquement renforcé de plaques d'acier shagalaxien, entrelacées avec du cuir. Bien que plutôt lourd, il demeure un choix populaire au sein de leur clan.";
	ITEM.iconoverride = "begotten/ui/itemicons/goreshield_shagalax.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 0);
	ITEM.attachmentOffsetVector = Vector(8, 5.73, -8);
	ITEM.bulletConditionScale = 0.25;
	ITEM.conditionScale = 0.45;
	ITEM.requiredSubfactions = {"Clan Shagalax"};

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1000, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "leather", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Clan Reaver Shield";
	ITEM.model = "models/begotten_prelude/items/goreshield_thyrm.mdl";
	ITEM.weight = 4.5;
	ITEM.uniqueID = "shieldhathood2";
	ITEM.description = "Un bouclier robuste assombri par la magie de la Sœur. Ce modèle existe depuis des siècles, remontant aux premiers sorciers thyrmiens. Il est orné et protégé par des sigils goréens.";
	ITEM.iconoverride = "begotten/ui/itemicons/goreshield_thyrm.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 355.03, 0);
	ITEM.attachmentOffsetVector = Vector(-1.01, 2.83, 0.34);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 0.7;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "wood", "wood", "wood"}};
	ITEM.requiredSubfactions = {"Clan Reaver"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Clan Gore Shield";
	ITEM.model = "models/begotten_prelude/items/goreshield_ursa.mdl";
	ITEM.weight = 4.5;
	ITEM.uniqueID = "shieldhathood5";
	ITEM.description = "Un bouclier robuste assombri par la magie du Père. Ce motif représente le Grand Ours, une créature mythologique du prédécesseur du Clan Gore, le Clan Ursa. Il est orné et protégé par des sigils goréens.";
	ITEM.iconoverride = "begotten/ui/itemicons/goreshield_ursa.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 351.05, 180.04);
	ITEM.attachmentOffsetVector = Vector(0, 0.71, -3.54);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 0.7;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "wood", "wood", "wood"}};
	ITEM.requiredSubfactions = {"Clan Gore"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Clan Crast Shield";
	ITEM.model = "models/begotten_prelude/items/goreshield_crast.mdl";
	ITEM.weight = 3.5;
	ITEM.uniqueID = "shieldhathood3";
	ITEM.description = "Un bouclier robuste béni par la protection de la Mère. Il est exceptionnellement léger, pour aider les chamans généralement faibles qui manient ces boucliers. Il est orné et protégé par des sigils goréens.";
	ITEM.iconoverride = "begotten/ui/itemicons/goreshield_crast.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(92.49, 0, 180);
	ITEM.attachmentOffsetVector = Vector(0, -1.41, -5.66);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 0.7;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "wood", "wood", "wood"}};
	ITEM.requiredSubfactions = {"Clan Crast"};
ITEM:Register();

local ITEM = Clockwork.item:New("shield_base");
	ITEM.name = "Clan Harald Shield";
	ITEM.model = "models/begotten_prelude/items/goreshield_haraldr.mdl";
	ITEM.weight = 4.5;
	ITEM.uniqueID = "shieldhathood4";
	ITEM.description = "Un bouclier robuste béni par la protection du Vieux Fils. Il exhale une odeur de sel et d'océan, souvent attaché aux flancs des drakkars. Il est orné et protégé par des sigils goréens.";
	ITEM.iconoverride = "begotten/ui/itemicons/goreshield_haraldr.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(82.54, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-0.71, 3.54, -3.54);
	ITEM.bulletConditionScale = 0.5;
	ITEM.conditionScale = 0.7;
	ITEM.fireplaceFuel = 180;
	
	ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "wood", "wood", "wood"}};
	ITEM.requiredSubfactions = {"Clan Harald"};
ITEM:Register();
