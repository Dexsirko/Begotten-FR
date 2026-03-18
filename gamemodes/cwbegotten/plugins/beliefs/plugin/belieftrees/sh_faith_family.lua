--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local FAMILY = cwBeliefs.beliefTrees:New("family")
	FAMILY.name = "Faith of the Family";
	FAMILY.color = Color(150, 50, 20);
	FAMILY.order = 7;
	FAMILY.size = {w = 771, h = 407};
	FAMILY.textures = {"family", "faithfamilyarrows"};
	FAMILY.headerFontOverride = "nov_IntroTextSmallaaafaa";
	FAMILY.tooltip = {
		{"Faith of the Family", FAMILY.color, "Civ5ToolTip4"},
		{"Chaque foi possède un ensemble de compétences unique, débloquant des capacités de personnage, des rituels, et améliorant généralement les statistiques globales. On peut également se diversifier dans des sous-fois, bien que la pratique ouverte de ces sous-fois puisse faire considérer votre personnage comme hérétique par les autorités religieuses concernées.", Color(225, 200, 200)},
		{"\n\"La ville sainte de Glaze dans le domaine de l'Enfer. Ce sont mes deux épées à croiser, en effet sur sa poitrine en résolution d'une cause finale. Dans un cœur battant de boucliers.\"", Color(128, 90, 90, 240)},
		{"", Color(50, 255, 50)}
	};
	FAMILY.columnPositions = {
		[1] = (FAMILY.size.w - 4) * 0.1,
		[2] = (FAMILY.size.w - 4) * 0.3,
		[3] = (FAMILY.size.w - 4) * 0.5,
		[4] = (FAMILY.size.w - 4) * 0.7,
		[5] = (FAMILY.size.w - 4) * 0.9,
	};
	FAMILY.rowPositions = {
		[1] = (FAMILY.size.h - 4) * 0.3,
		[2] = (FAMILY.size.h - 4) * 0.5,
		[3] = (FAMILY.size.h - 4) * 0.7,
		[4] = (FAMILY.size.h - 4) * 0.9,
	};
	
	FAMILY.lockedSubfactions = {"Clan Grock"};
	FAMILY.requiredFaiths = {"Faith of the Family"};
	
	-- First index is column.
	FAMILY.beliefs = {
		[1] = {
			["father"] = {
				name = "Strength of the Father",
				subfaith = "Faith of the Father",
				description = "Sélectionne la « Foi du Père » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de pousser un cri de guerre. Gagnez le double de gain de foi en infligeant des dégâts et en tuant des ours, des thralls et des personnages ayant un niveau de sacrement supérieur au vôtre.",
				quote = "Le Père est le Patriarche, la manifestation du conflit et de la lutte. Il s'assure que ses enfants sont aptes à survivre coûte que coûte. Les disciples du Père peuvent être assoiffés de sang et autrement brutaux, mais ils possèdent un sens de la force et de l'honneur inégalé par tous.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				row = 1,
			},
			["honor_the_gods"] = {
				name = "Honor the Gods",
				subfaith = "Faith of the Father",
				description = "Débloque les rituels de niveau I de la Foi de la Famille.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father"},
				row = 2,
			},
			["man_become_beast"] = {
				name = "Man Become Beast",
				subfaith = "Faith of the Father",
				description = "Débloque la capacité de manier à deux mains des armes à une main. Débloque la capacité d'équiper des griffes. Augmente l'endurance maximale de 10 points. Augmente les PV maximum de 30 points. Débloque les rituels Familiaux de niveau II.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father", "honor_the_gods"},
				row = 3,
			},
			["fearsome_wolf"] = {
				name = "Fearsome is the Wolf",
				subfaith = "Faith of the Father",
				description = "Améliore la capacité « Cri de guerre » : Pendant 20 secondes, vous infligez 20% de dégâts normaux et d'endurance supplémentaires, 15% de dégâts de stabilité supplémentaires contre tous les joueurs et PNJ, sprintez 10% plus vite, et réduisez le délai d'attaque en mêlée de 20%. Tuer un joueur réinitialise le temps de recharge de votre cri de guerre. Augmente également les dégâts des haches de lancer de 15%.",
				quote = "\"MORT À LA GLAZE ET GLOIRE AU GAY GORE !!!\"",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father", "honor_the_gods", "man_become_beast"},
				row = 4,
			},
		},
		[2] = {
			["mother"] = {
				name = "Mercy of the Mother",
				subfaith = "Faith of the Mother",
				description = "Sélectionne la « Foi de la Mère » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de pousser un cri de guerre. Débloque la capacité d'équiper des armes Bénies. Gain de foi accru en accomplissant des rituels et en soignant d'autres personnages.",
				quote = "La Mère est la Matriarche, l'architecte de la nature et du cycle de la vie et de la mort. De son ventre est venue toute vie, et sous sa surveillance, ils mourront tous un jour. Les disciples de la Mère sont des parias de la société Gore, des hommes difformes et rabougris, et des femmes esclaves maladives. Leur but est de guérir le monde cadavérique qu'ils habitent, et de donner la mort aux êtres flétris qui rongent ses racines.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				row = 1,
			},
			["one_with_the_druids"] = {
				name = "One With the Druids",
				subfaith = "Faith of the Mother",
				description = "Débloque les rituels Familiaux de niveau I et II. Augmente l'efficacité des objets de soin utilisés sur vous-même et sur les autres de 50%.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother"},
				row = 2,
			},
			["gift_great_tree"] = {
				name = "Gift of the Great Tree",
				subfaith = "Faith of the Mother",
				description = "Vous régénérez désormais passivement de la santé au fil du temps, indépendamment de vos blessures, mais toujours affecté par la septicémie. Ceci est séparé de la régénération normale de santé et bien plus rapide. Augmente vos PV maximum de 25 points.",
				quote = "\"Les gardiens du Grand Arbre sont à leur tour bénis par des capacités surnaturelles. Les blessures se referment à leur contact, la terre morte fait germer la vie à chaque pas. Tout sera remboursé intégralement quand leur vie prendra fin et que leurs corps seront à nouveau consumés par la Terre.\"",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother", "one_with_the_druids"},
				row = 3,
			},
			["watchful_raven"] = {
				name = "Watchful is the Raven",
				subfaith = "Faith of the Mother",
				description = "Améliore la capacité « Cri de guerre » : Surligne en vert tous les alliés proches (personnages qui vous reconnaissent) pendant 15 secondes et augmente votre propre santé mentale et endurance ainsi que la leur de 5 points, tout en offrant 10% de résistance aux dégâts. Débloque les rituels Familiaux de niveau III et les rituels uniques de la Mère. Débloque la capacité de Parler-corbeau si vous êtes un Guerrier Goreic du Clan Crast. Réduit les risques de subir des blessures de 50%.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother", "one_with_the_druids", "gift_great_tree"},
				row = 4,
			},
		},
		[3] = {
			["old_son"] = {
				name = "Wisdom of the Old Son",
				subfaith = "Faith of the Old Son",
				description = "Sélectionne la « Foi du Vieux Fils » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de pousser un cri de guerre. Gain de foi résiduel accru. Gagnez +50% de gain de foi en tuant des thralls et des ours.",
				quote = "Le Vieux Fils est l'annonciateur de la guerre, la divinité de la conquête et la manifestation de la mer sans fin. Ceux qui naissent sous Lui sont des âmes agitées, cherchant toujours à s'améliorer et à rire au nez des obstacles insurmontables. Le vieux et éprouvé Clan Haralder a navigué à travers le monde, conquis des paysages infernaux et est revenu avec de puissants butins. Ils sont les challengeurs, les tueurs de démons, les aventuriers et les héritiers de la fortune. Mais peut-être pourraient-ils être bien plus, car le Vieux Fils s'agite dans les profondeurs sans fin, et son réveil pourrait provoquer un déluge qui noierait la civilisation et le fardeau de l'humanité avec elle.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				row = 1,
			},
			["the_black_sea"] = {
				name = "The Black Sea",
				subfaith = "Faith of the Old Son",
				description = "Augmente considérablement l'efficacité des sens et permet de les utiliser lorsqu'ils ne sont pas équipés, ce qui signifie également qu'ils doivent être activés manuellement. Les pièges à proximité seront surlignés lors de l'utilisation des sens. Réduit considérablement la perte d'oxygène, vous permettant de rester sous l'eau trois fois plus longtemps. Débloque les rituels Familiaux de niveau I.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son"},
				row = 2,
			},
			["taste_of_blood"] = {
				name = "Taste of Blood",
				subfaith = "Faith of the Old Son",
				description = "Augmente vos PV maximum de 30 points. Lorsque vous infligez des dégâts à un personnage, il sera surligné en rouge pendant 3 minutes. Pendant ce temps, vous lui infligerez 15% de dégâts supplémentaires. Vous ne pouvez traquer qu'une seule personne à la fois.",
				quote = "\"Je goûte ton sang. C'est une bonne saveur ! Cours, fuis, et je chasse. Tes os seront enterrés dans ces bois.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son", "the_black_sea"},
				row = 3,
			},
			["daring_trout"] = {
				name = "Daring is the Trout",
				subfaith = "Faith of the Old Son",
				description = "Améliore la capacité « Cri de guerre » : augmente vos dégâts de pénétration d'armure en mêlée de 8 points pendant 20 secondes. Augmente les dégâts des haches de lancer de 25%. Augmente les dégâts de pénétration d'armure des armes de lancer de 10%. Toucher des ennemis avec des armes de lancer les désoriente, les empêchant de sprinter pendant 8 secondes. Débloque les rituels Familiaux de niveau II et les rituels uniques du Vieux Fils. Si vous êtes membre du Clan Harald, les corbeaux vous avertiront maintenant si votre Drakkar est attaqué.",
				quote = "\"Nous avons navigué jusqu'à cette terre étrangère pour tuer et piller ! Ne vous battrez-vous pas contre nous, lâches ? Ne rejoindrez-vous pas le tas de cadavres ?\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son", "the_black_sea", "taste_of_blood"},
				row = 4,
			},
		},
		[4] = {
			["young_son"] = {
				name = "Ingenuity of the Young Son",
				subfaith = "Faith of the Young Son",
				description = "Sélectionne la « Foi du Jeune Fils » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de pousser un cri de guerre. Gain de foi accru en artisanat.",
				quote = "Le Jeune Fils est la divinité de l'innovation, la source de tout métal et de tout feu, et le profanateur des lois naturelles. Ceux qui suivent le Jeune Fils sont considérés comme des hommes stoïques, têtus, qui restent entre eux. Ils sont également réputés pour avoir du fer en fusion dans le sang, ce qui trempe leur acier lorsqu'ils forgent de puissantes armes. Le Père, dans sa constante désapprobation de sa plus jeune progéniture, place le Jeune Fils sur la voie de la tourmente familiale dans un effort pour prouver la force de son ingéniosité. Il appelle ses disciples humains - pour qui il a montré beaucoup d'appréciation malgré les autres divinités - à l'aider sur sa voie pour tuer le Père et accomplir la prophétie de ruine et de renaissance.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				row = 1,
			},
			["taste_of_iron"] = {
				name = "Taste of Iron",
				subfaith = "Faith of the Young Son",
				description = "Tous les objets fabriqués seront en parfait état, indépendamment de l'état des pièces composantes. Débloque les rituels Familiaux de niveau I. Augmente la résistance aux dégâts de brûlure de 50%. Annule également tous les dégâts des feux environnementaux.",
				quote = "\"On ne peut pas brûler ce qui est bouillant.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son"},
				row = 2,
			},
			["shieldwall"] = {
				name = "Shieldwall",
				subfaith = "Faith of the Young Son",
				description = "Augmente les PV maximum de 25 points. Supprime entièrement la pénalité de dégâts d'arme liée à l'utilisation de boucliers. Augmente la résistance à l'endurance de tous les boucliers de 10 points.",
				quote = "\"Les Shagalaxiens croient que la seule chose qui sépare l'homme de la bête est le métal dans ses mains. Quand un homme jette son fer de côté, il n'est guère plus qu'un gibier à chasser.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son", "taste_of_iron"},
				row = 3,
			},
			["enduring_bear"] = {
				name = "Enduring is the Bear",
				subfaith = "Faith of the Young Son",
				description = "Débloque la capacité de fondre l'acier Shagalaxian (si Maître Forgeron est débloqué). Augmente la stabilité maximale de 25 points. Diminue les risques de blessure de 20%. Diminue le gain de fatigue de 50%.",
				quote = "\"Je ne me reposerai pas tant que le ciel ne sera pas assombri par un brouillard gris : quand nos moteurs seront construits, quand nos titans d'acier gémiront, quand tout sera écrasé sous nos roues roulantes. Un nouveau dieu ! Trempé dans le feu de l'enfer et refroidi dans le sang ! Shag-a-lax ! Shag-a-lax !\"",
				iconOverride = "begotten/ui/belieficons/bestial.png",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son", "taste_of_iron", "shieldwall"},
				row = 4,
			},
		},
		[5] = {
			["sister"] = {
				name = "Cunning of the Sister",
				subfaith = "Faith of the Sister",
				description = "Sélectionne la « Foi de la Sœur » comme votre sous-foi. Débloque la capacité de prier. Débloque la capacité de pousser un cri de guerre. Gagnez un gain de foi accru en infligeant des dégâts, en tuant et en vendant comme esclaves des personnages ayant un niveau de foi inférieur au vôtre.",
				quote = "La Sœur est la fille de l'ambition, la déesse trompeuse de la ruse et des complots. Ses disciples sont haineux et mécontents, cherchant toujours à usurper le pouvoir chaque fois que possible. Le Clan Reaver, le clan élu de la Sœur, est réputé pour avoir une forteresse impénétrable au plus profond des Royaumes Goreic où des hommes sont torturés et écorchés pour donner du pouvoir à leur déesse. Les autres clans voient Ses disciples comme un mauvais présage, leur venue étant la ruine finale du monde et la destruction de la Famille dans son ensemble. Beaucoup soupçonnent que la Sœur n'est pas réellement un membre de la Famille mais une idole proxy déformée du Prince Obscur. Il est peu probable que leurs suppositions soient incorrectes.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				row = 1,
			},
			["witch_druid"] = {
				name = "Witch Druid",
				subfaith = "Faith of the Sister",
				description = "Débloque la capacité de manier à deux mains des armes à une main. Débloque la capacité d'équiper des griffes. Débloque les rituels de niveau I de la Foi de la Famille et de la Foi des Ténèbres.",
				quote = "\"Méfiez-vous de l'homme d'osier.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister"},
				row = 2,
			},
			["shedskin"] = {
				name = "Shedskin",
				subfaith = "Faith of the Sister",
				description = "Augmente la santé maximale de 25 points. Augmente la valeur de protection de toutes les armures de 15%. Débloque les rituels de niveau II de la Foi de la Famille et de la Foi des Ténèbres, ainsi que les rituels uniques de la Sœur. Débloque également la capacité de murmurer dans l'obscurité.",
				quote = "\"Sous leurs plaques de fer noir, ils sont rembourrés avec les peaux d'hommes écorchés. Si nous devons tuer ces brutes, vous devez frapper profond !\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister", "witch_druid"},
				row = 3,
			},
			["deceitful_snake"] = {
				name = "Deceitful is the Snake",
				subfaith = "Faith of the Sister",
				description = "Améliore la capacité « Cri de guerre » : restaure 70% de tous les PV perdus au cours des 2 dernières secondes. Si quelqu'un vous inflige 10 points de dégâts ou plus en un seul coup, il sera surligné en rouge et recevra 25% de dégâts supplémentaires de votre part pendant 40 secondes. Débloque également la capacité de fondre de l'Acier Forgé par l'Enfer (seulement si « Maître Forgeron » est également débloqué).",
				quote = "\"Vous crierez, et ensuite vous n'aurez plus de langue. Vous gargouillerez puis étoufferez. À un arbre vous serez pendu, et votre chair sera transformée en manteau.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister", "witch_druid", "shedskin"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(FAMILY)