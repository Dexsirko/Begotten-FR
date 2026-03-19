--[[
	Begotten 3
	Created by cash wednesday, gabs, DETrooper and alyousha35
--]]

local BLIND = Clockwork.trait:New()
	BLIND.uniqueID = "blind"
	BLIND.name = "Aveugle"
	BLIND.description = "Votre personnage est totalement aveugle, de naissance ou à cause d'un traumatisme. Vous ne pourrez pas voir sauf en utilisant les « Sens ». L'arbre de croyances « Aptitude » sera verrouillé et ne pourra pas être progressé."
	BLIND.points = -10
	BLIND.disables = {"crosseyed", "literate", "scribe"}
	BLIND.excludedfactions = {"Children of Satan"}
Clockwork.trait:Register(BLIND)

local BRAWNY = Clockwork.trait:New()
	BRAWNY.uniqueID = "brawny"
	BRAWNY.name = "Costaud"
	BRAWNY.description = "Votre personnage est fort physiquement, ce qui lui permet de manier de grandes armes de guerre. Ce trait débloque automatiquement les 3 premières croyances du côté droit de l'arbre « Prouesse » : « Fighter », « Strength » et « Might »."
	BRAWNY.points = 4
	BRAWNY.disables = {"weak", "winded"}
	BRAWNY.excludedsubfactions = {"Auxiliary", "Clan Crast"};
Clockwork.trait:Register(BRAWNY)

local DUELIST = Clockwork.trait:New()
	DUELIST.uniqueID = "duelist"
	DUELIST.name = "Duelliste"
	DUELIST.description = "Votre personnage est réputé pour son habileté au combat, capable de dévier les coups avec aisance. Ce trait débloque automatiquement les 3 croyances suivantes dans l'arbre « Prouesse » : « Fighter », « Deflection » et « Parrying »."
	DUELIST.points = 4
	DUELIST.disables = {"clumsy", "weak"}
	DUELIST.excludedsubfactions = {"Auxiliary", "Clan Crast"};
Clockwork.trait:Register(DUELIST)

local CANNIBAL = Clockwork.trait:New()
	CANNIBAL.uniqueID = "cannibal"
	CANNIBAL.name = "Cannibale"
	CANNIBAL.description = "Votre personnage est un putain de cannibale sauvage, que ce soit par nécessité ou par pure putain de psychopathie. Ce trait débloque automatiquement la première croyance de l'arbre « Brutalité », qui permet de dévorer les cadavres pour se sustenter et regagner de la santé."
	CANNIBAL.points = 1
	CANNIBAL.excludedsubfactions = {"Varazdat"}
	CANNIBAL.disables = {"pacifist"}
Clockwork.trait:Register(CANNIBAL)

local CLUMSY = Clockwork.trait:New()
	CLUMSY.uniqueID = "clumsy"
	CLUMSY.name = "Maladroit"
	CLUMSY.description = "Votre personnage est maladroit, un idiot, un putain d'imbécile distrait. En courant, il y a une petite chance que vous trébuchiez et tombiez au hasard, et d'autres actions ont une chance d'échouer."
	CLUMSY.points = -6
	CLUMSY.excludedfactions = {"Children of Satan"}
	CLUMSY.disables = {"duelist"}
Clockwork.trait:Register(CLUMSY)

local CRIMINAL = Clockwork.trait:New()
	CRIMINAL.uniqueID = "criminal"
	CRIMINAL.name = "Criminel"
	CRIMINAL.description = "Votre personnage est un criminel ordinaire, compétent dans l'art du crochetage. Ce trait débloque automatiquement les 3 premières croyances du côté gauche de l'arbre « Souplesse » : « Nimble », « Sly Fidget » et « Safecracker », et offre également deux crochets de départ."
	CRIMINAL.points = 4
	CRIMINAL.disables = {"pilgrim"};
	CRIMINAL.excludedfactions = {"Holy Hierarchy"};
Clockwork.trait:Register(CRIMINAL)

local CROSSEYED = Clockwork.trait:New()
	CROSSEYED.uniqueID = "crosseyed"
	CROSSEYED.name = "Bigleux"
	CROSSEYED.description = "Votre personnage est un putain de bigleux. Vous avez l'air stupide et tout le monde le voit."
	CROSSEYED.points = -8
	CROSSEYED.disables = {"blind"}
	CROSSEYED.excludedfactions = {"Children of Satan"};
Clockwork.trait:Register(CROSSEYED)

local ESCAPEE = Clockwork.trait:New()
	ESCAPEE.uniqueID = "escapee"
	ESCAPEE.name = "Évadé"
	ESCAPEE.description = "Votre personnage s'est évadé d'un camp d'esclaves ou d'une prison, mais dans sa hâte de fuir, il n'a pas pu se faire retirer ses liens. Vous commencerez attaché."
	ESCAPEE.points = -2
	ESCAPEE.disables = {"logger", "miner", "pilgrim", "scavenger", "survivalist", "veteran"}
	ESCAPEE.requiredfactions = {"Wanderer"}
Clockwork.trait:Register(ESCAPEE)

local EXHAUSTED = Clockwork.trait:New()
	EXHAUSTED.uniqueID = "exhausted"
	EXHAUSTED.name = "Épuisé"
	
	if game.GetMap() == "rp_district21" then
		EXHAUSTED.description = "Votre personnage a voyagé longtemps et loin pour atteindre la Colline de Lumière, ce qui l'a épuisé. Ce trait fait commencer votre personnage avec des valeurs élevées de faim, de soif et de fatigue."
	else
		EXHAUSTED.description = "Votre personnage a voyagé longtemps et loin pour atteindre la Tour de Lumière, ce qui l'a épuisé. Ce trait fait commencer votre personnage avec des valeurs élevées de faim, de soif et de fatigue."
	end

	EXHAUSTED.points = -2
	EXHAUSTED.requiredfactions = {"Wanderer"}
Clockwork.trait:Register(EXHAUSTED)

local FAVORED = Clockwork.trait:New()
	FAVORED.uniqueID = "favored"
	FAVORED.name = "Favorisé"
	FAVORED.description = "Par vertu ou bonne fortune, votre personnage a clairement été béni par la faveur d'une puissance divine. Ce trait débloque automatiquement les 3 croyances de la colonne gauche de l'arbre « Fortune » : « Fortunate », « Lucky » et « Favored »."
	FAVORED.points = 4
	FAVORED.disables = {"marked", "possessed"}
Clockwork.trait:Register(FAVORED)

local FOLLOWED = Clockwork.trait:New()
	FOLLOWED.uniqueID = "followed"
	FOLLOWED.name = "Suivi"
	FOLLOWED.description = "Il y a longtemps, votre personnage a commis l'erreur de piller un ancien tombeau. Par ignorance, il n'a pas vu qu'il avait été prophétisé que ceux qui profaneraient la tombe seraient maudits pour être traqués pour l'éternité..."
	FOLLOWED.disables = {"pilgrim", "shrewd"}
	FOLLOWED.points = -7
	FOLLOWED.excludedfactions = {"Gatekeeper", "Hillkeeper", "Pope Adyssa's Gatekeepers"};
Clockwork.trait:Register(FOLLOWED)

local GLUTTONY = Clockwork.trait:New()
	GLUTTONY.uniqueID = "gluttony"
	GLUTTONY.name = "Gourmandise"
	GLUTTONY.description = "Votre personnage aime l'excès et n'en a jamais assez. Votre faim et votre soif se draineront deux fois plus vite. Cela affectera également la fatigue (énergie) si vous êtes un Voltiste avec la croyance « Yellow and Black »."
	GLUTTONY.points = -4
Clockwork.trait:Register(GLUTTONY)

local GUNSLINGER = Clockwork.trait:New()
	GUNSLINGER.uniqueID = "gunslinger"
	GUNSLINGER.name = "Flingueur"
	GUNSLINGER.description = "Que sont les gens pour votre personnage, sinon des cibles mouvantes ? Votre personnage commencera avec deux croyances de l'arbre « Ingéniosité » : « Ingenious » et « Powder and Steel »."
	GUNSLINGER.disables = {"pilgrim"}
	GUNSLINGER.points = 3
	GUNSLINGER.excludedfactions = {"Children of Satan", "Gatekeeper", "Hillkeeper", "Holy Hierarchy", "Pope Adyssa's Gatekeepers"}
	GUNSLINGER.excludedsubfactions = {"Clan Crast", "Clan Grock", "Clan Harald", "Clan Reaver", "Clan Gore"};
Clockwork.trait:Register(GUNSLINGER)

local IMBECILE = Clockwork.trait:New()
	IMBECILE.uniqueID = "imbecile"
	IMBECILE.name = "Imbécile"
	IMBECILE.description = "Votre personnage est attardé et incapable de former des phrases complètes. Bienheureux soit l'esprit trop petit pour le doute."
	IMBECILE.points = -3
	IMBECILE.disables = {"literate", "scribe", "lobotomite"}
	IMBECILE.excludedfactions = {"Children of Satan"}
Clockwork.trait:Register(IMBECILE)

local INSANE = Clockwork.trait:New()
	INSANE.uniqueID = "insane"
	INSANE.name = "Fou"
	INSANE.description = "Votre personnage est putain de fou. Votre santé mentale maximale est définitivement plafonnée à 40%."
	INSANE.points = -7
	INSANE.disables = {"pacifist"}
	INSANE.excludedsubfactions = {"Rekh-khet-sa"}
Clockwork.trait:Register(INSANE)

local LEPER = Clockwork.trait:New()
	LEPER.uniqueID = "leper"
	LEPER.name = "Lépreux"
	LEPER.description = "Chaque instant d'éveil de l'existence de votre personnage est un enfer, car il a été maudit pour marcher sur Terre avec une affliction très impie : la Lèpre. Son corps ravagé et difforme fait de lui un paria social et une cible de persécution. Votre personnage subira 50% de perte de sang supplémentaire en cas de saignement, et son affliction répugnante sera connue de tous ceux qui poseront les yeux sur lui."
	LEPER.points = -5
	LEPER.disables = {"pilgrim"}
	LEPER.disablesSkins = true;
	LEPER.excludedfactions = {"Gatekeeper", "Hillkeeper", "Goreic Warrior", "Holy Hierarchy", "Pope Adyssa's Gatekeepers"};
Clockwork.trait:Register(LEPER)

local LITERATE = Clockwork.trait:New()
	LITERATE.uniqueID = "literate"
	LITERATE.name = "Alphabète"
	LITERATE.description = "Votre personnage est l'un des rares à avoir appris à lire en ces temps incivilisés. Ce trait débloque automatiquement la première croyance de l'arbre « Aptitude » : « Literacy »."
	LITERATE.points = 1
	LITERATE.disables = {"blind", "imbecile", "scribe"}
	LITERATE.excludedfactions = {"Pope Adyssa's Gatekeepers"}
Clockwork.trait:Register(LITERATE)

local LOGGER = Clockwork.trait:New()
	LOGGER.uniqueID = "logger"
	LOGGER.name = "Bûcheron"
	LOGGER.description = "Votre personnage est bûcheron, coupant aussi bien les arbres que les membres. Ce trait offre une hachette de départ."
	LOGGER.points = 4
	LOGGER.disables = {"escapee", "weak"}
	LOGGER.requiredfactions = {"Wanderer"}
	LOGGER.eventlocked = false;
Clockwork.trait:Register(LOGGER)

local MARKED = Clockwork.trait:New()
	MARKED.uniqueID = "marked"
	MARKED.name = "Marqué"
	MARKED.description = "Soit en ayant irrité une puissance ténébreuse, soit en s'étant trop aventuré dans l'occulte, votre personnage est devenu marqué pour la mort. Les conséquences peuvent être graves, et l'arbre de croyances « Fortune » sera verrouillé et ne pourra pas être progressé."
	MARKED.points = -4
	MARKED.disables = {"favored"}
Clockwork.trait:Register(MARKED)

local MINER = Clockwork.trait:New()
	MINER.uniqueID = "miner"
	MINER.name = "Mineur"
	MINER.description = "Votre personnage est mineur, passant beaucoup de son temps profondément sous terre. Ce trait offre une pioche de départ pour extraire du minerai et une lanterne pour vous aider à naviguer dans les profondeurs."
	MINER.points = 7
	MINER.disables = {"escapee", "weak"}
	MINER.requiredfactions = {"Wanderer"}
	MINER.excludedmaps = {"rp_district21"}
Clockwork.trait:Register(MINER)

local NIMBLE = Clockwork.trait:New()
	NIMBLE.uniqueID = "nimble"
	NIMBLE.name = "Agile"
	NIMBLE.description = "Votre personnage est rapide sur ses pieds, capable d'échapper à des situations dangereuses avec une relative aisance. Ce trait débloque automatiquement les 3 premières croyances du côté droit de l'arbre « Souplesse » : « Nimble », « Evasion » et « Dexterity »."
	NIMBLE.points = 4
	NIMBLE.disables = {"winded"}
Clockwork.trait:Register(NIMBLE)

local PACIFIST = Clockwork.trait:New()
	PACIFIST.uniqueID = "pacifist"
	PACIFIST.name = "Pacifiste"
	PACIFIST.description = "Votre personnage est pacifiste et déteste l'acte de tuer. Blesser ou tuer d'autres personnages affectera négativement votre santé mentale. L'arbre de croyances « Brutalité » sera également verrouillé et ne pourra pas être progressé."
	PACIFIST.points = -4
	PACIFIST.disables = {"cannibal", "insane"}
	PACIFIST.excludedsubfactions = {"Legionary", "Clan Reaver", "Clan Gore"}
	PACIFIST.excludedfactions = {"Children of Satan", "Pope Adyssa's Gatekeepers"}
Clockwork.trait:Register(PACIFIST)

local PILGRIM = Clockwork.trait:New()
	PILGRIM.uniqueID = "pilgrim"
	PILGRIM.name = "Pèlerin"
	
	if game.GetMap() == "rp_district21" then
		PILGRIM.description = "Votre personnage a voyagé loin et large pour atteindre la Colline de Lumière, que ce soit en quête d'un sanctuaire ou dans la poursuite d'un but sacré. Votre personnage apparaîtra dans la zone sécurisée de la Colline de Lumière."
	else
		PILGRIM.description = "Votre personnage a voyagé loin et large pour atteindre la Tour de Lumière, que ce soit en quête d'un sanctuaire ou dans la poursuite d'un but sacré. Votre personnage apparaîtra dans la zone sécurisée de la Tour de Lumière."
	end
	
	PILGRIM.points = 2
	PILGRIM.disables = {"criminal", "escapee", "gunslinger", "leper"}
	PILGRIM.requiredfactions = {"Wanderer"}
Clockwork.trait:Register(PILGRIM)

local PIOUS = Clockwork.trait:New()
	PIOUS.uniqueID = "pious"
	PIOUS.name = "Pieux"
	PIOUS.description = "Votre personnage est pieux et croit fermement en sa foi. Ce trait accorde un sacrement gratuit avec une épiphanie à utiliser dans l'arbre de croyances."
	PIOUS.points = 1
	PIOUS.excludedsubfactions = {"Clan Grock"};
Clockwork.trait:Register(PIOUS)

local PLACEBO = Clockwork.trait:New()
	PLACEBO.uniqueID = "placebo"
	PLACEBO.name = "Placebo"
	PLACEBO.description = "Ce trait pourrait faire quelque chose..."
	PLACEBO.points = 1
Clockwork.trait:Register(PLACEBO)

local POSSESSED = Clockwork.trait:New()
	POSSESSED.uniqueID = "possessed"
	POSSESSED.name = "Possédé"
	POSSESSED.description = "Votre personnage est sujet à la possession par une force démoniaque, parlant souvent en langues et perpétrant involontairement des violences extrêmes. En raison de cette présence maligne, votre personnage encourra passivement de la corruption jusqu'à 50%, moment auquel il pourra être possédé."
	POSSESSED.points = -5
	POSSESSED.disables = {"favored", "zealous"}
	POSSESSED.excludedsubfactions = {"Rekh-khet-sa"}
Clockwork.trait:Register(POSSESSED)

local SCAVENGER = Clockwork.trait:New()
	SCAVENGER.uniqueID = "scavenger"
	SCAVENGER.name = "Fouilleur"
	SCAVENGER.description = "Votre personnage est un fouilleur expérimenté et sait quoi chercher lors des recherches. Ce trait améliore légèrement vos chances d'obtenir un butin de meilleure qualité en fouillant des conteneurs, et offre également un kit de démontage de départ pour décomposer les objets en leurs composants."
	SCAVENGER.points = 3
	SCAVENGER.disables = {"escapee"}
Clockwork.trait:Register(SCAVENGER)

local SCRIBE = Clockwork.trait:New()
	SCRIBE.uniqueID = "scribe"
	SCRIBE.name = "Scribe"
	SCRIBE.description = "Votre personnage n'est pas seulement l'un des rares à savoir lire, mais aussi un scribe instruit, une qualité précieuse en effet. Ce trait débloque automatiquement les 2 premières croyances de la colonne du milieu de l'arbre « Aptitude » : « Literacy » et « Scribe »."
	SCRIBE.points = 3
	SCRIBE.disables = {"blind", "literate", "imbecile"}
Clockwork.trait:Register(SCRIBE)

local SHREWD = Clockwork.trait:New()
	SHREWD.uniqueID = "shrewd"
	SHREWD.name = "Astucieux"
	SHREWD.description = "Votre personnage est très intelligent, utilisant son esprit pour survivre à des situations autrement inéluctables. Ce trait débloque automatiquement les 3 premières croyances au milieu de l'arbre « Ingéniosité » : « Ingenious », « Craftsman » et « Mechanic »."
	SHREWD.points = 4
	SHREWD.disables = {"followed"};
	SHREWD.excludedsubfactions = {"Clan Shagalax"};
Clockwork.trait:Register(SHREWD)

local SURVIVALIST = Clockwork.trait:New()
	SURVIVALIST.uniqueID = "survivalist"
	SURVIVALIST.name = "Survivaliste"
	SURVIVALIST.description = "Votre personnage est un loup solitaire, ne veillant que sur lui-même au détriment des autres. Ce trait offre une arme de mêlée aléatoire de départ, un assortiment aléatoire d'objets consommables, et accorde cinq sacrements avec leurs épiphanies respectives à utiliser dans l'arbre de croyances."
	SURVIVALIST.points = 10
	SURVIVALIST.eventlocked = false;
	SURVIVALIST.disables = {"escapee"}
	SURVIVALIST.excludedfactions = {"Children of Satan", "Gatekeeper", "Hillkeeper", "Holy Hierarchy", "Pope Adyssa's Gatekeepers"}
	SURVIVALIST.excludedsubfactions = {"Clan Crast", "Clan Grock"};
Clockwork.trait:Register(SURVIVALIST)

local VETERAN = Clockwork.trait:New()
	VETERAN.uniqueID = "veteran"
	VETERAN.name = "Vétéran"
	VETERAN.description = "Votre personnage est un vétéran de plusieurs batailles, ayant accumulé une certaine expérience de combat et un équipement de base. Ce trait offre une arme de mêlée aléatoire et un bouclier de départ, et débloque automatiquement les 4 croyances du côté gauche de l'arbre « Prouesse » : « Fighter », « Halfsword and Sway », « Blademaster » et « Billman »."
	VETERAN.points = 16
	VETERAN.eventlocked = false;
	VETERAN.disables = {"duelist", "escapee", "weak"}
	VETERAN.excludedfactions = {"Children of Satan", "Gatekeeper", "Hillkeeper", "Holy Hierarchy", "Pope Adyssa's Gatekeepers"}
	VETERAN.excludedsubfactions = {"Clan Crast", "Clan Grock"};
Clockwork.trait:Register(VETERAN)

local VIGOROUS = Clockwork.trait:New()
	VIGOROUS.uniqueID = "vigorous"
	VIGOROUS.name = "Vigoureux"
	VIGOROUS.description = "Votre personnage est endurant et peut encaisser les coups. Ce trait débloque automatiquement les 3 croyances du côté milieu-droit de l'arbre « Fortitude » : « The Believer's Perseverance », « Plenty to Spill » et « Unyielding »."
	VIGOROUS.points = 4
	VIGOROUS.disables = {"weak", "winded"}
Clockwork.trait:Register(VIGOROUS)

local WEAK = Clockwork.trait:New()
	WEAK.uniqueID = "weak"
	WEAK.name = "Faible"
	WEAK.description = "Votre personnage a un physique chétif et est incapable de tolérer beaucoup de douleur. L'arbre de croyances « Prouesse » sera verrouillé et ne pourra pas être progressé."
	WEAK.points = -5
	WEAK.disables = {"brawny", "duelist", "miner", "logger", "veteran", "vigorous"}
Clockwork.trait:Register(WEAK)

local WINDED = Clockwork.trait:New()
	WINDED.uniqueID = "winded"
	WINDED.name = "Essoufflé"
	WINDED.description = "Votre personnage est un mauvais coureur et se fatigue facilement. Ce trait réduit votre endurance maximale de 25 points et verrouille la croyance « Outlasting » dans l'arbre de croyances « Fortitude »."
	WINDED.points = -4
	WINDED.disables = {"brawny", "nimble", "vigorous"}
Clockwork.trait:Register(WINDED)

local WOUNDED = Clockwork.trait:New()
	WOUNDED.uniqueID = "wounded"
	WOUNDED.name = "Blessé"
	WOUNDED.description = "Votre personnage a été blessé pendant son voyage ardu vers sa destination. Ce trait fait commencer votre personnage avec un assortiment aléatoire de blessures et une santé manquante."
	WOUNDED.points = -2
	WOUNDED.requiredfactions = {"Wanderer"}
Clockwork.trait:Register(WOUNDED)

local ZEALOUS = Clockwork.trait:New()
	ZEALOUS.uniqueID = "zealous"
	ZEALOUS.name = "Zélé"
	ZEALOUS.description = "Par la puissance pure de leur foi, votre personnage est capable de résister aux tentations impies et de supporter des événements qui autrement briseraient sa santé mentale. Ce trait débloque automatiquement les 2 premières croyances de la deuxième colonne de l'arbre « Fortitude » : « Prudence » et « Saintly Composure ». Ce trait accorde également trois sacrements avec leurs épiphanies respectives à utiliser dans le menu des croyances."
	ZEALOUS.points = 7
	ZEALOUS.disables = {"possessed"}
	ZEALOUS.excludedsubfactions = {"Clan Grock"}
Clockwork.trait:Register(ZEALOUS)

local LOBOTOMITE = Clockwork.trait:New();
	LOBOTOMITE.uniqueID = "lobotomite";
	LOBOTOMITE.name = "Lobotomisé";
	LOBOTOMITE.description = "Que ce soit par intervention chirurgicale, malformation congénitale ou pure malchance, votre personnage s'est retrouvé avec un cortex préfrontal sectionné. Vous êtes immunisé contre les effets de l'imbécillité, mais vous vous retrouvez souvent en proie à des crises, à la folie et à une incompétence générale.";
	LOBOTOMITE.points = -4;
	LOBOTOMITE.disables = {"imbecile"};
Clockwork.trait:Register(LOBOTOMITE);