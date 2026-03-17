--[[
- LIGHT ARMOR MINIMUM VALUES

PROTECTION - 25

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.stabilityScale = 0.75; -- reduces stability damage by 25%

- MEDIUM ARMOR MINIMUM VALUES

PROTECTION - 40
FALL DAMAGE - +10%

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%

- HEAVY ARMOR MINIMUM VALUES

PROTECTION - 65
FALL DAMAGE - +15%

ITEM.bluntScale = 0.85; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%

--]]

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Wanderer Mail";
ITEM.group = "prelude_wanderers/wanderertabard";
ITEM.model = "models/begottenprelude/items/wanderertabard.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/wanderertabard.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 53
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une cotte de mailles rouillée portée sous un pourpoint de cuir délabré. Elle ne porte ni couleurs ni insignes, en faisant le choix d'armure par excellence du Rôdeur.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
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
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 35; -- Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "leather", "leather"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 2500, bNoSupercrate = true};

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
ITEM.name = "Faithling Chainmail";
ITEM.uniqueID = "faithling_mail"
ITEM.group = "prelude_wanderers/romanmail";
ITEM.model = "models/begotten_apocalypse/items/hilltop_chainmail.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/romanmail_male.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "Cotte de mailles grossièrement forgée de conception païenne. Ce type d'armure est fréquemment observé aux confins des districts comtaux, où les pillards rôdent en toute liberté et mettent les villages à sac.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
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
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
ITEM.insulation = 35; -- Armor only accounts for 80% of total insulation, helmets cover the rest of the 20%.

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "leather"}};

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
ITEM.name = "Wastelord Hauberk";
ITEM.uniqueID = "wastelord_armor"
ITEM.group = "prelude_wanderers/templar";
ITEM.model = "models/begottenprelude/goose/templarprop.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/templarprop.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.65
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 82;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une armure de plaques d'acier impeccablement forgée, surmontée d'un tabard sans ornement. Portée presque exclusivement par des mercenaires et de puissants survivants anonymes des terres désolées, cette armure possède un pouvoir étrange empêchant les factions de la revêtir.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredbeliefs = {"hauberk"};
ITEM.requiredFactions = {"Wanderer"};
ITEM.attributes = {"wastelord"};

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

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth"}};

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
ITEM.name = "Wanderer Crude Plate";
ITEM.group = "wanderers/crudeplate";
ITEM.model = "models/begotten/headgroups_props/crudeplate.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/crude_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une armure grossièrement assemblée qui offre pourtant une protection exceptionnelle. Elle est constituée de plaques d'acier recouvrant presque tout le corps.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 9500};

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
ITEM.name = "Gatekeeper Plate";
ITEM.group = "gatekeepers/gatekeepermedium";
ITEM.model = "models/items/magic/armors/player_armors/player_armor_chainmail.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gatekeeper_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une armure de plaques de fer couramment utilisée par l'Ordre Sacré des Gardiens de la Porte.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

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
ITEM.name = "Fine Gatekeeper Plate";
ITEM.group = "gatekeepers/gatekeeperfine";
ITEM.model = "models/items/magic/armors/player_armors/player_armor_plate.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/heavy_gatekeeper_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "chainmail";
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.description = "Une armure améliorée, inspirée de celle utilisée par le Saint Ordre des Gardiens, renforcée d'acier fin et de plaques supplémentaires.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

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
ITEM.name = "Ornate Gatekeeper Plate";
ITEM.group = "gatekeepers/gatekeeperornate";
ITEM.model = "models/items/magic/armors/player_armors/player_armor_plate_magic.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/ornate_gatekeeper_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70
ITEM.type = "chainmail";
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.description = "Une armure plaquée or extrêmement coûteuse, inspirée de celle utilisée par le Saint-Ordre des Gardiens, renforcée d'acier fin et de plaques supplémentaires.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"gold_ingot", "gold_ingot", "fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

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
ITEM.name = "Vexillifer Gatekeeper Plate";
ITEM.model = "models/items/magic/armors/player_armors/player_armor_plate_magic.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/ornate_gatekeeper_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70
ITEM.type = "chainmail";
ITEM.hasHelmet = true;
ITEM.weight = 7;
ITEM.weightclass = "Medium";
ITEM.description = "L'armure dorée et ornée d'un Vexillifer, renforcée d'acier fin et surmontée d'une peau de lion et d'un masque de fer stoïque.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFaiths = {"Faith of the Light"};
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

ITEM.attributes = {"fear", "banner_blessing"};
ITEM.kinisgerOverride = true;

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
ITEM.insulation = 55;

ITEM.components = {breakdownType = "meltdown", items = {"gold_ingot", "fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/gatekeepers/vexi.mdl";
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
ITEM.name = "Auxiliary Gambeson";
ITEM.group = "gatekeepers/gatekeeperlight_black";
ITEM.model = "models/begotten/headgroup_props/gatekeeperlightarmor_black.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/auxiliary_gambeson.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un gambison de cuir clouté avec des manches en tissu teintes en noir, pour distinguer les Auxiliaires des troupes de combat standard des Gardiens de la Porte.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 30;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Gatekeeper Gambeson";
ITEM.group = "gatekeepers/gatekeeperlight";
ITEM.model = "models/begotten/headgroup_props/gatekeeperlightarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gatekeeper_gambeson_new.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un gambison de cuir clouté aux manches de tissu teintes d'un rouge vif. Protection minimaliste pour les gardes de roturiers.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 30;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Praeventor Gambeson";
ITEM.group = "gatekeepers/gatekeeperlight_brown";
ITEM.model = "models/begotten/headgroup_props/gatekeeperlightarmor_brown.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/praeventor_gambeson.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Un gambison de cuir clouté avec des manches en tissu teintes en brun, pour aider les Praeventors à mieux se fondre dans le Wasteland.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 30;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Renegade Disciple Robes";
ITEM.model = "models/begotten/headgroups_props/renegadearmor2.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/renegade_disciple_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.hasHelmet = true;
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Robe de cuir portée par les Gardiens de la Porte du Pape Adyssa.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Pope Adyssa's Gatekeepers";

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
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/gatekeepers/renegadedisciple.mdl";
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Renegade Acolyte Robes";
ITEM.model = "models/begotten/headgroups_props/renegadearmor1.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/renegade_acoylte_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30
ITEM.type = "leather";
ITEM.hasHelmet = true;
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Robe de cuir portée par les Gardiens de la Porte du Pape Adyssa.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Pope Adyssa's Gatekeepers";

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
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/gatekeepers/renegadeacolyte.mdl";
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Padded Gambeson";
ITEM.uniqueID = "padded_coat"
ITEM.group = "prelude_wanderers/wanderergambeson";
ITEM.model = "models/begottenprelude/items/wanderergambeson.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/wanderergambeson.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 37
ITEM.type = "leather";
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.description = "Un gambison matelassé en cuir et tissu épais offrant une protection convenable.";
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
ITEM.stabilityScale = 0.7; -- reduces stability damage by 30%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "leather", "leather", "cloth", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Orthodoxist Monk Robes";
ITEM.group = "wanderers/monkrobes";
ITEM.model = "models/begotten/headgroups_props/monkrobes.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/monk_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Robe brune avec un surcot en cuir pour une protection minimale. La tenue d'un ordre dévot de flagellants paysans. Elle semble protégée par une aura de jugement qui inspire un grand malaise aux pécheurs.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "cloth", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Orthodoxist Battle Monk Robes";
ITEM.group = "wanderers/monkmail";
ITEM.model = "models/begotten/headgroups_props/monkmail.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/battle_monk_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 60
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Robe de mailles avec un surcot en cuir bouilli. Fabriqué pour un ordre de moines guerriers qui cherchent l'extinction de l'humanité. Elle semble protégée par une aura de jugement qui provoque un grand malaise chez les pécheurs.";
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
ITEM.insulation = 45;

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
ITEM.name = "Old Soldier Cuirass";
ITEM.group = "wanderers/oldsoldier";
ITEM.model = "models/begottenprelude/items/oldsoldier.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/old_soldier_cuirass.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 40
ITEM.type = "metal";
ITEM.weight = 3.5;
ITEM.weightclass = "Light";
ITEM.description = "L'uniforme usé d'un soldat ayant servi dans les armées de campagne de l'Empire de la Lumière, peut-être même lors des célèbres campagnes de Lord Maximus. Il est protégé par une cuirasse et des plaques de genoux, mais ne comporte aucune protection pour les bras.";
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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "leather", "leather", "cloth", "cloth", "cloth"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 3000};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Light Brigandine Armor";
ITEM.group = "wanderers/brigandinelight";
ITEM.model = "models/begotten/headgroup_props/brigandinelight.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/light_brigandine.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 35
ITEM.type = "leather";
ITEM.weight = 2.5;
ITEM.weightclass = "Light";
ITEM.description = "Une brigandine légère en cuir qui offre une protection adéquate pour son faible poids.";
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
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "leather", "leather", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Brigandine Armor";
ITEM.group = "wanderers/brigandine";
ITEM.model = "models/begotten/headgroup_props/brigandinemedium.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/brigandine.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 50
ITEM.type = "leather";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "Une brigandine de cuir renforcée de plaques de fer, offrant une protection adéquate pour son faible poids.";
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
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "leather", "leather", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Merchant Robes";
ITEM.group = "wanderers/merchant";
ITEM.model = "models/begotten/headgroup_props/merchant.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/merchant_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 15
ITEM.type = "leather";
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.description = "Ces robes s'inspirent de la tenue des marchands des Terres Sombres, réputés pour leur commerce de biens exotiques. Elles offrent une protection raisonnable malgré leur légèreté.";
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
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scribe Robes";
ITEM.group = "wanderers/scribe";
ITEM.model = "models/begotten/headgroup_props/scribe.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/scribe_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 15
ITEM.type = "leather";
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.description = "Robe portée par les scribes de la Hiérarchie Sacrée, symbolisant leur rang.";
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
ITEM.insulation = 50;

ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Plague Doctor Robes";
ITEM.model = "models/begottenprelude/goose/plagueitem.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/plague.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 15
ITEM.type = "leather";
ITEM.hasHelmet = true;
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.description = "De fines robes noires avec un masque à bec empli d'herbes à l'odeur étrange. Elles confèrent à leur porteur une silhouette synonyme de mort ; la Peste est venue pour nous tous.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

ITEM.requiredbeliefs = {"plague_doctor"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.insulation = 45;

ITEM.attributes = {"disease_resistance", "practitioner", "miracle_doctor"};
ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth", "cloth", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begottenprelude/goose/plague.mdl";
	--else
		--return "models/begotten/wanderers/plaguedoc.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Scrapper Grunt Plate";
ITEM.group = "wanderers/scrappergrunt";
ITEM.model = "models/begotten/headgroup_props/scrappergrunt.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/scrapper_grunt_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 45
ITEM.type = "plate";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une série de plaques de ferraille assemblées qui forment une armure rudimentaire mais efficace.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Crast", "Clan Grock"};

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
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 35;

ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "cloth"}};

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
ITEM.name = "Scrapper Machinist Plate";
ITEM.group = "wanderers/scrapper";
ITEM.model = "models/begotten/headgroup_props/scrapperarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/scrapper_machinist_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 68
ITEM.type = "plate";
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.description = "Une série de plaques de ferraille assemblées qui forment une armure rudimentaire mais efficace.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Crast", "Clan Grock"};

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
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "breakdown", items = {"scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap", "scrap"}};

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
ITEM.name = "Exile Knight Armor";
ITEM.model = "models/begotten/headgroup_props/exileknightarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/exile_knight_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.concealsFace = true;
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une vieille armure ayant autrefois appartenu à un Chevalier de Sol déchu. Bien que recouverte d'un tissu en lambeaux ayant mal résisté aux conditions hostiles du désert, l'armure elle-même est dans un état nettement meilleur, avec des marques dorées encore visibles bien que passées.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/knighthelmet";

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

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "leather", "cloth"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 1000, supercrateOnly = true};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/exileknight.mdl";
	--else
		--return "models/begotten/gatekeepers/highgatekeeper02.mdl";
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
ITEM.name = "Knight Plate"; 
ITEM.group = "gatekeepers/knight_set"
ITEM.model = "models/begotten/headgroup_props/knightarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/knight_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une armure de plaques en acier gothique, portée par les Chevaliers de Sol. Elle a été bénie par une énergie catalytique et ne peut donc être portée par les indignes.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Holy Hierarchy"};
ITEM.faction = "Holy Hierarchy";
ITEM.genderless = true;

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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 35%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "leather", "cloth"}};

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
ITEM.name = "Knight Justicar Plate";
ITEM.group = "gatekeepers/knight_justicar"
ITEM.model = "models/begotten/headgroups_props/justicararmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/knight_justicar_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Acier noirci d'élite orné des couleurs d'une noble maison. Il a été béni d'une énergie catalytique et ne peut donc être porté par les indignes.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Holy Hierarchy"};
--ITEM.overlay = "begotten/zomboverlay/gatekeep1";
ITEM.faction = "Holy Hierarchy";
ITEM.genderless = true;

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
ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
ITEM.stabilityScale = 0.50; -- reduces stability damage by 50%
ITEM.insulation = 40;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "leather", "leather"}};

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
ITEM.name = "Inquisitor Armor";
ITEM.group = "gatekeepers/inquisitor";
ITEM.model = "models/begotten/headgroup_props/inquisitorarmor_brown.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/inquisitor_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 55;
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.type = "leather";
ITEM.description = "Un manteau de cuir brun robuste avec rembourrage et sacoches, porté sur une cuirasse de fer marquée par les combats. Il s'agit d'une armure de qualité, qui affiche fièrement ses insignes et son design tout en préservant la liberté de mouvement et la souplesse du porteur.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Holy Hierarchy";
ITEM.bodygroupCharms = {["holy_sigils"] = {1, 1}};

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
	[DMG_FALL] = -0.08, -- increases fall damage by 8%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "leather", "leather", "leather", "leather", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Black Inquisitor Armor";
ITEM.group = "gatekeepers/blackinquisitor";
ITEM.model = "models/begotten/headgroup_props/inquisitorarmor_black.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/black_inquisitor_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 60;
ITEM.weight = 6.2;
ITEM.weightclass = "Medium";
ITEM.type = "leather";
ITEM.description = "Une cape de cuir noir robuste avec rembourrage et sacoches, portée sur une cuirasse d'acier marquée par les combats. Il s'agit d'une armure de qualité, qui affiche fièrement ses insignes et son design tout en préservant la liberté de mouvement et la souplesse du porteur.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Holy Hierarchy";
ITEM.bodygroupCharms = {["holy_sigils"] = {1, 1}};

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
	[DMG_FALL] = -0.08, -- increases fall damage by 8%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "leather", "leather", "leather", "leather", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "High Inquisitor Armor";
ITEM.group = "gatekeepers/whiteinquisitor";
ITEM.model = "models/begotten/headgroup_props/inquisitorarmor_white.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/high_inquisitor_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 65;
ITEM.weight = 6.5;
ITEM.weightclass = "Medium";
ITEM.type = "leather";
ITEM.description = "Un manteau de cuir blanc robuste avec rembourrage et sacoches, porté sur une cuirasse d'acier finement ouvragée. Il s'agit d'une armure de qualité qui affiche fièrement ses insignes et son design, sans pour autant entraver les mouvements et la flexibilité du porteur. Cet équipement particulier de l'Inquisition est remarquablement bien fabriqué et tenu en haute estime.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Holy Hierarchy";
ITEM.bodygroupCharms = {["holy_sigils"] = {1, 1}};

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
	[DMG_FALL] = -0.08, -- increases fall damage by 8%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"steel_chunks", "leather", "leather", "leather", "leather", "cloth", "cloth", "cloth"}};

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

--[[ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};]]--

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Heavy Gatekeeper Reinforced Plate";
ITEM.uniqueID = "high_gatekeeper_reinforced_plate";
ITEM.model = "models/begotten/headgroup_props/highgatekeeperarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/high_gatekeeper_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 8.5;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Renforcée par une épaisseur d'acier accrue, cette plaque est blindée selon les normes d'un équipement de Chevalier.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/gatekeeperhelmet";
ITEM.faction = "Gatekeeper";

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
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/gatekeepers/highgatekeeper01.mdl";
	--else
		--return "models/begotten/gatekeepers/highgatekeeper02.mdl";
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
ITEM.name = "Heavy Gatekeeper Plate";
ITEM.uniqueID = "high_gatekeeper_heavy_plate";
ITEM.model = "models/begotten/headgroup_props/highgatekeeperarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/high_gatekeeper_reinforced_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Une solide armure de plaques d'acier, marquée par les combats incessants et les guerres.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.overlay = "begotten/zomboverlay/new/gatekeeperhelmet";
ITEM.faction = "Gatekeeper";

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

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/gatekeepers/highgatekeeper02.mdl";
	--else
		--return "models/begotten/gatekeepers/highgatekeeper01.mdl";
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
ITEM.name = "Wanderer Oppressor Armor";
ITEM.model = "models/begotten/headgroup_props/wandereroppressor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/wanderer_oppressor_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 68
ITEM.type = "leather";
ITEM.hasHelmet = true;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.description = "L'armure d'un tyran des terres désolées. Elle est équipée de plaques d'acier grossières et maintenue par des ferrailles. Ce style d'armure est souvent utilisé par les Seigneurs de la Ferraille, paranoïaques face aux assassins Voltistes.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.excludedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Crast", "Clan Grock"};
ITEM.overlay = "begotten/zomboverlay/new/genericmask";

ITEM.requiredbeliefs = {"hauberk"};

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
	[DMG_FALL] = -0.15, -- increases fall damage by 15%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.85; -- reduces slash damage by 25%
ITEM.bulletScale = 0.65; -- reduces bullet damage by 35%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "scrap", "scrap", "steel_chunks", "steel_chunks"}};
ITEM.itemSpawnerInfo = {category = "Armor", rarity = 1000, supercrateOnly = true};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/wandereroppressor.mdl";
	--else
		--return "models/begotten/wanderers/plaguedoc.mdl";
	--end;
end;

ITEM.runSound = {
	"armormovement/body-lobe-1.wav.mp3",
	"armormovement/body-lobe-2.wav.mp3",
	"armormovement/body-lobe-3.wav.mp3",
	"armormovement/body-lobe-4.wav.mp3",
	"armormovement/body-lobe-5.wav.mp3",
};

ITEM.walkSound = {
	"armormovement/body-lobe-b1.wav.mp3",
	"armormovement/body-lobe-b2.wav.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Voltist Archangel Exoskeleton";
ITEM.model = "models/begotten/headgroup_props/voltistarchangelexoarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/voltist_archangel_exoskeleton.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 60
ITEM.weight = 7;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Plaques de métal peint destinées à être accrochées dans la chair. Tiges à enfoncer dans les orbites et à travers le lobe frontal. Des ailes de métal ; une insulte pour les fidèles. Le tout bricolé avec des câbles terribles, mal gérés jusqu'à la folie. Seul un fou absolu ou une victime privée de libre arbitre se soumettrait à l'électrozombification.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.permanent = true; -- Cannot be unequipped.
ITEM.overlay = "begotten/zomboverlay/voltyellow";

ITEM.attributes = {"conditionless", "double_jump", "not_unequippable", "night_vision", "thermal_vision"};
ITEM.requiredbeliefs = {"yellow_and_black"};

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
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 90;

ITEM.components = {breakdownType = "meltdown", items = {"tech", "tech", "tech", "tech", "scrap", "scrap", "scrap", "scrap", "scrap"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/voltist_heavy.mdl";
	--else
		--return "models/begotten/wanderers/voltist_heavy.mdl";
	--end;
end;

ITEM.runSound = {
	"mvm/player/footsteps/robostep_05.wav",
	"mvm/player/footsteps/robostep_09.wav",
	"mvm/player/footsteps/robostep_13.wav",
	"mvm/player/footsteps/robostep_15.wav",
};

ITEM.walkSound = {
	"mvm/giant_scout/giant_scout_step_01.wav",
	"mvm/giant_scout/giant_scout_step_02.wav",
	"mvm/giant_scout/giant_scout_step_03.wav",
	"mvm/giant_scout/giant_scout_step_04.wav",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Voltist Exoskeleton";
ITEM.model = "models/begotten/headgroup_props/voltistexoarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/voltist_exoskeleton.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.weight = 4;
ITEM.weightclass = "Light";
ITEM.type = "plate";
ITEM.description = "Plaques de métal en décomposition à enfoncer dans la chair. Tiges à enfoncer dans les orbites et à travers le lobe frontal. Le tout assemblé avec des câbles terribles, bricolés jusqu'à la folie. Seul un fou absolu ou une victime privée de libre arbitre se soumettrait à l'électro-zombification.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.permanent = true; -- Cannot be unequipped.
ITEM.overlay = "begotten/zomboverlay/voltyellow";

ITEM.attributes = {"conditionless", "not_unequippable", "night_vision", "thermal_vision"};
ITEM.requiredbeliefs = {"yellow_and_black"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
ITEM.insulation = 90;

ITEM.components = {breakdownType = "meltdown", items = {"tech", "tech", "scrap", "scrap", "scrap", "scrap", "scrap"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/voltist_medium.mdl";
	--else
		--return "models/begotten/wanderers/voltist_medium.mdl";
	--end;
end;

ITEM.runSound = {
	"mvm/player/footsteps/robostep_05.wav",
	"mvm/player/footsteps/robostep_09.wav",
	"mvm/player/footsteps/robostep_13.wav",
	"mvm/player/footsteps/robostep_15.wav",
};

ITEM.walkSound = {
	"mvm/giant_scout/giant_scout_step_01.wav",
	"mvm/giant_scout/giant_scout_step_02.wav",
	"mvm/giant_scout/giant_scout_step_03.wav",
	"mvm/giant_scout/giant_scout_step_04.wav",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Voltist Stormchaser Exoskeleton";
ITEM.model = "models/begotten/headgroups_props/voltisttechnoheavy.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/voltist_stormchaser_exoskeleton.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 90
ITEM.weight = 10;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Plaques de métal peint destinées à être accrochées dans la chair. Tiges à enfoncer dans les orbites oculaires et à travers le lobe frontal. Pylônes luminescents émettant une énergie psionique d'asservissement mental. Plaqué et assemblé avec une efficacité surprenante, bien qu'extrêmement encombrant et horriblement inconfortable pour son hôte. Cet exosquelette fut clairement conçu pour un Stormchaser, un technohérétique maître d'œuvre possédant un sens supérieur du libre arbitre et de la prévoyance tactique comparé à ses pairs zombifiés.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.permanent = true; -- Cannot be unequipped.
ITEM.overlay = "begotten/zomboverlay/voltyellow";

ITEM.attributes = {"conditionless", "electrified", "not_unequippable", "night_vision", "thermal_vision"};
ITEM.requiredbeliefs = {"yellow_and_black", "hauberk"};

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
ITEM.bulletScale = 0.3; -- reduces bullet damage by 70%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 100;

ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "steel_chunks", "technocraft", "tech", "tech", "tech"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/wanderers/voltist_technoheavy.mdl";
	--else
		--return "models/begotten/wanderers/voltist_heavy.mdl";
	--end;
end;

ITEM.runSound = {
	"mvm/player/footsteps/robostep_05.wav",
	"mvm/player/footsteps/robostep_09.wav",
	"mvm/player/footsteps/robostep_13.wav",
	"mvm/player/footsteps/robostep_15.wav",
};

ITEM.walkSound = {
	"mvm/giant_scout/giant_scout_step_01.wav",
	"mvm/giant_scout/giant_scout_step_02.wav",
	"mvm/giant_scout/giant_scout_step_03.wav",
	"mvm/giant_scout/giant_scout_step_04.wav",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Master-at-Arms Gatekeeper Plate";
ITEM.group = "gatekeepers/masteratarms";
ITEM.model = "models/begotten/headgroups_props/masteratarmsplate.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/masteratarms_gatekeeper_plate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75
ITEM.type = "chainmail";
ITEM.weight = 7;
ITEM.weightclass = "Medium";
ITEM.description = "Un ensemble unique d'armure Gatekeeper, façonnée dans les matériaux les plus nobles, conçue spécifiquement pour protéger le Maître d'Armes.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Gatekeeper"};
ITEM.requiredRanks = {"Master-At-Arms"};
ITEM.faction = "Gatekeeper";

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

ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.45; -- reduces bullet damage by 55%
ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
ITEM.insulation = 45;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

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
ITEM.name = "Twisted Fuck Armor";
ITEM.group = "wanderers/wandererbone";
ITEM.model = "models/begotten/headgroups_props/wandererbone.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/twisted_fuck_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 1.5;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25;
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "Forgée à partir des os d'innombrables victimes, cette armure témoigne de la mentalité dépravée de son porteur. Elle émet un sinistre cliquetis au moindre mouvement, lui conférant une présence particulièrement terrifiante. Cette armure est spécialement efficace contre les attaques contondantes.";
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

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 20;

ITEM.components = {breakdownType = "breakdown", items = {"human_bone", "human_bone", "human_bone", "human_bone", "human_bone", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM.runSound = {
	"armormovement/rattle1.mp3",
	"armormovement/rattle2.mp3",
	"armormovement/rattle3.mp3",
	"armormovement/rattle4.mp3",
	"armormovement/rattle5.mp3",
	"armormovement/rattle6.mp3",
	"armormovement/rattle7.mp3",
	"armormovement/rattle8.mp3",
	"armormovement/rattle9.mp3",
};

ITEM.walkSound = {
	"armormovement/rattle1.mp3",
	"armormovement/rattle2.mp3",
	"armormovement/rattle3.mp3",
	"armormovement/rattle4.mp3",
	"armormovement/rattle5.mp3",
	"armormovement/rattle6.mp3",
	"armormovement/rattle7.mp3",
	"armormovement/rattle8.mp3",
	"armormovement/rattle9.mp3",
};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Gatekeeper Halfplate";
ITEM.group = "gatekeepers/gatekeeperhalfplate";
ITEM.model = "models/begotten/items/gatekeeperhalfplate.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/gatekeeperhalfplate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 48
ITEM.type = "chainmail";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "Un plastron porté sur un gambison arborant les couleurs du Saint-Ordre des Gardiens. Une pièce d'armure bon marché mais extrêmement pratique.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";

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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Gatekeeper Medici Halfplate";
ITEM.group = "gatekeepers/medicushalfplate";
ITEM.model = "models/begotten/items/medicushalfplate.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/medicushalfplate.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 48
ITEM.type = "chainmail";
ITEM.weight = 4.5;
ITEM.weightclass = "Medium";
ITEM.description = "Un plastron porté sur un gambison à manches blanches, avec une croix rouge peinte sur le devant, les couleurs des Médicis de l'Ordre Sacré des Gardiens. Une pièce d'armure bon marché mais très pratique, permettant une identification facile sur le champ de bataille.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.excludedFactions = {"Goreic Warrior"};
ITEM.faction = "Gatekeeper";
ITEM.attributes = {"practitioner"};

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
ITEM.insulation = 35;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Grand Knight Plate";
ITEM.model = "models/begotten/headgroup_props/knightarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/grand_knight_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hasHelmet = true;
ITEM.hitParticle = "MetalSpark";
ITEM.isUnique = true;
ITEM.protection = 90;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure de plaques recouverte de tissu sacré et de sceaux bénis. Un casque forgé en acier Maximillian avec des gravures dorées. Il était destiné à une figure puissante de la foi Glazic.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.overlay = "begotten/zomboverlay/new/grandknight";
ITEM.requiredFactions = {"Holy Hierarchy"};
ITEM.requiredRanks = {"Grand Knight"};
ITEM.requiredbeliefs = {"hauberk"};
ITEM.genderless = true;

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_HEAD] = true,
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
ITEM.slashScale = 0.55; -- reduces slash damage by 45%
ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
ITEM.stabilityScale = 0.45; -- reduces stability damage by 55%
ITEM.insulation = 70;

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/gatekeepers/grandknight.mdl";
end;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "leather", "leather", "leather"}};

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
