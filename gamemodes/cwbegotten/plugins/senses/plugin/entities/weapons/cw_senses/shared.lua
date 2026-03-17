--[[
	Begotten 3
	Created by cash wednesday, gabs, DETrooper and alyousha35
--]]

if (SERVER) then
	AddCSLuaFile("shared.lua");
end;

if (CLIENT) then
	SWEP.Slot = 1;
	SWEP.SlotPos = 5;
	SWEP.DrawAmmo = false;
	SWEP.PrintName = "Senses";
	SWEP.DrawCrosshair = false;
end

SWEP.Instructions = "Tir principal : Basculer";
SWEP.Purpose = "If you are in a dark area and cannot see, you can use your senses to navigate.";
SWEP.Contact = "";
SWEP.Author	= "";

SWEP.WorldModel = "";
SWEP.ViewModel = "models/weapons/c_arms.mdl";
SWEP.HoldType = "fist";
SWEP.Weight = 1

SWEP.Primary.DefaultClip = 0;
SWEP.Primary.Automatic = false;
SWEP.Primary.ClipSize = -1;
SWEP.Primary.Ammo = "";

SWEP.Secondary.DefaultClip = 0;
SWEP.Secondary.Automatic = false;
SWEP.Secondary.ClipSize = -1;
SWEP.Secondary.Ammo	= "";

SWEP.NoIronSightFovChange = true;
SWEP.NoIronSightAttack = true;
SWEP.IronSightPos = Vector(0, 0, 0);
SWEP.IronSightAng = Vector(0, 0, 0);
SWEP.NeverRaised = true;
SWEP.LoweredAngles = Angle(0.000, 0.000, -22.000);

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

function SWEP:Deploy()
	self:SetNextPrimaryFire(CurTime() + 0.25);
	self:SetNextSecondaryFire(CurTime() + 0.25);
	
	if SERVER then
		local player = self.Owner;
	
		if player.spawning then
			return;
		end
		
		if !(cwBeliefs and (player:HasBelief("creature_of_the_dark") or player:HasBelief("the_black_sea"))) and !player:GetNetVar("hasThermal") and !player:GetNetVar("hasNV") then
			local clothesItem = player:GetClothesEquipped();
			
			if (!clothesItem or (clothesItem and !clothesItem.attributes) or (clothesItem and clothesItem.attributes and !table.HasValue(clothesItem.attributes, "thermal_vision"))) and !player:GetCharmEquipped("thermal_implant") then
				player:SensesOn()
			end
		end
	end
end

function SWEP:Holster(newWeapon)
	if SERVER then
		local player = self.Owner;
		
		if !IsValid(newWeapon) or newWeapon:GetClass() ~= "cw_senses" then
			if !(cwBeliefs and (player:HasBelief("creature_of_the_dark") or player:HasBelief("the_black_sea"))) and !player:GetNetVar("hasThermal") and !player:GetNetVar("hasNV") then
				local clothesItem = player:GetClothesEquipped();
			
				if (!clothesItem or (clothesItem and !clothesItem.attributes) or (clothesItem and clothesItem.attributes and !table.HasValue(clothesItem.attributes, "thermal_vision"))) and !player:GetCharmEquipped("thermal_implant") then
					self.Owner:SensesOff();
				end
			end
		end
	end
	
	return true;
end

-- Called when the player attempts to primary fire.
function SWEP:PrimaryAttack()
	if SERVER then
		local clothesItem;
		
		if self.Owner.GetClothesEquipped then
			clothesItem = self.Owner:GetClothesEquipped();
		end
				
		if (cwBeliefs and self.Owner.HasBelief and (self.Owner:HasBelief("creature_of_the_dark") or self.Owner:HasBelief("the_black_sea"))) or (clothesItem and clothesItem.attributes and table.HasValue(clothesItem.attributes, "thermal_vision")) or self.Owner:GetCharmEquipped("thermal_implant") then
			if !self.Owner.sensesOn then
				self.Owner:SensesOn();
			else
				self.Owner:SensesOff();
			end
		end
		
		self:SetNextPrimaryFire(CurTime() + 2);
		
		return false;
	end
end;

-- Called when the player attempts to secondary fire.
function SWEP:SecondaryAttack()
	if SERVER then
		local clothesItem;
		
		if self.Owner.GetClothesEquipped then
			clothesItem = self.Owner:GetClothesEquipped();
		end
		
		if (clothesItem and clothesItem.attributes and table.HasValue(clothesItem.attributes, "night_vision")) or self.Owner:GetCharmEquipped("thermal_implant") then
			if !self.Owner.sensesOn then
				self.Owner:SensesOn(true);
			else
				self.Owner:SensesOff();
			end
			
			self:SetNextSecondaryFire(CurTime() + 2);
		elseif cwBeliefs and self.Owner.HasBelief and (self.Owner:HasBelief("embrace_the_darkness")) and !self.Owner.opponent then
			local lastZone = self.Owner:GetCharacterData("LastZone");
			local valid_zones = {"scrapper", "wasteland"};
			
			if (((cwDayNight and cwDayNight.currentCycle == "night") or (!cwWeather or cwWeather.weather == "bloodstorm")) and table.HasValue(valid_zones, lastZone)) or lastZone == "caves" then
				if self.Owner:Crouching() then
					if !self.Owner.cloaked then
						local curTime = CurTime();

						if !self.Owner.cloakCooldown or self.Owner.cloakCooldown <= curTime then
							local playerPos = self.Owner:GetPos();
							local blockedCloak;
							
							for _, v in _player.Iterator() do
								if v:GetNetVar("yellowBanner") then
									if (v:GetPos():Distance(playerPos) <= config.Get("talk_radius"):Get()) then
										blockedCloak = true;
									
										break;
									end
								end
							end
						
							if !blockedCloak then
								self.Owner:Cloak();
							end
						elseif (self.Owner.cloakCooldown - curTime) > 5 then
							Schema:EasyText(self.Owner, "chocolate", "Vous êtes couvert de poudre noire et ne pouvez pas vous camoufler pendant encore"..math.ceil(self.Owner.cloakCooldown - curTime).." seconds!");
						else
							Schema:EasyText(self.Owner, "chocolate", "Vous ne pouvez pas vous camoufler avant encore"..math.ceil(self.Owner.cloakCooldown - curTime).." seconds!");
						end
					else
						self.Owner:Uncloak();
					end
				else
					Schema:EasyText(self.Owner, "chocolate", "Vous devez être accroupi pour activer ou désactiver le camouflage.");
				end
			else
				Schema:EasyText(self.Owner, "peru", "Vous devez être dans le no man's land ou les mines, et il doit actuellement faire nuit ou y avoir une tempête de sang (si vous êtes en surface) pour activer le camouflage.");
			end
			
			self:SetNextSecondaryFire(CurTime() + 2);
		end
	end
	
	return false;
end;