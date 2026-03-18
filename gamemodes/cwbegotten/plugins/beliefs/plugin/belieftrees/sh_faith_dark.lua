--[[
	Begotten 3: Jesus Wept
	écrit par: cash wednesday, DETrooper, gabs et alyousha35.
--]]

local DARK = cwBeliefs.beliefTrees:New("dark")
	DARK.name = "Faith of the Dark";
	DARK.color = Color(137, 0, 0, 255);
	DARK.order = 7;
	DARK.size = {w = 771, h = 407};
	DARK.textures = {"dark", "faithdarkarrows"};
	DARK.headerFontOverride = "nov_IntroTextSmallaaafaa";
	DARK.tooltip = {
		{"Faith of the Dark", DARK.color, "Civ5ToolTip4"},
		{"Chaque foi possède un ensemble de compétences unique, débloquant des capacités de personnage, des rituels, et améliorant généralement les statistiques globales. On peut également se diversifier dans des sous-fois, bien que la pratique ouverte de ces sous-fois puisse faire considérer votre personnage comme hérétique par les autorités religieuses concernées.", Color(225, 200, 200)},
		{"\n\"La ville sainte de Glaze dans le domaine de l'Enfer. Ce sont mes deux épées à croiser, en effet sur sa poitrine en résolution d'une cause finale. Dans un cœur battant de boucliers.\"", Color(128, 90, 90, 240)},
		{"", Color(50, 255, 50)}
	};
	DARK.columnPositions = {
		[1] = (DARK.size.w - 4) * 0.1,
		[2] = (DARK.size.w - 4) * 0.2,
		[3] = (DARK.size.w - 4) * 0.3,
		[4] = (DARK.size.w - 4) * 0.5,
		[5] = (DARK.size.w - 4) * 0.55,
		[6] = (DARK.size.w - 4) * 0.6,
		[7] = (DARK.size.w - 4) * 0.7,
		[8] = (DARK.size.w - 4) * 0.8,
		[9] = (DARK.size.w - 4) * 0.85,
		[10] = (DARK.size.w - 4) * 0.9,
	};
	DARK.rowPositions = {
		[1] = (DARK.size.h - 4) * 0.3,
		[2] = (DARK.size.h - 4) * 0.5,
		[3] = (DARK.size.h - 4) * 0.7,
		[4] = (DARK.size.h - 4) * 0.9,
	};
	
	DARK.lockedSubfactions = {"Clan Grock"};
	DARK.requiredFaiths = {"Faith of the Dark"};
	
	-- First index is column.
	DARK.beliefs = {
		[1] = {
			["embrace_the_darkness"] = {
				name = "Embrace the Darkness",
				subfaith = "Primevalism",
				description = "Active la mécanique de « Camouflage » pour une utilisation avec les Sens dans les Terres Désolées la nuit, pendant les tempêtes de sang ou dans les mines. Réduit la perte de santé mentale dans les mines. Débloque également les rituels de niveau III de la « Foi des Ténèbres » si vous êtes de la lignée « Maison Rekh-khet-sa ».",
				quote = "\"Regardez dans le noir de la nuit et quelque chose vous fixera en retour.\"",
				requirements = {"primevalism", "creature_of_the_dark", "soothsayer"},
				row = 3,
			},
		},
		[2] = {
			["primevalism"] = {
				name = "Primevalism",
				subfaith = "Primevalism",
				description = "Sélectionne « Primevalisme » comme votre sous-foi. Débloque la capacité de prier. Gagnez le double du gain de foi résiduel lorsque vous êtes à l'extérieur dans les Terres Désolées la nuit.",
				quote = "\"Depuis l'aube des temps, les hommes ont regardé dans l'obscurité de la nuit et ont vu des dieux là où il n'y en avait pas. Des jungles torturées aux bois cendrés et aux vastes déserts, ces primitifs ont créé des dizaines de milliers de divinités pour expliquer les inconnues de la vie. Ces hommes inférieurs étaient en effet uniquement concentrés sur la survie ; ils ne cherchaient pas les vérités complètes, car les platitudes de leur mythologie et leurs dieux durs et lointains les maintenaient satisfaits. À l'époque des Begotten, ils continuent encore, créant des effigies d'os et accomplissant des sacrifices primitifs à leurs nombreux dieux. Ce qu'ils ignorent, c'est que ces milliers de divinités partagent toutes le même visage - des proxys pour rassembler le pouvoir des masses, car leur foi aveugle satisfait en effet les démons de la nuit.\"",
				row = 1,
			},
			["creature_of_the_dark"] = {
				name = "Creature of the Dark",
				subfaith = "Primevalism",
				description = "Augmente considérablement la portée effective des Sens et permet de les utiliser lorsqu'ils ne sont pas équipés, ce qui signifie également qu'ils doivent être activés manuellement.",
				quote = "\"Ceux qui cherchent la chaleur de la lumière et du feu ne sont pas faits pour vivre ici. Dans la jungle, vous serez notre proie.\"",
				requirements = {"primevalism"},
				row = 2,
			},
			["soothsayer"] = {
				name = "Soothsayer",
				subfaith = "Primevalism",
				description = "Débloque les rituels de niveau I et II de la « Foi des Ténèbres ». Débloque également la capacité de murmurer dans l'obscurité.",
				quote = "\"Des marques dans la boue. Une maison de crânes dans la jungle. Une figure d'enfant liée par des bâtons de bambou, le visage dévoré par des fourmis carnivores. Le diable vit ici - nous devons quitter cet endroit !\"",
				requirements = {"primevalism", "creature_of_the_dark"},
				row = 3,
			},
			["survivalist"] = {
				name = "Survivalist",
				subfaith = "Primevalism",
				description = "Toutes les armes de mêlée perforantes et les projectiles, ainsi que les carreaux d'arbalète, appliquent désormais un poison qui réduit la vitesse de déplacement de la cible et draine lentement sa santé.",
				quote = "\"Les tribaux frottent leurs lances avec des herbes et des lierres vils. Une piqûre et vous le sentirez.\"",
				requirements = {"primevalism", "creature_of_the_dark", "soothsayer"},
				row = 4,
			},
		},
		[3] = {
			["thirst_blood_moon"] = {
				name = "Thirst of the Blood Moon",
				subfaith = "Primevalism",
				description = "Lorsque vous êtes à l'extérieur dans les Terres Désolées la nuit ou pendant les tempêtes de sang, ou dans les mines, 50% des dégâts infligés vous sont rendus sous forme de santé. Offre également une petite chance de guérir des blessures ou d'arrêter les saignements si les dégâts infligés dépassent 25. Réduit de moitié la perte de santé mentale résiduelle nocturne/pendant les tempêtes de sang. Débloque des rituels uniques du « Primevalisme ».",
				quote = "\"Le garde entendit des hurlements et ne put discerner s'il s'agissait d'un homme ou d'une bête. En vérité, cela n'avait pas d'importance.\"",
				iconOverride = "begotten/ui/belieficons/lunar_repudiation.png",
				requirements = {"primevalism", "creature_of_the_dark", "soothsayer"},
				row = 3,
			},
		},
		[4] = {
			["unending_dance"] = {
				name = "The Unending Dance",
				subfaith = "Satanism",
				description = "Vous infligez désormais plus de dégâts contre les personnages plus leur santé mentale est basse. À partir de moins de 90% de santé mentale ennemie, vous infligez 10% de dégâts supplémentaires, ce qui atteint un maximum de 70% de dégâts à 10 de santé mentale ennemie.",
				quote = "\"Au début, la foule fut horrifiée lorsque le spadassin Darklander en représentation tourna ses deux lames contre l'audience. Beaucoup hurlèrent et coururent, cherchant désespérément une sortie de l'amphithéâtre. Beaucoup d'autres commencèrent simplement à applaudir l'art, se targuant d'ovations debout alors que des douzaines de personnes avaient la tête expertement tranchée dans un éblouissant étalage de compétence et de passion. Le maître spadassin fut pris d'un fou rire alors qu'il poursuivait son œuvre, l'audience attendant avec impatience son sort en l'encourageant. Les survivants de la tragédie se souviennent de l'événement avec une touche presque nostalgique ; exprimant un sincère et triste regret de ne pas avoir rejoint les innombrables morts dans la danse apocalyptique de la mort.\"",
				requirements = {"satanism", "murder_artform", "flamboyance"},
				row = 4,
			},
		},
		[5] = {
			["flamboyance"] = {
				name = "Flamboyance",
				subfaith = "Satanism",
				description = "Toutes les armes de mêlée ont désormais 10% de délai en moins avant l'attaque suivante.",
				quote = "\"La gloriole à son apogée\"",
				requirements = {"satanism", "murder_artform"},
				row = 3,
			},
		},
		[6] = {
			["murder_artform"] = {
				name = "Murder as an Artform",
				subfaith = "Satanism",
				description = "Débloque la capacité d'équiper des armes sacrificielles sataniques. Débloque également la capacité de manier à deux mains des armes à une main.",
				requirements = {"satanism"},
				row = 2,
			},
			["impossibly_skilled"] = {
				name = "Impossibly Skilled",
				subfaith = "Satanism",
				description = "Les armes doubles bloquent désormais les balles, les carreaux d'arbalète et les projectiles. Débloque la capacité de parer ou de dévier les carreaux et projectiles pour les rediriger vers votre ennemi. Augmente modérément les fenêtres de parade et de déviation pour toutes les armes de mêlée. Nécessite également que « Blademaster » soit débloqué.",
				quote = "\"Les hérétiques prétendent que les immortels de l'Enfer ont passé des siècles à perfectionner leurs réflexes et leur habileté avec les lames au point de pouvoir trancher sans effort les balles et les projectiles en plein vol. Peut-être est-ce une compétence que vous pourriez apprendre ?\"",
				requirements = {"satanism", "murder_artform", "flamboyance", "blademaster"},
				row = 4,
			},
		},
		[7] = {
			["satanism"] = {
				name = "Satanism",
				subfaith = "Satanism",
				description = "Sélectionne « Satanisme » comme votre sous-foi. Débloque la capacité de prier. Gagnez le double du gain de foi en accomplissant des rituels.",
				quote = "Le satanisme est le nom donné à la croyance la plus vraie de toutes. L'humanité a fait le choix de se priver de plaisir pour l'espoir de quelque chose de plus, une sorte de justification derrière leur misère. Ils ont commis l'erreur de suivre la Lumière, quelque chose qui n'existe que pour éloigner les hommes de leurs véritables désirs. Ces hommes prient un dieu qui n'écoute jamais, un dieu qui est mort à plus d'un titre. Ils croient qu'ils doivent souffrir une vie de misère et de douleur pour un au-delà de félicité et d'ignorance. Le satanisme est l'inverse de cette croyance. Ceux qui recherchent les pages interdites ouvrent les yeux sur les vérités complètes de la condition humaine. Ils comprennent qu'ils doivent prendre les choses en main, exploiter les énergies de chaque délice passionné et de chaque agonie torturée. Pour cette raison, les satanistes sont considérés comme des créatures égoïstes, souvent imprévisibles, qui ne cachent pas leurs véritables désirs comme le font les châtiés.",
				row = 1,
			},
			["witch"] = {
				name = "Witch",
				subfaith = "Satanism",
				description = "Débloque les rituels de niveau I de la « Foi des Ténèbres ». Débloque également la capacité de murmurer dans l'obscurité.",
				requirements = {"satanism"},
				row = 2,
			},
			["heretic"] = {
				name = "Heretic",
				subfaith = "Satanism",
				description = "Débloque les rituels de niveau II de la « Foi des Ténèbres ».",
				requirements = {"satanism", "witch"},
				row = 3,
			},
			["sorcerer"] = {
				name = "Sorcerer",
				subfaith = "Satanism",
				description = "Débloque les rituels de niveau III de la « Foi des Ténèbres » et augmente votre plafond de niveau de sacrement de 5. Débloque également la capacité de fondre de l'Acier Forgé par l'Enfer (seulement si « Maître Forgeron » est également débloqué).",
				requirements = {"satanism", "witch", "heretic"},
				row = 4,
			},
		},
		[8] = {
			["blank_stare"] = {
				name = "A Blank Stare",
				subfaith = "Satanism",
				description = "Débloque la capacité de déterminer approximativement le niveau de santé mentale des personnages inspectés.",
				requirements = {"satanism"},
				row = 2,
			},
			["assassin"] = {
				name = "Assassin",
				subfaith = "Satanism",
				description = "Poignarder quelqu'un avec une dague qui a moins de 25% de sa santé maximale ou qui est tombé le tuera instantanément. Les dagues de lancer déclenchent également cet effet. Les personnages affectés par de tels bonus de dégâts seront surlignés en rouge. Le bonus d'attaque dans le dos pour les dagues passe de +200% à +300%. Éteint également « Soulscorch ». Nécessite également que « Swift » soit débloqué.",
				quote = "\"Méfiez-vous du trompeur aux doigts noirs !\"",
				iconOverride = "begotten/ui/belieficons/wrestle_subdue.png",
				requirements = {"satanism", "blank_stare", "encore", "swift"},
				row = 4,
			},
		},
		[9] = {
			["encore"] = {
				name = "Encore",
				subfaith = "Satanism",
				description = "Le délai d'attaque et de blocage après avoir été paré est désormais réduit de 50%, vous permettant de récupérer bien plus tôt. Vous avez également 50% moins de chances d'être désarmé après une attaque à haut drain d'endurance.",
				requirements = {"satanism", "blank_stare"},
				row = 3,
			},
		},
		[10] = {
			["sadism"] = {
				name = "Sadism",
				subfaith = "Satanism",
				description = "Débloque la capacité « Cri de guerre tordu », vous permettant d'imiter les cris torturés de vos victimes pour réduire sévèrement la santé mentale de tous les personnages non-croyants de la Foi des Ténèbres à portée de voix. Notez que l'utilisation de cette capacité coûte 5 points de santé mentale.",
				quote = "\"Le tortionnaire a une certaine grâce dans ses capacités vocales. Il a découvert que sa passion pour infliger la douleur était amplifiée lorsqu'il chantait avec ses victimes, modifiant sa tonalité pour correspondre aux cris agonisants de l'accusé tremblant... Un homme plutôt drôle !\"",
				requirements = {"satanism", "blank_stare", "encore"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(DARK)