--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local ITEM = Clockwork.item:New();
	ITEM.name = "Purifying Stone";
	ITEM.model = "models/srp/items/art_flash.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/purifying_stone.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre hautement luminescente dotée de diverses propriétés purificatrices.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};

	-- Called when a player drops the item.
	function ITEM:OnUse(player, position)
		if (player:Alive() and !player:IsRagdolled()) then
			netstream.Start(player, "Stunned", 7);
			netstream.Start(player, "PlaySound", "begotten/ui/sanity_gain.mp3");
			
			if cwSanity then
				player:HandleSanity(20);
			end
			
			player:HandleNeed("corruption", -30);
			Clockwork.chatBox:Add(player, nil, "itnofake", "Tu écrases la pierre purificatrice dans ta main et ressens immédiatement la corruption quitter ton corps.");
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas effectuer cette action pour le moment.")
		end
	end;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Up Catalyst";
	ITEM.model = "models/srp/items/spezzy/art_poonlight.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/up_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une grande pierre luminescente. Des glyphes à peine visibles semblent y être gravés.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 75};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Tortured Spirit";
	ITEM.model = "models/srp/items/art_zoonlight.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/tortured_spirit.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une sphère de verre d'où s'échappent des vapeurs brûlantes qui s'agitent à l'intérieur. Parfois, les fumées prennent l'apparence d'un visage hurlant.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 400, supercrateOnly = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Belphegor Catalyst";
	ITEM.model = "models/srp/items/art_fireball.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/belphegor_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Un morceau arrondi de roche volcanique, tiède au contact. On peut y voir du magma palpitant, formant des sceaux sataniques.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 100};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Xolotl Catalyst";
	ITEM.model = "models/srp/items/art_battery.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/xolotl_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Un gros morceau de roche enroulée. Elle semble chargée électriquement.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 400, supercrateOnly = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Down Catalyst";
	ITEM.model = "models/srp/items/art_crystalthorn.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/down_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre arrondie, criblée de cratères. De gros boulons luminescents en émergent sous différents angles, tous portant des glyphes à peine visibles à l'intérieur.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 75};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Elysian Catalyst";
	ITEM.model = "models/srp/items/art_sparkler.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/elysian_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Un petit morceau de roche enroulé. Il semble chargé électriquement.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 75, bNoSupercrate = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Familial Catalyst";
	ITEM.model = "models/srp/items/art_bubble.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/familial_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une roche sédimentaire crayeuse aux teintes vert-rouge saisissantes. Des glyphes nordiques y ont été gravés.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 100};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Ice Catalyst";
	ITEM.model = "models/srp/items/spezzy/art_vrchen.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ice_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une sphère glacée entourée de petits glaçons.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 150};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Light Catalyst";
	ITEM.model = "models/srp/items/art_gravi.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/light_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre déformée aux reflets dorés. Elle est gravée de glyphes de Lumière.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 100};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Pantheistic Catalyst";
	ITEM.model = "models/srp/items/art_kolobok.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pantheistic_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Un orbe cireux et rond, un cristal énergisé formant un sceau du Nord.";
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 100};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Pentagram Catalyst";
	ITEM.model = "models/srp/items/art_crystal.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/pentagram_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une formation de cristal rouge incandescent, ornée de nombreux sceaux sataniques gravés à l'intérieur.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 400, supercrateOnly = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Holy Spirit";
	ITEM.model = "models/srp/items/art_moonlight.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/holy_spirit.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Un orbe de verre où tourbillonnent des fumées incandescentes. Parfois, ces fumées dessinent le visage d'un homme majestueux.";
	ITEM.stackable = true;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 400, supercrateOnly = true};
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
		
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Trinity Catalyst";
	ITEM.model = "models/srp/items/art_jellyfish.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/trinity_catalyst.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre déformée aux reflets dorés, avec un large centre creux entouré de fins filaments. Elle est gravée de glyphes de Lumière.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
	
	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 95, bNoSupercrate = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Judgemental Sigil Stone";
	ITEM.model = "models/srp/items/spezzy/art_ftoneflower.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_ftoneflower.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire qui, tenue en main, vous fait ressentir de la culpabilité pour le simple fait d'être en vie.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Fire Sigil Stone";
	ITEM.model = "models/srp/items/art_stoneblood.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_stoneblood.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire qui brûle furieusement dans votre main.";
	ITEM.stackable = true;	
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Ice Sigil Stone";
	ITEM.model = "models/srp/items/spezzy/art_moldfish.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_moldfish.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire qui draine l'air d'un froid insupportable.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Glazic Sigil Stone";
	ITEM.model = "models/srp/items/art_mammasbeads.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_mammasbeads.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire qui éblouit les spectateurs d'un puissant sentiment d'envie et d'admiration.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 700, supercrateOnly = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Unholy Sigil Stone";
	ITEM.model = "models/srp/items/art_slug.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_slug.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire qui inspire une répulsion totale à quiconque possède la moindre notion de pureté.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};
	
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Vengeful Sigil Stone";
	ITEM.model = "models/srp/items/art_firefly.mdl";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/art_firefly.png";
	ITEM.weight = 0.1;
	ITEM.category = "Catalysts";
	ITEM.description = "Une pierre sigillaire forgée à partir d'aspects de la vengeance.";
	ITEM.stackable = true;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	ITEM.itemSpawnerInfo = {category = "Rituals", rarity = 600, supercrateOnly = true};
	
ITEM:Register();