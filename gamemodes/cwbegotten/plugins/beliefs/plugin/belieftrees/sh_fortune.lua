--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local FORTUNE = cwBeliefs.beliefTrees:New("fortune")
	FORTUNE.name = "Fortune";
	FORTUNE.color = Color(60, 69, 72);
	FORTUNE.order = 3;
	FORTUNE.size = {w = 258, h = 407};
	FORTUNE.textures = {"fortune", "fortunearrows"};
	FORTUNE.tooltip = {
		{"Fortune", FORTUNE.color, "Civ5ToolTip4"},
		{"La fortune mesure la chance de votre personnage. Négliger cet arbre de croyances au profit d'autres peut contribuer à la perte de votre personnage, tandis que l'améliorer peut augmenter ses chances d'échapper à des situations périlleuses et améliorer sa capacité à récupérer des ressources.", Color(225, 200, 200)},
		{"\n\"Entraîne-toi avec la pièce dans ton unique main. L'autre est tombée en pourriture...\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : Augmente les chances de trouver des objets extrêmement rares. Réduit le coût de tous les articles vendus par les marchands de 10%.", Color(50, 255, 50)}
	};
	FORTUNE.columnPositions = {
		[1] = (FORTUNE.size.w - 4) * 0.3,
		[2] = (FORTUNE.size.w - 4) * 0.5,
		[3] = (FORTUNE.size.w - 4) * 0.7,
	};
	FORTUNE.rowPositions = {
		[1] = (FORTUNE.size.h - 4) * 0.3,
		[2] = (FORTUNE.size.h - 4) * 0.5,
		[3] = (FORTUNE.size.h - 4) * 0.7,
		[4] = (FORTUNE.size.h - 4) * 0.9,
	};
	
	FORTUNE.hasFinisher = true;
	FORTUNE.lockedTraits = {"marked"};
	
	-- First index is column.
	FORTUNE.beliefs = {
		[1] = {
			["fortunate"] = {
				name = "Fortunate",
				description = "Vous avez désormais une chance de trouver des objets légèrement meilleurs en fouillant.",
				quote = "\"La fortune sourit aux audacieux.\"",
				row = 1,
			},
			["lucky"] = {
				name = "Lucky",
				description = "5% de chances d'éviter complètement les dégâts lorsque vous subissez des dégâts de n'importe quelle source (à l'exclusion de la flagellation/auto-électrocution).",
				requirements = {"fortunate"},
				row = 2,
			},
			["favored"] = {
				name = "Favored",
				description = "Une puissance d'un autre monde, qu'elle soit bénie ou impie, vous regarde avec faveur. Vos prières ont plus de chances d'être entendues, et les forces malveillantes ne vous cibleront plus. Vous ne mourrez plus en consommant certains aliments ou boissons, et ces objets qui étaient autrefois mortels peuvent désormais avoir une valeur cachée.",
				quote = "\"Les Dieux favorisent celui-ci.\"",
				requirements = {"fortunate", "lucky"},
				row = 3,
			},
		},
		[2] = {},
		[3] = {
			["talented"] = {
				name = "Talented",
				description = "Augmente le gain de foi de toutes les activités de 15%.",
				quote = "\"Un talent naturel pour tout. Est-ce un prodige venu des cieux, ou un descendant de noble stature ?\"",
				row = 1,
			},
			["gifted"] = {
				name = "Gifted",
				description = "Augmentation supplémentaire de 10% du gain de foi de toutes les activités.",
				requirements = {"talented"},
				row = 2,
			},
			["jack_of_all_trades"] = {
				name = "Jack of All Trades",
				description = "Gagnez instantanément six niveaux de foi, mais toutes les croyances de niveau 4 non liées à une sous-foi sont verrouillées (à l'exclusion des croyances de sous-foi). Toutes les épiphanies investies dans les croyances verrouillées seront remboursées. Notez que cela n'augmentera pas votre niveau de sacrement maximum, donc si vous êtes déjà au niveau maximum, cette croyance ne fera rien.",
				quote = "\"..et maître d'aucune.\"",
				requirements = {"talented", "gifted"},
				row = 3,
			},
		},
	};
cwBeliefs.beliefTrees:Register(FORTUNE)