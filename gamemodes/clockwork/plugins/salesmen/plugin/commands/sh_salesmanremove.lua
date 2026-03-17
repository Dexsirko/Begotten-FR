--[[
	BEGOTTEN III: Developed by DETrooper, cash wednesday, gabs & alyousha35
--]]

local COMMAND = Clockwork.command:New("SalesmanRemove")
COMMAND.tip = "Retirez un vendeur à la position que vous ciblez."
COMMAND.access = "s"

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity

	if (IsValid(target)) then
		if (target:GetClass() == "cw_salesman") then
			for k, v in pairs(cwSalesmen.salesmen) do
				if (target == v) then
					target:Remove()
					cwSalesmen.salesmen[k] = nil
					cwSalesmen:SaveSalesmen()

					Schema:EasyText(player, "cornflowerblue", "["..self.name.."] You have removed a salesman.")

					return
				end
			end
		else
			Schema:EasyText(player, "darkgrey", "Cette entité n'est pas un vendeur !")
		end
	else
		Schema:EasyText(player, "grey", "Vous devez regarder une entité valide !")
	end
end

COMMAND:Register()