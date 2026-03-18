--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local PROWESS = cwBeliefs.beliefTrees:New("prowess")
	PROWESS.name = "Prowess";
	PROWESS.color = Color(150, 50, 20);
	PROWESS.order = 1;
	PROWESS.size = {w = 378, h = 407};
	PROWESS.textures = {"prowess", "prowessarrows"};
	PROWESS.tooltip = {
		{"Prowess", PROWESS.color, "Civ5ToolTip4"},
		{"La prouesse mesure la force physique de votre personnage, affectant principalement son efficacité au combat en mêlée, ainsi que sa capacité d'inventaire.", Color(225, 200, 200)},
		{"\n\"Mais ensuite, il visita le Royaume des Ténèbres, et ce fut le point de non-retour. Il sentit dans son poignet un tremblement qui se manifesta en secousse. Ses fibres étaient maintenant des épines, ses liquides bouillaient. Il sentit qu'il perdrait de vue la vérité, et c'est ce qui arriva...\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : +40% de capacité d'inventaire, +35% de régénération d'endurance et +15% de dégâts d'endurance. Octroie la capacité d'éviter de tomber en ragdoll en subissant des dégâts.", Color(50, 255, 50)}
	};
	PROWESS.columnPositions = {
		[1] = (PROWESS.size.w - 4) * 0.1,
		[2] = (PROWESS.size.w - 4) * 0.3,
		[3] = (PROWESS.size.w - 4) * 0.5,
		[4] = (PROWESS.size.w - 4) * 0.7,
		[5] = (PROWESS.size.w - 4) * 0.9,
	};
	PROWESS.rowPositions = {
		[1] = (PROWESS.size.h - 4) * 0.3,
		[2] = (PROWESS.size.h - 4) * 0.5,
		[3] = (PROWESS.size.h - 4) * 0.7,
		[4] = (PROWESS.size.h - 4) * 0.9,
	};
	
	PROWESS.hasFinisher = true;
	--PROWESS.lockedBeliefs = {"loremaster"};
	PROWESS.lockedTraits = {"weak"};
	
	-- First index is column.
	PROWESS.beliefs = {
		[1] = {
			["halfsword_sway"] = {
				name = "Halfsword and Sway",
				description = "Débloque la capacité de changer la posture d'arme pour toutes les armes.",
				quote = "\"Ne frappe pas cette plaque avec ton épée comme un putain de plouc ! Frappe les articulations et les interstices, bande de pauvres cons non éclairés !\"",
				requirements = {"fighter"},
				row = 2,
			},
			["blademaster"] = {
				name = "Blademaster",
				description = "Toutes les armes tranchantes à une main et les griffes infligent désormais 15% de dégâts supplémentaires. Débloque l'utilisation de l'attribut « Jeu d'épée » pour les épées longues et les épées d'armes à une main.",
				iconOverride = "begotten/ui/belieficons/swordsman.png",
				--lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "halfsword_sway"},
				row = 3,
			},
			["billman"] = {
				name = "Billman",
				description = "Les armes d'hast, les lances, les rapières, les faux, les carreaux d'arbalète et les projectiles infligent désormais 15% de dégâts de pénétration d'armure supplémentaires.",
				quote = "Le soldat honnête garde ses distances avec les imbéciles assoiffés de sang qui cherchent sa perte.",
				lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "halfsword_sway", "blademaster"},
				row = 4,
			},
		},
		[2] = {
			["parrying"] = {
				name = "Parrying",
				description = "Débloque la capacité « Parade » pour la mêlée, qui vous permet de contrer les coups ennemis et d'infliger des dégâts supplémentaires.",
				requirements = {"fighter"},
				row = 2,
			},
			["repulsive_riposte"] = {
				name = "Repulsive Riposte",
				description = "Débloque la capacité d'enchaîner les parades, prolongeant votre fenêtre de parade active de 0,3 seconde chaque fois que vous réussissez une parade, vous permettant ainsi de parer plusieurs adversaires plus facilement. Les parades multiples restaureront successivement plus d'endurance plus vous parez de cibles. Les dégâts d'attaque en riposte après une parade réussie passent de 200% à 250%.",
				--lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "parrying"},
				row = 3,
			},
		},
		[3] = {
			["fighter"] = {
				name = "Fighter",
				description = "L'endurance maximale est désormais augmentée de 10 points.",
				quote = "\"Ramasse cette lance, mon garçon ! Tu vas te battre dans l'armée du Seigneur maintenant.\"",
				row = 1,
			},
			["warrior"] = {
				name = "Warrior",
				description = "L'endurance maximale est désormais augmentée de 10 points supplémentaires.",
				requirements = {"fighter"},
				row = 2,
			},
			["master_at_arms"] = {
				name = "Master at Arms",
				description = "L'endurance maximale est désormais augmentée de 10 points supplémentaires.",
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "warrior"},
				row = 3,
			},
			["wrestle_subdue"] = {
				name = "Wrestle and Subdue",
				description = "Débloque la capacité de ramasser les ennemis qui ont été renversés au combat, même pendant qu'ils se relèvent.",
				lockedBeliefs = {"loremaster"},
				lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				quote = "\"Tu perds pied et tu tombes ? Je t'enfoncerai dans la terre.\"",
				requirements = {"fighter", "warrior", "master_at_arms"},
				row = 4,
			},
		},
		[4] = {
			["deflection"] = {
				name = "Deflection",
				description = "Les déviations réussies (blocages parfaits) restaurent désormais +10 points d'endurance et +5 points de stabilité, et empêchent les attaques ennemies pendant au moins 1 seconde. Lorsque votre fenêtre de déviation est déclenchée, votre son de blocage aura une hauteur plus élevée. Notez qu'il y a un temps de recharge de 2 secondes pour votre fenêtre de déviation, qui est défini chaque fois que vous bloquez.",
				requirements = {"fighter"},
				row = 2,
			},
			["sidestep"] = {
				name = "Sidestep",
				description = "Les déviations réussies restaurent désormais +10 points supplémentaires d'endurance et de stabilité, et empêchent également les attaques ennemies pendant une seconde supplémentaire. Le temps de recharge avant votre prochaine déviation est réduit de 20%, et les déviations réussies supprimeront votre temps de recharge de déviation.",
				--lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "deflection"},
				row = 3,
			},
		},
		[5] = {
			["strength"] = {
				name = "Strength",
				description = "Débloque la capacité d'utiliser des armes lourdes. Empêche d'être désarmé en subissant des dégâts si vous utilisez une arme de lancer en posture de mêlée. Débloque également la capacité de recharger les arbalètes.",
				requirements = {"fighter"},
				row = 2,
			},
			["might"] = {
				name = "Might",
				description = "Augmente la capacité d'inventaire de 25%. Infligez 10% de dégâts de stabilité supplémentaires avec toutes les armes de mêlée. Les poings et les armes de poing infligent désormais 20% de dégâts supplémentaires. Débloque l'utilisation de l'attribut « Puncture ».",
				quote = "\"Je t'écrase maintenant !\"",
				--lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "strength"},
				row = 3,
			},
			["unrelenting"] = {
				name = "Unrelenting",
				description = "Les armes lourdes, les faux et les armes à deux mains infligent désormais 10% de dégâts supplémentaires. Toutes les armes de mêlée infligent désormais 25% de dégâts d'endurance supplémentaires. Supprime la pénalité de dégâts pour toucher plusieurs cibles avec un seul coup.",
				lockedSubfactions = {"Auxiliary", "Servus", "Low Ministry"},
				lockedBeliefs = {"loremaster"},
				requirements = {"fighter", "strength", "might"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(PROWESS)