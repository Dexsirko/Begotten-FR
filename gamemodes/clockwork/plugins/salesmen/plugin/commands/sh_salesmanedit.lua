--[[
	BEGOTTEN III: Developed by DETrooper, cash wednesday, gabs & alyousha35
--]]

local COMMAND = Clockwork.command:New("SalesmanEdit")
COMMAND.tip = "Modifie un vendeur à la position de votre cible."
COMMAND.text = "[number Animation]"
COMMAND.flags = CMD_DEFAULT
COMMAND.access = "s"
COMMAND.optionalArguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = player:GetEyeTraceNoCursor().Entity

	if (IsValid(target)) then
		if (target:GetClass() == "cw_salesman") then
			local salesmanTable = cwSalesmen:GetTableFromEntity(target)

			player.cwSalesmanSetup = true
			player.cwSalesmanAnim = tonumber(arguments[1])
			player.cwSalesmanPos = target:GetPos()
			player.cwSalesmanAng = target:GetAngles()
			player.cwSalesmanHitPos = player:GetEyeTraceNoCursor().HitPos
			player.cwSalesmanEditing = target;

			if (!player.cwSalesmanAnim and type(arguments[1]) == "string") then
				player.cwSalesmanAnim = tonumber(_G[arguments[1]])
			end

			if (!player.cwSalesmanAnim and salesmanTable.animation) then
				player.cwSalesmanAnim = salesmanTable.animation
			end

			netstream.Start(player, "SalesmanEdit", salesmanTable)

			--[[for k, v in pairs(cwSalesmen.salesmen) do
				if (target == v) then
					target.cwCash = nil
					target:Remove()
					cwSalesmen.salesmen[k] = nil
					cwSalesmen:SaveSalesmen()

					return
				end
			end]]--
		else
			Schema:EasyText(player, "darkgrey", "Cette entité n'est pas un vendeur !")
		end
	else
		Schema:EasyText(player, "grey", "Vous devez regarder une entité valide !")
	end
end

COMMAND:Register()