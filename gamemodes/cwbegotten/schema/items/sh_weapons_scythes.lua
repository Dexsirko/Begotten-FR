local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Glaive";
	ITEM.model = "models/demonssouls/weapons/war scythe.mdl";
	ITEM.weight = 3;
	ITEM.uniqueID = "begotten_scythe_glaive";
	ITEM.category = "Melee";
	ITEM.description = "Une lame affûtée fixée au bout d'une longue perche, elle peut facilement éventrer quiconque se trouve à sa portée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/glaive.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(88.51, 0, 351.05);
	ITEM.attachmentOffsetVector = Vector(1.41, 3, -9.9);

	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 850, supercrateOnly = true};
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "War Scythe";
	ITEM.model = "models/props/begotten/melee/scythe.mdl";
	ITEM.weight = 4;
	ITEM.uniqueID = "begotten_scythe_warscythe";
	ITEM.category = "Melee";
	ITEM.description = "L'outil d'un serf, voué au labeur, transformé en arme. Une vision fréquente dans le Champ des Larmes, une terre où les esclaves épuisaient leurs corps jusqu'à la mort, et où leurs âmes, après le trépas, continuaient à peiner pour l'éternité. Cette arme est hantée par de telles âmes, et elle émet une aura lugubre capable de réduire n'importe quel homme en larmes s'il s'y expose trop longtemps.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/war_scythe.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.isPolearm = true;
	ITEM.hasMinimumRange = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_Spine2";
	ITEM.attachmentOffsetAngles = Angle(186.63, 194.21, 355.03);
	ITEM.attachmentOffsetVector = Vector(5.66, 1.5, -23.34);
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood", "wood", "wood"}}; -- use "breakdown" for other type
	ITEM.itemSpawnerInfo = {category = "Melee", rarity = 2000, bNoSupercrate = true};
ITEM:Register();
