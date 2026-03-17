local ITEM = Clockwork.item:New();
	ITEM.name = "Lockpick";
	ITEM.uniqueID = "lockpick";
	ITEM.model = "models/items/special/lockpicks/lockpick_01.mdl";
	ITEM.weight = 0.1;
	ITEM.category = "Tools";
	ITEM.stackable = true;
	ITEM.description = "Un crocheton rouillé, il semble à peine tenir.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png"
	
	ITEM.itemSpawnerInfo = {category = "Junk", rarity = 350, onGround = false, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();