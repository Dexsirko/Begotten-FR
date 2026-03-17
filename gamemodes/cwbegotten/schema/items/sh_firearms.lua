--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Blunderbuss";
	ITEM.model = "models/arxweapon/ashot.mdl";
	ITEM.weight = 2;
	ITEM.uniqueID = "begotten_blunderbuss";
	ITEM.description = "Une arme en métal et bois maladroite qui peut étonnamment résister à la puissance du Grapeshot pur. Elle déchaîne l'enfer tout autour de vous.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/blunderbuss.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 342, 6.96);
	ITEM.attachmentOffsetVector = Vector(0.71, 3, 7.07);

	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Grapeshot"};
	ITEM.firearmType = "Shotgun";
	ITEM.reloadTime = 10; -- Seconds
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "scrap", "scrap", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 2250, supercrateItems = {["grapeshot"] = {min = 7, max = 15}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Colt";
	ITEM.model = "models/weapons/doi/w_1911.mdl";
	ITEM.weight = 1.5;
	ITEM.uniqueID = "begotten_colt";
	ITEM.description = "Une trouvaille impossible ! Un pistolet antique fonctionnel, vestige d'un âge révolu. Il utilise des munitions d'antan et peut abattre les salopards sans difficulté.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/colt.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(68.62, 4.97, 355.03);
	ITEM.attachmentOffsetVector = Vector(-4.95, -4.24, 0.71);
	
	ITEM.ammoCapacity = 7;
	ITEM.ammoTypes = {"Old World Shot", "Old World Magazine"};
	ITEM.ammoTypesNice = {"Old World Shot"};
	ITEM.firearmType = "Handgun";
	ITEM.reloadTime = 5; -- Seconds (for magazine)
	ITEM.reloadSounds = {"weapons/m1911/handling/m1911_magrelease.wav", "weapons/m1911/handling/m1911_magout.wav", "weapons/m1911/handling/m1911_magin.wav", "weapons/m1911/handling/m1911_maghit.wav", "weapons/m1911/handling/m1911_boltback.wav", "weapons/m1911/handling/m1911_boltrelease.wav"};
	ITEM.usesMagazine = true;
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 3000, supercrateOnly = true, supercrateItems = {["old_world_magazine"] = {min = 2, max = 3}, ["old_world_shot"] = {min = 7, max = 14}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Corpsecrank";
	ITEM.model = "models/weapons/w_shot_enforcer.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_corpsecrank";
	ITEM.description = "Une machine entièrement métallique qui éjecte des boulets de mitraille à chaque tour de manivelle. Une arme de guerre conçue pour produire en masse un produit de valeur : des cadavres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/corpsecrank.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(2, 2.84, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 3.54, -6.36);
	
	ITEM.ammoCapacity = 6;
	ITEM.ammoTypes = {"Grapeshot"};
	ITEM.firearmType = "Repeating Shotgun";
	ITEM.isRevolver = true;
	ITEM.reloadTime = 2; -- Seconds (for one round)
	ITEM.reloadSounds = {"weapons/bulkcannon/draw.wav", "weapons/bulkcannon/insertshell.wav", "weapons/bulkcannon/lock.wav"};
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 2500, supercrateOnly = true, supercrateItems = {["grapeshot"] = {min = 15, max = 30}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Wooden Crossbow";
	ITEM.uniqueID = "begotten_crossbow";
	ITEM.category = "Crossbows";
	ITEM.model = "models/begotten/weapons/w_crossbow.mdl";
	ITEM.weight = 3.5;
	ITEM.description = "Communément utilisée par les milices peu entraînées des districts ruraux, l'arbalète est un modèle ancien bien antérieur à l'Empire de la Lumière. Elle propulse des carreaux à grande vitesse et dispose d'un mécanisme de blocage permettant de ne pas maintenir la tension, bien qu'elle exige encore une force considérable pour être rechargée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/crossbow.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 354.15, 0);
	ITEM.attachmentOffsetVector = Vector(-3.23, 1.39, -6.36);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Iron Bolt", "Iron Bolt (Incendiary)", "Scrap Bolt"};
	ITEM.attributes = {"variable_damage"};
	ITEM.firearmType = "Crossbow";
	ITEM.reloadTime = 5; -- Seconds (for one round)
	ITEM.reloadSounds = {"weapons/bulkcannon/draw.wav", "weapons/crossbow/bow-pre1.wav.mp3", "weapons/crossbow/bowgun-stance.wav.mp3"};
	
	ITEM.includedSubfactions = {"Clan Crast", "Clan Shagalax"};
	ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "wood", "wood"}};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 1500, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Scrap Crossbow";
	ITEM.uniqueID = "begotten_scrapbow";
	ITEM.category = "Crossbows";
	ITEM.model = "models/begotten/weapons/w_scrapbow.mdl";
	ITEM.weight = 4;
	ITEM.description = "Une arbalète fabriquée à partir de ferraille et de bois pourri.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scrapbow.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(90, 354.15, 0);
	ITEM.attachmentOffsetVector = Vector(-3.23, 1.39, -6.36);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Iron Bolt", "Iron Bolt (Incendiary)", "Scrap Bolt"};
	ITEM.attributes = {"variable_damage"};
	ITEM.firearmType = "Crossbow";
	ITEM.reloadTime = 8; -- Seconds (for one round)
	ITEM.reloadSounds = {"weapons/bulkcannon/draw.wav", "weapons/crossbow/bow-pre1.wav.mp3", "weapons/crossbow/bowgun-stance.wav.mp3"};
	
	ITEM.includedSubfactions = {"Clan Crast", "Clan Shagalax"};
	ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "wood"}};
ITEM:Register();

ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Hillkeeper Axmusket";
	ITEM.model = "models/begoyten/gunaxe/gunaxe.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_hillkeeper_axmusket";
	ITEM.description = "Un mousquet Glazic finement ouvragé, doté d'une hache en acier en guise de crosse. Une arme efficace typique des Hommes des Collines ; chaque outil doit servir un double usage, chaque centimètre d'acier et chaque grain de poudre étant exploités à des fins des plus pratiques. La poignée de cette arme a été bénie par trois fois et brûle désormais les mains des hérétiques.";
	ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/gunaxe.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(87.73, 360, 170.9);
	ITEM.attachmentOffsetVector = Vector(1.39, 5.08, -5.08);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Longshot"};
	ITEM.attributes = {"melee"};
	ITEM.firearmType = "Long Gun (Great Weapon)";
	ITEM.reloadTime = 10; -- Seconds
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"wood", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}};
	ITEM.requiredFaiths = {"Faith of the Light"};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Inquisitor Revolver";
	ITEM.model = "models/arxweapon/hellsing.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_inquisitor_revolver";
	ITEM.description = "Une version plus légère du mousquet à répétition qui tire des munitions de calibre Pop-a-Shot, couramment utilisée par l'Inquisition.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/inquisitor_revolver.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 339.12, 177.16);
	ITEM.attachmentOffsetVector = Vector(-5.66, 3.54, 9.19);	
	ITEM.bodygroup2 = 9;
	ITEM.bodygroup3 = 2;
	
	ITEM.ammoCapacity = 8;
	ITEM.ammoTypes = {"Pop-a-Shot"};
	ITEM.firearmType = "Repeater";
	ITEM.isRevolver = true;
	ITEM.reloadTime = 10; -- Seconds (for one round)
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Musket";
	ITEM.model = "models/weapons/w_snip_ele.mdl";
	ITEM.weight = 2
	ITEM.uniqueID = "begotten_musket";
	ITEM.description = "Un long tuyau rouillé capable de charger de gros projectiles. Une arme vénérée des Districts du Comté.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/musket.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 355.03, 357.02);
	ITEM.attachmentOffsetVector = Vector(-2.83, 2.83, -7.78);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Longshot", "Grapeshot"};
	ITEM.firearmType = "Long Gun";
	ITEM.reloadTime = 10; -- Seconds
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "steel_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 900, supercrateItems = {["longshot"] = {min = 10, max = 15}, ["grapeshot"] = {min = 3, max = 5}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Peppershot";
	ITEM.model = "models/weapons/w_pist_piper.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_peppershot";
	ITEM.description = "Un pistolet assemblé à partir de divers matériaux de récupération.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/peppershot.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(68.62, 0, 357.02);
	ITEM.attachmentOffsetVector = Vector(-4.24, 0, -5.66);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Pop-a-Shot", "Grapeshot"};
	ITEM.attributes = {"suppressed"};
	ITEM.firearmType = "Handgun";
	ITEM.reloadTime = 10; -- Seconds
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"scrap", "scrap", "scrap"}};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 600, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Repeating Musket";
	ITEM.model = "models/weapons/w_bulkcannon.mdl";
	ITEM.weight = 3.5;
	ITEM.uniqueID = "begotten_musket_repeating";
	ITEM.description = "Cette arme fut à l'origine conçue dans le seul but d'exécuter les démons, et seule un Grand Magistrat était autorisé à la manier. En ces temps plus sombres, elle remplit désormais de nombreuses fonctions supplémentaires.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/repeating_musket.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 351.47, 90);
	ITEM.attachmentOffsetVector = Vector(-2.12, 3.54, -0.71);
	
	ITEM.ammoCapacity = 7;
	ITEM.ammoTypes = {"Longshot", "Grapeshot"};
	ITEM.firearmType = "Repeater";
	ITEM.isRevolver = true;
	ITEM.reloadTime = 10; -- Seconds (for one round)
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 2000, supercrateOnly = true, supercrateItems = {["longshot"] = {min = 10, max = 20}, ["grapeshot"] = {min = 5, max = 10}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Scavenger Gun";
	ITEM.model = "models/weapons/v_smg_mothgun.mdl";
	ITEM.weight = 2.5;
	ITEM.uniqueID = "begotten_scavenger_gun";
	ITEM.description = "Une mitrailleuse artisanale usée, elle semble à peine fonctionner. Une trouvaille rare en effet.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scavenger_gun.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 353.04, 357.02);
	ITEM.attachmentOffsetVector = Vector(-2.83, 2.83, -7.78);
	
	ITEM.ammoCapacity = 25;
	ITEM.ammoTypes = {"Scrapshot", "Scavenger Gun Magazine", "Scavenger Gun Large Magazine"};
	ITEM.ammoTypesNice = {"Scrapshot"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "scrap", "scrap", "scrap"}};
	ITEM.firearmType = "Carbine";
	ITEM.reloadTime = 5; -- Seconds (for magazine)
	ITEM.reloadSounds = {"weapons/bulkcannon/draw.wav", "weapons/m1911/handling/m1911_boltback.wav", "weapons/m1911/handling/m1911_magout.wav", "weapons/m1911/handling/m1911_magin.wav", "weapons/m1911/handling/m1911_maghit.wav", "weapons/m1911/handling/m1911_boltrelease.wav"};
	ITEM.usesMagazine = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 1200, supercrateItems = {["scavenger_gun_large_magazine"] = {min = 2, max = 5}, ["scrapshot"] = {min = 15, max = 30}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Springer";
	ITEM.model = "models/weapons/w_snip_m1903.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_springer";
	ITEM.description = "Un fusil ancien de haute puissance, antérieur même à l'Empire de la Lumière. Il est assez puissant pour tuer presque n'importe qui d'une seule balle, bien que les munitions soient rares. Il est fréquent que ceux qui acquièrent cette arme se fassent engager des tueurs à gages pour la leur dérober.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/springer.png"
	ITEM.isAttachment = true;
	ITEM.loweredOrigin = Vector(39.50, -28.45, -20.17);
	ITEM.loweredAngles = Angle(39.50, -28.45, -20.17);
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine";
	ITEM.attachmentOffsetAngles = Angle(0, 0, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 4, 4);
	
	ITEM.ammoCapacity = 5;
	ITEM.ammoTypes = {"Old World Longshot"};
	ITEM.ammoTypesNice = {"Old World Longshot"};
	ITEM.attributes = {"sundering_shot"};
	ITEM.firearmType = "Rifle";
	ITEM.reloadTime = 5; -- Seconds
	ITEM.reloadSounds = {"weapons/request day of defeat/m1903 springfield boltback 1.wav", "weapons/request day of defeat/m1903 springfield clipin.wav", "weapons/request day of defeat/m1903 springfield boltforward 2.wav"};
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 5500, supercrateOnly = true, supercrateItems = {["old_world_longshot"] = {min = 10, max = 20}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Sweeper";
	ITEM.model = "models/weapons/w_nik_trenchy.mdl";
	ITEM.weight = 3.6;
	ITEM.uniqueID = "begotten_sweeper";
	ITEM.description = "Une vieille machine de guerre, actionnée par pompe et alimentée par de la mitraille de l'Ancien Monde. Elle a beaucoup servi au fil des années.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/sweeper.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(2, 2.84, 0);
	ITEM.attachmentOffsetVector = Vector(-4, 3.54, -6.36);
	
	ITEM.ammoCapacity = 6;
	ITEM.ammoTypes = {"Old World Grapeshot"};
	ITEM.attributes = {"sundering_shot_grapeshot"};
	ITEM.firearmType = "Repeating Shotgun";
	ITEM.reloadTime = 1; -- Seconds (for one round)
	ITEM.reloadSounds = {"weapons/nikm1987trench/shotgun_shell_00.wav"};
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 5500, supercrateOnly = true, supercrateItems = {["old_world_grapeshot"] = {min = 10, max = 20}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Thompson";
	ITEM.model = "models/_tails_ models/props/rust/thompson/thompson.mdl";
	ITEM.weight = 4.5;
	ITEM.uniqueID = "begotten_thompson";
	ITEM.description = "Une mitraillette automatique antique, antérieure même à l'Empire de la Lumière. Elle semble avoir été pillée dans un musée ancien et remise en état de marche avec des pièces de rechange.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/thompson.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 347.07, 266.21);
	ITEM.attachmentOffsetVector = Vector(-1.41, 3.3, 2.83);
	
	ITEM.ammoCapacity = 30;
	ITEM.ammoTypes = {"Old World Shot", "Old World Large Magazine"};
	ITEM.ammoTypesNice = {"Old World Shot"};
	ITEM.firearmType = "Submachinegun";
	ITEM.reloadTime = 5; -- Seconds (for magazine)
	ITEM.reloadSounds = {"weapons/m1911/handling/m1911_magrelease.wav", "weapons/m1911/handling/m1911_magout.wav", "weapons/m1911/handling/m1911_magin.wav", "weapons/m1911/handling/m1911_maghit.wav", "weapons/m1911/handling/m1911_boltback.wav", "weapons/m1911/handling/m1911_boltrelease.wav"};
	ITEM.usesMagazine = true;
	ITEM.unrepairable = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 5500, supercrateOnly = true, supercrateItems = {["old_world_large_magazine"] = {min = 2, max = 3}, ["old_world_shot"] = {min = 20, max = 30}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Voltist Railgun";
	ITEM.model = "models/arxweapon/railgun.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_voltist_railgun";
	ITEM.description = "Un canon à rail électrifié de fortune de fabrication Voltiste. Il propulse des projectiles lourds sur de grandes distances et excelle à percer les blindages.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/voltist_railgun.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 337.13, 0);
	ITEM.attachmentOffsetVector = Vector(1.01, 3.54, -7.78);
	 
	ITEM.bodygroup1 = 9
	ITEM.bodygroup2 = 1

	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Volt Projectile"};
	ITEM.firearmType = "Railgun";
	ITEM.reloadTime = 10; -- Seconds
	ITEM.reloadSounds = {"weapons/bulkcannon/draw.wav", "weapons/request day of defeat/m1903 springfield draw.wav", "weapons/request day of defeat/m1903 springfield boltback 1.wav", "weapons/m1911/handling/m1911_boltback.wav", "weapons/CB4/cb4-1_trigger.wav", "railgun/railgun_empty_sparks.mp3", "railgun/railgun_1s_recharge.mp3"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"tech", "tech", "scrap", "scrap", "scrap", "scrap", "wood"}};
	ITEM.requiredbeliefs = {"wriggle_fucking_eel"};
ITEM:Register();

ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Jezail";
	ITEM.model = "models/sw_battlefront/weapons/jezail_short.mdl";
	ITEM.weight = 2
	ITEM.uniqueID = "begotten_jezail_short";
	ITEM.description = "Un mousquet des Terres Sombres. Il est équipé d'une lunette pour un tir plus précis. Une gravure rouge sang brûle la main de quiconque ne suit pas les ténèbres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/jezail_short.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 343.09, 90);
	ITEM.attachmentOffsetVector = Vector(3.54, 3.54, -9.9);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Longshot", "Pop-a-Shot"};
	ITEM.firearmType = "Long Gun";
	ITEM.reloadTime = 8; -- Seconds
	ITEM.reloadSounds = {"oneuse_deploy.ogg"};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"wood", "steel_chunks", "steel_chunks", "steel_chunks"}};
ITEM:Register();

ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Jezail Rifle";
	ITEM.model = "models/sw_battlefront/weapons/jazail_long.mdl";
	ITEM.weight = 3
	ITEM.uniqueID = "begotten_jezail_long";
	ITEM.description = "Un fusil Darklander, tristement célèbre pour son utilisation par les Janissaires Nigerii. Il est équipé d'une lunette pour un tir plus précis. Son canon a été allongé et rayé, le rendant excellent pour le tir de précision. Une gravure rouge sang brûle la main de quiconque ne suit pas les ténèbres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/jazail_long.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 343.09, 90);
	ITEM.attachmentOffsetVector = Vector(3.54, 3.54, -9.9);
	
	ITEM.ammoCapacity = 1;
	ITEM.ammoTypes = {"Longshot"};
	ITEM.firearmType = "Long Gun";
	ITEM.reloadTime = 8; -- Seconds
	ITEM.reloadSounds = {"oneuse_deploy.ogg", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};
	ITEM.requiredFaiths = {"Faith of the Dark"};
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.components = {breakdownType = "meltdown", items = {"wood", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Storm Drummer";
	ITEM.model = "models/begotten/weapons/w_shagalaxlmg.mdl";
	ITEM.weight = 6.5;
	ITEM.uniqueID = "begotten_stormdrummer";
	ITEM.description = "L'orgueil d'un seigneur de guerre, une relique de l'époque où les tanks à vapeur parcouraient les districts du comté. Cette mitrailleuse fut inventée par les machinistes pseudo-ferrailleurs shagalaxiens dans le but explicite de supprimer et de dominer les lignes de tir glaziques sous un déluge de balles.";
	ITEM.iconoverride = "begotten/ui/itemicons/w_shagalaxlmg.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 353.04, 357.02);
	ITEM.attachmentOffsetVector = Vector(-2.83, 2.83, -7.78);
	
	ITEM.ammoCapacity = 100;
	ITEM.ammoTypes = {"Scrapshot", "Shagalax Bullet Box Magazine"};
	ITEM.ammoTypesNice = {"Scrapshot"};
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "scrap", "scrap", "scrap", "scrap", "scrap"}};
	ITEM.firearmType = "Machine Gun";
	ITEM.reloadTime = 10; -- Seconds (for magazine)
	ITEM.reloadSounds = {"begotten/scraplmg/cloth.wav", "begotten/scraplmg/wfoly_plr_lm_pkilo_drop.wav", "begotten/scraplmg/wpfoly_m249_reload_open_v1.wav", "begotten/scraplmg/wpfoly_m249_reload_clipout_v1.wav", "begotten/scraplmg/wpn_h1_saw_ins_look_01.wav", "begotten/scraplmg/wpfoly_m249_reload_clipin_v1.wav", "begotten/scraplmg/wpfoly_m249_reload_close_v2.wav", "begotten/scraplmg/wpfoly_m249_reload_chamber_v1.wav"};
	ITEM.usesMagazine = true;
	
	ITEM.excludedSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 2500, supercrateOnly = true, supercrateItems = {["shagalax_bullet_box_magazine"] = {min = 1, max = 2}}};
ITEM:Register();

local ITEM = Clockwork.item:New("firearm_base");
	ITEM.name = "Pepperbox";
	ITEM.model = "models/weapons/w_pepperbox.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "begotten_pepperbox";
	ITEM.description = "Un pistolet à quatre canons autrefois utilisé par les escrocs, brigands et bandits de grand chemin du passé. Il sert désormais de symbole de statut parmi la paysannerie des terres désolées.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pepperbox.png"
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(90, 0, 90);
	ITEM.attachmentOffsetVector = Vector(-4.5, 0, -3.8);
	
	ITEM.ammoCapacity = 4;
	ITEM.ammoTypes = {"Pop-a-Shot"};
	ITEM.firearmType = "Repeater";
	ITEM.isRevolver = true;
	ITEM.reloadTime = 8; -- Seconds (for one round)
	ITEM.reloadSounds = {"musket/reload_musket01.wav", "musket/reload_musket02.wav", "musket/reload_musket03.wav", "musket/reload_musket04.wav", "musket/reload_musket05.wav", "musket/reload_musket06.wav", "musket/reload_musket07.wav", "musket/reload_musket08.wav", "musket/reload_musket_cock.wav"};

	ITEM.excludeSubfactions = {"Philimaxio", "Knights of Sol"};
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 4000, bNoSupercrate = true};	
ITEM:Register();