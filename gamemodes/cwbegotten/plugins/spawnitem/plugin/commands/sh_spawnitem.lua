local Clockwork = Clockwork;

if Clockwork.command.RegisterType then
	Clockwork.command:RegisterType("SpawnItem", function (current_arg, _args)
		local matches = {}
	
		for k, v in pairs(item.stored) do
			local itemName = v("name");
			
			if string.find(string.lower(itemName), string.lower(current_arg)) then
				table.insert(matches, itemName)
			end
		end
	
		return matches
	end)
end

local COMMAND = Clockwork.command:New("SpawnItem");
COMMAND.tip = "Fait apparaître un objet là où vous regardez.";
COMMAND.text = "<string Item>";
COMMAND.access = "s";
COMMAND.types = {"SpawnItem"}
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
		local itemTable = Clockwork.item:FindByID(arguments[1]);
				
				if (itemTable and !itemTable.isBaseItem) then
					local trace = player:GetEyeTraceNoCursor();
					
					itemTable = Clockwork.item:CreateInstance(itemTable("uniqueID"));
					local entity = Clockwork.entity:CreateItem(player, itemTable, trace.HitPos);

					if (IsValid(entity)) then
						undo.Create("Item")
						undo.AddEntity(entity)
						undo.SetPlayer(player)
						undo.Finish()
						Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
					end;
			
			
				else
					Schema:EasyText(player, "grey", "Ceci n'est pas un objet valide !");
				end;
end;

COMMAND:Register();