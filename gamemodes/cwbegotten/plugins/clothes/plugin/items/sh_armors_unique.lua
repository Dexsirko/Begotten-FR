local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Lord Vasso's Gothic Plate";
ITEM.model = "models/begotten/headgroup_props/hellspikearmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/lord_vasso_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0 -- item does not degrade
--ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 6;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "L'armure personnelle forgée en enfer de Lord Vasso, dont le style évoque une époque antérieure à l'Empire de la Lumière.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Children of Satan"};

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	--[HITGROUP_HEAD] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.70; -- reduces blunt damage by 30%
ITEM.pierceScale = 0.60; -- reduces pierce damage by 40%
ITEM.slashScale = 0.50; -- reduces slash damage by 50%
ITEM.bulletScale = 0.15; -- reduces bullet damage by 85%
ITEM.stabilityScale = 0.20; -- reduces stability damage by 80%
ITEM.insulation = 80;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begotten/satanists/lordvasso/male_56.mdl";
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Bjornling's Red Wolf Plate";
ITEM.model = "models/begotten/headgroup_props/reaverplate.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/bjornling_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0 -- item does not degrade
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure lourde forgée en fer noir infernal. Ornée de crânes et de peaux d'hommes comme de démons, les Loups Rouges du Clan Reaver veillent à ce que leur présence soit connue.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.25, -- increases fall damage by 25%
}

ITEM.bluntScale = 0.70; -- reduces blunt damage by 30%
ITEM.pierceScale = 0.60; -- reduces pierce damage by 40%
ITEM.slashScale = 0.50; -- reduces slash damage by 50%
ITEM.bulletScale = 0.15; -- reduces bullet damage by 85%
ITEM.stabilityScale = 0.20; -- reduces stability damage by 80%
ITEM.insulation = 80;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begotten/goreicwarfighters/bjornling.mdl";
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Kalkaslash Kingplate";
ITEM.model = "models/begotten/headgroup_props/housecarlarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/lord_vasso_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0 -- item does not degrade
--ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 6;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure de plaques forgée dans l'acier suprême de Shagalax. Elle est destinée à un Roi du Trône d'Écorce.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.requiredRanks = {"King"};
ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	--[HITGROUP_HEAD] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.70; -- reduces blunt damage by 30%
ITEM.pierceScale = 0.60; -- reduces pierce damage by 40%
ITEM.slashScale = 0.50; -- reduces slash damage by 50%
ITEM.bulletScale = 0.15; -- reduces bullet damage by 85%
ITEM.stabilityScale = 0.20; -- reduces stability damage by 80%
ITEM.insulation = 80;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begotten/goreicwarfighters/goreking.mdl";
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Shingar's Blackwolf Hauberk";
ITEM.model = "models/begotten/headgroup_props/housecarlarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/lord_vasso_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0 -- item does not degrade
--ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 6;
ITEM.weightclass = "Heavy";
ITEM.type = "chainmail";
ITEM.description = "Cotte de mailles shagalaxienne, cuir bouilli et peau de loup ensanglantée. Une armure brutale qui fait parfaitement l'affaire.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.requiredRanks = {"King"};
ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	--[HITGROUP_HEAD] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.70; -- reduces blunt damage by 30%
ITEM.pierceScale = 0.60; -- reduces pierce damage by 40%
ITEM.slashScale = 0.50; -- reduces slash damage by 50%
ITEM.bulletScale = 0.15; -- reduces bullet damage by 85%
ITEM.stabilityScale = 0.20; -- reduces stability damage by 80%
ITEM.insulation = 80;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begotten/goreicwarfighters/shingar.mdl";
end;

ITEM.runSound = {
	"armormovement/body-hauberk-1.wav.mp3",
	"armormovement/body-hauberk-2.wav.mp3",
	"armormovement/body-hauberk-3.wav.mp3",
	"armormovement/body-hauberk-4.wav.mp3",
	"armormovement/body-hauberk-5.wav.mp3",
};

ITEM.walkSound = {
	"armormovement/body-hauberk-b4.wav.mp3",
	"armormovement/body-hauberk-b5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Emperor Varazdat's Nigerii Hauberk";
ITEM.model = "models/begotten/headgroup_props/hellspikearmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/lord_vasso_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0 -- item does not degrade
--ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 6;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure de l'Empereur de l'Empire du Nigerii Oriental. Elle est manifestement taillée pour une silhouette corpulente.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Children of Satan"};

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	--[HITGROUP_HEAD] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.70; -- reduces blunt damage by 30%
ITEM.pierceScale = 0.60; -- reduces pierce damage by 40%
ITEM.slashScale = 0.50; -- reduces slash damage by 50%
ITEM.bulletScale = 0.15; -- reduces bullet damage by 85%
ITEM.stabilityScale = 0.20; -- reduces stability damage by 80%
ITEM.insulation = 80;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
		return "models/begotten/satanists/emperorvarazdat.mdl";
end;

ITEM.runSound = {
	"armormovement/body-armor-1.WAV.mp3",
	"armormovement/body-armor-2.WAV.mp3",
	"armormovement/body-armor-3.WAV.mp3",
	"armormovement/body-armor-4.WAV.mp3",
	"armormovement/body-armor-5.WAV.mp3",
	"armormovement/body-armor-6.WAV.mp3",
};

ITEM.walkSound = {
	"armormovement/body-armor-b4.WAV.mp3",
	"armormovement/body-armor-b5.WAV.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Elder Druid Robes";
ITEM.model = "models/begotten/headgroups_props/elderdruid.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elder_druid_robes.png"
ITEM.helmetIconOverride = "materials/begotten/ui/itemicons/gore_skull_helm.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 55
ITEM.type = "leather";
ITEM.hasHelmet = true;
ITEM.weight = 3.5;
ITEM.weightclass = "Light";
ITEM.description = "Un ensemble original de Robes de Druide des Lames, miraculeusement préservé à travers les siècles. Il est indissociablement lié à un Heaume de Minotaure Dread et bénéficie d'une protection élevée grâce à l'Aura Maternelle. Il semble que les projectiles balistiques soient totalement inefficaces contre cette armure, l'aura la protégeant de ces moyens lâches.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Shagalax", "Clan Harald", "Clan Reaver"};
ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

ITEM.effectiveLimbs = {
	[HITGROUP_HEAD] = true,
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.25, -- increases fall damage by 25%
}

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.85; -- reduces stability damage by 15%
ITEM.bulletScale = 0.10; -- reduces bullet damage by 90%
ITEM.insulation = 70;

ITEM.attributes = {"mothers_blessing", "increased_regeneration", "fear"};
ITEM.components = {breakdownType = "breakdown", items = {"hide", "hide", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/goreicwarfighters/elderdruid.mdl";
	--else
		--return "models/begotten/satanists/lordvasso/male_56.mdl";
	--end;
end;

ITEM:Register();