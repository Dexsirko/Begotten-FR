local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Darklander Spice Guard Armor";
ITEM.model = "models/begotten/headgroups_props/spiceguard.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/darklander_spice_guard_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65;
ITEM.weight = 6.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Forgée dans l'acier infernal le plus pur et ornée de soie fine d'Orient, cette armure appartenait manifestement à un membre de la Garde des Épices. Ces guerriers des Terres Sombres protègent les routes commerciales et escortent les marchands.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.faction = "Children of Satan";

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/darklanderspiceguard.mdl";
	--else
		--return "models/begotten/satanists/darklanderspiceguard.mdl";
	--end;
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
ITEM.name = "Dread Armor";
ITEM.model = "models/begotten/headgroup_props/dreadarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/dread_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une armure lourde forgée dans les flammes de l'Enfer, digne des plus loyaux serviteurs de Satan. Sa composition en acier infernal offre une protection suprême contre toutes les formes de dégâts.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";
ITEM.faction = "Children of Satan";

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/dreadarmor.mdl";
	--else
		--return "models/begotten/satanists/dreadarmor.mdl";
	--end;
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
ITEM.name = "Elegant Robes";
ITEM.group = "satanists/elegantrobes";
ITEM.model = "models/begotten/headgroup_props/elegantrobes.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elegant_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 45
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Des robes élégantes qui ne conviennent qu'aux adeptes ornés de Satan. Elles sont conçues avec expertise à partir de tissus exotiques qui affichent la suprématie et la richesse, tout en offrant une protection inégalée sans sacrifier la grâce ou la mobilité.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"fine_steel_chunks", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Heavy Hellplate Armor";
ITEM.group = "satanists/hellplateheavy";
ITEM.model = "models/begotten/headgroup_props/hellplateheavyarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/heavy_hellplate_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Autrefois l'armure digne des Sentinelles Blanches et l'emblème de la Maison Philimaxio, cette armure a depuis été reforgée de nombreuses fois dans les flammes infernales, ne ressemblant plus que de très loin à sa forme originelle. Son existence est une honte pour l'Ordre du Gardien et une insulte flagrante à la Lumière. Cette armure spécifique a été renforcée par des plaques supplémentaires, la rendant extrêmement protectrice au détriment de la mobilité et de la grâce.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

ITEM.requiredbeliefs = {"hauberk"};
ITEM.requiredSubfactions = {"Philimaxio"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 35%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hellplate Armor";
ITEM.group = "satanists/hellplatemedium";
ITEM.model = "models/begotten/headgroup_props/hellplatemediumarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/hellplate_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Autrefois l'armure digne des Sentinelles Blanches et l'emblème de la Maison Philimaxio, cette armure a depuis été reforgée maintes fois dans les flammes infernales, ne conservant qu'une lointaine ressemblance avec sa forme originelle. Son existence est une honte pour l'Ordre du Gardien et une insulte flagrante à la Lumière.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hellspike Armor";
ITEM.model = "models/begotten/headgroup_props/hellspikearmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/hellspike_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une armure de plaques métalliques ornée de pointes, dont le design trouve son origine dans les Terres Obscures. Ces modèles orientaux furent autrefois des pièces prisées dans les collections des nobles glaziques, mais ils sont désormais associés aux disciples du Seigneur des Ténèbres.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/hellspike";
ITEM.faction = "Children of Satan";

ITEM.attributes = {"spiked"}

ITEM.requiredbeliefs = {"hauberk"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/hellspike_armor.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
	--end;
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
ITEM.name = "Wraith Armor";
ITEM.model = "models/begotten/headgroup_props/wraitharmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/wraith_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure d'Acier Damné, réputée contenir les ossements de nombreux sacrifiés. Façonnée à l'image d'un squelette, elle est assurée de terrifier les ennemis.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/wraithplate";
ITEM.faction = "Children of Satan";

ITEM.attributes = {"fear"};
ITEM.requiredbeliefs = {"hauberk", "primevalism"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "human_bone", "human_bone", "human_bone", "human_bone", "human_bone"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/wraitharmor.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
	--end;
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
ITEM.name = "Darklander Immortal Armor";
ITEM.uniqueID = "darklander_immortal_armor"
ITEM.model = "models/begotten/headgroups_props/darklanderimmortal.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/darklander_immortal_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0
ITEM.permanent = true;
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure de plaques lourde de conception nigériane orientale. Elle est destinée aux fameux Immortels, une bande d'élite de guerriers dévoués à l'Empereur. Une magie obscure empêche quiconque n'étant pas de la lignée du Roi des Rois de porter cette armure.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Children of Satan"};
ITEM.attributes = {"conditionless", "not_unequippable"};
ITEM.overlay = "begotten/zomboverlay/new/immortal";
ITEM.faction = "Children of Satan";

ITEM.requiredbeliefs = {"hauberk"};
ITEM.requiredSubfactions = {"Varazdat"};

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "human_bone", "human_bone", "human_bone", "human_bone", "human_bone"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/satanists/darklanderimmortal.mdl";
	--else
		--return "models/begotten/satanists/hellspike_armor.mdl";
	--end;
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
ITEM.name = "Helldancer Robes";
ITEM.group = "satanists/elegantrobesupgrade";
ITEM.model = "models/begotten/items/elegantrobesupgrade.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/elegantrobesupgrade.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 55
ITEM.type = "leather";
ITEM.weight = 4;
ITEM.weightclass = "Light";
ITEM.description = "Des robes élégantes reprenant les motifs du Ministère Glazic et des Princes de l'Ordre Doré Nigerii, ajustées parfaitement sous une armure noire aux motifs culturels contrastés similaires. Cette armure rend hommage aux Danseurs de Sang des Ténèbres ; une troupe de gladiateurs qui abattaient sadiquement des foules d'esclaves nus avec leurs épées jumelles, dansant et riant tout du long.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.90; -- reduces pierce damage by 10%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"fine_steel_chunks", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Blackplate Armor";
ITEM.group = "satanists/halfhellplate";
ITEM.model = "models/begotten/items/halfhellplate.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/halfhellplate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65;
ITEM.weight = 5.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Armure noire maudite, reforgée d'innombrables fois en Enfer. Fut-elle jadis la cuirasse d'un Gardien de Porte vénéré, ou ces plaques servirent-elles peut-être un Janissaire ? Nul n'importe plus, car elle est désormais portée par les Enfants de Satan.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Children of Satan";

-- specifies which hitgroups will be affected by blunt, slash, pierce and other damage type scaling.
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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hell Baron Gothic Plate";
ITEM.model = "models/begotten/headgroups_props/ornatehellplatebaron.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/ornatehellplatebaron.png"
ITEM.helmetIconOverride = "materials/begotten/ui/itemicons/hellplate_helmet.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Plastron noir en acier infernal de la plus haute qualité, taillé sur mesure pour le plus brutal, doux, répugnant, charmant, terrible, bienveillant, magnifique et ogresque Baron des Enfers qui puisse jamais exister !";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Dark"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/hellplate";
ITEM.faction = "Children of Satan";
ITEM.requiredRanks = {"Hell Baron"};

ITEM.requiredbeliefs = {"hauberk"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_HEAD] = true,
	[HITGROUP_CHEST] = true,
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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
ITEM.slashScale = 0.55; -- reduces slash damage by 45%
ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
ITEM.stabilityScale = 0.50; -- reduces stability damage by 50%
ITEM.insulation = 65;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "gold_ingot", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/satanists/ornatehellplatebaron.mdl";
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