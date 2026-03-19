--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

Clockwork.kernel:IncludePrefixed("shared.lua");

AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

local cwDueling = cwDueling;

-- Called when the entity initializes.
function ENT:Initialize()
	self:SetModel("models/props/begotten/misc/duel_statue.mdl");
	self:SetMoveType(MOVETYPE_VPHYSICS);
	self:PhysicsInit(SOLID_VPHYSICS);
	self:SetUseType(SIMPLE_USE);
	self:SetSolid(SOLID_VPHYSICS);
	self:SetCollisionGroup(COLLISION_GROUP_WORLD);
	--[[self.Sound = CreateSound(self, "ambient/statue/st_seventhday_01.wav");
	self.Sound:PlayEx(0.2, 100);]]--

	local physicsObject = self:GetPhysicsObject();
	
	if (IsValid(physicsObject)) then
		physicsObject:Wake();
		physicsObject:EnableMotion(false);
	end;
end;

-- Called when the entity's transmit state should be updated.
function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS;
end;

-- add a cooldown for the caller using the entity
function ENT:Use(activator, caller)
	if IsValid(caller) and caller:IsPlayer() then
		if caller.opponent == nil then
			if (!cwDueling:PlayerIsInMatchmaking(caller)) then
				-- Todo: Show matchmaking message/UI.
				
				for k, v in pairs(caller:GetWeapons()) do
					local weaponItemTable = item.GetByWeapon(v);
					
					if weaponItemTable then
						if weaponItemTable.category == "Firearms" then
							Schema:EasyText(caller, "peru","Vous ne pouvez pas entrer en duel avec une arme à feu équipée !");
							
							return;
						elseif weaponItemTable.category == "Crossbows" then
							Schema:EasyText(caller, "peru","Vous ne pouvez pas entrer en duel avec une arbalète équipée !");
							
							return;
						end
					end
				end
				
				Clockwork.dermaRequest:RequestConfirmation(caller, "Duel", "Êtes-vous sûr de vouloir faire la queue pour un duel ? Notez que vous ne perdrez pas votre progression ni vos objets en cas de mort.", function()
					if caller:Alive() and IsValid(self) then
						if caller:GetPos():DistToSqr(self:GetPos()) > (256 * 256) then
							return;
						end
						
						if !caller.duelData then
							caller.duelData = {};
						end
						
						caller.duelData.duelStatue = self;
						
						cwDueling:PlayerEntersMatchmaking(caller);
					end
				end);
			else
				Schema:EasyText(caller, "icon16/shield_go.png", "orange", "Sorti du Matchmaking de Duel")
				
				cwDueling:PlayerExitsMatchmaking(caller);
				
				caller.duelData = nil;
			end;
		end;
	end;
end;

--[[function ENT:OnRemove()
	self.Sound:Stop();
end;]]--