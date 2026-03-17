local Clockwork = Clockwork;

local COMMAND = Clockwork.command:New("SummonItem");
COMMAND.tip = "Fait apparaître un objet à l'endroit où vous regardez.";
COMMAND.text = "<string Item>";
COMMAND.access = "s";
COMMAND.types = {"SpawnItem"}
COMMAND.arguments = 1;

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
    local itemTable = Clockwork.item:FindByID(arguments[1]);
				
    if (itemTable and !itemTable.isBaseItem) then
        local trace = player:GetEyeTraceNoCursor();
        
        if (trace.Hit) then
            local itemTable = Clockwork.item:CreateInstance(itemTable("uniqueID"));
            local entity = Clockwork.entity:CreateItem(player, itemTable, trace.HitPos);
			
			entity:SetRenderMode(RENDERMODE_TRANSCOLOR);
			entity:SetColor(Color(255, 255, 255, 0));
			
            ParticleEffect("teleport_fx", trace.HitPos, Angle(0,0,0), entity);
            sound.Play("misc/summon.wav", trace.HitPos, 100, 100);
			
            timer.Create("summonitem"..CurTime(), 0.75, 1, function()
                if (IsValid(entity)) then
                    Clockwork.entity:MakeFlushToGround(entity, trace.HitPos, trace.HitNormal);
					entity:SetColor(Color(255, 255, 255, 255));
                end;
				
				util.Decal("PentagramBurn", trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal);
            end);
        else
            Schema:EasyText(player, "darkgrey", "Regarde un endroit valide ! L'objet ne peut pas être généré ici.");
        end;
    else
        Schema:EasyText(player, "grey", "Ceci n'est pas un objet valide !");
    end;
end;

COMMAND:Register();