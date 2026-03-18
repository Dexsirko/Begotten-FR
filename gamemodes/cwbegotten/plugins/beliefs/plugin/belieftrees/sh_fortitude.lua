--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local FORTITUDE = cwBeliefs.beliefTrees:New("fortitude")
	FORTITUDE.name = "Fortitude";
	FORTITUDE.color = Color(150, 80, 60);
	FORTITUDE.order = 6;
	FORTITUDE.size = {w = 378, h = 407};
	FORTITUDE.textures = {"fortitude", "fortitudearrows"};
	FORTITUDE.tooltip = {
		{"Fortitude", FORTITUDE.color, "Civ5ToolTip4"},
		{"La fortitude mesure la résilience mentale et physique de votre personnage, affectant principalement sa résistance à la folie ainsi que l'amélioration de ses capacités de combat grâce à une tolérance à la douleur accrue.", Color(225, 200, 200)},
		{"\n\"Je suis le créateur de toute cette lumière et maintenant je tombe en morceaux sans reconnaissance. Mourir sans glorification est une nature pécheresse, pourtant Dieu ne réside pas dans la lumière. La lumière réside dans les ténèbres. Les âmes commencent par la chair. L'esprit médite à l'intérieur de coquilles qui ne peuvent supporter un mensonge qui ne fait qu'interpréter tout ce que nous avons accompli.\"", Color(128, 90, 90, 240)},
		{"\nBonus d'achèvement de l'arbre de croyances : +15 PV maximum, +25% de résistance aux dégâts d'endurance, +15% de résistance aux dégâts de stabilité. Octroie une résistance au renversement par explosion. Les attaques autrement létales vous mettront désormais toujours en état critique.", Color(50, 255, 50)},
	};
	FORTITUDE.columnPositions = {
		[1] = (FORTITUDE.size.w - 4) * 0.1,
		[2] = (FORTITUDE.size.w - 4) * 0.3,
		[3] = (FORTITUDE.size.w - 4) * 0.5,
		[4] = (FORTITUDE.size.w - 4) * 0.7,
		[5] = (FORTITUDE.size.w - 4) * 0.9,
	};
	FORTITUDE.rowPositions = {
		[1] = (FORTITUDE.size.h - 4) * 0.3,
		[2] = (FORTITUDE.size.h - 4) * 0.5,
		[3] = (FORTITUDE.size.h - 4) * 0.7,
		[4] = (FORTITUDE.size.h - 4) * 0.9,
	};
	
	FORTITUDE.hasFinisher = true;

	-- First index is column.
	FORTITUDE.beliefs = {
		[1] = {
			["asceticism"] = {
				name = "Asceticism",
				description = "La faim et la soif se drainent désormais 35% plus lentement. Cela affectera également la fatigue (énergie) si vous êtes un Voltiste avec la croyance « Yellow and Black ».",
				row = 1,
			},
			["outlasting"] = {
				name = "Outlasting",
				description = "Réduit le drain d'endurance en sprintant de 25%.",
				lockedTraits = {"winded"},
				requirements = {"asceticism"},
				row = 2,
			},
		},
		[2] = {
			["prudence"] = {
				name = "Prudence",
				description = "La santé mentale se draine désormais 25% plus lentement et certains événements l'affectent moins. L'effet sur la santé mentale des cris de guerre ennemis est réduit de 50%.",
				row = 1,
			},
			["saintly_composure"] = {
				name = "Saintly Composure",
				description = "Les effets d'une faible santé mentale sont grandement réduits, et l'effet des cris de guerre ennemis sur votre vision est également grandement réduit.",
				quote = "\"Par la monture divine et la noble stature, ces pensées engendrées ne me tenteront pas.\"",
				requirements = {"prudence"},
				row = 2,
			},
			["lunar_repudiation"] = {
				name = "Lunar Repudiation",
				description = "Confère l'immunité à tous les effets de la Lune de Sang et réduit de moitié la perte de santé mentale résiduelle nocturne. Réduit considérablement les effets de peur des thralls et des armures ennemies.",
				requirements = {"prudence", "saintly_composure"},
				row = 3,
			},
		},
		[3] = {
			["hauberk"] = {
				name = "Hauberk",
				description = "Débloque la capacité de porter une armure lourde.",
				row = 1,
			},
			["defender"] = {
				name = "Defender",
				description = "Débloque la capacité d'équiper des grands boucliers.",
				quote = "Les sauvages tremblaient devant le mur d'acier qui avançait.",
				requirements = {"hauberk"},
				row = 2,
			},
			["warden"] = {
				name = "Warden",
				description = "Toutes les armes de mêlée et boucliers ont désormais 15% de résistance supplémentaire aux dégâts d'endurance.",
				requirements = {"hauberk", "defender"},
				row = 3,
			},
			["unburdened"] = {
				name = "Unburdened",
				description = "Réduit considérablement la pénalité de mouvement pour les armures moyennes et lourdes, y compris la roulade.",
				requirements = {"hauberk", "defender", "warden"},
				row = 4,
			},
		},
		[4] = {
			["believers_perseverance"] = {
				name = "The Believer's Perseverance",
				description = "Augmente la durée de l'état critique de 300%.",
				quote = "\"Souffre en silence et n'entre pas dans la lumière ; il reste encore des ennemis à tuer !\"",
				row = 1,
			},
			["plenty_to_spill"] = {
				name = "Plenty to Spill",
				description = "Réduit le taux de perte de sang en cas de saignement de 50%.",
				requirements = {"believers_perseverance"},
				row = 2,
			},
			["unyielding"] = {
				name = "Unyielding",
				description = "Augmente vos PV maximum de 25 points.",
				requirements = {"believers_perseverance", "plenty_to_spill"},
				row = 3,
			},
		},
		[5] = {
			["hide_of_steel"] = {
				name = "Hide of Steel",
				description = "Réduit les risques de subir des blessures de 50%.",
				row = 1,
			},
			["iron_bones"] = {
				name = "Iron Bones",
				description = "Réduit les dégâts subis aux membres de 33%.",
				requirements = {"hide_of_steel"},
				row = 2,
			},
		},
	};
cwBeliefs.beliefTrees:Register(FORTITUDE)