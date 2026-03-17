local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Shagalax Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm5.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_black_steel_helm.png"
	ITEM.weight = 2
	ITEM.uniqueID = "gore_black_steel_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 5
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque d'acier noirci utilisé par de nombreux Gores du Clan Shagalax. Il offre une protection exemplaire."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Harald", "Clan Reaver"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreshagalaxhelm";
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 72
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 40; -- Adds 8% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Bastard Gore Spikehelm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm6.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_guardian_helm.png"
	ITEM.weight = 3
	ITEM.uniqueID = "bastard_gore_spikehelm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 6
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque d'acier hérissé de pointes et de cornes, porté par les rejetons oubliés de Gores qui combattent pour attirer l'attention des Dieux. Il offre une protection exemplaire."
	--ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.requireFaith = {"Faith of the Family"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreguardianhelm";
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 57
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 40; -- Adds 8% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Seafarer Hood"
	ITEM.model = "models/begotten/headgroup_props/gore_hood1.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_hood.png"
	ITEM.weight = 0.3
	ITEM.uniqueID = "gore_hood"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 9
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un capuchon typique des Lanceurs, orné des dents de bêtes abattues. L'étoffe exhale une odeur d'eau de mer salée."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 15
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "cloth";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.75; -- reduces stability damage by 25%
	ITEM.insulation = 50; -- Adds 10% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "breakdown", items = {"cloth"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Warfighter Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm4.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_horned_helm.png"
	ITEM.weight = 2
	ITEM.uniqueID = "gore_horned_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 4
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque à cornes grossièrement fabriqué, couramment porté par les guerriers sauvages du Clan Gore. Il offre une protection raisonnable."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/gorewarfighterhelm";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 50
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.bulletScale = 0.75; -- reduces bullet damage by 25%
	ITEM.insulation = 45; -- Adds 9% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Bastard Raider Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm2.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_raider_helm.png"
	ITEM.weight = 0.9
	ITEM.uniqueID = "bastard_raider_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 2
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque de fer compact orné de deux petites cornes, souvent porté par les esclaves aspirants cherchant une mort digne au Grand Arbre."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 35
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 45; -- Adds 9% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Ridge Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm1.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_ridge_helm.png"
	ITEM.weight = 1.2
	ITEM.uniqueID = "gore_ridge_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 1
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un heaume à crête de fer d'origine goréenne, orné de décorations."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 53
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
	ITEM.insulation = 50; -- Adds 10% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Dread Minotaur Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_mino1.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_skull_helm.png"
	ITEM.weight = 1.5
	ITEM.concealsFace = true;
	ITEM.uniqueID = "gore_skull_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 10
	ITEM.headSuffix = "_gore";
	ITEM.description = "Le crâne d'une bête abattue, orné de cornes et de fétiches tribaux maudits. Ce heaume insuffle à vos ennemis un sentiment de fatalité imminente."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.attributes = {"fear"};
	ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 40
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.75; -- reduces slash damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.insulation = 70; -- Adds 14% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"hide", "hide", "cloth", "human_bone"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Twisted Minotaur Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_mino2.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_skull_helm2.png"
	ITEM.weight = 1.5
	ITEM.concealsFace = true;
	ITEM.uniqueID = "gore_skull_helm2"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 11
	ITEM.headSuffix = "_gore";
	ITEM.description = "Le crâne d'une bête abattue, orné de cornes torsadées et de peaux bouillies. Ce heaume inspire la terreur à vos ennemis."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.attributes = {"fear"};
	ITEM.overlay = "begotten/zomboverlay/new/goreminotaur";

	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 40
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.75; -- reduces slash damage by 25%
	ITEM.stabilityScale = 0.65; -- reduces stability damage by 35%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.insulation = 70; -- Adds 14% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"hide", "hide", "cloth", "human_bone"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Bastard Reaver Helm"
	ITEM.model = "models/begotten/headgroup_props/gore_helm3.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gore_spiked_helm.png"
	ITEM.weight = 0.9
	ITEM.uniqueID = "bastard_reaver_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 3
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque de bronze à pointes porté par les aspirants bandits et meurtriers cherchant une mort digne au Grand Arbre."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 35
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 45; -- Adds 9% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Champion Ridge Helm"
	ITEM.model = "models/begotten/headgroups_props/lamellarridgehelm.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/lamellar_ridge_helm.png"
	ITEM.weight = 3
	ITEM.uniqueID = "gore_champion_ridge_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 7
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un heaume à crête d'acier éprouvé au combat. Seul un Gore digne peut le porter."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	ITEM.excludedSubfactions = {"Clan Grock"};
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 67
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 40;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore King's Chosen Helmet"
	ITEM.model = "models/begotten/headgroups_props/scalehelmet.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/chosenarmor_helmet.png"
	ITEM.weight = 2.5
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 12
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casque en acier Shagalaxien orné de sigils familiaux en laiton."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";
	ITEM.excludedSubfactions = {"Clan Grock"};
	ITEM.requiredRanks = {"King's Chosen"};
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 77
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Reaver Despoiler Helm"
	ITEM.model = "models/begotten/headgroups_props/reaverplatehelm.mdl"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/reaver_plate_helm.png"
	ITEM.weight = 4.5
	ITEM.uniqueID = "reaver_despoiler_helm"
	ITEM.category = "Helms"
	ITEM.attributes = {"fear"};
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 8
	ITEM.headSuffix = "_gore";
	ITEM.description = "Un casier d'acier forgé en enfer, sadique, orné d'os humains et de cornes démoniaques. Il a été maudit par une énergie catalytique qui empêche les âmes timorées de le porter."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goredespoilerhelm";
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Harald", "Clan Shagalax"};
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 72
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 40;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "steel_chunks", "steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Reaver Marauder Helmet"
	ITEM.model = "models/begotten_apocalypse/items/reaver_marauder_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/reaver_marauder_helm.png"
	ITEM.headReplacement = "models/begotten/heads/reaver_marauder_helmet.mdl";
	ITEM.weight = 2
	ITEM.uniqueID = "reaver_marauder_helm"
	ITEM.category = "Helms"
	ITEM.description = "Un spangenhelm finement ouvragé avec une camail de mailles en dessous, il est redouté dans les terres désolées pour être la dernière chose que l'on voit avant d'être condamné à l'esclavage."
	ITEM.requiredFactions = {"Goreic Warrior", "Wanderer"};
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Harald", "Clan Shagalax"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/genericmask";
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 0.8 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 62
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 60;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Reaver Drottinn Helmet"
	ITEM.model = "models/begotten_apocalypse/items/reaverchiefhelmet.mdl"
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/reaverchiefhelmet.png"
	ITEM.headReplacement = "models/begotten/heads/reaver_chief_helmet.mdl";
	ITEM.weight = 2.5
	ITEM.uniqueID = "reaver_drottinn_helm"
	ITEM.category = "Helms"
	ITEM.description = "Forgé dans un acier infernal noirci, ce casque appartient au clan tortionnaire dévoyé des Reaver."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Harald", "Clan Shagalax"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/genericmask";
	
	ITEM.conditionScale = 0.8 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 67
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.65; -- reduces bullet damage by 35%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 65;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Crast Shaman Helm"
	ITEM.model = "models/begotten/misc/gore_cla_germ_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_cla_germ_helm.png"
	ITEM.weight = 1.4
	ITEM.uniqueID = "crast_feather_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 5
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un casque de fer léger orné de plumes et d'encens. Ce type de casque est généralement porté par les chamans du Clan Crast qui préfèrent une alternative protectrice à leurs casques crâniens. Les guérisseurs utilisent les barbes de leurs plumes pour suturer les blessures, augmentant ainsi l'efficacité de leurs remèdes."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.requiredSubfactions = {"Clan Crast"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.attributes = {"practitioner"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 53
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
	ITEM.pierceScale = 0.90; -- reduces pierce damage by 10%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.bulletScale = 0.85; -- reduces bullet damage by 15%
	ITEM.insulation = 50; -- Adds 10% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Wolf Headdress"
	ITEM.model = "models/begotten/misc/gore_cla_wolf_trofe.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/wolfpelt.png"
	ITEM.weight = 2
	ITEM.uniqueID = "gore_wolf_headdress"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 6
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "La peau tannée d'un loup-garou, cousue et imprégnée de la colère du Père pour bénir ses enfants d'une guérison surnaturelle."
	ITEM.requiredSubfactions = {"Clan Gore"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.attributes = {"lesserlifeleech", "recklessfury"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 30
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "cloth";

	ITEM.bluntScale = 0.60; -- reduces blunt damage by 40%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.insulation = 40; -- Adds 8% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "breakdown", items = {"bearskin", "hide", "hide"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Haralder Sealord Ridge Helm"
	ITEM.model = "models/begotten/misc/gore_ancient_nord_cum.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_ancient_nord_cum.png"
	ITEM.weight = 3
	ITEM.uniqueID = "haralder_sealord_ridge_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 9
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un heaume à crête d'acier orné, éprouvé au combat. Il porte la malédiction du Clan Harald."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.requireFaith = {"Faith of the Family"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	ITEM.requiredbeliefs = {"hauberk"};
	ITEM.requiredSubfactions = {"Clan Harald"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 70
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.60; -- reduces bullet damage by 40%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 65;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Guardian Helm"
	ITEM.model = "models/begotten/misc/gore_lord_helm_3.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_lord_helm_3.png"
	ITEM.weight = 3
	ITEM.uniqueID = "gore_guardian_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 4
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un casque d'acier à pointes, généralement porté par les défenseurs du Grand Arbre. Il offre une protection exemplaire."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreguardianhelm";
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 57
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 40; -- Adds 8% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Haralder King's Chosen Helmet"
	ITEM.model = "models/begotten/misc/gore_lord_helm_2.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_lord_helm_2.png"
	ITEM.uniqueID = "haralder_kings_chosen_helmet"
	ITEM.weight = 2.5
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 3
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un casque en acier Shagalaxien orné de sigils familiaux en or, son imposante conception provenant de l'est. Ceux du Clan Harald s'enorgueillissent d'une longue histoire de sélection comme Élus du Roi, bien que, compte tenu de leur malédiction, il soit extrêmement rare qu'un Haraldien accède au trône."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/gorekingschosenhelmet";
	ITEM.requiredSubfactions = {"Clan Harald"};
	ITEM.requiredRanks = {"King's Chosen"};
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 78
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.50; -- reduces bullet damage by 50%
	ITEM.stabilityScale = 0.55; -- reduces stability damage by 45%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Leather Helm"
	ITEM.model = "models/begotten/misc/gore_eldenringhelm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_eldenringhelm.png"
	ITEM.weight = 0.9
	ITEM.uniqueID = "gore_leather_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 10
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un casque en cuir fabriqué par les tanneurs Shagalax de Vancouver. Il est peu coûteux à fabriquer et offre une certaine protection."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "npc/combine_soldier/zipline_clothing2.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 33
	ITEM.hitParticle = "GlassImpact";
	ITEM.type = "leather";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.90; -- reduces slash damage by 10%
	ITEM.stabilityScale = 0.80; -- reduces stability damage by 20%
	ITEM.insulation = 45; -- Adds 9% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "breakdown", items = {"cloth", "cloth"}};
ITEM:Register();
	
local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore Earmuff Helm"
	ITEM.model = "models/begotten/misc/gore_earmuff_helmet.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_earmuff_helmet.png"
	ITEM.weight = 1.2
	ITEM.uniqueID = "gore_earmuff_helm"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 1
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un casque bon marché conçu pour les Vancouver Gores. Malgré ses matériaux peu coûteux, il a été forgé pour protéger au maximum la tête sans entraver la vision."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 50
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.85; -- reduces blunt damage by 15%
	ITEM.pierceScale = 0.95; -- reduces pierce damage by 5%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.bulletScale = 0.95; -- reduces bullet damage by 5%
	ITEM.insulation = 50; -- Adds 10% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Gore King Helm"
	ITEM.model = "models/begotten/headgroups_props/goreking_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/goreking_helm.png"
	ITEM.uniqueID = "gore_king_helm"
	ITEM.weight = 2.5
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 1
	ITEM.headSuffix = "_kinggore";
	ITEM.description = "L'acier le plus fin de Shagalax, forgé et reforgé dans le sang d'esclaves sacrifiés cent fois avant d'être jugé assez résistant. Orné d'or pillé d'une terre étrangère, le Heaume du Roi de la Carnage inspire la terreur dans le cœur de tous ceux qui le contemplent, car celui qui le porte est assurément un adversaire brutal."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	ITEM.requiredRanks = {"King"};
	ITEM.excludedSubfactions = {"Clan Grock"};
	ITEM.requiredbeliefs = {"hauberk"};
	ITEM.attributes = {"fear"};
	
	ITEM.conditionScale = 1
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 85
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.80; -- reduces blunt damage by 20%
	ITEM.pierceScale = 0.65; -- reduces pierce damage by 35%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.30; -- reduces bullet damage by 70%
	ITEM.stabilityScale = 0.50; -- reduces stability damage by 50%
	ITEM.insulation = 50;
	
	ITEM.components = {breakdownType = "meltdown", items = {"gold_ingot", "fine_steel_chunks", "fine_steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Haralder Ridge Helm"
	ITEM.model = "models/begotten/misc/gore_sturg_helm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/haralder_ridge_helm.png"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 7
	ITEM.headSuffix = "_preludegore";
	ITEM.weight = 2
	ITEM.uniqueID = "haralder_ridge_helm"
	ITEM.category = "Helms"
	ITEM.description = "Un casque à crête finement ouvragé, rembourré de cuir bouilli qui exhale une odeur de mer. Il porte la malédiction du Clan Harald."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/goreridgehelm";
	ITEM.requiredbeliefs = {"hauberk"};
	
	ITEM.conditionScale = 0.8 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 62
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.70; -- reduces pierce damage by 30%
	ITEM.slashScale = 0.60; -- reduces slash damage by 40%
	ITEM.bulletScale = 0.70; -- reduces bullet damage by 30%
	ITEM.stabilityScale = 0.60; -- reduces stability damage by 40%
	ITEM.insulation = 60;
	
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks", "steel_chunks", "leather"}};
ITEM:Register();

local ITEM = Clockwork.item:New("bodygroup_base")
	ITEM.name = "Reaver Slaver Helmet"
	ITEM.model = "models/begotten/misc/gore_reavereasthelm.mdl"
	ITEM.iconoverride = "begotten/ui/itemicons/gore_reavereasthelm.png"
	ITEM.weight = 1.5
	ITEM.uniqueID = "reaver_slaver_helmet"
	ITEM.category = "Helms"
	ITEM.bodyGroup = 1
	ITEM.bodyGroupVal = 8
	ITEM.headSuffix = "_preludegore";
	ITEM.description = "Un spagenhelm de fer grossièrement forgé, avec une camail de mailles en dessous, il est redouté par les habitants du désert comme étant la dernière chose qu'ils voient avant d'être condamnés à l'esclavage."
	ITEM.requiredFactions = {"Goreic Warrior"};
	ITEM.excludedSubfactions = {"Clan Grock", "Clan Gore", "Clan Crast", "Clan Harald", "Clan Shagalax"};
	ITEM.useSound = "armor/plate_damage_02.wav";
	ITEM.overlay = "begotten/zomboverlay/new/genericmask";
	
	ITEM.conditionScale = 1.2 -- item degrades 1.5x faster with damage related condition loss
	ITEM.repairCostModifier = 0.5;

	ITEM.effectiveLimbs = {
		[HITGROUP_HEAD] = true,
	}

	ITEM.protection = 55
	ITEM.hitParticle = "MetalSpark";
	ITEM.type = "plate";

	ITEM.bluntScale = 0.90; -- reduces blunt damage by 10%
	ITEM.pierceScale = 0.85; -- reduces pierce damage by 15%
	ITEM.slashScale = 0.70; -- reduces slash damage by 30%
	ITEM.stabilityScale = 0.70; -- reduces stability damage by 30%
	ITEM.bulletScale = 0.80; -- reduces bullet damage by 20%
	ITEM.insulation = 50; -- Adds 10% insulation. Helmets account for 20% of total insulation. Body armor covers the other 80%.
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "iron_chunks", "iron_chunks"}};
ITEM:Register();