local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Armored Blade Druid Robes";
ITEM.group = "goreicwarfighters/armoredbladedruid";
ITEM.model = "models/begotten/headgroups_props/armoredbladedruid.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/armored_blade_druid_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Bien que traditionnellement considérés comme fragiles, les enfants de la Mère ne sont pas démunis au combat, et se voient ainsi contraints de renforcer leurs robes spirituelles d'une armure. Cet équipement possède un enchantement pour repousser les dégâts des armes à feu.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Shagalax", "Clan Harald", "Clan Reaver"};

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
ITEM.bulletScale = 0.5; -- reduces bullet damage by 50%
ITEM.insulation = 70;

ITEM.attributes = {"mothers_blessing", "increased_regeneration"};
ITEM.components = {breakdownType = "breakdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "hide", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Blade Druid Robes";
ITEM.group = "goreicwarfighters/bladedruid";
ITEM.model = "models/begotten/headgroup_props/bladedruidrobes.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/blade_druid_robes.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Des couches de peau et de tissu gravé évoquant des robes mystiques. Taillées à l'image de l'ancien ordre des Druides de la Lame, fondateurs de la société et de la religion de Gore. Seuls ceux nés sous l'image de la Mère seraient dignes de porter de telles robes.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Shagalax", "Clan Harald", "Clan Reaver"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 60;

ITEM.attributes = {"mothers_blessing", "increased_regeneration", "miracle_doctor"};
ITEM.components = {breakdownType = "breakdown", items = {"hide", "cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Gore Seafarer Garb";
ITEM.group = "goreicwarfighters/goreseafarer";
ITEM.model = "models/begotten/headgroup_props/seafarerarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_seafarer_garb.png"
ITEM.category = "Armor"
ITEM.weight = 1;
ITEM.description = "Une cape de fourrure traditionnellement portée par les pillards marins Goreic. Elle n'offre aucune protection.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Goreic Warrior"};

ITEM.insulation = 25;

ITEM.attributes = {"seafarer"};
ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Gore Berserker Armor";
ITEM.uniqueID = "gore_beserker_armor"; -- due to typo in the old name
ITEM.group = "goreicwarfighters/goreberzerker";
ITEM.model = "models/begotten/headgroup_props/berzerkerarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_beserker_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Une peau d'ours communément portée par les Berserkers du Gore, les guerriers les plus redoutables et intrépides des Gores.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.attributes = {"lifeleech", "rage"};
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock", "Clan Crast", "Clan Shagalax", "Clan Harald", "Clan Reaver"};

ITEM.effectiveLimbs = {
	[HITGROUP_HEAD] = true,
}

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 25;

ITEM.components = {breakdownType = "breakdown", items = {"hide", "hide", "bearskin", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Gore Chainmail";
ITEM.group = "goreicwarfighters/gorechainmail";
ITEM.model = "models/begotten/headgroup_props/gorechainmalarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_chainmail.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une grossière armure de mailles sur une tenue de cuir et de fourrure, elle offre une protection adéquate contre les armes ennemies et les intempéries.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.excludedSubfactions = {"Clan Grock"};

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
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth", "leather", "cloth"}};

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
ITEM.name = "Gore Housecarl Armor";
ITEM.group = "goreicwarfighters/gorehousecarl";
ITEM.model = "models/begotten/headgroup_props/housecarlarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_housecarl_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75;
ITEM.weight = 8;
ITEM.weightclass = "Heavy";
ITEM.type = "chainmail";
ITEM.description = "L'armure d'un Housecarl Goreic : un assemblage de cotte de mailles et d'armure d'écailles shagalaxiennes, agrémentée de décorations en cuir ouvragé.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "leather", "leather", "leather", "cloth"}};

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
ITEM.name = "Grockling Rattleshirt Armor";
ITEM.model = "models/begotten/headgroup_props/rattleshirtarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/grockling_rattleshirt_armor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.9
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 38;
ITEM.weight = 3;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "Un ensemble d'os humains et animaux liés formant des plaques protectrices. Une tête de minotaure constituant un casque de guerre terrifiant. L'armure cliquette à chaque mouvement, lui conférant une présence particulièrement effrayante. Cette armure est spécialement adaptée pour résister aux attaques contondantes.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.attributes = {"fear"};
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Reaver", "Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast"};
ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

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

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.slashScale = 0.90; -- reduces slash damage by 10%
ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 55;

ITEM.components = {breakdownType = "breakdown", items = {"human_bone", "human_bone", "human_bone", "human_bone", "human_bone", "human_bone", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	--if (player:GetGender() == GENDER_FEMALE) then
		return "models/begotten/goreicwarfighters/gorechieftan.mdl";
	--else
		--return "models/begotten/goreicwarfighters/gorechieftan.mdl";
	--end;
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
ITEM.name = "Gore Warfighter Armor";
ITEM.group = "goreicwarfighters/warfighter";
ITEM.model = "models/begotten/headgroup_props/warfighterarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/warfighter_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 33
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Armure de cuir couramment portée par les guerriers du Clan Gore. Elle offre une protection raisonnable sans compromettre la mobilité.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Goreic Warrior"};

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

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Old Haralder Chainmail";
ITEM.group = "goreicwarfighters/haralderchainmail";
ITEM.model = "models/begotten/headgroup_props/haralderarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/haralder_chainmail.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une armure de mailles sans manches sur un vêtement de cuir, stylisée à la mode du Clan Haralder. Le cuir rapiécé sent la mer. Cette armure est ancienne et oubliée.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.excludedSubfactions = {"Clan Grock"};

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
ITEM.pierceScale = 0.80; -- reduces pierce damage by 20%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Red Wolf Plate";
ITEM.group = "goreicwarfighters/reaverplate";
ITEM.model = "models/begotten/headgroup_props/reaverplate.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/bjornling_armor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 80;
ITEM.weight = 11;
ITEM.weightclass = "Heavy";
ITEM.type = "plate";
ITEM.description = "Armure lourde forgée en enfer dans du fer noir. Ornée de crânes et de peaux, tant humaines que démoniaques, les Loups Rouges du Clan Reaver veillent à ce que leur présence soit connue.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast", "Clan Grock"};

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

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
ITEM.insulation = 70;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "human_bone", "human_bone"}};

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
ITEM.name = "Gore Lamellar";
ITEM.group = "goreicwarfighters/gorelamellar";
ITEM.model = "models/begotten/headgroups_props/gorelamellar.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_lamellar.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65
ITEM.type = "plate";
ITEM.weight = 6.5;
ITEM.weightclass = "Medium";
ITEM.description = "Des plaques d'acier disposées en écailles de poisson sur un gambison. Il offre une bonne protection sans trop entraver la mobilité.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.excludedSubfactions = {"Clan Grock"};

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
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "steel_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Gore King's Chosen Armor";
ITEM.group = "goreicwarfighters/gorescale";
ITEM.model = "models/begotten/headgroups_props/gorescalearmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/chosenarmor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 85;
ITEM.weight = 9;
ITEM.weightclass = "Heavy";
ITEM.type = "chainmail";
ITEM.description = "Armure d'écailles en acier shagalaxien ornée de sigils familiaux en laiton. Une armure qui se vante de l'approbation des Dieux et du Roi.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Grock"};
ITEM.requiredRanks = {"King's Chosen"};

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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.60; -- reduces slash damage by 40%
ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
ITEM.stabilityScale = 0.50; -- reduces stability damage by 50%
ITEM.insulation = 60;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "leather", "leather", "leather", "cloth"}};

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
ITEM.name = "Reaver Marauder Lamellar";
ITEM.group = "goreicwarfighters/reaver_marauder";
ITEM.model = "models/begotten/items/reaver_marauder_item.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/reaver_marauder_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.80
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 65;
ITEM.weight = 6.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Un harnais de lamelles en fer noir forgé à froid. Il est couvert de sceaux et de runes du Clan Reaver, ainsi que de symboles étrangers venus des terres gelées du lointain nord. Très répandu dans les bandes de guerre goreiques pour son solide blindage métallique protecteur.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.excludedSubfactions = {"Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast", "Clan Grock"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true,
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "human_bone", "human_bone"}, xp = 30};

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
ITEM.name = "Reaver Drottinn Lamellar";
ITEM.group = "goreicwarfighters/reaver_chief";
ITEM.model = "models/begotten/items/reaver_marauder_item.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/reaver_marauder_item.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.80
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70;
ITEM.weight = 7.5;
ITEM.weightclass = "Medium";
ITEM.type = "plate";
ITEM.description = "Un ensemble de lamelles noircies, porté par les tortionnaires, les bourreaux et les commandants des lointains Maraudeurs. Cette armure fut forgée pour affirmer la maîtrise goreique sur les ténèbres ; pour manier son pouvoir sans en devenir l'esclave.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast", "Clan Grock"};

ITEM.effectiveLimbs = {
	[HITGROUP_GENERIC] = true,
	[HITGROUP_CHEST] = true,
	[HITGROUP_STOMACH] = true,
	[HITGROUP_LEFTARM] = true,
	[HITGROUP_RIGHTARM] = true,
	[HITGROUP_LEFTLEG] = true,
	[HITGROUP_RIGHTLEG] = true,
	[HITGROUP_GEAR] = true,
}

ITEM.damageTypeScales = {
	[DMG_FALL] = -0.10, -- increases fall damage by 10%
}

ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 70;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "human_bone", "human_bone"}};

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
ITEM.name = "Shagalaxian Scalemail";
ITEM.group = "prelude_gores/scalegore";
ITEM.model = "models/begotten_prelude/items/scalegore.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/scalegore.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une cotte de mailles en écailles forgée de manière impressionnante, noircie selon les anciennes méthodes de forge shagalax. Doublée d'un type spécial de rembourrage en cuir, cette armure peut aider à amortir les coups des armes à feu.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.requiredSubfactions = {"Clan Shagalax"};

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
ITEM.pierceScale = 0.80; -- reduces pierce damage by 20%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Reaver Chainmail";
ITEM.group = "prelude_gores/chaingore2";
ITEM.model = "models/begotten_prelude/items/chaingore2.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/chaingore2.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Cotte de mailles goreique forgée dans le style des Pilleurs de l'Est. Un rembourrage supplémentaire a été cousu sous la maille pour résister aux attaques contondantes.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.onerequiredbelief = {"sister", "satanism", "primevalism"};

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

ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
ITEM.pierceScale = 0.80; -- reduces pierce damage by 20%
ITEM.slashScale = 0.70; -- reduces slash damage by 30%
ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Goreic Kingplate";
ITEM.group = "body/seafarer_armor";
ITEM.model = "models/begotten/headgroup_props/haralderarmor.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/kingarmor.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.75
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 75
ITEM.type = "chainmail";
ITEM.weight = 6;
ITEM.weightclass = "Medium";
ITEM.description = "Une armure brutale forgée par les plus grands esprits que le Clan Shagalax ait pu rassembler, et bénie à trois reprises par le Clan Crast. Utilisant des techniques dignes des antiques chars de guerre, cette armure étonnamment agile est capable de résister à de nombreuses épreuves. Elle est presque perpétuellement couverte de sang, signe de son efficacité au combat.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.requiredRanks = {"King"};
ITEM.faction = "Goreic Warrior";
ITEM.excludedSubfactions = {"Clan Grock"};

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

ITEM.attributes = {"rage"};
ITEM.bluntScale = 0.65; -- reduces blunt damage by 35%
ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
ITEM.slashScale = 0.65; -- reduces slash damage by 35%
ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
ITEM.insulation = 65;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks", "gold_ingot"}};

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
ITEM.name = "Frenzied Chainmail";
ITEM.group = "prelude_gores/battaniansash";
ITEM.model = "models/begotten_prelude/items/batttaniansash.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/batttaniansash.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 55
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une solide cotte de mailles bénie par le Père, conférant à son porteur une vitesse et une vigueur accrues au combat. Ce style d'armure est porté par les guerriers en devenir qui aspirent à être honorés bien après leur mort.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.requiredSubfactions = {"Clan Gore"};
ITEM.kinisgerOverride = true;

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
ITEM.pierceScale = 0.80; -- reduces pierce damage by 20%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.stabilityScale = 0.80; -- reduces stability damage by 20%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.attributes = {"rage"};
ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth", "cloth"}};

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Haralder Sealord Lamellar";
ITEM.group = "prelude_gores/fishscale";
ITEM.model = "models/begotten/headgroups_props/gorelamellar.mdl" -- Replace later
ITEM.uniqueID = "haralder_sealord_lamellar";
ITEM.iconoverride = "begotten/ui/itemicons/fishscale.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 70
ITEM.type = "plate";
ITEM.weight = 7.5;
ITEM.weightclass = "Medium";
ITEM.description = "Des plaques d'acier disposées en motif d'écailles de poisson sur un gambison. Elle offre une bonne protection sans trop entraver la mobilité. Cette armure est affectée par la malédiction du Clan Harald, et personne d'autre ne peut la porter.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.requiredSubfactions = {"Clan Harald"};
ITEM.kinisgerOverride = true;

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
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
ITEM.insulation = 70;

ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};

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
ITEM.name = "Goreic Eastmen Armor";
ITEM.group = "prelude_gores/braveset";
ITEM.model = "models/begotten_prelude/items/braveset.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/braveset.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 38
ITEM.type = "leather";
ITEM.weight = 2;
ITEM.weightclass = "Light";
ITEM.description = "Armure de cuir aux teintes vives des Îles Orientales des Gorelands. Elle offre une protection convenable sans compromettre la mobilité.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};

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

ITEM.components = {breakdownType = "breakdown", items = {"leather", "leather", "cloth", "cloth"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)

end;

ITEM:Register();

local ITEM = Clockwork.item:New("clothes_base");
ITEM.name = "Haralder Chainmail";
ITEM.group = "prelude_gores/haraldnew";
ITEM.model = "models/begotten_prelude/items/chaingore4.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/chaingore4.png"
ITEM.uniqueID = "haralder_chainmail";
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "chainmail";
ITEM.weight = 4;
ITEM.weightclass = "Medium";
ITEM.description = "Un ensemble de cotte de mailles sans manches, porté sur un vêtement de cuir, stylisé à la mode du Clan Haralder. Le cuir rapiécé exhale une odeur de mer.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.requiredSubfactions = {"Clan Harald"};
ITEM.kinisgerOverride = true;

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
ITEM.pierceScale = 0.80; -- reduces pierce damage by 20%
ITEM.slashScale = 0.75; -- reduces slash damage by 25%
ITEM.bulletScale = 0.90; -- reduces bullet damage by 10%
ITEM.insulation = 50;

ITEM.attributes = {"seafarer"};
ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "leather", "cloth", "cloth", "cloth"}};

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
ITEM.name = "Quebecois Gore Chainmail";
ITEM.group = "prelude_gores/chaingore3";
ITEM.model = "models/begotten_prelude/items/chaingore3.mdl"
ITEM.iconoverride = "begotten/ui/itemicons/chaingore3.png"
ITEM.category = "Armor"
ITEM.conditionScale = 0.9
ITEM.hitParticle = "MetalSpark";
ITEM.protection = 50
ITEM.type = "chainmail";
ITEM.weight = 5;
ITEM.weightclass = "Medium";
ITEM.description = "Une grossière cotte de mailles sur une tenue de cuir et de fourrure, elle offre une protection adéquate contre les armes ennemies et les intempéries. Ce style particulier trouve son origine dans les terres gelées de Vancouver.";
ITEM.useSound = "armormovement/body-armor-b4.WAV.mp3";
ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
ITEM.excludedSubfactions = {"Clan Grock"};

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
ITEM.insulation = 50;

ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "cloth", "cloth", "leather", "cloth"}};

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
ITEM.name = "Grockling Godless Garb";
ITEM.model = "models/begotten/headgroup_props/groktribalarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/groktribalarmor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.9
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 25;
ITEM.weight = 1.5;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "Certains adeptes des Anciennes Voies utilisent la croyance comme un outil, et ils aiguisent leur foi par la folie. Les Sans-Dieu rejettent les offrandes des Divinités, vénérant plutôt la terre, les feuilles, les os et le sang. Lorsqu'ils se perdent dans la démence, ils deviennent leurs propres dieux.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.attributes = {"godless"};
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Reaver", "Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast"};
ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

ITEM.effectiveLimbs = {
	[HITGROUP_HEAD] = true,
}

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 20;

ITEM.components = {breakdownType = "breakdown", items = {"human_bone", "human_bone", "human_bone", "human_bone"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/goreicwarfighters/groktribal.mdl";
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
ITEM.name = "Grockling Iconoclast Garb";
ITEM.model = "models/begotten/headgroup_props/grokcrastarmor.mdl"
ITEM.iconoverride = "materials/begotten/ui/itemicons/grokcrastarmor.png"
ITEM.category = "Armor"
ITEM.concealsFace = true;
ITEM.conditionScale = 0.9
ITEM.hasHelmet = true;
ITEM.hitParticle = "GlassImpact";
ITEM.protection = 30;
ITEM.weight = 1.25;
ITEM.weightclass = "Light";
ITEM.type = "leather";
ITEM.description = "Les Iconoclastes Grocklings sont des fanatiques d'une autre trempe. Ils se dressent pour railler en particulier ceux du Clan Crast en arborant d'anciennes et interdites effigies. Un Iconoclaste Grockling est une vision véritablement terrifiante, car il annonce l'arrivée de nombreux autres Grocks qui suivent leur chef vers l'oubli.";
ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
ITEM.attributes = {"godless", "iconoclast", "fear"};
ITEM.requiredFactions = {"Goreic Warrior"};
ITEM.excludedSubfactions = {"Clan Reaver", "Clan Harald", "Clan Gore", "Clan Shagalax", "Clan Crast"};
ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

ITEM.effectiveLimbs = {
	[HITGROUP_HEAD] = true,
}

ITEM.bluntScale = 0.55; -- reduces blunt damage by 45%
ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
ITEM.insulation = 30;

ITEM.components = {breakdownType = "breakdown", items = {"human_bone", "human_bone", "human_bone", "human_bone", "quill", "quill"}};

-- Called when a replacement is needed for a player.
function ITEM:GetReplacement(player)
	return "models/begotten/goreicwarfighters/grokcrast.mdl";
end;

ITEM:Register();