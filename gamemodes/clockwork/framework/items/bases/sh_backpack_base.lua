local Clockwork = Clockwork;

local ITEM = Clockwork.item:New(nil, true);
ITEM.name = "Backpack Base";
ITEM.uniqueID = "backpack_base";
ITEM.model = "models/props_c17/suitcase_passenger_physics.mdl";
ITEM.weight = 2; -- The real, actual weight of the item (as opposed to the perceived weight)
ITEM.invSpace = 4; -- The amount of additional space this item gives when equipped
ITEM.useText = "Equip";
ITEM.category = "Backpacks";
ITEM.description = "Un joli sac à dos noir capable de contenir des affaires.";
ITEM.slots = {"Backpacks"};
ITEM.equipmentSaveString = "backpack";

-- Called when a player has unequipped the item.
function ITEM:OnPlayerUnequipped(player, extraData)
	if Clockwork.equipment:UnequipItem(player, self) then
		local useSound = self.useSound;
		local infoTable = player.cwInfoTable;

		infoTable.inventoryWeight = Clockwork.inventory:CalculateWeight(player:GetInventory());
		infoTable.maxWeight = player:GetMaxWeight();
		
		--[[player:SetLocalVar("InvWeight", math.ceil(infoTable.inventoryWeight))
		
		if infoTable.inventorySpace then
			player:SetLocalVar("InvSpace", math.ceil(infoTable.inventorySpace))
		end]]--
		
		if !player:IsNoClipping() and (!player.GetCharmEquipped or !player:GetCharmEquipped("urn_silence")) then
			if (useSound) then
				if (type(useSound) == "table") then
					player:EmitSound(useSound[math.random(1, #useSound)]);
				else
					player:EmitSound(useSound);
				end;
			elseif (useSound != false) then
				player:EmitSound("begotten/items/first_aid.wav");
			end;
		end
		
		return true;
	end
	
	return false;
end

function ITEM:HasPlayerEquipped(player)
	return player:GetBackpackEquipped(self);
end

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if (self:HasPlayerEquipped(player)) then
		if !player.spawning then
			Schema:EasyText(player, "peru", "Vous ne pouvez pas lâcher un objet que vous portez actuellement.")
		end
		
		return false
	end
end

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	if (self:HasPlayerEquipped(player)) then
		if !player.spawning then
			Schema:EasyText(player, "peru", "Vous ne pouvez pas équiper un objet que vous utilisez déjà.")
		end
		
		return false
	end
	
	if !Clockwork.player:HasFlags(player, "S") then
		local faction = player:GetFaction();
		local subfaction = player:GetSubfaction();
		local kinisgerOverride = player:GetNetVar("kinisgerOverride");
		local kinisgerOverrideSubfaction = player:GetNetVar("kinisgerOverrideSubfaction");
		
		if self.excludedFactions and #self.excludedFactions > 0 then
			if (table.HasValue(self.excludedFactions, kinisgerOverride or faction)) then
				if !self.includedSubfactions or #self.includedSubfactions < 1 or !table.HasValue(self.includedSubfactions, kinisgerOverrideSubfaction or subfaction) then
					if !player.spawning then
						Schema:EasyText(player, "chocolate", "Vous n'êtes pas de la faction appropriée pour équiper ce sac à dos !")
					end
					
					return false
				end
			end
		end
		
		if self.excludedSubfactions and #self.excludedSubfactions > 0 then
			if (table.HasValue(self.excludedSubfactions, kinisgerOverrideSubfaction or subfaction)) then
				if !player.spawning then
					Schema:EasyText(player, "chocolate", "Vous n'êtes pas de la bonne sous-faction pour équiper ce sac à dos !")
				end
				
				return false
			end
		end
		
		if self.requiredFaiths and #self.requiredFaiths > 0 then
			if (!table.HasValue(self.requiredFaiths, player:GetFaith())) then
				if !self.kinisgerOverride or self.kinisgerOverride and !player:GetCharacterData("apostle_of_many_faces") then
					if !player.spawning then
						Schema:EasyText(player, "chocolate", "Vous n'avez pas la foi requise pour équiper ce sac à dos !")
					end
					
					return false
				end
			end
		end
		
		if self.requiredSubfaiths and #self.requiredSubfaiths > 0 then
			if (!table.HasValue(self.requiredSubfaiths, player:GetSubfaith())) then
				if !self.kinisgerOverride or self.kinisgerOverride and !player:GetCharacterData("apostle_of_many_faces") then
					if !player.spawning then
						Schema:EasyText(player, "chocolate", "Vous n'êtes pas de la sous-foi appropriée pour équiper ce sac à dos !")
					end
					
					return false
				end
			end
		end
		
		if self.requiredFactions and #self.requiredFactions > 0 then
			if (!table.HasValue(self.requiredFactions, faction) and (!kinisgerOverride or !table.HasValue(self.requiredFactions, kinisgerOverride))) then
				if !player.spawning then
					Schema:EasyText(player, "chocolate", "Vous n'êtes pas de la faction appropriée pour équiper ce sac à dos !")
				end
				
				return false
			end
		end
		
		if self.requiredSubfactions and #self.requiredSubfactions > 0 then
			if (!table.HasValue(self.requiredSubfactions, subfaction) and (!kinisgerOverrideSubfaction or !table.HasValue(self.requiredSubfactions, kinisgerOverrideSubfaction))) then
				if !player.spawning then
					Schema:EasyText(player, "peru", "Vous n'appartenez pas à la sous-faction autorisée à équiper ce sac à dos !")
				end
				
				return false
			end
		end
		
		if self.requiredRanks and #self.requiredRanks > 0 then
			local rank = player:GetCharacterData("rank", 1);
			
			if Schema.Ranks[faction] then
				local rankString = Schema.Ranks[faction][rank];
				
				if rankString then
					if (!table.HasValue(self.requiredRanks, rankString)) then
						if !player.spawning then
							Schema:EasyText(player, "peru", "Vous n'avez pas le rang requis pour équiper ce sac à dos !")
						
							return false;
						end
					end
				end
			end
		end
	end

	if (player:Alive()) then
		local backpack = player:GetBackpackEquipped();
		
		if backpack and backpack.uniqueID == self.uniqueID then
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous avez déjà un sac à dos de ce type équipé !")
			end
			
			return false
		end
		
		local infoTable = player.cwInfoTable;

		infoTable.inventoryWeight = Clockwork.inventory:CalculateWeight(player:GetInventory());
		infoTable.maxWeight = player:GetMaxWeight();
		
		--[[player:SetLocalVar("InvWeight", math.ceil(infoTable.inventoryWeight))
		
		if infoTable.inventorySpace then
			player:SetLocalVar("InvSpace", math.ceil(infoTable.inventorySpace))
		end]]--
		
		Clockwork.equipment:EquipItem(player, self, "Backpacks")

		return true
	else
		if !player.spawning then
			Schema:EasyText(player, "peru", "Vous ne pouvez pas effectuer cette action pour le moment.")
		end
	end

	return false
end

function ITEM:OnInstantiated()
	-- why is this here?
	--printp("FUCKED")
end;

ITEM:Register();