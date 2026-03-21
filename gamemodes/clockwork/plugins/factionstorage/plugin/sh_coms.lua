--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local COMMAND = Clockwork.command:New("ContSetFactionLock")
COMMAND.tip = "Définir le verrouillage de faction d'un conteneur."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor()

	if (IsValid(trace.Entity)) then
		if (Clockwork.entity:IsPhysicsEntity(trace.Entity)) then
			local model = string.lower(trace.Entity:GetModel())

			if (cwStorage.containerList[model]) then
				if (!trace.Entity.cwInventory) then
					cwStorage.storage[trace.Entity] = trace.Entity
					trace.Entity.cwInventory = {}
				end
				
				player.cwFactionStorageSetup = true;
				player.cwFactionStorageEditing = trace.Entity;
				
				local data = trace.Entity.cwFactionLock or {};
				
				netstream.Start(player, "FactionStorageAdd", {
					name = trace.Entity:GetNetworkedString("Name") or "Container",
					factions = data.factions or {},
					subfactions = data.subfactions or {},
					ranks = data.ranks or {},
					subfaiths = data.subfaiths or {},
				});
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
			end
		else
			Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("ContTakeFactionLock")
COMMAND.tip = "Réinitialiser le verrouillage de faction d'un conteneur."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor()

	if (IsValid(trace.Entity)) then
		if (Clockwork.entity:IsPhysicsEntity(trace.Entity)) then
			local model = string.lower(trace.Entity:GetModel())

			if (cwStorage.containerList[model]) then
				if !trace.Entity.cwFactionLock then
					Schema:EasyText(player, "grey", "["..self.name.."] Ce conteneur n'a pas de verrouillage par faction!")
				
					return;
				end
				
				if (!trace.Entity.cwInventory) then
					cwStorage.storage[trace.Entity] = trace.Entity
					trace.Entity.cwInventory = {}
				end
				
				trace.Entity.cwFactionLock = nil;

				if !trace.Entity.cwPassword then
					trace.Entity.cwLockTier = nil;
					trace.Entity:SetNWBool("unlocked", true);
				end
				
				cwStorage:SaveStorage();

				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Le verrouillage par faction de ce conteneur a été retiré.")
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
			end	
		else
			Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("ContCopyFactionLock")
COMMAND.tip = "Copiez le verrouillage de faction d'un conteneur. Collez avec ContPasteFactionLock."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"
COMMAND.alias = {"CopyFactionLock"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor()

	if (IsValid(trace.Entity)) then
		if (Clockwork.entity:IsPhysicsEntity(trace.Entity)) then
			local model = string.lower(trace.Entity:GetModel())

			if (cwStorage.containerList[model]) then
				if !trace.Entity.cwFactionLock then
					Schema:EasyText(player, "grey", "["..self.name.."] Ce conteneur n'a pas de verrouillage par faction!")
				
					return;
				end
				
				if (!trace.Entity.cwInventory) then
					cwStorage.storage[trace.Entity] = trace.Entity
					trace.Entity.cwInventory = {}
				end
				
				player.cwFactionLockCopy = table.Copy(trace.Entity.cwFactionLock);

				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Le verrouillage par faction de ce conteneur a été copié!")
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
			end	
		else
			Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
	end
end

COMMAND:Register()

local COMMAND = Clockwork.command:New("ContPasteFactionLock")
COMMAND.tip = "Colle le verrouillage de faction d'un conteneur copié sur un autre conteneur."
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "a"
COMMAND.alias = {"PasteFactionLock"};

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local trace = player:GetEyeTraceNoCursor()

	if (IsValid(trace.Entity)) then
		if (Clockwork.entity:IsPhysicsEntity(trace.Entity)) then
			local model = string.lower(trace.Entity:GetModel())

			if (cwStorage.containerList[model]) then
				if (!trace.Entity.cwInventory) then
					cwStorage.storage[trace.Entity] = trace.Entity
					trace.Entity.cwInventory = {}
				end
				
				local data = player.cwFactionLockCopy;
				
				if !data then
					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Vous n'avez pas de verrouillage par faction copié!")
				
					return false;
				end

				if !table.IsEmpty(data.factions) or !table.IsEmpty(data.subfactions) or !table.IsEmpty(data.ranks) or !table.IsEmpty(data.subfaiths) then
					trace.Entity.cwFactionLock = table.Copy(data);
					trace.Entity.cwLockTier = 3;
					trace.Entity:SetNWBool("unlocked", false);
					trace.Entity:SetNWBool("hasPassword", true);
				else
					trace.Entity.cwFactionLock = nil;
					trace.Entity.cwLockTier = nil;
					trace.Entity:SetNWBool("unlocked", true);
					
					if !trace.Entity.cwPassword then
						trace.Entity:SetNWBool("hasPassword", false);
					end
				end
				
				cwStorage:SaveStorage();

				Schema:EasyText(player, "cornflowerblue", "["..self.name.."] Le verrouillage par faction de ce conteneur a été collé!")
			else
				Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
			end	
		else
			Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
		end
	else
		Schema:EasyText(player, "grey", "["..self.name.."] Ce n'est pas un conteneur valide!")
	end
end

COMMAND:Register()
