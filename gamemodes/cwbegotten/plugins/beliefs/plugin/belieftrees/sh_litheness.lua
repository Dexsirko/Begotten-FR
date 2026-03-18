--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local LITHENESS = cwBeliefs.beliefTrees:New("litheness")
	LITHENESS.name = "Litheness";
	LITHENESS.color = Color(100, 70, 70);
	LITHENESS.order = 4;
	LITHENESS.size = {w = 258, h = 407};
	LITHENESS.textures = {"litheness", "lithenessarrows"};
	LITHENESS.tooltip = {
		{"Litheness", LITHENESS.color, "Civ5ToolTip4"},
		{"La souplesse mesure la discrétion et la fourberie de votre personnage, ainsi que sa flexibilité et sa vitesse. Améliorer cet arbre de croyances permettra à votre personnage de devenir un maître de la furtivité, du vol et de la tromperie, tout en augmentant la vitesse de sprint et en débloquant des esquives.", Color(225, 200, 200)},
		{"\n\"Écorche l'imbécile qui trébuche dans sa foulée. Laisse-le courir nu, chair dégainée, tandis que des yeux ombreux jugent sa vitesse languissante.\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : +5% de vitesse de sprint, +15 points de stabilité maximum et 20% de taux de régénération de stabilité.", Color(50, 255, 50)}
	};
	LITHENESS.columnPositions = {
		[1] = (LITHENESS.size.w - 4) * 0.3,
		[2] = (LITHENESS.size.w - 4) * 0.5,
		[3] = (LITHENESS.size.w - 4) * 0.7,
	};
	LITHENESS.rowPositions = {
		[1] = (LITHENESS.size.h - 4) * 0.3,
		[2] = (LITHENESS.size.h - 4) * 0.5,
		[3] = (LITHENESS.size.h - 4) * 0.7,
		[4] = (LITHENESS.size.h - 4) * 0.9,
	};
	
	LITHENESS.hasFinisher = true;
	
	-- First index is column.
	LITHENESS.beliefs = {
		[1] = {
			["sly_fidget"] = {
				name = "Sly Fidget",
				description = "Débloque la mécanique de « Crochetage ».",
				requirements = {"nimble"},
				row = 2,
			},
			["safecracker"] = {
				name = "Safecracker",
				description = "Vous pouvez désormais crocheter les serrures de niveau III.",
				requirements = {"nimble", "sly_fidget"},
				row = 3,
			},
			["thief"] = {
				name = "Thief",
				description = "Le crochetage est désormais plus facile.",
				quote = "Un serf peine, un voleur récolte.",
				requirements = {"nimble", "sly_fidget", "safecracker"},
				row = 4,
			},
		},
		[2] = {
			["nimble"] = {
				name = "Nimble",
				description = "Les déplacements accroupis sont désormais silencieux et rapides. Réduit la distance à laquelle les thralls peuvent vous voir lorsque vous êtes accroupi.",
				row = 1,
			},
		},
		[3] = {
			["evasion"] = {
				name = "Evasion",
				description = "Débloque la capacité « Roulade de combat ». La roulade de combat accorde des frames d'invincibilité basées sur le poids de l'armure portée et peut également éteindre les incendies.",
				requirements = {"nimble"},
				row = 2,
			},
			["dexterity"] = {
				name = "Dexterity",
				description = "Toutes les actions avec barre de progression, y compris lever les armes, recharger, se lever et fabriquer, entre autres, s'achèvent désormais 33% plus rapidement. Double la vitesse à laquelle vous visez avec les armes à distance. Débloque la capacité de courir en toute sécurité avec un seau plein de liquide.",
				requirements = {"nimble", "evasion"},
				row = 3,
			},
			["swift"] = {
				name = "Swift",
				description = "Le sprint est désormais 10% plus rapide.",
				requirements = {"nimble", "evasion", "dexterity"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(LITHENESS)