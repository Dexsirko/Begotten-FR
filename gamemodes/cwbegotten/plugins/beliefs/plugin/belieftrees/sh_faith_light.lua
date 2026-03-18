--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local LIGHT = cwBeliefs.beliefTrees:New("light")
	LIGHT.name = "Faith of the Light";
	LIGHT.color = Color(255, 215, 0);
	LIGHT.order = 7;
	LIGHT.size = {w = 771, h = 407};
	LIGHT.textures = {"light", "faithlightarrows"};
	LIGHT.headerFontOverride = "nov_IntroTextSmallaaafaa";
	LIGHT.tooltip = {
		{"Faith of the Light", LIGHT.color, "Civ5ToolTip4"},
		{"Chaque foi possède un ensemble de compétences unique, débloquant des capacités de personnage, des rituels, et améliorant généralement les statistiques globales. On peut également se diversifier dans des sous-fois, bien que la pratique ouverte de ces sous-fois puisse faire considérer votre personnage comme hérétique par les autorités religieuses concernées.", Color(225, 200, 200)},
		{"\n\"La ville sainte de Glaze dans le domaine de l'Enfer. Ce sont mes deux épées à croiser, en effet sur sa poitrine en résolution d'une cause finale. Dans un cœur battant de boucliers.\"", Color(128, 90, 90, 240)},
		{"", Color(50, 255, 50)}
	};
	LIGHT.columnPositions = {
		[1] = (LIGHT.size.w - 4) * 0.133,
		[2] = (LIGHT.size.w - 4) * 0.2,
		[3] = (LIGHT.size.w - 4) * 0.266,
		[4] = (LIGHT.size.w - 4) * 0.433,
		[5] = (LIGHT.size.w - 4) * 0.5,
		[6] = (LIGHT.size.w - 4) * 0.566,
		[7] = (LIGHT.size.w - 4) * 0.733,
		[8] = (LIGHT.size.w - 4) * 0.8,
		[9] = (LIGHT.size.w - 4) * 0.866,
	};
	LIGHT.rowPositions = {
		[1] = (LIGHT.size.h - 4) * 0.3,
		[2] = (LIGHT.size.h - 4) * 0.5,
		[3] = (LIGHT.size.h - 4) * 0.7,
		[4] = (LIGHT.size.h - 4) * 0.9,
	};
	
	LIGHT.lockedSubfactions = {"Clan Grock"};
	LIGHT.requiredFaiths = {"Faith of the Light"};
	
	-- First index is column.
	LIGHT.beliefs = {
		[1] = {
			["repentant"] = {
				name = "Repentant",
				subfaith = "Sol Orthodoxy",
				description = "Débloque les rituels de niveau I de la « Foi de la Lumière ». Débloque la capacité d'équiper les armures et les armes sacrificielles de l'Orthodoxie Solaire, ainsi que la capacité de manier à deux mains des armes à une main.",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy"},
				row = 2,
			},
			["flagellant"] = {
				name = "Flagellant",
				subfaith = "Sol Orthodoxy",
				description = "Débloque les rituels de niveau II de la « Foi de la Lumière ». Débloque la capacité de s'auto-flageller. Deux fois la quantité de dégâts infligés à vous-même par la flagellation vous sera rendue sous forme d'endurance, et un tiers des dégâts restaurera votre santé mentale.",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy", "repentant"},
				row = 3,
			},
			["extinctionist"] = {
				name = "Extinctionist",
				subfaith = "Sol Orthodoxy",
				description = "Débloque les rituels de niveau III de la « Foi de la Lumière » et les rituels uniques de l'Orthodoxie Solaire. Lorsque vous êtes en feu, vos attaques de mêlée enflamment tout ennemi touché même s'il bloque (sans compter les déviations/parades).",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy", "repentant", "flagellant"},
				row = 4,
			},
		},
		[2] = {
			["sol_orthodoxy"] = {
				name = "Sol Orthodoxy",
				subfaith = "Sol Orthodoxy",
				description = "Sélectionne « Orthodoxie Solaire » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de se suicider. Débloque un gain de foi pour chaque point de dégâts qui vous est infligé. Le gain de foi provenant de toutes les sources sera légèrement augmenté si votre faim ou votre soif sont inférieures à 40%, davantage si les deux le sont.",
				quote = "L'Orthodoxie Solaire est une corruption des croyances Glazic traditionnelles. Elle dicte qu'aucun être mortel n'atteindra jamais l'illumination tant qu'il respirera encore. Les hommes sont encouragés à se repentir de leur terrible nature pécheresse, par la flagellation et même le suicide. La Glaze de Sol brillera à nouveau, mais seulement quand il n'y aura plus d'yeux vivants pour la voir.",
				iconOverride = "begotten/ui/belieficons/faith-traditionalist.png",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				row = 1,
			},
		},
		[3] = {
			["prison_of_flesh"] = {
				name = "This Prison of Flesh",
				subfaith = "Sol Orthodoxy",
				description = "Subir des dégâts de feu réduira la corruption de chaque point de dégâts subis. Si vous êtes possédé, la corruption ne sera pas réduite tant qu'elle n'est pas supérieure à 50%.",
				quote = "\"Laissez les démons venir à cette prison de chair ! Je les punirai, je leur montrerai l'agonie, et je ne céderai jamais à leurs désirs !\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy"},
				row = 2,
			},
			["purity_afloat"] = {
				name = "Purity Afloat",
				subfaith = "Sol Orthodoxy",
				description = "Augmente la vitesse de déplacement jusqu'à un maximum de 20% (à 25% de santé) plus votre santé est basse. L'augmentation de vitesse de déplacement de l'Armure Lourde est plafonnée à +15%.",
				quote = "\"Défaites-vous des chaînes du matériel. Frappez-vous nu et vrai. Abandonnez-vous et laissez la pureté flotter.\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy", "prison_of_flesh"},
				row = 3,
			},
			["fanaticism"] = {
				name = "Fanaticism",
				subfaith = "Sol Orthodoxy",
				description = "Augmente les dégâts de mêlée, d'endurance et de stabilité jusqu'à un maximum de 50% (à 10% de santé) plus votre santé est basse.",
				quote = "\"PURETÉ PAR LA DOULEUR ! EXTINCTION PAR LE SACRIFICE ! LES CLOCHES SONNENT POUR TOUS !\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Holy Hierarchy"},
				lockedSubfactions = {"Praeventor", "Northlander"},
				requirements = {"sol_orthodoxy", "prison_of_flesh", "purity_afloat"},
				row = 4,
			},
		},
		[4] = {
			["disciple"] = {
				name = "Disciple",
				subfaith = "Hard-Glazed",
				description = "Débloque les rituels de niveau I de la « Foi de la Lumière ». Augmente les chances de trouver des pièces dans les conteneurs de butin des Terres Désolées.",
				requirements = {"hard_glazed"},
				row = 2,
			},
			["acolyte"] = {
				name = "Acolyte",
				subfaith = "Hard-Glazed",
				description = "Débloque les rituels de niveau II de la « Foi de la Lumière ». Augmente le gain de santé mentale à proximité des feux.",
				requirements = {"hard_glazed", "disciple"},
				row = 3,
			},
			["emissary"] = {
				name = "Emissary",
				subfaith = "Hard-Glazed",
				description = "Débloque les rituels de niveau III de la « Foi de la Lumière ». Débloque également la capacité de fondre l'Acier Maximilien (seulement si « Maître Forgeron » est également débloqué).",
				requirements = {"hard_glazed", "disciple", "acolyte"},
				row = 4,
			},
		},
		[5] = {
			["hard_glazed"] = {
				name = "Hard-Glazed",
				subfaith = "Hard-Glazed",
				description = "Sélectionne « Hard-Glazed » comme votre sous-foi. Débloque la capacité de prier. Foi gagnée en faisant de grands dons de Pièces à l'Église.",
				quote = "La chasteté et l'aumône sont les principes fondamentaux de l'idéologie Hard-Glazed. Tout est perdu pour la Sainte Hiérarchie, et on ne doit s'attendre qu'à une vie terne, pleine de labeur pour son Ministre. Pourtant, ceux de la Hiérarchie suivent le Manifeste, et cachée dans ses pages se trouve la clé de l'ascension céleste.",
				iconOverride = "begotten/ui/belieficons/faith-glaze.png",
				row = 1,
			},
		},
		[6] = {
			["the_light"] = {
				name = "The Light",
				subfaith = "Hard-Glazed",
				description = "Débloque la capacité d'équiper certaines armes sacrificielles de la « Foi de la Lumière ». Toutes les armes de mêlée, les carreaux d'arbalète et les projectiles infligent désormais 15% de dégâts de pénétration d'armure supplémentaires.",
				quote = "\"La Glaze est la lumière... c'est la vérité - vous ne pouvez pas la voir en perspective car elle est vous ; votre folie, votre grandeur, votre pouvoir...\"",
				requirements = {"hard_glazed"},
				row = 2,
			},
			["blessed_powder"] = {
				name = "Blessed Powder",
				subfaith = "Hard-Glazed",
				description = "Toutes les armes à feu infligent désormais 30% de dégâts supplémentaires.",
				quote = "Le Seigneur Maximus cria de sa voix tonitruante « Donnez-leur l'acier », et ainsi, l'acier fut donné.",
				iconOverride = "begotten/ui/belieficons/blessed_powder2.png",
				requirements = {"hard_glazed", "the_light"},
				row = 3,
			},
			["manifesto"] = {
				name = "All Links to the Manifesto",
				subfaith = "Hard-Glazed",
				description = "Vous infligez désormais 20% de dégâts supplémentaires avec toute arme (sauf les armes à feu) contre les personnages d'une autre Foi, mais infligez 10% de dégâts en moins contre ceux de la même Foi. Remplace l'effet de l'attribut « Grounded » sur les armes de mêlée par une réduction de 60% des dégâts de mêlée en sprintant au lieu d'interdire carrément les attaques de mêlée en sprintant.",
				quote = "\"Il n'y a que la Glaze. Fuck les pauvres cons, en effet !\"",
				iconOverride = "begotten/ui/belieficons/loremaster.png",
				requirements = {"hard_glazed", "the_light", "blessed_powder"},
				row = 4,
			},
		},
		[7] = {
			["wire_therapy"] = {
				name = "Wire Therapy",
				subfaith = "Voltism",
				description = "Débloque la capacité de Relayer pour envoyer des messages à tous les autres Voltistes globalement. Débloque les recettes d'artisanat de niveau I du « Voltisme ».",
				quote = "On dirait que Shaye a besoin de passer plus de temps sur les fils.",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism"},
				row = 2,
			},
			["jacobs_ladder"] = {
				name = "Jacob's Ladder",
				subfaith = "Voltism",
				description = "Débloque les recettes d'artisanat de niveau II du « Voltisme ». Débloque la capacité de consommer des objets « Tech », ce qui diminuera la corruption et augmentera votre énergie, tout en fournissant une quantité substantielle de foi (XP). Les bénéfices de la consommation d'objets « Tech » dépendent de l'état de l'objet. Réduit la santé maximale de 5 points.",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism", "wire_therapy"},
				row = 3,
			},
			["the_paradox_riddle_equation"] = {
				name = "The Paradox Riddle Equation",
				subfaith = "Voltism",
				description = "Débloque les recettes d'artisanat de niveau III du « Voltisme ». À ce stade, vous ne pourrez plus communiquer normalement car votre voix sera à jamais altérée. Débloque la capacité d'appliquer des objets « Tech » sur les membres pour les guérir complètement de leurs blessures. Confère l'immunité à toutes les maladies. Se tenir dans une étendue d'eau, sous la pluie, ou ingérer de l'eau vous infligera désormais une grande quantité de dégâts électriques. Augmente votre plafond de niveau de sacrement de 5 points. Réduit la santé maximale de 5 points.",
				quote = "\"L'Équation de l'Énigme du Paradoxe, ou le Paradoxe du Défonceur de Cerveau, fait référence à un terrible événement dans l'histoire de la Sainte Hiérarchie. Une maladie de l'esprit qui a commencé comme un simple ensemble de questions et d'équations mathématiques s'est répandue dans les maisons nobles et a ravagé les Districts pendant une période de six ans dans la mémoire récente. On note que les palais de marbre du District Un étaient couverts de taches rouges à la suite des nobles se cognant la tête contre les murs par frustration et confusion totale. C'est peut-être la seule « peste » de l'histoire de la Sainte Hiérarchie qui n'a affecté que les classes supérieures, car le peuple était heureusement ignorant des implications profondes de l'Équation de l'Énigme, étant bien sûr trop simple d'esprit pour la comprendre. L'Équation de l'Énigme du Paradoxe a depuis été effacée de la mémoire Glazic par les autorités, mais elle a récemment été remise en lumière par les Voltistes qui prétendent avoir trouvé la réponse - au prix de leur humanité.\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism", "wire_therapy", "jacobs_ladder"},
				row = 4,
			},
		},
		[8] = {
			["voltism"] = {
				name = "Voltism",
				subfaith = "Voltism",
				description = "Sélectionne « Voltisme » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité d'« Auto-électrocution » pour gagner de la santé mentale. Gagnez un gain de foi accru en tuant des personnages des sous-fois « Hard-Glazed » ou « Orthodoxie Solaire ».",
				quote = "Une infestation cherchant à consumer la Lumière de l'intérieur, c'est ainsi que les ministres de la Sainte Hiérarchie décriraient le Voltisme. Un culte majeur sans chaîne de commandement qui recherche la technologie et l'illumination par le transhumanisme. Ils remplacent progressivement davantage de leur corps par des machines et stimulent leur esprit par des décharges électriques. Leurs véritables motivations, ou leur chef, restent inconnus.",
				iconOverride = "begotten/ui/belieficons/faith-volt.png",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				row = 1,
			},
		},
		[9] = {
			["wriggle_fucking_eel"] = {
				name = "Wriggle Like a Fucking Eel",
				subfaith = "Voltism",
				description = "L'Auto-électrocution cautérise désormais les saignements et diminue la fatigue et la corruption. Débloque la capacité d'utiliser l'armement Voltiste.",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism"},
				row = 2,
			},
			["yellow_and_black"] = {
				name = "Yellow and Black",
				subfaith = "Voltism",
				description = "Débloque la capacité d'équiper l'armement Voltiste et les exosquelettes. Vous n'êtes plus affecté par la faim et la soif. À la place, votre valeur de fatigue commencera à vous endommager si elle n'est pas contrôlée. Vous ne pouvez diminuer la fatigue que par l'électrocution ou la consommation d'objets Tech. Réduit la santé maximale de 5 points.",
				quote = "\"Entendez-vous le bourdonnement ? P-Pressez votre visage contre les barbelés ! Prenez note de la bannière jaune et noire...\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism", "wriggle_fucking_eel"},
				row = 3,
			},
			["the_storm"] = {
				name = "The Storm",
				subfaith = "Voltism",
				description = "À ce stade, vous ne pourrez plus communiquer normalement car votre voix sera à jamais altérée. Les attaques à dégâts électriques des armes Voltistes infligent désormais des dégâts et des dégâts de stabilité accrus contre les ennemis portant une armure métallique, avec plus de dégâts plus l'armure est lourde, ainsi que contre les ennemis qui sont sous la pluie. Se tenir dans une étendue d'eau, sous la pluie, ou ingérer de l'eau vous infligera désormais une grande quantité de dégâts électriques. Réduit la santé maximale de 5 points.",
				quote = "\"L'ÉLECTRIQUE REVIENDRA POUR NOUS !\"",
				lockedFactions = {"Pope Adyssa's Gatekeepers", "Gatekeeper", "Hillkeeper", "Holy Hierarchy"},
				lockedSubfactions = {"Machinist", "Northlander"};
				requirements = {"voltism", "wriggle_fucking_eel", "yellow_and_black"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(LIGHT)