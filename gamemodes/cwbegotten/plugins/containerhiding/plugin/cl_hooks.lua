--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

-- Called when an entity's menu options are needed.
function cwContainerHiding:GetEntityMenuOptions(entity, options)
	local class = entity:GetClass();
	
	if (class == "prop_physics") then
		local model = entity:GetModel();
		
		if (table.HasValue(self.containerProps["white"], string.lower(model)) or table.HasValue(self.containerProps["black"], string.lower(model))) then
			if (entity:GetNWBool("unlocked", true) == true) then
				if (Clockwork.Client:GetNetVar("hidden")) then
					options["Ouvrir"] = nil;
					options["Se cacher"] = "cw_entityUnHide";
				else
					options["Se montrer"] = "cw_entityHide";
				end;
			end
		end;
	end;
end;

-- Called when the post progress bar info is needed.
function cwContainerHiding:GetProgressBarInfoAction(action, percentage)
	if (action == "hide") then
		return {text = "Vous vous cachez dans le placard. Cliquez pour annuler..", percentage = percentage, flash = percentage > 75};
	end;
	
	if (action == "unhide") then
		return {text = "Vous sortez du placard. Cliquez pour annuler.", percentage = percentage, flash = percentage > 75};
	end;
end;