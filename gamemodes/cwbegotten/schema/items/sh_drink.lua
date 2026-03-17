local ITEM = Clockwork.item:New();
	ITEM.name = "Carton of Milk";
	ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Get Milk";
	ITEM.category = "Drinks";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Un putain de carton de lait dégueulasse, complètement foutu par le temps. Ça pue à gerber et ça donne envie de se foutre en l'air.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/milk.png"
	ITEM.stackable = true;
	ITEM.infectchance = 75;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 300, bNoSupercrate = true};
	ITEM.needs = {hunger = 4, thirst = 12};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)		
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu te sens vraiment dégoûté d'avoir bu quelque chose d'aussi infect. En conséquence, tu commences à te sentir émotionnellement et mentalement instable.");
			player:HandleSanity(-25);
		end
		
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New("alcohol_base");
	ITEM.name = "Willtan's Brew";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.35;
	ITEM.skin = 1;
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille en verre remplie d'un liquide éventé et mousseux. On peut y lire 'Willtan's Brew'.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;
	ITEM.expireTime = 120;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 600, bNoSupercrate = true};
	ITEM.needs = {thirst = 8};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "olivedrab", "Cette boisson n'a aucun goût, mais elle te fait te sentir très bien.");
		Clockwork.player:SetDrunk(player, self.expireTime)
		player:HandleSanity(5);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;
ITEM:Register();

local ITEM = Clockwork.item:New("alcohol_base");
	ITEM.name = "Old Beer";
	ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl";
	ITEM.weight = 0.5;
	ITEM.description = "Une bouteille marron contenant une bière très vieille et éventée. Toujours buvable, cela dit.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/beer.png"
	ITEM.infectchance = 5;
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;
	ITEM.expireTime = 120;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 600, bNoSupercrate = true};
	ITEM.needs = {thirst = 10};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "olivedrab", "Cette boisson a un goût de merde, mais elle te fait quand même du bien ! C'est bizarre !");
		Clockwork.player:SetDrunk(player, self.expireTime)
		player:HandleSanity(10);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;
ITEM:Register();

local ITEM = Clockwork.item:New("alcohol_base");
	ITEM.name = "Corpsebrew";
	ITEM.model = "models/kali/miscstuff/stalker/food/cossacks vodka.mdl";
	ITEM.weight = 0.35;
	ITEM.useText = "Chug";
	ITEM.description = "Une bouteille polie et inoffensive contenant un liquide transparent. Elle dégage une odeur très forte.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/corpsebrew.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;
	ITEM.cauldronPoison = true;
	ITEM.expireTime = 30;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 675, bNoSupercrate = true};
	ITEM.needs = {thirst = 35};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "À ta grande surprise (ou déception), le contenu de cette bière-cadavre était en fait délicieux ! De plus, tu sens des pièces supplémentaires dans tes poches ! Tu es vraiment béni des Dieux !");
			player:HandleSanity(15);
			Clockwork.player:GiveCash(player, math.random(10, 50), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "maroon", "Dans un accès de rage suicidaire, tu décides d'engloutir la bière de cadavre. Tu t'arrêtes à mi-chemin, sentant tes entrailles fondre et ta gorge s'embraser.");
			player:ScriptedDeath("Chugged some Corpsebrew and became a corpse.");
		end
		
		Clockwork.player:SetDrunk(player, self.expireTime)
	end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Dirty Water";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille poussiéreuse partiellement remplie d'eau trouble.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bottle_1.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "dirtywater"
	ITEM.infectchance = 60;
	ITEM.cauldronQuality = -2;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 675, bNoSupercrate = true};
	ITEM.needs = {thirst = 15};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)	
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:GiveItem(Clockwork.item:CreateInstance("empty_bottle"), true);
	
		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu ouvres la bouteille et verses de l'eau dans ton réceptacle, mais cela commence à court-circuiter ton intérieur !");
			Schema:DoTesla(player, true);			
			return;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu commences à te sentir étourdi et nauséeux. Tu as l'impression que tu vas vomir.");
			player:HandleSanity(-25);
		end
		
		--player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New("alcohol_base");
	ITEM.name = "Finechug";
	ITEM.model = "models/kali/miscstuff/stalker/food/cossacks vodka.mdl";
	ITEM.weight = 0.35;
	ITEM.description = "Une bouteille couleur argent, semblant remarquablement bien conservée. Elle contient un vin blanc alléchant.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/corpsebrew.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;
	ITEM.expireTime = 240;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1250};
	ITEM.needs = {hunger = 3, thirst = 35};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Cette boisson a bon goût ! Tu te sens vraiment bien aussi !");
		Clockwork.player:SetDrunk(player, self.expireTime)
		player:HandleSanity(20);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Soda";
	ITEM.model = "models/kali/miscstuff/stalker/food/energy drink.mdl";
	ITEM.weight = 0.35;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une canette de soda de marque générique des districts ruraux. Il serait imprudent de la consommer à proximité de Papa Pete.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/soda.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 0;

	ITEM.infectchance = 10;
	ITEM.dysentery = 5;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 600, bNoSupercrate = true};
	ITEM.needs = {thirst = 12, sleep = 8};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "lawngreen", "Quand tu ouvres la canette, elle pétille encore. Le goût est très sucré comparé à tout ce que tu as bu auparavant. Tu te sens aussi plus énergique.");
		player:HandleSanity(2);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Purified Water";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Est-ce possible ? Une bouteille d'eau fraîche ! Les miracles existent donc, à ce qu'il paraît.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1000};
	ITEM.needs = {thirst = 30};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:GiveItem(Clockwork.item:CreateInstance("empty_bottle"), true);
	
		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu ouvres la bouteille et verses de l'eau dans ton réceptacle, mais cela commence à court-circuiter tes circuits internes !");
			Schema:DoTesla(player, true);
			--player:TakeDamage(25);
			
			return;
		end
	
		Schema:EasyText(player, "lawngreen", "Alors que l'eau pure coule dans ta gorge desséchée, tu ressens une immense satisfaction à savoir que tu ne mourras pas de maladie aujourd'hui.");
		player:HandleSanity(8);
		--player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Ice Cold Pop™";
	ITEM.uniqueID = "papa_petes_ice_cold_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille d'un liquide extraterrestre, glaciale et fraîche malgré l'absence de réfrigération. Sa simple existence vous trouble au plus profond de votre être. Quoi qu'il en soit, son goût est excellent.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1000};
	ITEM.needs = {thirst = 30, sleep = 5};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Pop™ Glacée de Papa Pete's®. Tu te sens mentalement et physiquement revigoré.");
		player:HandleSanity(10);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Ice Cold Pop™, Prize Included!";
	ITEM.uniqueID = "papa_petes_ice_cold_pop_prize_included";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de Papa Pete's® Ice Cold Pop™. Elle promet une chance de gagner une pièce d'or massif.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 700, bNoSupercrate = true};
	ITEM.needs = {thirst = 35, sleep = 5};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu sirotes une autre classique Papa Pete's Ice Cold Pop ! Une fois terminé, la bouteille se met à déverser des pièces partout ! Tu as touché le jackpot !");
			player:HandleSanity(10);
			Clockwork.player:GiveCash(player, math.random(50, 300), "You win the prize!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "maroon", "Tu sirotes un peu de la Pop Glacée de Papa Pete, mais en le faisant, tu sens une pièce d'or se coincer dans ta gorge ! Tu as gagné le prix ! Mais maintenant, tu es sur le point de t'étouffer à mort.");
			player:ScriptedDeath("Won a prize from a Papa Pete's® Ice Cold Pop™!");
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();


local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Orange-Flavored Ice Cold Pop™";
	ITEM.uniqueID = "papa_petes_orange_flavored_ice_cold_pop";
	ITEM.cost = 15;
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de Papa Pete's® Ice Cold Pop™ avec une touche d'agrumes !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1150, bNoSupercrate = true};
	ITEM.needs = {thirst = 30, sleep = 5};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Pop™ Glacée Saveur Orange de Papa Pete's®. Tu te sens mentalement et physiquement revigoré.");
		player:HandleSanity(10);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Grape-Flavored Ice Cold Pop™";
	ITEM.uniqueID = "papa_petes_grape_flavored_ice_cold_pop";
	ITEM.cost = 15;
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de Papa Pete's® Ice Cold Pop™ au goût raisin !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1150, bNoSupercrate = true};
	ITEM.needs = {thirst = 30, sleep = 5};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if player:HasTrait("marked") and math.random(1, 3) == 1 then
			Clockwork.chatBox:AddInTargetRadius(player, "me", "ouvre une bouteille de Papa Pete's® Grape-Flavored Ice Cold Pop™, pour se prendre une salve de mitraille piégée en pleine face !", player:GetPos(), config.Get("talk_radius"):Get() * 2);
			Schema:EasyText(Schema:GetAdmins(), "icon16/bomb.png", "tomate", player:Name().." got graped by Papa Pete!");
			
			local filter = RecipientFilter();
			
			if zones then
				filter:AddPlayers(zones:GetPlayersInSupraZone(zones:GetPlayerSupraZone(player)));
			else
				filter:AddAllPlayers();
			end
			
			player:EmitSound("musket/musket4.wav", 511, math.random(98, 102), 1, CHAN_WEAPON, 0, 0, filter);
			local effect = EffectData();
			local Forward = player:GetForward()
			local Right = player:GetRight()
			
			effect:SetOrigin(player:GetShootPos() - (Forward * 65) + (Right * 5));
			effect:SetNormal(-player:GetAimVector());
			util.Effect( "effect_awoi_smoke_pistol", effect );
		
			player:DeathCauseOverride("Got graped by Papa Pete.");
			player:Kill();
			
			if cwGore then
				if (player:GetRagdollEntity()) then
					cwGore:SplatCorpse(player:GetRagdollEntity(), 60);
				end;
			end
			
			return;
		elseif player:HasBelief("favored") then
			player:GiveItem(Clockwork.item:CreateInstance("grapeshot"));
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Pop™ Glacée Saveur Raisin de Papa Pete's®. Curieusement, tu trouves une cartouche à mitraille détachée dans la bouteille. Tu te sens mentalement et physiquement revigoré.");
		else
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Boisson Glacée® à Saveur de Raisin de Papa Pete™. Tu te sens mentalement et physiquement revigoré.");
		end
		
		player:HandleSanity(10);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Ice Cold Crazy Pop™";
	ITEM.uniqueID = "papa_petes_ice_cold_crazy_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de Papa Pete's® Ice Cold Crazy Pop™. Elle vante le fait que le goût de cette Ice Cold Pop™ est si délicieux qu'il vous rendra fou.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1150, bNoSupercrate = true};
	ITEM.needs = {thirst = 30, sleep = 5, stamina = 30};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:HandleStamina(self.needs.stamina);

		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu sirotes un peu de la Pop Folle Glacée® de Papa Pete™. Tu te sens revigoré, bien que ta santé mentale soit sauvagement mise en pièces.");
			player:HandleSanity(-75);
		end

		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Cream Pop™";
	ITEM.uniqueID = "papa_petes_cream_pop";
	ITEM.cost = 20;
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de crème Papa Pete. On crie tous pour la crème Papa Pete !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 2000};
	ITEM.needs = {thirst = 35, sleep = 15, stamina = 80};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:HandleStamina(self.needs.stamina);
		Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Crème Pop™ de Papa Pete's®. C'est très crémeux et délicieux. Tu te sens mentalement et physiquement revigoré, et tu ressens un regain d'énergie !");
		player:HandleSanity(15);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Meat Pop™";
	ITEM.uniqueID = "papa_petes_meat_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.4;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une marque inhabituelle de Cold Pop de Papa Pete. Elle est remplie d'une gelée rose.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1500};
	ITEM.needs = {hunger = 25, thirst = 20};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Pop™ à la viande de Papa Pete's®. Le goût charnu surprend, mais ça remplit ton estomac tout de même.");
		player:HandleSanity(5);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Ice Cold Ice Pop™";
	ITEM.uniqueID = "papa_petes_ice_cold_ice_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une boisson Papa Pete's incroyablement glaciale. Celle-ci est accompagnée d'un avertissement : risque de gel cérébral.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1300, bNoSupercrate = true};
	ITEM.needs = {thirst = 30, sleep = 5};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la glace glacée Papa Pete's® Ice Pop™. À part un léger mal de crâne dû au froid, tu te sens vraiment bien !");
			player:AddFreeze(25, player);
			player:HandleSanity(2);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "olive", "Tu sirotes un peu de la glace glacée Papa Pete's® Ice Pop™. C'est délicieux, mais tu es instantanément transformé en un bloc de glace !");
			player:AddFreeze(100, player);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

 local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Pipin' Hot Pop™";
	ITEM.uniqueID = "papa_petes_pipin_hot_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille très chaude de la marque Papa Pete's. Elle contient un liquide rouge pétillant. Ça doit être très épicé !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1300, bNoSupercrate = true};
	ITEM.needs = {thirst = 40, sleep = 5, stamina = 100};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:HandleStamina(self.needs.stamina);

		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu du Pipin' Hot Pop™ de Papa Pete's® ! Il a un arrière-goût épicé. Après avoir fini de boire, quelques pièces tombent de la bouteille !");
			player:HandleSanity(10);
			Clockwork.player:GiveCash(player, math.random(25, 100), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "olive", "Tu sirotes un peu du Pipin' Hot Pop™ de Papa Pete's®. C'est délicieux, mais tu es enveloppé de flammes !");
			player:HandleSanity(-15);
			player:Ignite(20);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
    ITEM.name = "Papa Pete's® Silly Pop™";
	ITEM.uniqueID = "papa_petes_silly_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une Papa Pete Cold Pop qui affirme que ce goût étrange va te rendre fou !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1750, bNoSupercrate = true};
	ITEM.needs = {thirst = 60, sleep = 5, stamina = 100};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:HandleStamina(self.needs.stamina);

		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu de la Boisson Folle™ de Papa Pete's®. Le goût est correct, et cela te fait éclater de rire par la suite ! Ta santé mentale est grandement restaurée !");
			player:HandleSanity(60);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "olive", "Tu sirotes un peu de la Pop Folle™ de Papa Pete's®. C'est bon, mais ton cerveau est maintenant tout embrouillé !");
			if(!player:HasTrait("lobotomite")) then player:GiveTrait("imbecile"); end
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

 local ITEM = Clockwork.item:New();
	ITEM.name = "Papa Pete's® Plague Pop™";
	ITEM.uniqueID = "papa_petes_plague_pop";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une Papa Pete Cold Pop qui prétend avoir un goût si délicieux qu'elle pourrait déclencher la fin des temps pour les mortels !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cold_pop.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;
	ITEM.cauldronPlague = true;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 2500};
	ITEM.needs = {thirst = 60, sleep = 5, stamina = 100};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		player:HandleStamina(self.needs.stamina);

		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu du Plague Pop™ de Papa Pete's®. Ce n'était pas très bon, mais tu sens tes poches s'alourdir de pièces ! Les dieux t'ont béni !");
			player:HandleSanity(5);
			Clockwork.player:GiveCash(player, math.random(50, 250), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			Schema:EasyText(player, "lawngreen", "Tu sirotes un peu du Plague Pop™ de Papa Pete's®. Le goût est plutôt bon, mais tu ne peux t'empêcher de remarquer un mal de gorge en finissant la bouteille.");
			player:GiveDisease("begotten_plague", 1, true);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Yum Chug";
	ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl";
	ITEM.weight = 0.65;
	ITEM.useText = "Chug";
	ITEM.category = "Drinks";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une bouteille de délicieuse lampée, elle contient un liquide blanc et épais, ça doit être très bon.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/yumchug.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;
	ITEM.cauldronPoison = true;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 300, bNoSupercrate = true};
	ITEM.needs = {hunger = 0, thirst = 0};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		--Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 60);
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Plutôt que d'avaler l'eau de Javel comme un imbécile, tu examines prudemment l'intérieur du récipient et découvres un dépôt de pièces ! Quelle chance !");
			player:HandleSanity(5);
			Clockwork.player:GiveCash(player, math.random(5, 40), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			player:HandleSanity(-100);
			player:ScriptedDeath("Chugged the Yum Chug.");
			Schema:EasyText(player, "maroon", "Tu commences à descendre la délicieuse lampée. Tu sens ta gorge brûler et tu perds toute capacité à goûter. Tu commences à mourir en t'étouffant. Espèce de crétin fini.");
			Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." chugged the Yum Chug!", nil);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Holy Water";
	ITEM.model = "models/props_junk/glassjug01.mdl";
	ITEM.weight = 0.3;
	ITEM.useText = "Purify Youself";
	ITEM.category = "Drinks"
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle5.wav";
	ITEM.description = "Une bouteille en verre d'eau bénite. On dit qu'elle purifie toutes les impuretés.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/laudanum.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 666, bNoSupercrate = true};
	ITEM.needs = {thirst = 20};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)

		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu bois le contenu de la bouteille en verre. Hélas, ce n'est pas de l'eau bénite mais un parfum secret de Papa Pete's Ice Cold Pop™ ! Tu te sens revigoré ! Et il y a aussi des pièces !");
			player:HandleSanity(15);
			Clockwork.player:GiveCash(player, math.random(5, 50), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		else
			player:HandleNeed("corruption", -100);
			player:ScriptedDeath("Cleansed of impurities.");
			player:Ignite(8, 0);
			Schema:EasyText(player, "maroon", "Alors que tu avales l'Eau Bénite et qu'elle commence à purifier les impuretés de ton corps, tu réalises soudain que personne dans ce monde maudit n'est pur, toi y compris. Ton âme même s'embrase et est consumée par les flammes.");
			Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." drank holy water!", nil);
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Varazdat Bloodwine";
	ITEM.model = "models/props/cs_militia/bottle02.mdl";
	ITEM.weight = 0.3;
	ITEM.useText = "Drink";
	ITEM.category = "Alcohol";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de vin finement vieilli des Terres Obscures. Il semble fermenté avec du sang humain, des épices coûteuses et de délicieuses baies.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bottle02.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 30, thirst = 50};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Ce vin a un goût excellent ! Vous vous sentez empli d'un sentiment de valeur personnelle accrue.");
		player:HandleSanity(30);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Varazdat Masterclass Bloodwine";
	ITEM.model = "models/props/cs_militia/bottle02.mdl";
	ITEM.weight = 0.3;
	ITEM.useText = "Drink";
	ITEM.category = "Alcohol";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de vin exotique provenant des Terres Obscures. Elle serait fermentée avec du sang humain, des épices coûteuses et de délicieuses baies. Cette bouteille en particulier serait épicée avec le sang d'esclaves-putains vierges et vieillie pendant plus de 300 ans.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bottle02.png"
	ITEM.stackable = true;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 40, thirst = 65};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		Schema:EasyText(player, "lawngreen", "Ce vin a un goût excellent ! Vous vous sentez empli d'un sentiment de valeur personnelle accrue.");
		player:HandleSanity(50);
		player:HandleXP(cwBeliefs.xpValues["drink"]);
		
		if !player:HasBelief("favored") then
			if !Schema.poisonedWinePlayers then
				Schema.poisonedWinePlayers = {};
				
				table.insert(Schema.poisonedWinePlayers, player);
			else
				if !table.HasValue(Schema.poisonedWinePlayers, player) then
					table.insert(Schema.poisonedWinePlayers, player);
				end
			end
		end
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Pissjug Chug";
	ITEM.model = "models/props_junk/garbage_plasticbottle001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Chug";
	ITEM.category = "Drinks";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une cruche de pisse - elle a été filtrée par des machines défectueuses des Récupérateurs. Elle te remplira certainement l'estomac, au léger détriment de ta santé mentale.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/yumchug.png"
	ITEM.stackable = true;
	ITEM.infectchance = 8;
	ITEM.cauldronLiquidity = 1;
	ITEM.cauldronQuality = -1;
	
	ITEM.needs = {thirst = 50};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)	
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu ouvres la cruche et verses la pisse dans ton réceptacle, mais cela commence à court-circuiter tes entrailles !");
			Schema:DoTesla(player, true);
			--player:TakeDamage(25);
			
			return;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu avales le pot à pisse. Ça a un goût de sel et de misère.");
			player:HandleSanity(-8);
		end
		
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Bucket of Purified Water";
	ITEM.model = "models/props_junk/MetalBucket01a.mdl";
	ITEM.weight = 3;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Un seau rempli d'eau purifiée.";
	ITEM.stackable = false;
	ITEM.needs = {thirst = 70};
	ITEM.uniqueID = "purified_water_bucket";
	ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/bucket.png"
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Clockwork.chatBox:AddInTargetRadius(player, "me", "apporte un seau d'eau à son visage et en boit le contenu entier sans s'arrêter.", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
		
		player:GiveItem(Clockwork.item:CreateInstance("empty_bucket"), true);

		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu verses de l'eau dans ton réceptacle, mais cela commence à court-circuiter tes entrailles !");
			Schema:DoTesla(player, true);
			--player:TakeDamage(25);
			
			return;
		end
	
		Schema:EasyText(player, "lawngreen", "Alors que l'eau pure coule dans ta gorge desséchée, tu ressens une immense satisfaction à savoir que tu ne mourras pas de maladie aujourd'hui.");
		player:HandleSanity(20);
		--player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Bucket of Dirty Water";
	ITEM.model = "models/props_junk/MetalBucket01a.mdl";
	ITEM.weight = 3.2;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Un seau rempli d'eau sale.";
	ITEM.stackable = false;
	ITEM.needs = {thirst = 30};
	ITEM.uniqueID = "dirty_water_bucket";
	ITEM.iconoverride = "begotten_apocalypse/ui/itemicons/bucket.png"
	ITEM.infectchance = 60;
	ITEM.cauldronQuality = -3;
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Clockwork.chatBox:AddInTargetRadius(player, "me", "apporte un seau d'eau à son visage et en boit le contenu d'une traite, sans s'arrêter.", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
		
		player:GiveItem(Clockwork.item:CreateInstance("empty_bucket"), true);
		
		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu avales le seau d'eau sale, mais il commence à court-circuiter tes entrailles !");
			Schema:DoTesla(player, true);
			return;
		end

		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Une eau glaciale et répugnante, venue des terres gelées, descend dans votre gorge jusqu'à votre estomac. Vous avez l'impression de pouvoir vomir.");
			player:HandleSanity(-25);
		end
			--player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Blood Bottle";
	ITEM.model = "models/props_junk/GlassBottle01a.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Drink";
	ITEM.category = "Drinks";
	ITEM.useSound = "ambient/levels/canals/toxic_slime_gurgle4.wav";
	ITEM.description = "Une bouteille de sang expertisée par des cultistes de la chair et des bizarros.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bottle_2.png"
	ITEM.stackable = true;
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = -4;
	
	ITEM.needs = {thirst = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)	
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette boisson est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:GiveItem(Clockwork.item:CreateInstance("empty_bottle"), true);
	
		if player:HasBelief("the_paradox_riddle_equation") or player:HasBelief("the_storm") then
			Schema:EasyText(player, "maroon", "Tu ouvres la bouteille et verses du sang dans ton réceptacle, mais cela commence à court-circuiter tes entrailles !");
			Schema:DoTesla(player, true);	
			player:HandleSanity(-5);			
			return;
		end
		
		if !player:HasBelief("heart_eater") then
			Schema:EasyText(player, "olive", "Le sang suinte de la bouteille et coule dans ta gorge... Tu te sens répugné, à la fois physiquement et spirituellement.");
			player:HandleSanity(-50);
			player:HandleXP(cwBeliefs.xpValues["drink"]);
		elseif player:HasBelief("heart_eater") and !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olivedrab", "Le sang suinte de la bouteille et coule dans ta gorge... Même en tant que buveur de sang expérimenté, tu trouves le goût et la texture dérangeants.");
			player:HandleSanity(-15);
		else
			Schema:EasyText(player, "lawngreen", "Le sang s'écoule de la bouteille et coule dans ta gorge... Délicieux !");
		end
		
		player:HandleXP(cwBeliefs.xpValues["drink"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();