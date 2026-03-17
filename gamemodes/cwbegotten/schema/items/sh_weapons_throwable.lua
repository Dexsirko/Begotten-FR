local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Iron Javelin";
	ITEM.model = "models/demonssouls/weapons/cut javelin.mdl";
	ITEM.weight = 2.3;
	ITEM.uniqueID = "begotten_javelin_iron_javelin";
	ITEM.category = "Throwables";
	ITEM.description = "Un javelot en fer robuste, particulièrement efficace pour transpercer les ennemis.";
	ITEM.iconoverride = "begotten/ui/itemicons/iron_javelin.png"
	ITEM.isAttachment = true;
	ITEM.isJavelin = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(273.48, 178.01, 191.93);
	ITEM.attachmentOffsetVector = Vector(-6.36, 2.1, -16.27);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, bNoSupercrate = true};
	ITEM.repairCostModifier = 0.25;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Pilum";
	ITEM.model = "models/props/begotten/melee/heide_lance.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_javelin_pilum";
	ITEM.category = "Throwables";
	ITEM.description = "Un modèle ancien, ressuscité par les érudits de la Sainte Hiérarchie pour l'usage des Gardiens des Portes. Il est réputé pour ses capacités de perforation d'armure et d'anti-bouclier.";
	ITEM.iconoverride = "begotten/ui/itemicons/pilum.png"
	ITEM.isAttachment = true;
	ITEM.isJavelin = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(170.06, 187.96, 181.99);
	ITEM.attachmentOffsetVector = Vector(0, 2.9, 0);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.attributes = {"malleable", "shieldbreaker"};
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.repairCostModifier = 0.25;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Training Javelin";
	ITEM.model = "models/begotten/weapons/training_spear.mdl";
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_javelin_training_javelin";
	ITEM.category = "Throwables";
	ITEM.description = "Un poteau en bois utilisable pour l'entraînement au lancer de javelot à faible risque.";
	ITEM.iconoverride = "begotten/ui/itemicons/training_javelin.png"
	ITEM.isAttachment = true;
	ITEM.isJavelin = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 279.45, 0);
	ITEM.attachmentOffsetVector = Vector(-4.24, 3, -24.75);
	ITEM.canUseShields = true;
	ITEM.fireplaceFuel = 120;
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
	ITEM.repairCostModifier = 0.25;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Throwing Axe";
	ITEM.model = "models/demonssouls/weapons/cut throwing axe offset.mdl";
	ITEM.weight = 0.8;
	ITEM.uniqueID = "begotten_javelin_throwing_axe";
	ITEM.category = "Throwables";
	ITEM.description = "Une hache au manche courbé, conçue pour une seule fin : s'enfoncer dans la chair.";
	ITEM.iconoverride = "begotten/ui/itemicons/throwing_axe.png"
	ITEM.isAttachment = true;
	ITEM.isJavelin = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 258.63, 0);
	ITEM.attachmentOffsetVector = Vector(7.78, 0.71, -4.24);
	ITEM.canUseShields = true;
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 1500, bNoSupercrate = true};
	ITEM.repairCostModifier = 0.25;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Throwing Dagger";
	ITEM.model = "models/demonssouls/weapons/cut throwing dagger offset.mdl";
	ITEM.weight = 0.3;
	ITEM.uniqueID = "begotten_javelin_throwing_dagger";
	ITEM.category = "Throwables";
	ITEM.description = "Une lame lestée fixée à une poignée en bois légère. Elle peut être lancée rapidement avec une relative facilité, permettant à un assassin en devenir de déchaîner une pluie de dagues en un court instant.";
	ITEM.iconoverride = "begotten/ui/itemicons/throwing_dagger.png"
	ITEM.isJavelin = true;
	ITEM.canUseShields = true;
	
	ITEM.attributes = {"concealable"};
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 700, bNoSupercrate = true};
	ITEM.repairCostModifier = 0.1;
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Hillkeeper Throwing Axe";
	ITEM.model = "models/begotten_apocalypse/items/WinterholdAxe Thrown.mdl";
	ITEM.weight = 1.2;
	ITEM.uniqueID = "begotten_javelin_axehill";
	ITEM.category = "Throwables";
	ITEM.description = "Une hache de fabrication Gore-Glaze, montée sur un manche de bois étrangement courbé et torsadé. Sa forme est conçue pour le lancer.";
	ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/WinterholdAxe.png"
	ITEM.isAttachment = true;
	ITEM.isJavelin = true;
	ITEM.canUseShields = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(0, 258.63, 0);
	ITEM.attachmentOffsetVector = Vector(7.78, 0.71, -4.24);
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}}; -- use "breakdown" for other type
	ITEM.repairCostModifier = 0.25;
ITEM:Register();