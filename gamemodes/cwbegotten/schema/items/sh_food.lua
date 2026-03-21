local ITEM = Clockwork.item:New();
	ITEM.name = "Can of Beans";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Open & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une vieille boîte de haricots, elle semble toujours scellée bien que sa fraîcheur reste douteuse.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.infectchance = 10; -- Chance to give you a disease.
	ITEM.cauldronQuality = 1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 800, bNoSupercrate = true};
	ITEM.needs = {hunger = 15, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		--player:GiveItem(Clockwork.item:CreateInstance("empty_can"));
		
		Schema:EasyText(player, "olivedrab", "Bien que périmées depuis longtemps et légèrement écumeuses, ces fèves restent parfaitement comestibles.");

		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Punctured Can of Beans";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan002a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Drink Slop";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de conserve percée contenant ce qui fut autrefois des haricots. Maintenant, c'est un mélange boueux d'asticots, de moisissure et de maladies. Hé, au moins c'est quelque chose pour remplir ton estomac.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can_punctured.png"
	ITEM.stackable = true;
	ITEM.infectchance = 50; -- Chance to give you a disease.
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 350, bNoSupercrate = true};
	ITEM.needs = {hunger = 12, thirst = 10};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)	
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu te sens dégoûté à l'idée d'avoir mangé quelque chose d'aussi infect. En conséquence, tu commences à te sentir émotionnellement et mentalement instable.");
			player:HandleSanity(-25);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Moldy Bread";
	ITEM.cost = 8;
	ITEM.model = "models/kali/miscstuff/stalker/food/bread.mdl";
	ITEM.weight = 0.2;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Un petit pain de pain, entrelacé de moisissure et de terre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/bread.png"
	ITEM.stackable = true;
	ITEM.infectchance = 15;
	ITEM.cauldronQuality = 0;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 500, bNoSupercrate = true};
	ITEM.needs = {hunger = 8};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Le pain est pâteux et moisi, mais il reste bien meilleur que la plupart des autres nourritures trouvées dans le désert.");
			player:HandleSanity(-5);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Canned Meal";
	ITEM.cost = 8;
	ITEM.model = "models/kali/miscstuff/stalker/food/tourist's breakfast.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Open & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de conserve cabossée censée contenir des haricots et de la saucisse, mais elle est toujours scellée, un miracle !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/canned_meal.png"
	ITEM.stackable = true;
	ITEM.cauldronQuality = 1;

	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1100};
	ITEM.needs = {hunger = 20, thirst = 8, health = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Bear Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.5;
	ITEM.plural = "Raw Bear Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande crue prélevée sur un ours.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "bear_meat"
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 15, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges de la viande crue à contrecœur.");
			player:HandleSanity(-5);
		end
			
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Bear Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.5;
	ITEM.plural = "Cooked Bear Meat";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande d'ours cuite, très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_bear_meat"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 25, thirst = 5, health = 7};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Wolf Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Raw Wolf Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande crue récoltée sur un loup. Elle n'est pas très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "wolf_meat"
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 3, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges de la viande crue à contrecœur.");
			player:HandleSanity(-5);
		end
			
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Wolf Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Cooked Wolf Meat";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande de loup cuite. Elle n'est pas très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_wolf_meat"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 8, thirst = 4, health = 2};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Leopard Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Raw Leopard Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande crue prélevée sur un léopard.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "leopard_meat"
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 10, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges de la viande crue à contrecœur.");
			player:HandleSanity(-5);
		end
			
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Leopard Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Cooked Leopard Meat";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande de léopard cuite, très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_leopard_meat"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 25, thirst = 5, health = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Deer Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Raw Deer Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande crue prélevée sur un cerf.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "deer_meat"
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 10, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges de la viande crue à contrecœur.");
			player:HandleSanity(-5);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Deer Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Cooked Deer Meat";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande de cerf cuite, très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_deer_meat"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 25, thirst = 5, health = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Goat Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Cooked Goat Meat";
	ITEM.useText = "Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande de chèvre cuite, très nutritive.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_goat_meat"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 20, thirst = 5, health = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Goat Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Raw Goat Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande crue prélevée sur une chèvre.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "goat_meat"
	ITEM.infectchance = 30;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 8, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges de la viande crue à contrecœur.");
			player:HandleSanity(-5);
		end
	
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Gatekeeper Ration";
	ITEM.cost = 8;
	ITEM.model = "models/items/provisions/food_ratio/food_ratio02.mdl";
	ITEM.weight = 0.4;
	ITEM.useText = "Unwrap & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Un gros morceau de viande rosâtre, bien préparé et emballé pour être transportable. Vous préférez rester dans l'ignorance quant à sa provenance précédente.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/gatekeeper_ration.png"
	ITEM.stackable = true;

	ITEM.needs = {hunger = 25, thirst = 15};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		player:HandleSanity(5);
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Raw Human Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Raw Human Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Morceaux mutilés provenant d'un humain abattu.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "humanmeat"
	ITEM.infectchance = 50;
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 6, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu te repais de la chair fraîche d'un autre. Tu remets en question ta santé mentale.");
			player:HandleSanity(-20);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Fucked Meat";
	ITEM.model = "models/gibs/humans/mgib_07.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Fucked Meat";
	ITEM.useText = "Force Down Your Throat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Cette viande est foutue ! Ou peut-être pas. Oserais-tu y goûter ?";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/human_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "fuckedmeat"
	ITEM.infectchance = 50;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 300, bNoSupercrate = true};
	ITEM.needs = {hunger = 6, thirst = 0};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu manges la viande avariée et à ta grande surprise, la viande est pourrie ! Tu recraches les vers et la pourriture, laissant place à un profond sentiment de regret.");
			player:HandleSanity(-25);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Unfucked Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.3;
	ITEM.plural = "Unfucked Meat";
	ITEM.useText = "Devour";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande douteuse, probablement un animal mort ou pire. Elle a été grillée depuis et est relativement sûre à consommer.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "unfuckedmeat"
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 25, thirst = 15, health = 8};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olivedrab", "La viande est savoureuse. Tu es fier d'un repas aussi honnête.");
		player:HandleSanity(10);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Meatmeal";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.6;
	ITEM.useText = "Devour";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Un repas de viande bouillie. Ce sera suffisant.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "meatmeal"
	
	ITEM.needs = {hunger = 45, thirst = 35, health = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olivedrab", "Un repas honnête !");
		player:HandleSanity(30);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
			
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	-- Called when the item entity has spawned.
	--[[function ITEM:OnEntitySpawned(entity)
		entity:SetMaterial("models/flesh");
	end;]]--
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Human Meat";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.35;
	ITEM.plural = "Cooked Human Meat";
	ITEM.useText = "Devour";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande cuite provenant d'un humain abattu.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_human_meat"
	ITEM.infectchance = 5;
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 12, thirst = 3, health = 3};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if player:HasBelief("savage") then
			Schema:EasyText(player, "olivedrab", "Tu apprécies le goût savoureux de tes semblables.");
			player:HandleSanity(2);
			player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		else
			Schema:EasyText(player, "olivedrab", "Cette viande est préparée presque assez bien pour oublier d'où elle vient.");
			player:HandleSanity(-2);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Punctured Can of Soup";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan002a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Drink Slop";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de conserve percée qui contenait autrefois de la soupe aux champignons. Maintenant un mélange boueux d'asticots, de moisissure et de maladies. Hé, au moins c'est quelque chose pour remplir ton estomac.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can_punctured.png"
	ITEM.stackable = true;
	ITEM.infectchance = 50;
	ITEM.cauldronQuality = 0;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 350, bNoSupercrate = true};
	ITEM.needs = {hunger = 12, thirst = 9};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Tu te sens dégoûté à l'idée d'avoir mangé quelque chose d'aussi immonde. En conséquence, tu commences à te sentir émotionnellement et mentalement instable.");
			player:HandleSanity(-25);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Kitty Candy";
	ITEM.cost = 8;
	ITEM.model = "models/kali/miscstuff/stalker/artifacts/eye.mdl";
	ITEM.weight = 0.25;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/kitty_candy.png"
	ITEM.description = "Voici des friandises pour minou. Attends un peu.";
	ITEM.stackable = true;
	ITEM.uniqueID = "kittycandy";
	ITEM.cauldronQuality = 0;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 1500, bNoSupercrate = true};
	ITEM.needs = {hunger = 8, health = 15};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "En léchant le bonbon, il se transforme soudain en une pierre purificatrice qui palpite, vous accordant une grande guérison et régénérant votre santé mentale tout en réduisant votre corruption !");
			player:HandleSanity(50);
			player:HandleNeed("corruption", -25);
			player:SetHealth(math.Clamp(player:Health() + 25, 0, player:GetMaxHealth()));
			player:HandleXP(cwBeliefs.xpValues["food"]);
		elseif (math.random( 1, 4 ) == 1) then
			player:ScriptedDeath("Had their insides dissolved with acid.");
			Schema:EasyText(player, "olive", "Tu commences à lécher la Kitty Candy. Après quelques coups de langue, tu remarques un goût infect dans ta bouche... Merde ! Cette Kitty Candy est de l'acide ! L'acide commence à brûler ta putain de langue et ta gorge.");
			player:HandleSanity(-100);
		else
			Schema:EasyText(player, "lawngreen", "Mmmm ! C'était vraiment délicieux ! Je pourrais bien en reprendre un, de Kitty Candy !");
			player:HandleSanity(50);
			player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
			player:HandleXP(cwBeliefs.xpValues["food"]);
		end;
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Canned Yummy Beans";
	ITEM.cost = 8;
	ITEM.model = "models/kali/miscstuff/stalker/food/tourist's breakfast.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte ouverte contenant des haricots décomposés et des asticots carnivores. Ça a l'air délicieux !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/canned_meal.png"
	ITEM.stackable = true;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 500, bNoSupercrate = true};
	ITEM.needs = {hunger = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
		
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu aperçois une lueur à l'intérieur de la boîte et te réjouis d'y découvrir une multitude de pièces ! Ta santé mentale est restaurée ! Les dieux te sourient !");
			player:HandleSanity(20);
			Clockwork.player:GiveCash(player, math.random(10, 30), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["food"]);
		elseif !player:HasBelief("savage_animal") and (math.random(1, 2) == 1) then
			--player:GiveItem(Clockwork.item:CreateInstance("empty_can"));
			player:ScriptedDeath("Was devoured by flesh eating maggots.");
			player:HandleSanity(-100);
			Schema:EasyText(player, "olive", "Tu ouvres la boîte et te délectes de ce que tu crois être de la bonne viande. Tes doigts tremblent en enfournant le produit dans ta bouche, et tu réalises rapidement qu'il grouille d'asticots dévoreurs de chair. Tu commences à mourir lentement, dévoré de l'intérieur.");
		else
			--player:GiveItem(Clockwork.item:CreateInstance("empty_can"));
			Schema:EasyText(player, "lawngreen", "Tu ouvres la boîte et commences à déguster les Yummy Beans. Et wow, qu'est-ce qu'ils sont bons !");
			
			if !player:HasBelief("savage_animal") then
				player:HandleSanity(-50);
			end
			
			player:HandleXP(cwBeliefs.xpValues["food"]);
		end;	
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Canned Yummy Meat";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Open & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de conserve scellée et relativement intacte, avec une étiquette indiquant 'Viande Fraîche, Emballée Aujourd'hui !'. Ouais, bien sûr.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 350, bNoSupercrate = true};
	ITEM.needs = {hunger = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		local playerPos = player:GetPos();

		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "Tu aperçois une lueur à l'intérieur de la boîte et te réjouis d'y découvrir une multitude de pièces ! Ta santé mentale est restaurée ! Les dieux te sourient !");
			player:HandleSanity(25);
			Clockwork.player:GiveCash(player, math.random(10, 30), "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["food"]);
		else
			player:ScriptedDeath("Became canned meat.");
			Schema:EasyText(player, "maroon", "Tu ouvres la canette, et soudain une main jaillit de l'intérieur et t'attrape ! Elle te tire à l'intérieur et ne te lâche pas ! MERDE !");
			
			timer.Simple(11, function()
				if IsValid(player) then
					Clockwork.chatBox:AddInTargetRadius(player, "me", "est soudainement saisi par une main surgie de la canette qu'il tient ! Il est violemment projeté à l'intérieur, hurlant tandis que son corps se disloque horriblement pour s'y loger ! Putain de merde !", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
					
					for k, v in pairs(ents.FindInSphere(player:GetPos(), Clockwork.config:Get("talk_radius"):Get())) do
						if v:IsPlayer() then
							if !v:HasBelief("savage_animal") then
								v:HandleSanity(-50);
							end
						end
					end
				end
			end);
			
			timer.Simple(11.5, function()
				if IsValid(player) then
					local ragdollEntity = player:GetRagdollEntity();
					
					if !player:Alive() and ragdollEntity then
						ragdollEntity:Remove();
					end
					
					Clockwork.entity:CreateItem(nil, "canned_fresh_meat", Vector(playerPos.x, playerPos.y, playerPos.z + 64));
					
					Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." was taken by a can!", nil);
				end
			end);
		end;
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Canned Fresh Meat";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Open & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de conserve scellée et relativement intacte, avec une étiquette indiquant 'Viande Fraîche, Emballée Aujourd'hui !'. Elle est couverte de sang et l'on peut entendre de faibles cris provenir de l'intérieur.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.cauldronQuality = -1;
	
	ITEM.needs = {hunger = 40};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olivedrab", "Le goût est un peu étrange, mais la viande est assurément fraîche.");
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Neat Yummy Meat";
	ITEM.cost = 8;
	ITEM.model = "models/kali/miscstuff/stalker/food/diet sausage.mdl";
	ITEM.weight = 0.2;
	ITEM.useText = "Devour";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une tranche de bouillasse, ça a l'air bien net et juteux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/neat_yummy_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "neatmeat";
	ITEM.infectchance = 50;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 350, bNoSupercrate = true};
	ITEM.needs = {hunger = 15, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if player:HasBelief("favored") then
			Schema:EasyText(player, "lawngreen", "La viande appétissante était vraiment délicieuse. De plus, ta santé mentale est régénérée et tu recraches quelques pièces !");
			Clockwork.player:GiveCash(player, 12, "Blessed coins!");
			player:HandleXP(cwBeliefs.xpValues["food"]);
		else
			local DeathMethods = {
				"Vous mordez dans la bouillie de viande, et juste après la montée du goût, vous ressentez une douleur fulgurante alors qu'un clou rouillé infecté est planté dans le palais de votre putain de bouche, habilement caché dans la viande elle-même. Vous êtes condamné à mourir d'infection, si vous ne videz pas de votre sang par la bouche avant.",
				"Vous enfoncez vos dents dans le délicieux morceau de viande, et juste après la montée du goût, vous ressentez une sensation terrible en réalisant qu'une longue bande de fil barbelé rouillé et infecté vous lacère la putain de bouche. Il y a du sang partout, bordel de merde. Vous êtes condamné à mourir d'infection si vous ne videz pas de votre sang par la bouche avant.",
				"Vous commencez à mâcher ce délicieux morceau de viande, mais quelque chose ne tourne pas rond. Vous commencez à sentir un mouvement dans votre bouche alors que vous réalisez qu'une colonie d'asticots mangeurs de chair se fraye un chemin hors de votre bouche. Ils se repaissent de votre langue et de vos joues, s'enfonçant et ressortant de vous. Vous êtes condamné à mourir à cause de ces petits enfoirés. Bien joué.",
				"Vous mordez dans la viande, et commencez à savourer sa saveur avant que le bruit d'un craquement sonore n'attire votre attention. Vous réalisez alors que vous venez de mordre dans un putain de cafard venimeux, et vous êtes condamné à mourir bientôt de ses toxines.",
				"Vous plongez dans votre délicieuse viande, pour ensuite reculer et vous figer à cause d'une douleur soudaine dans la bouche. Vous réalisez alors qu'une lame de rasoir rouillée et infectée s'est frayé un chemin dans votre bouche et vous a tranché la putain de langue ! Vous êtes destiné à mourir d'une mort lente et douloureuse par infection, si la perte de votre langue ne vous tue pas avant.",
				"Vous commencez à mastiquer la délicieuse viande avant de remarquer son putain de goût infect. Vous réalisez que cette viande est avariée ! Et vous êtes condamné à mourir d'une mort lente à cause des toxines que vous venez d'ingérer. Bien joué, mon pote."
			}
	
			if !player:HasBelief("savage_animal") and math.random(1, 4) == 1 then
				player:ScriptedDeath("Bit off more than they could chew.");
				Schema:EasyText(player, "olive", DeathMethods[math.random(1, #DeathMethods)]);
				player:HandleSanity(-100);
			else
				Schema:EasyText(player, "olive", "Mmmmm. C'était de la bonne viande délicieuse !");
				player:HandleXP(cwBeliefs.xpValues["food"]);
			end;
		end;
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Yummy Meat";
	ITEM.model = "models/kali/miscstuff/stalker/food/diet sausage.mdl";
	ITEM.weight = 0.2;
	ITEM.plural = "Cooked Yummy Meat";
	ITEM.useText = "Devour";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "De la viande indistincte récemment bouillie dans une tentative de la purger de ses hôtes immondes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/neat_yummy_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "cooked_yummy_meat"
	
	ITEM.needs = {hunger = 25, thirst = 10, health = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olive", "La viande n'avait pas bon goût.");
		player:HandleXP(cwBeliefs.xpValues["food"]);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Cooked Canned Goodies";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Une boîte de conserve ouverte de nourriture récemment cuite. Ça sent appétissant.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "masterclass_yummy_meal"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 70, thirst = 55, health = 10};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "lawngreen", "Tu consommes le repas. C'était une excellente cuisine !");
		player:HandleXP(cwBeliefs.xpValues["food"]);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleSanity(30);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "King's Meal";
	ITEM.model = "models/items/provisions/ham_dry/ham_dry.mdl";
	ITEM.weight = 0.55;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Un repas digne d'un Roi. Il est composé de viande cuite provenant de divers animaux chassés.";
	ITEM.iconoverride = "begotten/ui/itemicons/cooked_meat.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "kings_meal"
	ITEM.cauldronQuality = 1;
	
	ITEM.needs = {hunger = 100, thirst = 100, stamina = 50, health = 35};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end 
	
		Schema:EasyText(player, "lawngreen", "Tu consommes le repas. Il était excellent !");
		player:HandleXP(cwBeliefs.xpValues["food"]);
		player:HandleSanity(50);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		player:HandleStamina(self.needs.stamina);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Wanderer's Delight";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Au diable les asticots et la maladie ! Le Rôdeur se débrouille et trouve une cuisine excellente dans un monde en décomposition.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "wanderers_delight"
	
	ITEM.needs = {hunger = 60, thirst = 40, health = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "lawngreen", "Tu consommes le repas. Il avait un goût correct !");
		player:HandleXP(cwBeliefs.xpValues["food"]);
		player:HandleSanity(35);
		player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Crazy Can";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan002a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Une boîte de nourriture étrange. Son goût est si bon qu'il vous rendra fou !";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can_punctured.png"
	ITEM.stackable = true;
	ITEM.infectchance = 50;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 300, bNoSupercrate = true};
	ITEM.needs = {hunger = 10, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)	
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Le contenu de la boîte vous a laissé des cicatrices émotionnelles et un déséquilibre mental.");
			player:HandleSanity(-95);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Pickle Surprise";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Open & Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Où est le cornichon ?";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.cauldronQuality = 0;
	
	--ITEM.itemSpawnerInfo = {category = "Food", rarity = 2500};
	ITEM.needs = {hunger = 30, thirst = 15};

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		--player:GiveItem(Clockwork.item:CreateInstance("empty_can"));
		
		Schema:EasyText(player, "olivedrab", "Tu manges la Surprise au Cornichon. C'était bon, mais tu es saisi d'effroi en réalisant qu'il n'y avait pas de cornichon.");
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has eaten a Pickle Surprise!", nil);

		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Scrapper Slop";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Un horrible mélange de champignons, d'alcool et de chair bouillie. Un repas digne de charognes.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "scrapper_slop"
	ITEM.cauldronQuality = 0;
	
	ITEM.needs = {hunger = 15, thirst = 20};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "lawngreen", "Tu bouffes cette horrible bouillie. En fait, c'était moins pire que prévu.");
		player:HandleXP(cwBeliefs.xpValues["food"]);
		player:HandleSanity(5);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Shitstew";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Dégoûtant par sa texture, sa saveur et son odeur. Cette concoction abominable est à peine considérée comme de la 'nourriture'. Ton estomac gronde... souhaites-tu vraiment y goûter ?";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "shitstew"
	ITEM.customFunctions = {"Smell Contents"};
	ITEM:AddData("isPlagued", false, true);
	ITEM:AddData("isPoisoned", false, true)
	
	ITEM.needs = {hunger = 15, thirst = 5};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olivedrab", "Tu bouffes cette immonde bouillie. Malgré son goût infect, ça te remplit un peu l'estomac.");
		player:HandleXP(cwBeliefs.xpValues["food"]);

		if self:GetData("isPoisoned") then
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a poisoned stew!");
			player:GiveDisease("poisoned");
		end

		if self:GetData("isPlagued") then
			player:GiveDisease("begotten_plague");
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a plagued stew!");
		end
	end

	function ITEM:OnCustomFunction(player, name)
		if name == "Smell Contents" then
			if (self:GetData("isPlagued") or self:GetData("isPoisoned")) and player:HasBelief('culinarian') then
				Schema:EasyText(player, "olive", "Le ragoût ne sent pas tout à fait bon, même en tenant compte de sa nature de mélange hétéroclite...");
			else
				Schema:EasyText(player, "olivedrab", "L'odeur repoussante du ragoût vous assaille violemment les narines.");
			end
		end
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Blandstew";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Adéquat et chaud. Le goût fade est d'une neutralité écrasante. Mais il fait l'affaire. Votre estomac ne s'en plaindra pas, mais ne sautera pas de joie non plus.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "blandstew"
	ITEM.customFunctions = {"Smell Contents"};
	ITEM:AddData("isPlagued", false, true);
	ITEM:AddData("isPoisoned", false, true)
	
	ITEM.needs = {hunger = 20, thirst = 15};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "olivedrab", "Tu dévores le ragoût. Il est totalement quelconque du début à la fin.");
		player:HandleXP(cwBeliefs.xpValues["food"]);

		if self:GetData("isPoisoned") then
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a poisoned stew!");
			player:GiveDisease("poisoned");
		end

		if self:GetData("isPlagued") then
			player:GiveDisease("begotten_plague");
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a plagued stew!");
		end
	end

	function ITEM:OnCustomFunction(player, name)
		if name == "Smell Contents" then
			if (self:GetData("isPlagued") or self:GetData("isPoisoned")) and player:HasBelief('culinarian') then
				Schema:EasyText(player, "olive", "Le ragoût ne sent pas tout à fait bon, même compte tenu de sa nature de mélange hétéroclite...");
			else
				Schema:EasyText(player, "lightslateblue", "Le ragoût n'a absolument aucune odeur remarquable.");
			end
		end
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Finestew";
	ITEM.model = "models/props_junk/garbage_metalcan001a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.category = "Food";
	ITEM.description = "Un assortiment chaleureux et délicieux. Ce ragoût doit être divin, à en juger par son parfum. Il fait frétiller vos entrailles de joie.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "finestew"
	ITEM.customFunctions = {"Smell Contents"};
	ITEM:AddData("isPlagued", false, true);
	ITEM:AddData("isPoisoned", false, true)
	
	ITEM.needs = {hunger = 30, thirst = 25};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		Schema:EasyText(player, "lawngreen", "Tu dévores le ragoût. C'est, et de loin, la meilleure chose que tu aies jamais mise et que tu mettras jamais dans ta bouche. Ton estomac te remerciera pour les jours à venir.");
		player:HandleXP(cwBeliefs.xpValues["food"]);

		if self:GetData("isPoisoned") then
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a poisoned stew!");
			player:GiveDisease("poisoned");
		end

		if self:GetData("isPlagued") then
			player:GiveDisease("begotten_plague");
			Clockwork.player:NotifyAdmins("operator", player:Name().." has eaten a plagued stew!");
		end
	end

	function ITEM:OnCustomFunction(player, name)
		if name == "Smell Contents" then
			if (self:GetData("isPlagued") or self:GetData("isPoisoned")) and player:HasBelief('culinarian') then
				Schema:EasyText(player, "olive", "Le ragoût ne sent pas tout à fait bon, même en tenant compte de sa nature de mélange aléatoire d'ingrédients...");
			else
				Schema:EasyText(player, "lawngreen", "Le ragoût sent délicieusement bon, et tu as hâte de le déguster !");
			end
		end
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Anal Slop";
	ITEM.cost = 8;
	ITEM.model = "models/props_junk/garbage_metalcan002a.mdl";
	ITEM.weight = 0.5;
	ITEM.useText = "Eat";
	ITEM.category = "Food";
	ITEM.useSound = "npc/barnacle/barnacle_crunch2.wav";
	ITEM.description = "Affreux, des HARICOTS POURRIS ! Cette horrible pâte a probablement été créée par les Récupérateurs pour nourrir leurs esclaves. C'est juste assez pour les maintenir en vie... ou pas ?";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/can_punctured.png"
	ITEM.stackable = true;
	ITEM.infectchance = 15;
	ITEM.cauldronQuality = -1;
	
	ITEM.itemSpawnerInfo = {category = "Food", rarity = 500, bNoSupercrate = true};
	ITEM.needs = {hunger = 12, thirst = 6};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if !player:HasBelief("savage_animal") then
			Schema:EasyText(player, "olive", "Le contenu de la boîte était si infect que vous vous sentez physiquement violé - sodomisé à la gorge avec un arrière-goût qui ne partira jamais. Vous n'avez plus de désir, seulement une faim dévorante.");
			player:HandleSanity(-15);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end;

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();

local ITEM = Clockwork.item:New();
	ITEM.name = "Manlunch";
	ITEM.model = "models/items/provisions/food_ratio/food_ratio02.mdl";
	ITEM.weight = 0.45;
	ITEM.useText = "Unwrap & Eat";
	ITEM.useSound = "npc/barnacle/barnacle_crunch3.wav";
	ITEM.category = "Food";
	ITEM.description = "Viande bien cuite d'origine inconnue, enveloppée dans un linge graisseux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/manlunch.png"
	ITEM.stackable = true;
	ITEM.uniqueID = "manlunch"
	ITEM.infectchance = 5;
	
	ITEM.needs = {hunger = 40, thirst = 15, health = 6};
	
	function ITEM:OnSetup()
		if cwWarmth and cwWarmth.systemEnabled then
			ITEM:AddData("freezing", 0, true);
		end
	end

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local freezing = self:GetData("freezing");
		
		if freezing and freezing > 25 then
			Schema:EasyText(player, "lightslateblue", "Cette nourriture est complètement gelée et doit être décongelée avant d'être consommée !");
		
			return false;
		end
	
		if player:HasBelief("savage") then
			Schema:EasyText(player, "olivedrab", "Tu apprécies le goût savoureux de tes semblables.");
			player:HandleSanity(2);
			player:SetHealth(math.Clamp(player:Health() + self.needs.health, 0, player:GetMaxHealth()));
		else
			Schema:EasyText(player, "olivedrab", "Qui viens-je de dévorer ? Et pourquoi ce goût m'a-t-il tant plu ?");
			player:HandleSanity(-2);
		end
		
		player:HandleXP(cwBeliefs.xpValues["food"]);
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();
