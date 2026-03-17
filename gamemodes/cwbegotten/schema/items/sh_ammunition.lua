local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Grapeshot";
	ITEM.model = "models/kali/weapons/metro 2033/magazines/12 gauge shotgun shell.mdl";
	ITEM.weight = 0.25;
	ITEM.stackable = true;
	ITEM.description = "Une unique cartouche de mitraille.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/grapeshot.png"
	
	ITEM.ammoType = "Grapeshot";
	ITEM.ammoName = "Grapeshot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 1150, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Old World Grapeshot";
	ITEM.model = "models/kali/weapons/metro 2033/magazines/12 gauge shotgun shell.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Un obus Grapeshot antique, antérieur même à l'Empire de la Lumière.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/grapeshot.png"
	
	ITEM.ammoType = "Old World Grapeshot";
	ITEM.ammoName = "Old World Grapeshot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 500, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Pop-a-Shot";
	ITEM.model = "models/bullets/w_pbullet1.mdl";
	ITEM.weight = 0.1;
	ITEM.stackable = true;
	ITEM.description = "Une cartouche unique de poudre noire et de petites billes rouillées servant de projectile.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pop-a-shot.png"
	
	ITEM.ammoType = "Pop-a-Shot";
	ITEM.ammoName = "Pop-a-Shot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 100, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Longshot";
	ITEM.model = "models/shells/shell_338mag.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Une unique balle rouillée pouvant être chargée dans un mousquet. Elle a du coffre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/longshot.png"
	
	ITEM.ammoType = "Longshot";
	ITEM.ammoName = "Longshot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 1000, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Old World Magazine";
	ITEM.model = "models/uzi megazine 20.mdl";
	ITEM.weight = 0.8;
	ITEM.description = "Un chargeur contenant des munitions d'un temps révolu, une trouvaille vraiment rare !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scavenger_gun_magazine.png"
	
	ITEM.ammoType = "Old World Magazine";
	ITEM.ammoName = "Old World Shot";
	ITEM.ammoMagazineSize = 7;
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 800, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Old World Large Magazine";
	ITEM.model = "models/uzi megazine 32.mdl";
	ITEM.weight = 1.2;
	ITEM.description = "Un grand chargeur contenant des munitions d'un lointain passé, une trouvaille vraiment rare !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scavenger_gun_large_magazine.png"
	
	ITEM.ammoType = "Old World Large Magazine";
	ITEM.ammoName = "Old World Shot";
	ITEM.ammoMagazineSize = 30;
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 2000, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Old World Longshot";
	ITEM.model = "models/kali/weapons/metro 2033/magazines/12_7mm round.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Une cartouche unique de fabrication ancienne, elle surpasse assurément tout ce qui est déployé en ces temps obscurs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/old_world_longshot.png"
	
	ITEM.ammoType = "Old World Longshot";
	ITEM.ammoName = "Old World Longshot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 500, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Old World Shot";
	ITEM.model = "models/bullets/w_pbullet1.mdl";
	ITEM.weight = 0.1;
	ITEM.stackable = true;
	ITEM.description = "Une cartouche unique d'une fabrication ancienne, elle surpasse assurément tout ce qui est déployé en ces temps obscurs.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pop-a-shot.png"
	
	ITEM.ammoType = "Old World Shot";
	ITEM.ammoName = "Old World Shot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Firearms", rarity = 250, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Scavenger Gun Magazine";
	ITEM.model = "models/uzi megazine 20.mdl";
	ITEM.weight = 0.8;
	ITEM.description = "Un chargeur pouvant contenir 15 cartouches de calibre Scrapshot, destiné à l'omniprésent Fusil de Récupération.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scavenger_gun_magazine.png"
	
	ITEM.ammoType = "Scavenger Gun Magazine";
	ITEM.ammoName = "Scrapshot";
	ITEM.ammoMagazineSize = 15;
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}};
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 1500, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Scavenger Gun Large Magazine";
	ITEM.model = "models/uzi megazine 32.mdl";
	ITEM.weight = 1.2;
	ITEM.description = "Un chargeur allongé pouvant contenir 25 cartouches de calibre Scrapshot, destiné à l'usage du Fusil de Récupérateur omniprésent.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scavenger_gun_large_magazine.png"
	
	ITEM.ammoType = "Scavenger Gun Large Magazine";
	ITEM.ammoName = "Scrapshot";
	ITEM.ammoMagazineSize = 25;
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "scrap"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Scrapshot";
	ITEM.model = "models/bullets/w_pbullet1.mdl";
	ITEM.weight = 0.1;
	ITEM.stackable = true;
	ITEM.description = "Une toute petite cartouche fabriquée à partir de ferraille et de poudre noire.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pop-a-shot.png"
	
	ITEM.ammoType = "Scrapshot";
	ITEM.ammoName = "Scrapshot";
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 85, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Volt Projectile";
	ITEM.model = "models/items/librounds.mdl";
	ITEM.weight = 0.25;
	ITEM.stackable = true;
	ITEM.description = "Un projectile imposant et dense, propulsé par les canons électromagnétiques Voltist.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/volt_projectile.png"
	
	ITEM.ammoType = "Volt Projectile";
	ITEM.ammoName = "Volt Projectile";
	ITEM.requiredReloadBelief = "powder_and_steel";
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Iron Bolt";
	ITEM.model = "models/begotten/items/bolt.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Un carreau d'arbalète en bois à pointe de fer, d'excellente qualité aérodynamique. Il peut percer presque toutes les armures.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_bolt.png"
	
	ITEM.ammoType = "Iron Bolt";
	ITEM.ammoName = "Iron Bolt";
	ITEM.requiredReloadBelief = "strength";
	
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Iron Bolt (Incendiary)";
	ITEM.model = "models/begotten/items/bolt.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Un carreau d'arbalète en bois à pointe de fer, d'excellente qualité aérodynamique. Il a été enduit d'une huile qui s'enflamme au tir, sacrifiant le potentiel de perforation d'armure pour enflammer les cibles à l'impact.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/iron_bolt_incendiary.png"
	ITEM.uniqueID = "iron_bolt_incendiary";
	
	ITEM.ammoType = "Iron Bolt (Incendiary)";
	ITEM.ammoName = "Iron Bolt (Incendiary)";
	ITEM.requiredReloadBelief = "strength";
	
	ITEM.attributes = {"fire"};
	ITEM.components = {breakdownType = "breakdown", items = {"wood"}};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Scrap Bolt";
	ITEM.model = "models/begotten/items/rebar.mdl";
	ITEM.weight = 0.2;
	ITEM.stackable = true;
	ITEM.description = "Une flèche d'arbalète grossièrement façonnée à partir de fers à béton de récupération trouvés dans le Désert.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scrap_bolt.png"
	
	ITEM.ammoType = "Scrap Bolt";
	ITEM.ammoName = "Scrap Bolt";
	ITEM.requiredReloadBelief = "strength";
	
	ITEM.components = {breakdownType = "meltdown", items = {"scrap"}};
	ITEM.itemSpawnerInfo = {category = "Shot", rarity = 300, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("shot_base");
	ITEM.name = "Shagalax Bullet Box Magazine";
	ITEM.model = "models/begotten/items/shagalaxlmgammobox.mdl";
	ITEM.weight = 1.5;
	ITEM.description = "De la ferraille martelée formée en boîte pour les ceintures Scrapshot. Souvent accumulée par les chefs Récupérateurs pour des assauts terrifiants ou des défenses oppressives.";
	ITEM.iconoverride = "begotten/ui/itemicons/shagalaxlmgammobox.png"
	
	ITEM.ammoType = "Shagalax Bullet Box Magazine";
	ITEM.ammoName = "Scrapshot";
	ITEM.ammoMagazineSize = 100;
	ITEM.requiredReloadBelief = "powder_and_steel";
	
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks", "iron_chunks", "scrap", "scrap", "scrap"}};
ITEM:Register();