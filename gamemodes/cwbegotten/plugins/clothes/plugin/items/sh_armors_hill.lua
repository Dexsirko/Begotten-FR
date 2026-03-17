local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Hillkeeper Hauberk"; -- Gatekeeper plate equivalent
ITEM.group = "hillkeepers/acolyte";
ITEM.model = "models/begotten_apocalypse/items/hilltop_chainmail.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_chainmail.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Cotte de mailles sur un aketon tissé, avec une tunique bleue en dessous indiquant l'allégeance à la Colline. Communément utilisée par la Garde.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 55; -- Adds 24% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hillkeeper Fine Brigandine"; -- Fine Gatekeeper Plate equivalent
ITEM.group = "hillkeepers/fine_coat";
ITEM.model = "models/begotten_apocalypse/items/hill_fine_coat_item.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hill_fine_coat_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "chainmail";
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.description = "Un ensemble de brigandine finement ouvragé, teinté de bleu pour afficher l'allégeance à la Colline. Souvent utilisé par les Émissaires et les Gardes vétérans ayant accompli plus d'une rotation de service.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 60; -- Adds 24% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hillkeeper Defender Plate"; -- -- Heavy Gatekeeper Reinforced Plate equivalent
ITEM.group = "hillkeepers/coat_of_plate";
ITEM.model = "models/begotten_apocalypse/items/hilltop_coat_item.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_coat_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80
ITEM.type = "chainmail";
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.description = "Acier froid sur mailles cloutées et fin aketon. Armure majestueuse portée par l'élite de la Colline, des vétérans qui ont découvert que tout ce qu'ils savaient faire, c'était combattre.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 65; -- Adds 40% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hillkeeper Signifer Plate"; -- Vexillifer Gatekeeper Plate equivalent
ITEM.model = "models/begotten_apocalypse/items/hilltop_coat_item.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_coat_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70
ITEM.type = "chainmail";
ITEM.hasHelmet = true;
ITEM.weight = 7;
ITEM.weightclass = "Medium";
ITEM.description = "Un ensemble avec une tête de loup drapée sur un heaume conique à masque de chaînes, ne laissant paraître que les yeux. Porté par les hommes des Collines qui ont prêté serment de loyauté éternelle, préférant la mort à la chute de leurs bannières.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";
ITEM.helmetIconOverride = "materials/begotten_apocalypse/ui/itemicons/hill_signifier.png"

ITEM.attributes = {"fear", "banner_blessing"};

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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 80;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/bmoc/hill/hill_signifier.mdl";
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
ITEM.name = "Hillkeeper Aketon"; -- Gatekeeper gambeson equivalent
ITEM.group = "hillkeepers/disciple";
ITEM.model = "models/begotten_apocalypse/items/hilltop_gambeson.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_gambeson.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.weight = 2.5;
ITEM.weightclass = "Light";
ITEM.description = "Un aketon de lin épais et matelassé, recouvert de cuir par-dessus. Chaud et confortable, à peine assez protecteur pour être considéré comme plus qu'un manteau d'hiver.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Hide Parka";
ITEM.group = "wanderers/hidewanderer";
ITEM.model = "models/begotten_apocalypse/items/HideOutfit.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/HideOutfit.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un parka confectionné à partir de peaux assemblées, enroulées et maintenues par des liens et une couture rudimentaire. Isolant et chaud, voire confortable.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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
ITEM.insulation = 70;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "leather", "cloth", "cloth", "cloth", "cloth"}, xp = 30};

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
ITEM.name = "Bearhide Parka";
ITEM.group = "wanderers/bearhidewanderer";
ITEM.model = "models/begotten_apocalypse/items/BearSkin.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/BearSkin.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 35
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un parka confectionné dans la grande peau d'un ours, avec un gilet de cuir en dessous. Il est maintenu par une couture soignée. Très confortable, très chaud et protecteur.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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
ITEM.insulation = 80;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "leather", "cloth", "cloth", "cloth", "cloth"}, xp = 30};

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
ITEM.name = "Hillkeeper Heavy Coat of Plates"; -- Heavy Gatekeeper Plate equivalent
ITEM.model = "models/begotten_apocalypse/items/hilltop_heavy_item.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_heavy_item.png"
ITEM.category = "Armor"
ITEM.group = "hillkeepers/heavy_lamellar";
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une lourde armure de plaques d'acier sur une cotte de mailles. Symbole de force parmi les hommes du Nord.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

ITEM.requiredbeliefs = {"hauberk"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 65; -- Adds 28% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth"}, xp = 30};

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
ITEM.name = "Hillkeeper Master-at-Arms Harness";
ITEM.group = "hillkeepers/master_at_arms";
ITEM.model = "models/begotten_apocalypse/items/hilltop_master_item.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/hilltop_master_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 7;
ITEM.weightclass = "Heavy";
ITEM.type = "chainmail";
ITEM.description = "Un ensemble de plaques et d'écailles d'acier imbriquées reposait sur un haubert de mailles lourd et un long gambison, ornés de sigils et d'emblèmes ouvragés."
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Hillkeeper"};
ITEM.requiredRanks = {"Master-At-Arms"};
ITEM.faction = "Hillkeeper";

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

ITEM.bluntScale = 0.75; -- reduces blunt damage by 25%
ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
ITEM.slashScale = 0.55; -- reduces slash damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.bulletScale = 0.35; -- reduces bullet damage by 65%
ITEM.insulation = 65; -- Adds 48% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%. 

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "leather", "leather", "leather", "cloth"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Low Ministry Vestments";
ITEM.group = "wanderers/cleric";
ITEM.model = "models/begotten_apocalypse/items/cleric.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/cleric.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 35
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Épais bandages grossiers teints en bleu, signe de piété simple pour les membres inférieurs du clergé du Ministère.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Holy Hierarchy"};
ITEM.faction = "Holy Hierarchy";
ITEM.bodygroupCharms = {["codex_solis"] = {1, 1}};

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
ITEM.insulation = 50; -- Adds 32% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "leather", "leather", "cloth", "cloth"}, xp = 30};

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
ITEM.name = "Footpad Wrappings";
ITEM.group = "wanderers/footpad";
ITEM.model = "models/begotten_apocalypse/items/footpadarmor.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/footpadarmor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 35
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un simple ouvrage de pourpoint en cuir posé sur des vêtements de tissu, pour mieux se protéger des éléments sauvages et se fondre dans la neige parmi les autres pécheurs.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.insulation = 65;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "cloth", "cloth"}, xp = 30};

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
ITEM.name = "Low Ministry Cuirass";
ITEM.group = "wanderers/clericarmored";
ITEM.model = "models/begotten_apocalypse/items/clericarmored.mdl"
ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/clericarmored.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une plaque d'acier cannelée finement ouvragée, inspirée des paroles de Maximus, fixée sur les vêtements du Bas Ministère. Les tensions croissantes sur la Colline ont engendré un schisme parmi son clergé : ceux de la soutane qui restent attachés à la sécurité et à la tradition, craignant pour leurs âmes – et ceux qui osent prendre les armes contre les goules et les apostats, au service de mystères plus récents.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Holy Hierarchy"};
ITEM.faction = "Holy Hierarchy";
ITEM.bodygroupCharms = {["codex_solis"] = {1, 1}};

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
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 70; -- Adds 36% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Hillkeeper Low Brigandine"; -- Gatekeeper Halfplate equivalent
ITEM.group = "hillkeepers/halfplate";
ITEM.model = "models/begotten_apocalypse/items/halfplate.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/halfplate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 48
ITEM.type = "leather";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "Plastrons de brigandine ajustés sur un aketon. Armement économique couramment utilisé par la Garde.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 55; -- Adds 24% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Hillkeeper Mailed Brigandine"; -- Gatekeeper Plate equivalent
ITEM.group = "hillkeepers/nevsky";
ITEM.model = "models/begotten_apocalypse/items/nevsky.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/nevsky.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.description = "Brigandine sur cotte de mailles ajustée avec un Aketon. Dans le Grand Nord, les couches de protection sont ce qui maintiennent votre sang chaud et à l'intérieur.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Hillkeeper";

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 62; -- Adds 24% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}, xp = 30};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Northern Orthodoxist Battle Monk Robes";
ITEM.group = "wanderers/anglo";
ITEM.model = "models/begotten/items/anglochainworld.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/anglochainworld.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Armure et robes adaptées aux climats rigoureux. Cet infâme accoutrement est associé à la Grande Orthodoxie du Nord, une bande de fanatiques qui ont pillé et rançonné les pèlerins du Nord au nom de l'expiation et du remboursement de leurs dettes envers Sol. Il semble protégé par une aura de jugement qui inspire un profond malaise aux pécheurs.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";

ITEM.kinisgerOverride = true;
ITEM.requiredbeliefs = {"repentant"};

ITEM.attributes = {"solblessed"};

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 60; -- Adds 36% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "leather", "leather"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

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
ITEM.name = "Flayed Fuck Armor";
ITEM.group = "wanderers/flayedfuck";
ITEM.model = "models/begotten_apocalypse/items/flayedfuck.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/flayedfuck.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.5
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.description = "Un manteau répugnant composé de couches sur couches de chair en décomposition. Il dégage une puanteur misérable. Les sauvages des Terres Lointaines du Nord sont connus pour le porter afin de se protéger du climat brutal.";
ITEM.useSound = "vj_gib/gibbing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 45; -- Adds 28% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "breakdown", items = {"humanmeat", "humanmeat", "humanmeat", "humanmeat", "humanmeat", "humanmeat", "humanmeat"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"vj_flesh/alien_flesh1.wav",
	"vj_flesh/alien_flesh2.wav",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Fur Vest";
ITEM.group = "wanderers/furvest";
ITEM.model = "models/begotten_apocalypse/items/furvest.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/furvest.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.25
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.description = "Un lourd gilet en fourrures animales et tissus de récupération. Il offre une protection convenable contre les intempéries.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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
ITEM.slashScale = 0.95; -- reduces slash damage by 5%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth", "cloth", "leather"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 1500, bNoSupercrate = true};

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
ITEM.name = "Envelope Dress";
ITEM.group = "wanderers/envelopedress";
ITEM.model = "models/begotten_apocalypse/items/envelopedress.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/envelopedress.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.25
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 24
ITEM.type = "leather";
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.description = "Une robe bon marché, mais très pratique, faite de chiffons de récupération déchirés, probablement pris sur des morts. Elle protège des intempéries juste assez pour survivre.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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
ITEM.insulation = 45;

ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth", "cloth"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 1500, bNoSupercrate = true};

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
ITEM.name = "Armored Furs";
ITEM.group = "wanderers/armoredfurs";
ITEM.model = "models/begotten_apocalypse/items/armoredfurs.mdl"
ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/armoredfurs.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 48
ITEM.type = "leather";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Fourrures épaisses superposées à du cuir clouté. Cela offre une bonne isolation et une excellente protection contre les bêtes voraces.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};

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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 65; -- Adds 28% insulation. Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "leather", "leather", "leather"}};

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

ITEM.walkSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM:Register();
