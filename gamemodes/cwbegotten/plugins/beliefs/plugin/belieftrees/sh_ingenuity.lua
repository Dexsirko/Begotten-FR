--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local INGENUITY = cwBeliefs.beliefTrees:New("ingenuity")
	INGENUITY.name = "Ingenuity";
	INGENUITY.color = Color(80, 70, 50);
	INGENUITY.order = 5;
	INGENUITY.size = {w = 378, h = 407};
	INGENUITY.textures = {"ingenuity", "ingenuityarrows"};
	INGENUITY.tooltip = {
		{"Ingenuity", INGENUITY.color, "Civ5ToolTip4"},
		{"L'ingéniosité mesure la débrouillardise de votre personnage, affectant principalement son efficacité en Artisanat. Améliorer cet ensemble de croyances débloquera progressivement plus d'options d'artisanat. Davantage d'options d'artisanat peuvent devenir disponibles si cet ensemble est associé à l'aptitude. À mesure que votre niveau de sacrement augmente, l'état de votre équipement artisanal sera amélioré.", Color(225, 200, 200)},
		{"\n\"Bobby tout fier et cool avec ce vieil appareil à l'arrière du camion qui l'a installé avec un statut social sympa, loin du statut junior. C'est la machine la plus triste mais agréable avec de la mélasse dans l'indicateur de puissance, ainsi que les mathématiques et les tactiques administratives.\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : Réduit la détérioration de l'état des armures et des armes de 45% supplémentaires. Augmente la valeur de protection de toutes les armures de 5 points.", Color(50, 255, 50)}
	};
	INGENUITY.columnPositions = {
		[1] = (INGENUITY.size.w - 4) * 0.1,
		[2] = (INGENUITY.size.w - 4) * 0.3,
		[3] = (INGENUITY.size.w - 4) * 0.5,
		[4] = (INGENUITY.size.w - 4) * 0.7,
		[5] = (INGENUITY.size.w - 4) * 0.9,
	};
	INGENUITY.rowPositions = {
		[1] = (INGENUITY.size.h - 4) * 0.3,
		[2] = (INGENUITY.size.h - 4) * 0.5,
		[3] = (INGENUITY.size.h - 4) * 0.7,
		[4] = (INGENUITY.size.h - 4) * 0.9,
	};
	
	INGENUITY.hasFinisher = true;
	
	-- First index is column.
	INGENUITY.beliefs = {
		[1] = {
			["cookist"] = {
				name = "Cookist",
				description = "Débloque l'artisanat des objets cuisinables.",
				requirements = {"ingenious"},
				row = 2,
			},
			["culinarian"] = {
				name = "Culinarian",
				description = "Débloque les recettes de cuisine de maître.",
				requirements = {"ingenious", "cookist"},
				row = 3,
			},
		},
		[2] = {
			["powder_and_steel"] = {
				name = "Powder and Steel",
				description = "Débloque la capacité de charger les armes à feu.",
				quote = "\"Créateur tout-puissant, divinité, sainteté, idole de moi. Donne-moi le pouvoir, l'esprit, l'allégeance avec ceux qui ont quitté mon arsenal d'une armée. Guide divin, forces universelles soyez avec moi. Et pour ces démons, ripostez pour protéger Hard-Glaze et la société de sa destruction inévitable. Laissez tomber les trophées spirituels pour l'instant, et déchargez les munitions pour purifier ces pécheurs infidèles de la terre. Stockez les explosifs, chargez les fusils, entreposez les véhicules, mais surtout, plantez l'inflorescence de la société Hard-Glaze dans la terre pour les générations à venir.\" - Lord Maximus XII",
				iconOverride = "begotten/ui/belieficons/blessed_powder.png",
				lockedSubfactions = {"Knights of Sol", "Clan Gore", "Clan Reaver", "Clan Harald", "Clan Grock"},
				requirements = {"ingenious"},
				row = 2,
			},
			["pistolier"] = {
				name = "Pistolier",
				description = "Réduit considérablement les risques de raté pour toutes les armes à feu et les empêche d'exploser.",
				lockedSubfactions = {"Knights of Sol", "Clan Gore","Clan Reaver", "Clan Harald", "Clan Grock"},
				requirements = {"ingenious", "powder_and_steel"},
				row = 3,
			},
			["marksman"] = {
				name = "Marksman",
				description = "Augmente considérablement la précision à l'arrêt pour toutes les arbalètes et armes à feu.",
				lockedSubfactions = {"Knights of Sol", "Clan Gore", "Clan Reaver", "Clan Harald", "Clan Grock"},
				requirements = {"ingenious", "powder_and_steel", "pistolier"},
				row = 4,
			},
		},
		[3] = {
			["ingenious"] = {
				name = "Ingenious",
				description = "Débloque la mécanique d'« Artisanat » et la capacité d'interagir avec les pièges. Débloque la capacité d'utiliser les lanternes équipées comme source de lumière à votre ceinture.",
				row = 1,
			},
			["craftsman"] = {
				name = "Craftsman",
				description = "Débloque le niveau II de l'artisanat.",
				requirements = {"ingenious"},
				row = 2,
			},
			["mechanic"] = {
				name = "Mechanic",
				description = "Débloque le niveau III de l'artisanat. Débloque la capacité de réparer des objets non cassés en les fusionnant dans le menu d'inventaire.",
				requirements = {"ingenious", "craftsman"},
				row = 3,
			},
			["artisan"] = {
				name = "Artisan",
				description = "Débloque l'artisanat de chefs-d'œuvre. Débloque également la capacité de réparer des objets cassés.",
				requirements = {"ingenious", "craftsman", "mechanic"},
				row = 4,
			},
		},
		[4] = {
			["smith"] = {
				name = "Smith",
				description = "Débloque la capacité de fondre du Fer via l'artisanat. Débloque également la capacité de faire fondre des objets en métal aux forges.",
				requirements = {"ingenious"},
				row = 2,
			},
			["blacksmith"] = {
				name = "Blacksmith",
				description = "Débloque la capacité de fondre de l'Acier et de l'Or via l'artisanat.",
				requirements = {"ingenious", "smith"},
				row = 3,
			},
			["master_blacksmith"] = {
				name = "Master Blacksmith",
				description = "Débloque la capacité de fondre de l'Acier Fin via l'artisanat.",
				requirements = {"ingenious", "smith", "blacksmith"},
				row = 4,
			},
		},
		[5] = {
			["fortify_the_plate"] = {
				name = "Fortify the Plate",
				description = "Augmente la valeur de protection de toutes les armures de 5 points.",
				iconOverride = "begotten/ui/belieficons/fortify_plate.png",
				requirements = {"ingenious"},
				row = 2,
			},
			["scour_the_rust"] = {
				name = "Scour the Rust",
				description = "Réduit la détérioration de l'état des armures et des armes de 35%.",
				requirements = {"ingenious", "fortify_the_plate"},
				row = 3,
			},
		},
	};
cwBeliefs.beliefTrees:Register(INGENUITY)