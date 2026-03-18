--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local BRUTALITY = cwBeliefs.beliefTrees:New("brutality")
	BRUTALITY.name = "Brutality";
	BRUTALITY.color = Color(150, 20, 20);
	BRUTALITY.order = 2;
	BRUTALITY.size = {w = 258, h = 407};
	BRUTALITY.textures = {"brutality", "brutalityarrows"};
	BRUTALITY.tooltip = {
		{"Brutality", BRUTALITY.color, "Civ5ToolTip4"},
		{"La brutalité mesure la dépravation de votre personnage et sa haine envers l'homme, affectant principalement sa capacité de survie et débloquant des capacités telles que le cannibalisme et la récolte d'os. Améliorer complètement la brutalité rendra votre personnage bien plus capable de survivre tout en augmentant ses capacités de combat lorsqu'il est fou.", Color(225, 200, 200)},
		{"\n\"Il n'y aura pas d'exil pour les traînards. Ils ressentiront ma colère. Je transpercerai leur chair satanique et immonde avec une fourche et la récolterai pour la vache.\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : Tuer un autre personnage restaure instantanément 2% de votre santé et endurance actuellement manquantes par niveau de sacrement de la victime.", Color(50, 255, 50)}
	};
	BRUTALITY.columnPositions = {
		[1] = (BRUTALITY.size.w - 4) * 0.3,
		[2] = (BRUTALITY.size.w - 4) * 0.5,
		[3] = (BRUTALITY.size.w - 4) * 0.7,
	};
	BRUTALITY.rowPositions = {
		[1] = (BRUTALITY.size.h - 4) * 0.3,
		[2] = (BRUTALITY.size.h - 4) * 0.5,
		[3] = (BRUTALITY.size.h - 4) * 0.7,
		[4] = (BRUTALITY.size.h - 4) * 0.9,
	};
	
	BRUTALITY.hasFinisher = true;
	BRUTALITY.lockedTraits = {"pacifist"};
	
	-- First index is column.
	BRUTALITY.beliefs = {
		[1] = {
			["primeval"] = {
				name = "Primeval",
				description = "Débloque la mécanique de « Récolte », vous permettant de récolter des os sur les cadavres pour les utiliser en artisanat. Débloque la capacité de fabriquer des objets de soin à base de peau.",
				requirements = {"savage"},
				row = 2,
			},
			["headtaker"] = {
				name = "Headtaker",
				description = "Inflige 25% de dégâts supplémentaires aux membres avec tous les types de dégâts. Débloque la capacité de décapiter des personnages via des coups fatals à la tête avec une arme tranchante qui dépassent 30 dégâts. Décapiter un personnage accorde 20% de dégâts de mêlée supplémentaires pendant 30 secondes.",
				iconOverride = "begotten/ui/belieficons/brutality.png",
				requirements = {"savage", "primeval"},
				row = 3,
			},
		},
		[2] = {
			["savage"] = {
				name = "Savage",
				description = "Débloque la mécanique de « Cannibalisme ». La viande des cadavres peut être récoltée pour se sustenter. Gagnez de la santé mentale en consommant de la chair humaine cuite.",
				row = 1,
			},
			["savage_animal"] = {
				name = "Savage Animal",
				description = "Manger de la nourriture non cuite ou avariée ou boire de l'eau sale n'a plus d'effets négatifs. Supprime également la perte de santé mentale en mangeant des cœurs.",
				quote = "\"Craignez celui qui vous arrachera le cœur, dévorera votre chair et portera vos os. Car c'est lui le prédateur, et nous la proie !\"",
				requirements = {"savage", "primeval", "headtaker", "heart_eater", "bestial"},
				row = 4,
			},
		},
		[3] = {
			["heart_eater"] = {
				name = "Heart Eater",
				description = "Débloque la capacité d'arracher le cœur de quelqu'un et de le manger pour restaurer la soif.",
				iconOverride = "begotten/ui/belieficons/persistent_urges.png",
				requirements = {"savage"},
				row = 2,
			},
			["bestial"] = {
				name = "Bestial",
				description = "Lorsque votre santé mentale est inférieure ou égale à 40%, infligez 10% de dégâts supplémentaires avec toutes les armes de mêlée.",
				requirements = {"savage", "heart_eater"},
				row = 3,
			},
		},
	};
cwBeliefs.beliefTrees:Register(BRUTALITY)