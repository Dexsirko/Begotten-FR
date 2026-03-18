--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local APTITUDE = cwBeliefs.beliefTrees:New("aptitude")
	APTITUDE.name = "Aptitude";
	APTITUDE.color = Color(107, 92, 77)
	APTITUDE.order = 8;
	APTITUDE.size = {w = 378, h = 407};
	APTITUDE.textures = {"aptitude", "aptitudearrows"};
	APTITUDE.tooltip = {
		{"Aptitude", APTITUDE.color, "Civ5ToolTip4"},
		{"L'aptitude mesure l'intellect de votre personnage, affectant son alphabétisation, son efficacité en alchimie et en tant que guérisseur. Améliorer cet ensemble de croyances débloquera de nouvelles façons d'apprendre et de s'adapter, de devenir un médecin ou un alchimiste compétent, ainsi que la capacité de lire.", Color(225, 200, 200)},
		{"\n\"Ne souillez pas l'héritage de Hard-Glaze si vous ne pouvez pas supporter de maintenir le code.\"\nSa voix n'était pas un murmure, mais un défi audacieux à tous ceux qui s'opposaient.\n\"Était-ce le dernier témoignage ? La transcendance m'a rapproché, résonnant dans un rayon du nouvel espoir du Dieu tout-puissant.\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : +75% de gain de foi provenant de toutes les sources.", Color(50, 255, 50)},
	};
	APTITUDE.columnPositions = {
		[1] = (APTITUDE.size.w - 4) * 0.1,
		[2] = (APTITUDE.size.w - 4) * 0.3,
		[3] = (APTITUDE.size.w - 4) * 0.5,
		[4] = (APTITUDE.size.w - 4) * 0.7,
		[5] = (APTITUDE.size.w - 4) * 0.9,
	};
	APTITUDE.rowPositions = {
		[1] = (APTITUDE.size.h - 4) * 0.3,
		[2] = (APTITUDE.size.h - 4) * 0.5,
		[3] = (APTITUDE.size.h - 4) * 0.7,
		[4] = (APTITUDE.size.h - 4) * 0.9,
	};
	
	APTITUDE.hasFinisher = true;
	APTITUDE.lockedTraits = {"blind"};
	
	-- First index is column.
	APTITUDE.beliefs = {
		[1] = {
			["precise_measurements"] = {
				name =  "Precise Measurements",
				description = "Il est désormais impossible d'échouer une concoction.",
				requirements = {"literacy", "alchemist"},
				row = 3,
				disabled = true,
			},
			["blood_nectar"] = {
				name = "Blood Nectar",
				description = "Vos concoctions sont désormais nettement plus puissantes.",
				requirements = {"literacy", "alchemist", "precise_measurements"},
				row = 4,
				disabled = true,
			},
		},
		[2] = {
			["alchemist"] = {
				name = "Alchemist",
				description = "Débloque la mécanique d'« Alchimie ».",
				requirements = {"literacy"},
				row = 2,
				disabled = true,
			},
			["chemist"] = {
				name = "Chemist",
				description = "Débloque les concoctions de niveau II.",
				requirements = {"literacy", "alchemist"},
				row = 3,
				disabled = true,
			},
			["scientist"] = {
				name = "Scientist",
				description = "Débloque les concoctions de niveau III.",
				requirements = {"literacy", "alchemist", "chemist"},
				row = 4,
				disabled = true,
			},
		},
		[3] = {
			["literacy"] = {
				name = "Literacy",
				description = "Débloque la capacité de lire. Gagnez une quantité modérée de foi pour chaque écriture unique lue (jusqu'à un maximum de 8).",
				row = 1,
			},
			["scribe"] = {
				name = "Scribe",
				description = "Débloque la capacité de copier des écritures. Gagnez une abondance de foi pour chaque écriture unique copiée (réduite de moitié pour les copies suivantes).",
				requirements = {"literacy"},
				row = 2,
			},
			["anthropologist"] = {
				name = "Anthropologist",
				description = "Débloque la capacité de lire et copier les textes Runiques et des Terres Sombres.",
				requirements = {"literacy", "scribe"},
				row = 3,
			},
			["loremaster"] = {
				name = "Loremaster",
				description = "Augmente votre plafond de niveau de sacrement de 10 mais verrouille les croyances de niveau III et IV de l'arbre « Prouesse ». Toutes les épiphanies investies dans celles-ci seront remboursées.",
				quote = "Abandonnez vos désirs. Laissez de côté votre esprit guerrier. Vous êtes un phare de connaissance. Laissez les jeunes insensés se quereller et mourir. Devenez omniscient, et la sagesse sera votre arme.",
				requirements = {"literacy", "scribe", "anthropologist"},
				row = 4,
			},
		},
		[4] = {
			["sanitary"] = {
				name = "Sanitary",
				description = "Réduit considérablement les risques d'attraper une maladie ou une infection, et élimine complètement le risque de contracter des maladies en manipulant des cadavres.",
				quote = "L'insalubrité de l'esprit est la cause première de la folie ; l'insalubrité du corps est la cause première des afflictions.",
				requirements = {"literacy"},
				row = 2,
			},
			["doctor"] = {
				name = "Doctor",
				description = "Débloque la capacité de diagnostiquer les blessures d'un patient. Double la vitesse de guérison des autres personnages ainsi que la vitesse d'application du chloroforme.",
				requirements = {"literacy", "sanitary"},
				row = 3,
			},
			["surgeon"] = {
				name = "Surgeon",
				description = "Débloque la capacité de pratiquer des opérations pour traiter les blessures avancées.",
				requirements = {"literacy", "sanitary", "doctor"},
				row = 4,
			},
		},
		[5] = {
			["medicine_man"] = {
				name = "Medicine Man",
				description = "Triple l'efficacité des objets de soin lorsqu'ils sont utilisés sur d'autres personnages. Augmente l'efficacité des objets de soin sur vous-même de 70%.",
				requirements = {"literacy", "sanitary"},
				row = 3,
			},
			["plague_doctor"] = {
				name = "Plague Doctor",
				description = "Débloque la capacité de créer un remède contre la Peste des Begotten. Débloque également la capacité de fabriquer la tenue de Médecin de la Peste et de la porter.",
				requirements = {"literacy", "sanitary", "medicine_man"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(APTITUDE)