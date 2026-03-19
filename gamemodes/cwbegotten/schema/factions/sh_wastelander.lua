--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

-- Names for random name selection.
RANDOM_FORENAMES = {
	["glazic"] = {
		["male"] = {"Abraham", "Aaron", "Adam", "Alan", "Albert", "Alfred", "Alexander", "Atticus", "Andrew", "Anthony", "Angus", "Allen", "Alvin", "Albert", "Ambrose", "Arnold", "Arthur", "Buford", "Benjamin", "Benedict", "Bernard", "Brigham", "Braxton", "Barnabas", "Boxer", "Charles", "Christopher", "Clarence", "Clark", "Clayton", "Calvin", "Chester", "Cornelius", "David", "Donald", "Daniel", "Duncan", "Elias", "Eric", "Eugene", "Eustace", "Ernest", "Edward", "Earl", "Francis", "George", "Gregory", "Gerald", "Grover", "Gordon", "Hector", "Harold", "Horatio", "Henry", "Isaac", "Ian", "Joseph", "Jeffrey", "John", "Jonathan", "Jebediah", "James", "Jacob", "Julius", "Julian", "Justin", "Josiah", "Joshua", "Karmine", "Leonard", "Louis", "Lawrence", "Leland", "Lucas", "Lionel", "Lamont", "Lyman", "Magnus", "Moses", "Michael", "Michelangelo", "Marcus", "Martin", "Milton", "Nathaniel", "Noah", "Nicholas", "Oliver", "Obadiah", "Odysseus", "Orville", "Owen", "Philip", "Peter", "Paul", "Patrick", "Reginald", "Robert", "Richard", "Ronald", "Rufus", "Rhett", "Samuel", "Scott", "Stephen", "Sampson", "Sylvester", "Theodore", "Thomas", "Timothy", "Upton", "Ulysses", "Victor", "Vincent", "William", "Walter", "Wilbur", "Wallace", "Wyatt", "Zachary"},
		["female"] = {"Adela", "Adriana", "Alice", "Amelia", "Anna", "Audrey", "Autumn", "Aveline", "Beatrice", "Caroline", "Catherine", "Cecilia", "Daisy", "Dawn", "Ella", "Eleanor", "Elizabeth", "Emma", "Gloria", "Grace", "Heather", "Helen", "Isabel", "Isabella", "Jennifer", "Joan", "Joanna", "Julia", "Juliana", "Laura", "Livia", "Madeline", "Margaret", "Maria", "Mary", "Olympia", "Scarlett", "Sarah", "Silvia", "Sophia", "Susanna", "Sybilla", "Theodora", "Victoria", "Virginia", "Valeria", "Zelda"}
	},
	["gore-glazic"] = {
        ["male"] = {"Ludovic", "Leofric", "Jasper", "Gawain", "Albert", "Alfred", "Robert", "Saewulf", "Lefwald", "Asher", "Angus", "Carling", "Heath", "Dunstan", "Hale", "Leighwen", "Wyot", "Arthur", "Royce", "Clifford", "Hereward", "Brigham", "Eadwig", "Selwine", "Boxer", "Daltenn", "Oswen", "Edraed", "Gledwin", "Cenric", "Presley", "Chester", "Riley", "Linton", "Kingsley", "Whitney", "Cynameer", "Kenelm", "Erik", "Cuthbert", "Winthrop", "Riley", "Edward", "Earl", "Cythrid", "George", "Deorwine", "Haywood", "Grover", "Upton", "Huxley", "Camdyn", "Heren", "Wulfwin", "Solomon", "Esbort", "Athel", "Athelstan", "Swithin", "Aslac", "Ulfi", "Adrien", "Fulk", "Joscelin", "Julian", "Aelnod", "Fitzher", "Sewel", "Karmine", "Drogo", "Dene", "Valen", "Barantyn", "Samwell", "Lionel", "Lamont", "Lyman", "Magnus", "Moses", "Michael", "Michelangelo", "Marcus", "Martin", "Milton", "Nathaniel", "Noah", "Nicholas", "Oliver", "Guy", "Odysseus", "Orville", "Owen", "Philip", "Peter", "Paul", "Patrick", "Akeman", "Algar", "Richard", "Ronald", "Rufus", "Thori", "Wicing", "Merewin", "Marmaduke", "Eynolde", "Stannard", "Odo", "Jodoc", "Timothy", "Upton", "Ulysses", "Bartholomew", "Geoffrey", "William", "Wulsi", "Griffin", "Wallace", "Wyatt", "Zachary"},
        ["female"] = {"Thomasine", "Odelina", "Kynburgh", "Maud", "Anna", "Joyceline", "Marjorie", "Aveline", "Beatrice", "Caroline", "Catherine", "Cecilia", "Ismenia", "Stanilde", "Alfleta", "Eleanor", "Elizabeth", "Emma", "Gloria", "Grace", "Heather", "Helen", "Isabel", "Isabella", "Jennifer", "Joan", "Joanna", "Julia", "Juliana", "Laura", "Livia", "Madeline", "Margaret", "Maria", "Mary", "Olympia", "Scarlett", "Sarah", "Silvia", "Sophia", "Susanna", "Sybilla", "Theodora", "Victoria", "Virginia", "Valeria", "Tiecia", "Goditha", "Ediva", "Emmaline", "Basilia", "Pleasance", "Joy", "Ysopa", "Rosamund", "Avis", "Cwenhild", "Agatha", "Helewis"}
	},
	["goreic"] = {
		["male"] = {"Ale", "Alfr", "Alfgeir", "Anders", "Anlaufr", "Anundr", "Arnbjörn", "Arngrimr", "Arni", "Arnfast", "Asbjörn", "Bagge", "Baldr", "Barid", "Bengt", "Bersi", "Bertil", "Birger", "Björn", "Bo", "Borkvard", "Botulfr", "Bragi", "Buðli", "Dag", "Dan", "Dyre", "Eilif", "Egill", "Emund", "Einarr", "Eirikr", "Eskild", "Falki", "Faste", "Filip", "Fredrik", "Frirek", "Froði", "Freyr", "Folki", "Gandalfr", "Geirr", "Georg", "Gnupa", "Gorm", "Greger", "Grimr", "Guðfrið", "Guðmundr", "Guðröðr", "Gunnarr", "Hakon", "Halsten", "Haraldr", "Haukr", "Helgi", "Hemming", "Holmger", "Hrafn", "Hrolfr", "Hrane", "Hæsteinn", "Hjalmar", "Hroðgar", "Hroðulfr", "Hrörekr", "Hysing", "Ingólfr", "Ingemar", "Ingjald", "Ivar", "Jedvard", "Jon", "Karl", "Kettil", "Kettilmund", "Kjartan", "Klas", "Knut", "Kol", "Kolbjörn", "Magnus", "Markus", "Magni", "Mats", "Nils", "Niklas", "Oddr", "Ofeig", "Olafr", "Ormr", "Ottarr", "Refr", "Refil", "Ragnarr", "Rikulfr", "Rögnvaldr", "Skuli", "Snorri", "Sigbjörn", "Sigtrygg", "Sigurðr", "Starkaðr", "Steinn", "Sturla", "Styrbjörn", "Styrkar", "Sumarliði", "Suni", "Sveinn", "Sverker", "Sæmundr", "Sölvi", "Sörkver", "Tjudmund", "Toke", "Tolir", "Þorbjörn", "Þorfinn", "Þorbrandr", "Þordr", "Þorgil", "Þorsteinn", "Þorolfr", "Toste", "Totil", "Tryggve", "Tyke", "Ulfr", "Vagn", "Valdemar", "Åke", "Yngvar", "Örvar", "Öysteinn"},
		["female"] = {"Aleta", "Alfhildr", "Alfrið", "Alvör", "Anna", "Asa", "Aslaug", "Asta", "Astrid", "Beata", "Birgitta", "Björg", "Bodil", "Bothildr", "Cecilia", "Edla", "Elin", "Elisabet", "Freyja", "Gerðr", "Gloð", "Grima", "Gunnhildr", "Gurli", "Guðrun", "Gyla", "Gyrið", "Gyða", "Hafrid", "Halla", "Helena", "Holmfrid", "Iliana", "Inga", "Ingfrid", "Ingibjörg", "Ingjerðr", "Ingrid", "Karin", "Katarina", "Kraka", "Kristina", "Linda", "Maer", "Malmfrið", "Margareta", "Maria", "Rikissa", "Rögnfrið", "Rögnhildr", "Saga", "Sara", "Sif", "Sigrid", "Skuld", "Sofia", "Svanhildr", "Ulfhildr", "Vigdis", "Ylva", "Yrsa"}
	}
};

RANDOM_SURNAMES = {
	["glazic"] = {
		"Abriallias", "Aelius", "Anderson", "Antonius", "Appius", "Arcadius", "Armstrong", "Armistead", "Aetius", "Aurelius", "Bateman", "Barclay", "Brutus", "Buchanan", "Caecilius", "Carrinas", "Cassius", "Clemens", "Cornelius", "Chamberlain", "Cranston", "Crassus", "Crawford", "Decimius", "Dilworth", "Domitius", "Fabius", "Flavius", "Franklin", "Fulvius", "Galerius", "Hamilton", "Harris", "Harvus", "Honorius", "Horatius", "Julius", "Jupiter", "Koulius", "Krammy", "Labienus", "Lincoln", "Marius", "Morgan", "Morris", "Nasennius", "Oswald", "Opimius", "Patrobius", "Parker", "Petronius", "Philadelphus", "Pompeius", "Quinctius", "Randolph", "Roberts", "Rufinius", "Septimius", "Severus", "Simmons", "Sheridan", "Stevens", "Stuart", "Sullivan", "Suetonius", "Taylor", "Temple", "Thompson", "Titus", "Tullius", "Tyler", "Valerius", "Vorenus", "Wales", "Wilkes"
	},
	["gore-glazic"] = {
        "Leveson", "Frilleck", "Stokes", "Holbrook", "Sayth", "Arderne", "Bewley", "Bost", "Blount", "Kent", "Makepiece", "Lichefield", "Wenmann", "Hertcombe", "Wilkins", "Carrinas", "Daggas", "Thomisson", "Pursglove", "Coultherst", "Battyl", "Henshawe", "Wything", "Brennyng", "Peltie", "Socksson", "Stokton", "Boltone", "Hamme", "Ledleye", "Maxwells", "Haytere", "Cocke", "Harlande", "Blakeslee", "Calidwalle", "Esburne", "Oldwood", "Helmwood", "Krammy", "Haige", "Hathiwey", "Raclyffe", "Deadmane", "Greymane", "Battleborn", "Gladwyne", "Hurst", "Aston", "Glaziere", "Parrywy", "Rayne", "Chestere", "Colee", "Ackerg", "Stune", "Westcotte", "Reever", "Arte", "Rey", "Stidolphe", "Blackburn", "Washennon", "Willough", "Townsend", "Kardene", "Blakisle", "Ekklesonne", "Wiccam", "Rode", "Kyrstone", "Bourke", "Heile", "Wilkiee", "Sawvers", "Albyne", "Fitsgeffrey", "Pennebrygg", "Morecote", "Fox", "Tegonwell", "Baldwin", "Bedgbery", "Sedrigg", "Swan", "Bridgeman"
	},
	["goreic"] = {
		"Askelsson", "Axel", "Bengtsson", "Björnsson", "Borgesson", "Bundersson", "Ericsson", "Erling", "Eskelsson", "Estensson", "Fredriksson", "Glazkill", "Gustavsson", "Guttormsson", "Haldorsson", "Haralder", "Helgasson", "Helvig", "Heskin", "Hexum", "Hohlt", "Jostad", "Junge", "Kaase", "Karsten", "Klingenberg", "Knudtson", "Krogh", "Leif", "Lorensson", "Mathiesson", "Nygaard", "Nylund", "Ohlsson", "Olafsson", "Skau", "Thostensson", "Torgrimsson", "Tostensson", "Westergaard"
	}
};

local FACTION = Clockwork.faction:New("Wanderer");
	FACTION.disabled = false; -- For events.
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_wanderers";
	FACTION.color = Color(160, 100, 15);
	FACTION.description = "Les Rôdeurs sont les charognards des Terres Désolées. \nIls étaient les nombreux roturiers des Districts, à peine alphabétisés et mal nourris. \nPour survivre en tant que Rôdeur, il faut être vif et brutal, et choisir son allégeance avec soin. \nLeurs armes sont leur foi et la peur qu'ils inspirent, et leur lutte sera éternelle.";
	FACTION.availablefaiths = {"Faith of the Light", "Faith of the Family", "Faith of the Dark"};
	FACTION.subfactionsToAvailableFaiths = {["Northlander"] = {"Faith of the Light", "Faith of the Family"}};
	FACTION.imposters = true;
	FACTION.names = "glazic";
	
	if game.GetMap() == "rp_district21" then
		FACTION.subfactions = {
			{
				name = "Northlander", 
				namesOverride = "gore-glazic", 
				subtitle = "Sang du Nord", 
				description = "Les Gore-Glazic des Collines sont un peuple simple et robuste. Pendant des générations, ils ont levé leurs lames, leurs battes et leurs crocs contre l'obscurité. Ils ne se battent pas pour l'argent, mais pour la survie et la famille. Tous doivent s'unir pour survivre dans le froid désolé. Ils ont trouvé leur place dans leurs propres niches, car ils étaient autrefois beaucoup de choses : fermiers, bergers, guerriers. Depuis, ils sont devenus chasseurs et combattants, luttant bec et ongles pour s'accrocher au moindre lopin de terre dont ils peuvent encore revendiquer la propriété. Ces bois sont leur foyer, et ils ne les laisseront pas tomber aux mains des envahisseurs Gay-Goreic, ni même de leurs frères du Sud, si l'occasion se présente. Ils sont nés de l'union des Gores et des Glazics des frontières durant les derniers jours des Conquêtes de Maximus. Ils ont fidèlement servi l'Empire de Lumière et la Sainte Hiérarchie qui a suivi depuis leur création, leur peuple étant zélé jusqu'à l'excès - mais, en eux coule toujours le sang du Nord, et la Famille souhaite ramener les égarés à la maison. Ils sont les derniers de leur espèce, un peuple presque disparu.",
				attributes = {
					{Color(255, 225, 0), "(~) Païen de Sang : Ne peut choisir que les fois 'Hard-Glazed' ou 'Famille'"},
				}, 
				models = {
					["male"] = {
						clothes = "models/begotten/wanderers/northwanderer_male.mdl",
						heads = DEFAULT_MODELS.male.heads,
					},
					["female"] = {
						clothes = "models/begotten/wanderers/northwanderer_female.mdl",
						heads = DEFAULT_MODELS.female.heads,
					},
				},
				default = true
			},
			{
				name = "Southlander", 
				subtitle = "Reliques du Sud", 
				description = "Les Pèlerins des terres du sud migrent continuellement vers le nord en dépit des éléments hostiles, cherchant la délivrance des contrées plus corrompues du sud. Ils apportent avec eux leurs étranges traditions et leurs hérésies.",			
				models = {
					["male"] = {
						clothes = "models/begotten/wanderers/wanderer_male.mdl",
						heads = DEFAULT_MODELS.male.heads,
					},
					["female"] = {
						clothes = "models/begotten/wanderers/wanderer_female.mdl",
						heads = DEFAULT_MODELS.female.heads,
					},
				},
			},
		};
	end
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name == "Goreic Warrior") then
			return false;
		end;
	end;
FACTION_WANDERER = FACTION:Register();

local FACTION = Clockwork.faction:New("Gatekeeper");
	if game.GetMap() == "rp_district21" then
		FACTION.disabled = true;
		FACTION.hidden = true;
	else
		FACTION.disabled = false;
	end
	
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers";
	FACTION.color = Color(80, 100, 120);
	FACTION.description = "Les Gardiens de la Porte sont la première ligne de défense contre les innombrables horreurs impies qui menacent la Glaze. \nLeurs rangs grossissent de roturiers assoiffés de pouvoir enrôlés de force et de flagellants fanatiques. \nIls doivent servir la Sainte Hiérarchie avec diligence et sans poser de questions, aussi scandaleuses que puissent être leurs demandes. \nMal entraînés et mal équipés, ces soldats sont censés donner leur vie pour protéger la Lumière. \nEt ainsi ils le feront.";	
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.alliedfactions = {"Hillkeeper", "Holy Hierarchy"};
	FACTION.masterfactions = {"Holy Hierarchy"};
	FACTION.enlist = true;
	FACTION.promoteAcrossSubfactions = true;
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.3326; -- 0.3326 slots per player (9.9 at 30 players).
	--FACTION.imposters = true; -- Kinisgers should get enlisted through /enlist on Wanderer disguises.
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Legionary", subtitle = "Légionnaires - Soldats de l'Église", description = "L'Ordre Sacré des Gardiens de la Porte défend la Sainte Hiérarchie contre les menaces impies depuis des temps immémoriaux. Ils ont connu de nombreux changements au fil des ans et varient considérablement en force, en équipement et en nombre d'un district à l'autre, mais partagent néanmoins un objectif unique : protéger la Sainte Hiérarchie coûte que coûte. Les Légionnaires représentent le gros des troupes de cet Ordre Sacré et ne connaissent que la Glaze. Ces hommes sont un mélange de soldats professionnels, de rebuts des Terres Désolées enrôlés de force et de fanatiques religieux. Ils servent comme troupes de première ligne et gardes au service de la Sainte Hiérarchie, prenant souvent des risques considérables pour faire avancer les objectifs de leurs ministres ou pour les défendre.", attributes = {{Color(0, 225, 0), "(+) Exercice constant : Commence avec +15 d'endurance maximum"}, {Color(0, 225, 0), "(+) Rations nourrissantes : Commence avec +25 de santé maximum"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"}, {Color(0, 225, 0), "(+) La force du nombre : +100% de gain de foi en infligeant des dégâts"}, {Color(225, 0, 0), "(-) La sous-foi 'Voltisme' est verrouillée"}}},
		{name = "Auxiliary", subtitle = "Auxilium - Forgerons et Médecins", description = "Colonne vertébrale de l'Ordre Sacré et garants de son ingéniosité supérieure, les auxiliaires assurent le ravitaillement, entretiennent les troupes et agissent comme réservistes au combat. En tant que Forgerons, ils arment les rangs avec un équipement supérieur, servent les canons et fortifient les positions défensives. En tant que Medici, ils préviennent les épidémies dans les rangs et soignent les blessures subies au combat. On attend d'eux qu'ils combattent si nécessaire, bien qu'ils ne soient pas aussi souvent exposés au danger que leurs homologues légionnaires.", attributes = {{Color(0, 225, 0), "(+) Hommes de savoir : +25% de gain de foi"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 12"}, {Color(0, 225, 0), "(+) Entraînés et nourris : Commence avec +20 de santé et +10 d'endurance"}, {Color(0, 225, 0), "(+) +5kg de capacité de charge supplémentaire"}, {Color(225, 0, 0), "(-) Le palier IV de l'arbre de croyance Prowess est verrouillé"}, {Color(225, 0, 0), "(-) La sous-foi 'Voltisme' est verrouillée"}}},
		{name = "Praeventor", startingRank = 12, whitelist = true, subtitle = "Praeventores - Scouts and Assassins", description = "Reprenant le nom d'une unité similaire de l'époque romaine antique, les Praeventores servent de petit cadre d'élite d'éclaireurs, de chasseurs et d'assassins pour l'Ordre Sacré. Recrutés parmi les disciples les plus loyaux et les plus compétents de Hard-Glaze, les Praeventores ne disposent d'aucun équipement standardisé pour les aider à se fondre dans la masse tout en accomplissant leurs devoirs dans les Terres Désolées. Ces devoirs incluent : rendre compte des mouvements ennemis, récupérer des artéfacts précieux ou des fournitures nécessaires, assassiner les ennemis de la Sainte Hiérarchie ou éliminer des cibles à longue distance, capturer ou exécuter les personnes faisant l'objet de primes, et recueillir des renseignements.", attributes = {{Color(0, 225, 0), "(+) Excursionnistes : -25% de drain d'endurance et +5% de vitesse de sprint"}, {Color(0, 225, 0), "(+) Maîtres du déguisement : Reconnaître ne révèle pas votre rang"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8"}, {Color(225, 0, 0), "(-) Les sous-fois 'Orthodoxie Solaire' et 'Voltisme' sont verrouillées"}}},
	};
	FACTION.residualXPZones = { -- Zones that boost residual XP gain for this faction.
		["rp_begotten3"] = {
			{pos1 = Vector(1390, 10153, -938), pos2 = Vector(-2370, 11254, -1690), modifier = 0.5, nightModifier = 0.25}, -- Gate
			{pos1 = Vector(10061, 10379, -1211), pos2 = Vector(9385, 11870, -670), modifier = 0.33, nightModifier = 0.2}, -- Gorewatch
			{pos1 = Vector(3458, 12655, -814), pos2 = Vector(3335, 12769, -685), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(2742, 10244, -1194), pos2 = Vector(2913, 10071, -1074), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(-1963, 10678, -1055), pos2 = Vector(-2144, 10886, -1194), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(-3468, 12985, -375), pos2 = Vector(-3591, 13103, -241), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
		},
		["rp_district21"] = {
			{pos1 = Vector(-4765, 9246, 838), pos2 = Vector(-8075, 10488, 489), modifier = 0.5, nightModifier = 0.25}, -- Hill
			{pos1 = Vector(-10637, 13043, 465), pos2 = Vector(-4664, 9210, 879), modifier = 0.5, nightModifier = 0.25}, -- Hill
			{pos1 = Vector(-9328, -8640, -146), pos2 = Vector(-8771, -8105, 686), modifier = 0.33, nightModifier = 0.2}, -- Gorewatch
		},
	};
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy") then
			if player:GetSubfaction() ~= "Kinisger" then
				return false;
			end
		end;
		
		-- It is the IC responsibility of Gatekeepers to bloodtest recruits.
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		if (!Clockwork.player:IsWhitelisted(player, "Gatekeeper")) then
			Clockwork.player:SetWhitelisted(player, "Gatekeeper", true);
		end;
	end;
	
	if SERVER then
		function FACTION:CanPromote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end
	
	if !Schema.RanksRestrictedWages then
		Schema.RanksRestrictedWages = {};
	end
	
	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	if !Schema.RanksToCoin then
		Schema.RanksToCoin = {};
	end
	
	Schema.Ranks["Gatekeeper"] = {
		[1] = "Disciple",
		[2] = "Acolyte",
		[3] = "Artificer",
		[4] = "Forgemaster",
		[5] = "Medicus",
		[6] = "Master Medicus",
		[7] = "Emissary",
		[8] = "Vexillifer",
		[9] = "Squire",
		[10] = "High Gatekeeper",
		[11] = "Master-At-Arms",
		[12] = "Scout",
		[13] = "Master Scout",
		[14] = "Acolyte-Evocatus",
	};
	
	Schema.RankTiers["Gatekeeper"] = {
		[1] = {"Disciple"},
		[2] = {"Acolyte", "Acolyte-Evocatus", "Artificer", "Medicus", "Scout"},
		[3] = {"Emissary", "Forgemaster", "Master Medicus", "Master Scout", "Vexillifer", "Squire"},
		[4] = {"High Gatekeeper"},
		[5] = {"Master-At-Arms"},
	};
	
	Schema.RanksToBuffs["Gatekeeper"] = {
		["Master-At-Arms"] = {health = 50, stamina = 50},
	};
	
	-- Do not grant wages to these ranks if they are inside the safezone.
	Schema.RanksRestrictedWages["Gatekeeper"] = {1, 2, 12, 13, 14};
	
	Schema.RanksToSubfaction["Gatekeeper"] = {
		["Artificer"] = "Auxiliary",
		["Forgemaster"] = "Auxiliary",
		["Medicus"] = "Auxiliary",
		["Master Medicus"] = "Auxiliary",
		["Scout"] = "Praeventor",
		["Master Scout"] = "Praeventor",
	};
	
	Schema.RanksToCoin["Gatekeeper"] = {
		[1] = 25,
		[2] = 35,
		[3] = 35,
		[4] = 50,
		[5] = 35,
		[6] = 50,
		[7] = 50,
		[8] = 50,
		[9] = 50,
		[10] = 100,
		[11] = 200, 
		[12] = 35,
		[13] = 50,
		[14] = 50,
	};
FACTION_GATEKEEPER = FACTION:Register();

local FACTION = Clockwork.faction:New("Holy Hierarchy");
	local ministerModels = {
		male = {
			clothes = "models/begotten/gatekeepers/minister_male.mdl",
			heads = {
				"male_01",
				"male_02",
				"male_03",
				"male_04",
				"male_05",
				"male_06",
				"male_07",
				"male_08",
				"male_09",
				"male_11",
				"male_12",
				"male_13",
				"male_16",
				"male_22",
				"male_56"
			},
		},
	};

	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_hierarchy";
	FACTION.color = Color(225, 175, 0);
	FACTION.description = "La Sainte Hiérarchie défend la supériorité ancestrale de la minorité éclairée. \nParmi la mer sombre de sang bâtard et de populace incivilisée, ils sont les arbitres et les administrateurs chargés d'imposer la Sainte Lumière. \nPourtant, beaucoup sont corrompus, recherchant l'indulgence personnelle plutôt que de diriger avec droiture. \nAprès tout, depuis leurs hauts sièges, il n'y a personne au-dessus d'eux pour les juger d'un regard.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.alliedfactions = {"Gatekeeper", "Hillkeeper"};
	FACTION.enlist = true;
	FACTION.ratio = 0.1; -- 0.1 slots per player (3 at 30 players).
	--FACTION.imposters = true;
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Ministry", startingRank = 3, whitelist = true, subtitle = "Le Ministère - Les Quelques Privilégiés Surveillants de la Suprématie Glazic", description = "La Sainte Hiérarchie est peut-être la seule institution survivante de l'ancien monde et la seule église connue de la Lumière encore existante. Beaucoup considèrent la Sainte Hiérarchie comme la continuation directe de l'Empire de Lumière, y compris la Sainte Hiérarchie elle-même, qui pousse ce récit pour solidifier son emprise sur ses sujets. Quiconque doute de sa légitimité est exécuté sur-le-champ. Dominant la plupart de la paysannerie 'civilisée' qui erre dans les Terres Désolées, la Sainte Hiérarchie applique strictement ses codes religieux, qui changent constamment au gré du Pape. Au sommet de la Hiérarchie se trouve le Pape, suprême en pouvoir. Il vit dans un penthouse au sommet de l'hôtel dans un luxe absolu comparé aux taudis que la populace partage. En dessous de lui se trouvent les cardinaux, qui servent de conseil au Pape. Plus bas encore se trouvent les évêques, dont beaucoup sont maintenant en rébellion ouverte contre le nouveau Pape, certains revendiquant même son titre comme le leur. Enfin, il y a les prêtres, qui sont à peine au-dessus du statut de roturier et égaux en rang à ceux des Chevaliers de Sol ou de l'Inquisition. Les devoirs d'un prêtre impliquent souvent de fouiller les textes anciens conservés dans les grandes archives pour trouver un avantage à offrir à la Hiérarchie contre ses rivaux, ou pour déchiffrer les divagations de la machine dont tant d'errants parlent.", models = ministerModels},
		{name = "Inquisition", startingRank = 2, whitelist = true, subtitle = "La Seconde Inquisition - Chasseurs, Juges et Bourreaux", description = "L'Ordre Sacré des Inquisiteurs de la Glaze est une institution ancienne, fondée par le Seigneur Maximus lors de ses campagnes contre les Chapeaux Noirs et née du besoin de détruire les infiltrateurs et d'éliminer l'hérésie. Bien que dissoute après l'accomplissement de leur tâche, il ne fallut pas longtemps avant que l'Inquisition ne soit rétablie, car les ennemis de la Glaze ne faisaient que croître en nombre et en férocité. La venue du Dieu-Dessous et le déplacement subséquent du Seigneur Obscur de l'Enfer n'ont fait que renforcer le besoin de l'Inquisition, car des pouvoirs inconnus étaient maintenant ouvertement déchaînés sur l'humanité. L'Inquisition est la ligne de défense la plus importante pour la Sainte Hiérarchie, car elle débusque les ennemis cachés de la Glaze et fait respecter la doctrine religieuse. Les Inquisiteurs respectent strictement leur 'Livre de la Loi', qui détaille leur méthodologie et les règles auxquelles tous les disciples de la Glaze doivent adhérer. L'inquisition a également la capacité unique de tenir tout membre de la société Glazic responsable devant le 'Livre de la Loi', y compris les membres de la Sainte Hiérarchie. Les accusations d'hérésie ne sont cependant pas prises à la légère, et se tromper après avoir accusé quelqu'un au pouvoir peut avoir des conséquences désastreuses pour l'accusateur.", attributes = {{Color(0, 225, 0), "(+) Pieux : +50% de gain de foi"}, {Color(0, 225, 0), "(+) Commence avec +50 de santé maximum"}, {Color(0, 225, 0), "(+) +5kg de capacité de charge supplémentaire"}}},
		{name = "Knights of Sol", startingRank = 1, whitelist = true, subtitle = "Les Chevaliers de Sol - L'Ordre le Plus Dévoué de la Glaze", description = "Il y a seulement quelques années, Skylight est tombé sur Terre dans un enfer flamboyant, la dernière promesse d'un avenir pour l'humanité s'écrasant au sol avec lui. De ses innombrables habitants éclairés, seulement dix-sept ont émergé : les Glorieux Dix-Sept. Revêtant une glorieuse armure blanche et maniant des épées brillantes, les Glorieux Dix-Sept ont massacré chaque démon qui tombait sur eux. Des milliers sont tombés sous leurs lames avant que les démons ne se retirent dans les ténèbres, et il semblait que l'humanité vivrait au moins un jour de plus. Bien que les Glorieux Dix-Sept ne marchent plus sur cette Terre, leur héritage perdure dans le nouvel Ordre Sacré des Chevaliers de Sol. Ces Chevaliers de Sol sont constitués du meilleur de la Sainte Hiérarchie, inégalés en prouesse et considérés par beaucoup de fidèles comme des anges gardiens incarnés. Les Chevaliers reçoivent le meilleur équipement disponible dans les arsenaux royaux. Malgré cela, on ne voit jamais les Chevaliers avec des mousquets ou toute autre sorte d'arme à feu, les jugeant trop lâches pour quelqu'un de stature aussi noble. Les Chevaliers de Sol sont également connus pour garder des écuyers à leur service, souvent recrutés dans les rangs des Gardiens de la Porte.", attributes = {{Color(0, 225, 0), "(+) Les dégâts de balle sont réduits de 50%"}, {Color(0, 225, 0), "(+) Rempart : +25 d'endurance et +25 de stabilité"}, {Color(0, 225, 0), "(+) Commence avec +75 de santé maximum"}, {Color(225, 0, 0), "(-) Accablé : La vitesse de course est réduite de 10%"}, {Color(225, 0, 0), "(-) Lié par l'honneur : Ne peut pas équiper d'armes à feu."}}, models = ministerModels},
		{name = "Low Ministry", startingRank = 12, whitelist = true, maps = {"rp_district21"}, subtitle = "Le Bas Ministère - Défenseurs de la Glaze", description = "Dans le Nord existe une section unique de la Hiérarchie - le Bas Ministère. Tandis qu'à huis clos opère le petit clergé du Sud, c'est dans les rues désormais vides des hameaux du Nord que le Bas Ministère marchait et prêchait. Même maintenant dans les rues de la Colline, le Bas Ministère défend la foi avec un abandon zélé. Ils ont autorité sur tous les Hommes de la Garde et les Rôdeurs, à l'exception du misérable Aumônier qui ne relève que de l'autorité d'un Yeoman, et ont pour mission de maintenir la cohésion de la communauté intacte ; avec un livre saint dans une main et une croix dans l'autre. S'ils échouent dans leurs devoirs, un châtiment terrible leur sera infligé.", attributes = {{Color(0, 225, 0), "(+) Piété silencieuse : +15% de gain de foi"}, {Color(0, 225, 0), "(+) Sang de zélotes : Commence avec +30 de santé maximum"}, {Color(225, 0, 0), "(-) Les paliers III et IV de l'arbre de croyance Prowess sont verrouillés"}}, models = ministerModels, namesOverride = "gore-glazic"}
	};
	FACTION.singleGender = GENDER_MALE;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		--if (faction.name != "Wanderer" and faction.name != "Gatekeeper") then
			--return false;
		--end;
		
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		--[[if (!Clockwork.player:IsWhitelisted(player, "Holy Hierarchy")) then
			Clockwork.player:SetWhitelisted(player, "Holy Hierarchy", true);
		end;]]--
	end;
	
	if SERVER then
		function FACTION:CanEnlist(player, target, faction, subfaction)
			if !player:IsAdmin() then
				if faction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						if subfaction and subfaction.name ~= playerSubfaction then
							return false;
						end
					end
				end
			end
		end
		
		function FACTION:CanPromote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				if faction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						if subfaction and subfaction.name ~= playerSubfaction then
							return false;
						end
					end
				end
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				if faction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						if subfaction and subfaction.name ~= playerSubfaction then
							return false;
						end
					end
				end
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Holy Hierarchy"] = {
		[1] = "Sir",
		[2] = "Apprentice",
		[3] = "Vicar",
		[4] = "Justicar",
		[5] = "Inquisitor",
		[6] = "Minister",
		[7] = "Grand Knight",
		[8] = "Ordinator",
		[9] = "Magistrate",
		[10] = "Grand Inquisitor",
		[11] = "Regent",
		[12] = "Almsman",
		[13] = "Pater",
		[14] = "Castigator",
		[15] = "Suffragan",
		[16] = "High Priest",
	};
	
	Schema.RankTiers["Holy Hierarchy"] = {
		[1] = {"Sir", "Apprentice", "Vicar", "Almsman"},
		[2] = {"Justicar", "Inquisitor", "Minister", "Pater", "Castigator"},
		[3] = {"Grand Knight", "Ordinator", "Magistrate", "Suffragan"},
		[4] = {"Grand Inquisitor", "Regent", "High Priest"},
	};
	
	Schema.RanksToSubfaction["Holy Hierarchy"] = {
		["Sir"] = "Knights of Sol",
		["Justicar"] = "Knights of Sol",
		["Grand Knight"] = "Knights of Sol",
		["Apprentice"] = "Inquisition",
		["Inquisitor"] = "Inquisition",
		["Ordinator"] = "Inquisition",
		["Grand Inquisitor"] = "Inquisition",
		["Almsman"] = "Low Ministry",
		["Pater"] = "Low Ministry",
		["Castigator"] = "Low Ministry",
		["Suffragan"] = "Low Ministry",
		["High Priest"] = "Low Ministry",
	};
FACTION_HIERARCHY = FACTION:Register();

local FACTION = Clockwork.faction:New("Goreic Warrior");
	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gores";
	FACTION.color = Color(100, 100, 100);
	FACTION.description = "Les féroces clans de lances du Nord, inégalés dans leur endurance et leur force, se sont rassemblés pour la première fois. \nAu cœur de leur camp de guerre se trouve le Grand Arbre, celui qui a été marqué par la Sainte Hiérarchie et qui doit être restauré par le sang versé. \nLes Clans doivent mettre de côté leurs différences et lancer un raid divin sur les dernières terres Glazic restantes, pour chercher vengeance et gloire. \nSi leur Grand Arbre subit une autre catastrophe, leur connexion avec les Cinq Dieux sera à jamais rompue et le monde entier périra. \nPour cette raison, ils doivent endurer toujours plus, car il y a bien d'autres menaces au-delà que la Hiérarchie brisée.";
	FACTION.availablefaiths = {"Faith of the Family"};
	FACTION.subfactionsToAvailableFaiths = {["Clan Reaver"] = {"Faith of the Family", "Faith of the Dark"}};
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.225; -- 0.2217 slots per player (6.7 at 30 players).
	FACTION.imposters = true;
	FACTION.names = "goreic";
	FACTION.subfactions = {
		{name = "Clan Gore", subtitle = "Disciples du Père - Guerriers et Chasseurs", description = "Le clan Gore est actuellement connu comme le Clan de la Couronne, un titre donné au plus puissant de tous les clans. Suivant le Père, le clan Gore est né par le sang versé et la conquête. L'ancien Clan de la Couronne et les disciples du Père, le clan Ghorst, avaient un chef de guerre qui fit l'erreur d'engendrer un bâtard et de l'abandonner aux loups pour qu'il soit dévoré. Le garçon fut plutôt élevé par ces loups et prit le nom de Roi Faucheur Kalkaslash. Avec une armée de skinwalkers et de loups-garous, Kalkaslash se fraya un chemin sanglant jusqu'à la grande salle de son père, et le déchiqueta en un tas sanglant avec ses griffes. Dès lors, il s'empara de son trône et força les autres clans à s'agenouiller avec son armée nouvellement acquise d'hommes guerriers. Pendant les cent années suivantes, le clan Gore captura des femmes par milliers et engendra de nouveaux guerriers, car elles donnaient naissance à des milliers d'autres tueurs impitoyables pour poursuivre le processus. Le Père est dur et inflexible, mais avec sa force, les empires tomberont.", rivalry = "Clan Grock", attributes = {{Color(0, 225, 0), "(+) Commence avec +45 de santé maximum"}, {Color(0, 225, 0), "(+) Chasseurs experts : Inflige 50% de dégâts supplémentaires aux animaux"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8"}}},
		{name = "Clan Harald", subtitle = "Disciples du Vieux Fils - Marins et Explorateurs", description = "Le clan Harald est le deuxième plus ancien clan appartenant aux peuples Goreic, le plus ancien étant le clan Grock. Le sel de la mer coule dans le sang de ces hommes, et leur foyer est tout ce qui se trouve au-delà. Depuis plusieurs centaines d'années, le clan Harald n'a pas de vrai chef, depuis qu'il a été maudit par le dieu farceur de la Sœur. Tout homme qui se dit Chef de la mer, et donc chef du clan Harald, mourra noyé. Bien qu'il n'y ait jamais de chef du clan Harald, il existe toujours un conseil des marins les plus expérimentés (et les plus têtus) qui supervise les affaires. En ces temps sombres, les Haralders cherchent à mettre fin à leur malédiction et à devenir le nouveau Clan de la Couronne, car ils sentent qu'ils ont toujours été destinés à l'être. Les marins Haralder seront toujours en conflit avec les disciples de la Sœur, d'horribles farceurs qui créent des tempêtes transformant leurs drakkars en mer brûlante. Inconnu de tous les autres clans, les disciples du Vieux Fils voient leur divinité comme une bête massive vivant dans les profondeurs les plus sombres de l'océan, et bientôt ils la réveilleront et regarderont leur monde entier s'immerger sous les eaux, tandis qu'ils prospèrent au-dessus avec leurs puissantes voiles.", rivalry = "Clan Reaver", attributes = {{Color(0, 225, 0), "(+) Commence avec +35 de santé maximum"}, {Color(0, 225, 0), "(+) Accès à de plus grands Drakkars"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"}}},
		{name = "Clan Reaver", startingRank = 7, subtitle = "Disciples de la Sœur - Esclavagistes et Marchands", description = "Le plus riche de tous les clans, les Reavers sont les piliers de la société et de l'économie Goreic, mais sont souvent méprisés par les autres. Considérés comme faibles et comme des filous, ils ne sont jamais trustés par les autres clans, et pour cause. Le peuple Goreic est maudit pour vivre sur des terres infertiles, et pour cette raison, ils doivent survivre en pillant les peuples plus faibles. Pourtant, les Reavers suivent la Sœur, et ils considèrent qu'il est de leur droit de causer du malheur aux autres, même lorsqu'ils n'ont aucune raison pratique de le faire. Leur siège est celui de la Salle des Larmes, un endroit terrifiant caché quelque part dans les bois, où les gens sont suspendus aux portes de la mort tant qu'ils procurent du divertissement. Au lieu de rencontrer leurs ennemis sur un champ ouvert comme leurs frères brutaux, les Reavers jettent des malédictions sur leurs adversaires ou même manipulent des factions entières pour faire leurs volontés. Certains dans le Sud présument que les disciples de la Sœur pourraient en réalité faire l'œuvre du Prince Obscur, bien que les Reavers puissent même suggérer que les deux dieux ne font qu'un.", rivalry = "Clan Harald", attributes = {{Color(0, 225, 0), "(+) Commence avec +25 de santé maximum"}, {Color(0, 225, 0), "(+) Gagne un salaire passif de Pièces chaque heure"}, {Color(0, 225, 0), "(+) Gagne le double de pièces en vendant des esclaves"}, {Color(0, 225, 0), "(+) Peut choisir la Foi du Ténébreux comme foi"}, {Color(0, 225, 0), "(+) La croyance 'Survivaliste' de la Foi du Ténébreux accorde +25 de santé maximum"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"}}},
		{name = "Clan Shagalax", subtitle = "Followers of the Jeune Fils - Bâtisseurs et Forgerons", description = "On dit qu'un Shagalaxien naît avec une peau d'acier et du fer fondu coulant dans son sang. Sans leur métal, les Gores assoiffés de sang lanceraient des bâtons et des pierres au lieu de leur puissant acier. Il fut un temps, il y a longtemps, où les Shagalaxiens étaient considérés comme les plus puissants de tous les clans et où toutes les tribus étaient unies sous leur bannière ; quand leurs chars crachant de la vapeur projetaient des flammes à travers les vallées, réduisant en cendres armées et forêts. De pathétiques flèches ricochaient sur leurs nombreuses plaques d'acier tandis que leurs légions de chars écrasaient les champs de tribus terrifiées et de villes de la Glaze. Ce n'est que lorsque les faiblards du clan Crast ont eu vent des transactions du clan Shagalax avec un Titan-Dieu mécanique que leur titre de Clan de la Couronne dut être contesté. Ainsi, quand le Dieu-Dessous est entré dans ce monde, les Shagalaxiens ont profité de l'occasion et ont commencé leur invasion de l'éternel Empire de Lumière haï avec la puissance combinée des tribus Gore. Cependant, les Shagalaxiens apprirent bientôt que le Dieu-Dessous n'avait pas d'alliés, et dans leur plus grand moment de faiblesse, leurs restes furent conquis par les disciples du Père à la demande du clan Crast. Il fut alors décrété que seul le Père, et par procuration le clan Gore, pouvait dominer les autres clans. Les Shagalaxiens coupés de leurs frères pendant l'invasion du Dieu-Dessous constituent maintenant plusieurs des bandes de ferrailleurs qui ravagent les Terres Désolées, mais un petit nombre de ceux encore connectés au Grand Arbre demeurent parmi les grands clans. Beaucoup de Shagalaxiens prétendent être loyaux au Jeune Fils, une divinité de charité et d'ingéniosité, mais en secret, on dit que certains suivent un titan mécanique et attendent patiemment le moment où leurs légions de chars seront reconstruites afin de pouvoir réduire ce monde en cendres une fois de plus.", rivalry = "Clan Crast", attributes = {{Color(0, 225, 0), "(+) Commence avec +30 de santé maximum"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8, avec des points placés dans 'Ingéniosité'"}, {Color(0, 225, 0), "(+) Peut fabriquer et utiliser des armes à feu et des arbalètes"}, {Color(0, 225, 0), "(+) +5kg de capacité de charge supplémentaire"}}},
		{name = "Clan Crast", startingRank = 3, subtitle = "Disciples de la Mère - Chamanes et Mystiques", description = "Bien que tous les disciples de la Famille respectent le rôle de la Mère et sa contribution au cycle rude mais juste de la nature et de la mort, ceux qui sont réellement nés sous son signe sont méprisés comme faibles et pathétiques. À cette époque, les disciples de la Mère étaient jetés du haut de falaises pour s'écraser sur les rochers en contrebas, car ils ne deviendraient jamais de grands guerriers comme les disciples du Père. Puis, un roi plus bienveillant du Trône d'Écorce décida qu'un dixième des enfants nés sous le signe de la Mère serait autorisé à vivre. Comme toujours, ces enfants chanceux grandissaient pour devenir des êtres étranges et difformes, mais ils avaient des dons qui les rendaient utiles. Certains devinrent bardes, artistes : un nain jongleur ou un géant à deux têtes. D'autres avaient la Vision, un moyen de voir dans le vide sombre du destin lui-même. Avec une nouvelle génération d'êtres mystiques, un nouveau clan fut formé, le premier à suivre la Mère. À ce jour, le clan Crast prospère sans effusion de sang, car leurs grands voyants aveugles scrutent l'obscurité pour avertir les autres des périls à venir. Quand un voyant prédit la destruction du Grand Arbre par les dragons cracheurs de feu de la Sainte Hiérarchie, et que personne ne le crut, les Gores apprirent à ne plus jamais se méfier des avertissements de leurs Crasters. La lignée actuelle du clan Crast est la plus en phase avec les anciens Druides des Lames, et cherche à utiliser leurs armes anciennes forgées par la Terre elle-même. Un grand rituel attend le clan Crast pour restaurer leur Grand Arbre, et les autres clans sont prêts à voir cela jusqu'au bout.", rivalry = "Clan Shagalax", attributes = {{Color(0, 225, 0), "(+) Commence avec +25 de santé maximum"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 12"}, {Color(0, 225, 0), "(+) Peut déverrouiller la capacité de Parler-corbeau"}, {Color(0, 225, 0), "(+) Peut fabriquer et utiliser des arbalètes"}, {Color(225, 0, 0), "(-) Commence avec -4 Points de Trait"}}},
		{name = "Clan Grock", subtitle = "Disciples des Anciennes Voies - Nomades", description = "La première tribu Gore à venir s'installer près du Grand Arbre. Le plus ancien clan de tous les Gores, et ceux qui ont refusé de suivre les dieux de la Famille. Bien que de nombreux adeptes des Anciennes Voies reconnaissent l'existence de la Famille, ils choisissent plutôt de suivre leur propre chemin et de compter sur eux-mêmes pour tracer leur route dans la vie. Tous les Gores croient qu'ils sont destinés à mourir et que quoi qu'ils fassent ne peut changer cela, et ainsi ceux des Anciennes Voies conviennent qu'ils continueront à lutter pour survivre jusqu'à ce que ce jour vienne. Le Grock moyen est beaucoup plus grand et plus fort que ses frères, avec une épaisse toison de poils noirs couvrant leurs corps non lavés, leur donnant un aspect bestial. Le clan Grock ne détiendra jamais de pouvoir car leurs croyances encouragent un mode de vie nomade, libre de la société, des lois et de la dépendance envers les autres hommes. La seule fois où ils seront jamais appelés par les autres, c'est si leur Grand Arbre est attaqué, et alors seulement ils chargeront pour défendre leurs terres natales. Le clan Grock est considéré comme une plaisanterie par les autres clans, des hommes qui préféreraient coucher avec des bêtes plutôt qu'avec une bonne femme. Les pires d'entre eux sont le clan Gore, les rois arrogants d'antan qui organisaient des 'Grandes Chasses' pour massacrer autant de Grocks que possible pour la gloire et le droit de se vanter. Pourtant, quand leurs grands dieux les abandonnent, ceux des Anciennes Voies perdurent toujours.", rivalry = "Clan Gore", attributes = {{Color(0, 225, 0), "(+) Commence avec +100 de santé maximum"}, {Color(0, 225, 0), "(+) Sauvage : Les cris de guerre restaurent instantanément 25 d'endurance"}, {Color(0, 225, 0), "(+) Primitif : Les pierres lancées infligent 50% de dégâts de stabilité supplémentaires. Déverrouille la capacité d'équiper des armes lourdes en pierre runique"}, {Color(0, 225, 0), "(+) Costaud : Grandit de 0.5% en taille et gagne +2 PV à chaque Niveau de Sacrement"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8"}, {Color(0, 225, 0), "(+) +10kg de capacité de charge supplémentaire"}, {Color(225, 0, 0), "(-) Ne peut pas porter d'armure Moyenne ou Lourde"}, {Color(225, 0, 0), "(-) L'Arbre de Sous-Foi est verrouillé et ne peut pas être progressé"}}}
	};
	FACTION.models = {
		male = {
			clothes = "models/begotten/goreicwarfighters/goretribal_male.mdl",
			heads = {
				"male_90",
				"male_91",
				"male_92",
				"male_93",
				"male_94",
				"male_95",
				"male_96"
			},
		},
	};
	FACTION.singleGender = GENDER_MALE;
	
	if SERVER then
		function FACTION:CanPromote(player, target, faction, subfaction)
			if subfaction == "Clan Grock" then
				return false;
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if subfaction == "Clan Grock" then
				return false;
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Goreic Warrior"] = {
		[1] = "",
		[2] = "Housecarl",
		[3] = "Soothsayer",
		[4] = "Seer",
		[5] = "Admiral",
		[6] = "Ironborn",
		[7] = "Marauder",
		[8] = "Red Wolf",
		[9] = "Chieftain",
		[10] = "Elder",
		[11] = "Grand Admiral",
		[12] = "King's Chosen",
		[13] = "King",
	};
	
	Schema.RankTiers["Goreic Warrior"] = {
		[1] = {"", "Soothsayer", "Marauder"},
		[2] = {"Housecarl", "Seer", "Admiral", "Ironborn", "Red Wolf"},
		[3] = {"Chieftain", "Elder", "Grand Admiral"},
		[4] = {"King's Chosen"},
		[5] = {"King"},
	};
	
	Schema.RanksToBuffs["Goreic Warrior"] = {
		["King"] = {health = 50, stamina = 50},
	};
	
	Schema.RanksToSubfaction["Goreic Warrior"] = {
		["Admiral"] = "Clan Harald",
		["Grand Admiral"] = "Clan Harald",
		["Soothsayer"] = "Clan Crast",
		["Seer"] = "Clan Crast",
		["Elder"] = "Clan Crast",
		["Ironborn"] = "Clan Shagalax",
		["Marauder"] = "Clan Reaver",
		["Red Wolf"] = "Clan Reaver",
	};
FACTION_GOREIC = FACTION:Register();

local FACTION = Clockwork.faction:New("Children of Satan");
	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_satanists";
	FACTION.color = Color(125, 10, 10);
	FACTION.description = "Ceux qui sont choisis pour rejoindre les Enfants de Satan sont des individus exceptionnels, qu'ils soient particulièrement tordus et rusés, ou peut-être nés avec le sang de l'ancienne royauté. \nPour cette raison, les Enfants sont peu nombreux comparés aux autres puissances, mais ils compensent cela par leur habileté et leur grâce inégalées. \nL'Enfant de Satan moyen est âgé de plusieurs siècles, obsédé par la connaissance interdite supérieure et les œuvres d'art et de passion glorieuses, mais ils ont encore beaucoup à apprendre. \nCraignant ce qu'il adviendrait de leurs âmes corrompues s'ils devaient rencontrer un sort imprévu avant d'atteindre le stade de Démon, un Enfant de Satan risquera rarement sa vie pour une récompense insatisfaisante. \nIls sont les marionnettistes invisibles ; la Glaze et le Gore doivent être maintenus en équilibre, car Satan désire plus de sujets dans sa guerre contre le Dieu-Dessous, et l'extinction ne fera que résulter en Sa victoire.";
	FACTION.availablefaiths = {"Faith of the Dark"};
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.2; -- 0.2 slots per player (6 at 30 players).
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Varazdat", subtitle = "Maison Varazdat - Maîtres Épéistes et Buveurs de Sang", description = "L'Empire du Niger oriental est bien connu comme la Terre aux Mille Princes pour ses infâmes empereurs fous de luxure. Plusieurs de ces empereurs tenaient d'immenses orgies dans l'enceinte de leurs palais, ce qui donna naissance à de nombreux enfants bâtards. En raison de lois de succession floues, cela conduisit à une suite interminable de guerres en Extrême-Orient pour un trône baigné de sang. Parmi les milliers de prétendants au trône se trouvait l'enfant Varazdat, qui avait très peu de sang royal en lui, mais toute l'ambition du monde. Alors que les autres prétendants étaient soutenus par de riches marchands d'épices et des nobles, Varazdat était un rat des égouts qui commença son ascension en pickpocket et en égorgeant. Il kidnappa d'autres prétendants et prépara leurs corps en fins festins, leur chair tendre épicée et rôtie à la perfection. Pour chaque prétendant qu'il tuait et dont il se nourrissait, il absorbait son pouvoir et son droit de naissance. À la fin de son chemin, il était positivement ballonné, le ventre plein de royauté, et sa prétention au trône était soutenue par des millions de mercenaires. Le règne des Varazdat ne dura pas très longtemps, comme la plupart des choses, mais il ouvrit la voie aux futurs empereurs pour chercher des pouvoirs auprès des Ténèbres. Aujourd'hui, ceux qui partagent le sang de la Maison Varazdat sont craints comme des intrigants particulièrement impitoyables et des mangeurs d'enfants.", attributes = {{Color(0, 225, 0), "(+) Soif de sang : +10% de vitesse de sprint au-dessus de 95% de santé"}, {Color(0, 225, 0), "(+) Vol de vie : 70% en Armure Légère, 50% en Armure Moyenne, 30% en Armure Lourde"}, {Color(0, 225, 0), "(+) Guerriers de l'Est : +25 santé et +15 endurance"}, {Color(0, 225, 0), "(+) Commence au niveau de sacrement 5, avec les croyances 'Sauvage' et 'Mangeur de Cœurs' déverrouillées"}, {Color(225, 0, 0), "(-) Ne peut se sustenter qu'en se nourrissant de chair humaine"}, {Color(225, 0, 0), "(-) Cannibales déments : La perte de santé mentale est augmentée de 50%"}}},
		{name = "Rekh-khet-sa", subtitle = "Maison Rekh-khet-sa - Sorciers Immortels des Ténèbres", description = "La formation de la Maison de Rekh-khet-sa remonte à bien avant l'histoire enregistrée dans l'Égypte, une terre oubliée. Les anciens Égyptiens furent corrompus par Lucifer pour utiliser des magies noires dans leurs horribles quêtes d'immortalité absolue au nom de leur Pharaon. Bien que tous leurs membres originels soient décédés, leur avidité pour atteindre l'immortalité persiste encore à ce jour, leurs textes anciens étant la base de la réformation moderne des Rekh-khet-sa. De nombreux membres de la Maison Rekh-khet-sa poursuivent la quête d'immortalité du soi-disant Ancien, imprégnés de visions du Prince Obscur, et obsédés par la collection d'artefacts pour atteindre leurs objectifs, certains réussissant même à accomplir des magies telles que l'inversion de l'âge. Pour cette raison, les membres plus âgés des Rekh-khet-sa ont tendance à être plus sages que les autres maisons, capables d'acquérir une richesse d'expérience. Bien que chaque membre de cette lignée puisse avoir des centaines d'années, ils vivent éternellement dans les ténèbres. Quand la lumière de Sol brille sur eux, ils se ratatinent, leur peau parfaite pourrissant, révélant le coût de la vie éternelle.", attributes = {{Color(0, 225, 0), "(+) Sorciers anciens : Ne subit aucune corruption ni perte de santé mentale"}, {Color(0, 225, 0), "(+) Peut fabriquer de 'l'Acier Forgé par l'Enfer' sans la croyance 'Sorcier'"}, {Color(0, 225, 0), "(+) Plafond de niveau infini et +25% de gain de foi"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 16, avec 'Primévalisme' déverrouillé"}, {Color(0, 225, 0), "(+) +5kg de capacité de charge supplémentaire"}, {Color(225, 0, 0), "(-) Subit des dégâts périodiques à l'extérieur pendant la journée"}}},
		{name = "Philimaxio", subtitle = "Maison Philimaxio - Chevaliers Noirs Jurés au Prince Obscur", description = "Quand le Dieu-Dessous balaya les terres de Sol pour apporter ruine et purification, presque tous les districts centraux tombèrent immédiatement. Les Sentinelles Blanches du District Dix-Sept étaient d'un avis contraire. Leur forteresse fut ravagée maintes et maintes fois par les hordes d'esclaves morts-vivants, et à chaque fois, ils tombèrent sous les lames des Sentinelles. Ce n'étaient pas de simples gardes, mais des nobles renommés de la famille à poigne de fer des Philimaxio. Dans la Sainte Hiérarchie, très peu de maisons nobles s'abaisseraient jamais à porter directement les armes. Les Philimaxio étaient des martialistes, robustes et endurants, toujours prêts pour le moment où un grand ennemi se lèverait contre eux. En effet, ils tinrent leur District Dix-Sept jusqu'à ce qu'il n'y ait plus aucune raison de le faire, car l'Empire de Lumière s'effondra autour d'eux et ils furent abandonnés. Réalisant leur situation, les Philimaxio se retrouvèrent entourés de tentations obscures. Le Prince Obscur murmura à leurs oreilles, minant leur résolution spirituelle jusqu'à ce qu'ils se retournent contre la Lumière. Les Sentinelles Blanches devinrent cramoisies alors qu'ils massacraient tous les serfs, nobles et citoyens dans le District Dix-Sept. Les Philimaxio furent parmi les premiers à rejoindre les Enfants de Satan, cherchant le manoir hanté où ils deviendraient les gardes impies d'un Seigneur de la Terreur satanique. Silencieux, forts, dévoués et inflexibles, les fils de la Lignée Philimaxio repousseront tous ceux qui osent menacer les disciples des Ténèbres.", attributes = {{Color(0, 225, 0), "(+) Mur blindé : L'armure est 10% plus protectrice"}, {Color(0, 225, 0), "(+) Les dégâts de balle sont réduits de 50%"}, {Color(0, 225, 0), "(+) Nobles guerriers : +50% santé, +15 stabilité, +15 endurance"}, {Color(0, 225, 0), "(+) Acier noir : Les effets de 'Compétence Impossible' s'appliquent aussi aux Épées longues"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"}, {Color(225, 0, 0), "(-) Lié par l'honneur : Ne peut pas équiper d'armes à feu."}}},
		{name = "Kinisger", subtitle = "Maison Kinisger - Maîtres Mutants de l'Infiltration et de l'Assassinat", description = "Chaos, tromperie et fourberie. La Maison Kinisger existe depuis la Première Inquisition. Quand la tromperie était grande dans l'Empire de Lumière, le Seigneur Maximus s'avanca et révéla l'existence des Chapeaux Noirs ; des mutants au sang noir prenant l'apparence d'hommes de foi qui avaient infiltré la société pour semer le chaos. L'Inquisition fut alors appelée pour mettre fin aux Chapeaux Noirs, certains d'entre eux devant utiliser de la sorcellerie pour déguiser leur sang noir en rouge cramoisi, et quand l'Inquisition commença à exécuter quiconque éveillait leurs soupçons, ils durent prendre des mesures plus extrêmes. Ce fut le début de leur pacte, car ils utilisèrent des rituels obscurs pour déguiser leur chair en différentes apparences. Pratiquement tous les Chapeaux Noirs qui n'utilisèrent pas cette méthode furent exécutés lors de la Première Inquisition. Ainsi, les descendants de la Maison Kinisger sont tous des Chapeaux Noirs qui restent fidèles aux Ténèbres. Leurs membres, à ce jour, sont devenus experts dans l'art d'infiltrer la société et sont d'excellents espions et maîtres des rituels. Avant de se tourner vers les Ténèbres, les amish mutants de la Maison Kinisger étaient l'équivalent de cafards - prêts à tout pour simplement rester en vie parmi les hommes qui cherchaient leur perte. Ils utilisaient leur sorcellerie de la chair pour se cacher à la vue de tous, pour vivre parmi l'ennemi. Maintenant, ils se sont éveillés à leur véritable objectif : semer le chaos et le doute, chercher toujours à renverser toute grande menace de l'intérieur.", attributes = {{Color(0, 225, 0), "(+) Sans-visage : Rituels uniques pour modifier l'apparence ou se camoufler"}, {Color(0, 225, 0), "(+) Assassin : Inflige 25% de dégâts supplémentaires avec les dagues"}, {Color(0, 225, 0), "(+) Immunisé aux tests sanguins (sauf faux positifs)"}, {Color(0, 225, 0), "(+) Insaisissable : Augmente la vitesse des sauts en enfer"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"}, {Color(225, 0, 0), "(-) Sang mutant : Commence avec -3 Points de Trait"}}}
	};
	--FACTION.singleGender = GENDER_MALE;
	
	--[[if game.GetMap() == "rp_district21" then
		FACTION.models = {
			["male"] = {
				clothes = "models/begotten/wanderers/northwanderer_male.mdl",
				heads = DEFAULT_MODELS.male.heads,
			},
			["female"] = {
				clothes = "models/begotten/wanderers/northwanderer_female.mdl",
				heads = DEFAULT_MODELS.female.heads,
			},
		}
	end]]--
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if player:GetFaith() ~= "Faith of the Dark" then
			return false;
		end
		
		--[[if (!Clockwork.player:IsWhitelisted(player, "Children of Satan")) then
			Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
		end;]]--
	end;
	
	function FACTION:CanPromote(player, target, faction, subfaction)
		if !player:IsAdmin() then
			-- Aspirants can't be manually promoted, they must use their ritual.
			if target:GetCharacterData("rank") == 10 then
				return false;
			end
		end
	end
	
	function FACTION:GetPlayerCount()
		local numPlayers = 0;

		for _, v in _player.Iterator() do
			if (v:HasInitialized()) then
				if (v:GetFaction() == "Children of Satan") then
					if v:GetCharacterData("rank") == 10 then
						numPlayers = numPlayers + 0.5; -- Aspirants only count for 0.5.
					else
						numPlayers = numPlayers + 1;
					end
				end
			end
		end
		
		return numPlayers;
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Children of Satan"] = {
		[1] = "",
		[2] = "Dark Justicar",
		[3] = "Hierophant",
		[4] = "Sultan",
		[5] = "Black Finger",
		[6] = "Immortal",
		[7] = "Dreadlord",
		[8] = "Hell Baron",
		[9] = "Caretaker",
		[10] = "Aspirant",
	};
	
	Schema.RankTiers["Children of Satan"] = {
		[1] = {"", "Aspirant"},
		[2] = {"Dark Justicar", "Hierophant", "Sultan", "Black Finger", "Immortal"},
		[3] = {"Dreadlord"},
		[4] = {"Caretaker"},
		[5] = {"Hell Baron"},
	};
	
	Schema.RanksToBuffs["Children of Satan"] = {
		["Hell Baron"] = {health = 50, stamina = 50},
	};
	
	Schema.RanksToSubfaction["Children of Satan"] = {
		["Dark Justicar"] = "Philimaxio",
		["Hierophant"] = "Rekh-khet-sa",
		["Sultan"] = "Varazdat",
		["Black Finger"] = "Kinisger",
	};
FACTION_SATANIST = FACTION:Register();

----------------------
----------------------
--- Event Factions ---
----------------------
----------------------

-- For Begotten II Map Change Event.
local FACTION = Clockwork.faction:New("Pope Adyssa's Gatekeepers");
	FACTION.hidden = true;
	FACTION.disabled = true; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers_adyssa";
	FACTION.color = Color(20, 20, 20);
	FACTION.description = "Les Gardiens sont la première ligne de défense contre les innombrables horreurs impies qui menacent la Glaze. \nLeurs rangs grossissent de roturiers assoiffés de pouvoir enrôlés de force et de flagellants fanatiques. \nIls doivent servir la Sainte Hiérarchie avec diligence et sans poser de questions, aussi scandaleuses que puissent être leurs demandes. \nMal entraînés et mal équipés, ces soldats sont censés donner leur vie pour protéger la Lumière. \nEt ainsi ils le feront.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.enlist = true;
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.3326; -- 0.3326 slots per player (9.9 at 30 players).
	--FACTION.imposters = true;
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end
	
	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	if !Schema.RanksToCoin then
		Schema.RanksToCoin = {};
	end
	
	Schema.Ranks["Pope Adyssa's Gatekeepers"] = {
		[1] = "DISCIPLE",
		[2] = "ACOLYTE",
		[3] = "EMISSARY",
		[4] = "HIGH-EMISSARY",
		[5] = "MASTER-AT-ARMS",
	};
	
	Schema.RankTiers["Pope Adyssa's Gatekeepers"] = {
		[1] = {"DISCIPLE"},
		[2] = {"ACOLYTE"},
		[3] = {"EMISSARY"},
		[4] = {"HIGH-EMISSARY"},
		[5] = {"MASTER-AT-ARMS"},
	};
	
	Schema.RanksToBuffs["Pope Adyssa's Gatekeepers"] = {
		["MASTER-AT-ARMS"] = {health = 50, stamina = 50},
	};

	Schema.RanksToCoin["Pope Adyssa's Gatekeepers"] = {
		[1] = 25,
		[2] = 35,
		[3] = 50,
		[4] = 100,
		[5] = 200, 
	};
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy") then
			if player:GetSubfaction() ~= "Kinisger" then
				return false;
			end
		end;
		
		-- It is the IC responsibility of Gatekeepers to bloodtest recruits.
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		if (!Clockwork.player:IsWhitelisted(player, "Pope Adyssa's Gatekeepers")) then
			Clockwork.player:SetWhitelisted(player, "Pope Adyssa's Gatekeepers", true);
		end;
	end;
	
	if SERVER then
		function FACTION:CanPromote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
	end
	
	-- Called when a player's name should be assigned for the faction.
	function FACTION:GetNameCharCreation(name, rank, rankOverride)
		if !rank then
			return "GATEKEEPER-DISCIPLE."..name;
		end

		if rankOverride then
			return "GATEKEEPER-"..rankOverride.."."..name;
		end

		return "GATEKEEPER-"..Schema.Ranks["Pope Adyssa's Gatekeepers"][rank or 1].."."..name;
	end;
	
	-- Called when a player's name should be assigned for the faction.
	function FACTION:GetName(player, bNew)
		if bNew or !player:GetCharacterData("rank") then
			return Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5);
		end
	
		local name = player:Name();
		local rankOverride = player:GetCharacterData("rankOverride");
		
		if !tonumber(name) then
			Clockwork.player:SetName(player, Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5));
			name = player:Name();
		end

		if rankOverride then
			return "GATEKEEPER-"..rankOverride.."."..name;
		end
		
		local rank = math.Clamp(player:GetCharacterData("rank", 1), 1, #Schema.Ranks["Pope Adyssa's Gatekeepers"]);

		if (rank and isnumber(rank) and Schema.Ranks["Pope Adyssa's Gatekeepers"][rank]) then
			return "GATEKEEPER-"..Schema.Ranks["Pope Adyssa's Gatekeepers"][rank].."."..name;
		end;
	end;
FACTION_GATEKEEPER_ADYSSA = FACTION:Register();

-- For Scraptown Map Change Change Event.
local FACTION = Clockwork.faction:New("The Third Inquisition");
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.disabled = true; -- For events.
	FACTION.hidden = true;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers_adyssa";
	FACTION.color = Color(225, 175, 0);
	FACTION.description = "Des cendres de la Cité de Lumière surgit une troisième Inquisition, loyale à la mémoire du Pape Adyssa. \nLeur objectif est de détrôner le faux pape Aratakrast et de mettre fin à la décadence de sa cour. \nIls cherchent à civiliser les Districts du Comté par la poudre et l'acier sacrés, et ainsi continuent le combat. \nPourtant, il est peu probable que cette insurrection junior réussisse face au rugissement infernal de la barbarie et de l'apocalypse.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.names = "glazic";
	FACTION.imposters = true;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy" and faction.name != "Gatekeeper") then
			return false;
		end;
		
		if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end
		
		if (!Clockwork.player:IsWhitelisted(player, "The Third Inquisition")) then
			Clockwork.player:SetWhitelisted(player, "The Third Inquisition", true);
		end;
	end;
FACTION_THIRD_INQUISITION = FACTION:Register();

local FACTION = Clockwork.faction:New("Smog City Pirate");
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.disabled = true; -- For events.
	FACTION.hidden = true;
	FACTION.material = "begotten/faction/faction_logo_scrappers";
	FACTION.color = Color(92, 64, 51);
	FACTION.description = "Les redoutables habitants de Smog City, un lieu de machines et de misère. \nJurant de construire un Dieu Mécanique, les esclavagistes pirates commandent une main-d'œuvre jetable d'Errants pour édifier ce terrible titan. \nLes origines divisées et les conflits de foi provoquent des luttes intestines au sein des rangs des Pirates. \nCe n'est que sous le poing de fer de leur Roi que les gangs sont remis au pas.";
	FACTION.availablefaiths = {"Faith of the Light", "Faith of the Family", "Faith of the Dark"};
	FACTION.subfactions = {
		{name = "Machinists", subtitle = "Ferrailleurs Brutaux et Esclavagistes", description = "On dit que la puanteur fétide des machinists ferrailleurs, celle de la chair en décomposition et de la poudre à canon, peut être sentie à des kilomètres à la ronde. Les Ferrailleurs s'alignent avec les plus puissants et utilisent la foi comme un moyen de devenir plus forts que leurs pairs. Ce sont des charognards, des esclavagistes, et par-dessus tout, des cafards humains.", attributes = {{Color(0, 225, 0), "(+) Sauvages endurcis : +30 de santé maximum"}, {Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8"}, {Color(225, 0, 0), "(-) L'arbre de sous-foi Voltiste est verrouillé et ne peut pas être progressé !"}}},
		{name = "Voltists", subtitle = "Fanatiques Technologiques & Transhumanistes", description = "Les Électrozombifiés des Pirates de Smog City se croient au-dessus de la lutte à laquelle leurs frères ont succombé. Ils s'occupent des caprices du Programme - un dispositif technologique au-delà de la compréhension humaine - et cherchent à combiner son intelligence avec le Dieu Mécanique quand il sera construit.", attributes = {{Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 11, avec 'Voltisme' déverrouillé"}}},
	};
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.names = "glazic";
	FACTION.imposters = true;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name ~= "Wanderer") then
			return false;
		end;
		
		if (!Clockwork.player:IsWhitelisted(player, "Smog City Pirate")) then
			Clockwork.player:SetWhitelisted(player, "Smog City Pirate", true);
		end;
	end;
FACTION_SMOG_CITY_PIRATES = FACTION:Register();

local FACTION = Clockwork.faction:New("Hillkeeper");
	local goreglazeModels = {
		male = {
			clothes = "models/begotten/wanderers/northwanderer_male.mdl",
			heads = {
				"male_02",
				"male_04",
				"male_06",
				"male_07",
				"male_08",
				"male_09",
				"male_11",
				"male_12",
				"male_16",
				"male_22",
				"male_56"
			},
		},
		female = {
			clothes = "models/begotten/wanderers/northwanderer_female.mdl",
			heads = {
				"female_01",
				"female_02",
			}
		}
	};
	
	if game.GetMap() == "rp_district21" then
		FACTION.disabled = false;
	else
		FACTION.disabled = true;
		FACTION.hidden = true;
	end

	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_hillkeepers";
	FACTION.color = Color(103, 142, 180);
	FACTION.description = "Les Goreic-Glazemen de la Colline sont un peuple simple et robuste. Pendant des générations, ils ont levé leurs lames, leurs battes et leurs crocs contre l'obscurité. \nIls ne se battent pas pour l'argent, mais pour la survie et la famille. Tous doivent s'unir pour survivre dans le froid désolé. \nL'hérésie païenne se propage à nouveau dans les rangs, mais beaucoup restent fidèles et loyaux à la Lumière, quel qu'en soit le prix. \nMaintenant, ils doivent tenir bon face aux ténèbres qui approchent, alors même que la longue nuit se rapproche. La Colline ne doit pas tomber. \nLa gloire attend les audacieux et les courageux.";	
	FACTION.availablefaiths = {"Faith of the Light"};	
	FACTION.alliedfactions = {"Holy Hierarchy", "Gatekeeper"};
	FACTION.masterfactions = {"Holy Hierarchy"};
	FACTION.enlist = true;
	FACTION.promoteAcrossSubfactions = true;
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.3; -- 0.3 slots per player (9 at 30 players).
	--FACTION.imposters = true; -- Kinisgers should get enlisted through /enlist on Wanderer disguises.
	FACTION.names = "gore-glazic";
	FACTION.subfactions = {
		{
			name = "Watchman",
			subtitle = "Gardiens - Miliciens de la Colline",
			description = "À travers une grande partie de la Hiérarchie, chacun des Districts a constaté qu'il avait besoin de protection. Cela a conduit à l'introduction des Ordres Inférieurs, les Gardiens, pour tenir leurs portes et défendre leurs colonies défaillantes. Dans le nord rude et froid, où deux hommes pouvaient vivre dans la même région sans jamais se rencontrer, les rares colonies de district qui existaient dans le froid n'avaient pas besoin de force armée permanente organisée. Mais quand les Gores arrivaient, ou que des thralls menaçaient leurs familles, ils organisaient des fyrd et des levées, des milices nées de la nécessité. La Colline de Lumière attend de tout homme valide qu'il serve dans la Garde de la Ville pendant au moins quelques années, ce qui en a fait l'équivalent de l'Ordre Inférieur pour la Colline ; une bande de conscrits et de paysans. Ces hommes se sont battus pendant des générations pour de multiples raisons, toujours prêts à prendre les armes pour défendre leur foyer.",
			attributes = {
				{Color(0, 225, 0), "(+) Ascendance martiale : Commence avec +10 d'endurance maximum"},
				{Color(0, 225, 0), "(+) Sang des Gore : Commence avec +30 de santé maximum"},
				{Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 6"},
				{Color(0, 225, 0), "(+) Vigoureux : +100% de gain de foi en infligeant des dégâts"},
				{Color(0, 225, 0), "(+) Voix du Nord : Peut crier de guerre"},
				{Color(225, 0, 0), "(-) Pieux : Restreint à la sous-foi 'Hard-Glaze'"},
				{Color(225, 0, 0), "(-) Accablé : La vitesse de course est réduite de 5%"}
			},
			models = goreglazeModels
		},
		{
			name = "Servus",
			subtitle = "Serviteurs - Chauffeurs et Médecins",
			description = "Il y en a peu dans les districts du nord qui peuvent prétendre posséder des compétences précieuses au-delà de la chasse ou du combat, et les rares qui savent lire, soigner les blessures ou alimenter les puissantes forges sont rapidement pris sous l'aile du Ministère. Les servus sont ceux qui servent la Garde de la Colline par l'autorité du Cardinal, les quelques hommes instruits de la colonie qui savent recoudre des membres ensanglantés ou forger des armes de qualité. Pour leur savoir, on n'attend pas d'eux qu'ils ensanglantent leurs lames. Cependant, dans le vide rude du nord, il y aura toujours une raison de se battre aux côtés de ses frères.",
			attributes = {
				{Color(0, 225, 0), "(+) Quelques instruits : +25% de gain de foi"},
				{Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 12"},
				{Color(0, 225, 0), "(+) Voix du Nord : Peut crier de guerre"},
				{Color(0, 225, 0), "(+) Puissance du chauffeur : Commence avec +25 santé et +5 endurance"},
				{Color(0, 225, 0), "(+) +5kg de capacité de charge supplémentaire"},
				{Color(225, 0, 0), "(-) Le palier IV de l'arbre de croyance Prowess est verrouillé"},
				{Color(225, 0, 0), "(-) La sous-foi 'Voltisme' est verrouillée"}
			},
			models = goreglazeModels
		},
		{
			name = "Outrider",
			startingRank = 10,
			whitelist = true,
			subtitle = "Cochers - Éclaireurs et Voleurs",
			description = "Gaspiller une vie dans le nord, c'est gaspiller une paire de mains qui pourrait être utilisée pour de meilleures choses. À cette fin, les Outriders ont un double objectif : ils donnent aux criminels une chance de retrouver leur honneur et de servir la Lumière avant leur mort, et permettent aux misérables de la société de subvenir aux besoins de la communauté tout en expiant leurs péchés. Pour leurs infractions à la loi, ils sont envoyés dans les étendues sauvages hors de la sécurité des murs, pour explorer et récupérer des ressources pour le Ministère. Bien que tous les Outriders ne soient pas des criminels, la grande majorité d'entre eux le sont ; une vie de labeur vaut mieux qu'une vie terminée.",
			attributes = {
				{Color(0, 225, 0), "(+) Seconde chance : -25% de drain d'endurance et +5% de vitesse de sprint"},
				{Color(0, 225, 0), "(+) Voix du Nord : Peut crier de guerre"},
				{Color(0, 225, 0), "(+) Commence au Niveau de Sacrement 8"},
				{Color(225, 0, 0), "(-) Les sous-fois 'Orthodoxie Solaire' et 'Voltisme' sont verrouillées"}
			},
			models = goreglazeModels
		},
	}
	FACTION.residualXPZones = { -- Zones that boost residual XP gain for this faction.
		["rp_begotten3"] = {
			{pos1 = Vector(1390, 10153, -938), pos2 = Vector(-2370, 11254, -1690), modifier = 0.5, nightModifier = 0.25}, -- Gate
			{pos1 = Vector(10061, 10379, -1211), pos2 = Vector(9385, 11870, -670), modifier = 0.33, nightModifier = 0.2}, -- Gorewatch
			{pos1 = Vector(3458, 12655, -814), pos2 = Vector(3335, 12769, -685), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(2742, 10244, -1194), pos2 = Vector(2913, 10071, -1074), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(-1963, 10678, -1055), pos2 = Vector(-2144, 10886, -1194), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
			{pos1 = Vector(-3468, 12985, -375), pos2 = Vector(-3591, 13103, -241), modifier = 0.5, nightModifier = 0.25}, -- Watchtower
		},
		["rp_district21"] = {
			{pos1 = Vector(-4765, 9246, 838), pos2 = Vector(-8075, 10488, 489), modifier = 0.5, nightModifier = 0.25}, -- Hill
			{pos1 = Vector(-10637, 13043, 465), pos2 = Vector(-4664, 9210, 879), modifier = 0.5, nightModifier = 0.25}, -- Hill
			{pos1 = Vector(-9328, -8640, -146), pos2 = Vector(-8771, -8105, 686), modifier = 0.33, nightModifier = 0.2}, -- Gorewatch
		},
	};
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy" and faction.name != "Gatekeeper") then
			if player:GetSubfaction() ~= "Kinisger" then
				return false;
			end
		end;
		
		-- It is the IC responsibility of Gatekeepers to bloodtest recruits.
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		if (!Clockwork.player:IsWhitelisted(player, "Hillkeeper")) then
			Clockwork.player:SetWhitelisted(player, "Hillkeeper", true);
		end;
	end;
	
	if SERVER then
		function FACTION:CanPromote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if !player:IsAdmin() then
				local playerFaction = player:GetNetVar("kinisgerOverrideFaction") or player:GetFaction();
				
				if playerFaction == "Holy Hierarchy" then
					local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
					
					if playerSubfaction ~= "Ministry" then
						return false;
					end
				end
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToBuffs then
		Schema.RanksToBuffs = {};
	end
	
	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	if !Schema.RanksToCoin then
		Schema.RanksToCoin = {};
	end
	
	Schema.Ranks["Hillkeeper"] = {
        [1] = "Novice",
        [2] = "Yeoman",
        [3] = "Stoker",
        [4] = "Magnate",
        [5] = "Barber",
        [6] = "Surgeon",
        [7] = "Emissary",
        [8] = "High Emissary",
        [9] = "Master-At-Arms",
        [10] = "Footpad",
        [11] = "Highwayman",
        [12] = "Signifer",
		[13] = "Ealdorman",
		[14] = "Squire",
    };
	
	Schema.RankTiers["Hillkeeper"] = {
		[1] = {"Novice", "Footpad"},
		[2] = {"Yeoman", "Stoker", "Barber", "Highwayman", "Ealdorman"},
		[3] = {"Emissary", "Magnate", "Surgeon", "Signifer", "Squire"},
		[4] = {"High Emissary"},
		[5] = {"Master-At-Arms"},
	};
	
	Schema.RanksToBuffs["Hillkeeper"] = {
		["Master-At-Arms"] = {health = 50, stamina = 50},
	};
	
	Schema.RanksToSubfaction["Hillkeeper"] = {
		["Footpad"] = "Outrider",
		["Highwayman"] = "Outrider",
	};
	
	Schema.RanksToCoin["Hillkeeper"] = {
		[1] = 25,
		[2] = 35,
		[3] = 35,
		[4] = 50,
		[5] = 35,
		[6] = 50,
		[7] = 50,
		[8] = 100,
		[9] = 200,
		[10] = 35,
		[11] = 50,
		[12] = 50,
		[13] = 50,
	};

FACTION_HILLKEEPER = FACTION:Register();