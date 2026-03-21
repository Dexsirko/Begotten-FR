PLUGIN:SetGlobalAlias("cwAnomalous")

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("cl_plugin.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

local COMMAND = Clockwork.command:New("cosmicrupture");
	COMMAND.tip = "Provoque une Rupture Cosmique dans le Wasteland.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		Clockwork.chatBox:Add(nil, player, "event", "Le sol se met soudain à trembler violemment et le ciel explose d'éclairs tandis qu'un torrent d'énergie cosmique balaie le Wasteland. Les survivants expérimentés savent ce que cela signifie...");
		
		for _, v in _player.Iterator() do
			if IsValid(v) then
				-- Maybe check to see if zone is wasteland/tower/scrap factory/toothboy?
				netstream.Start(v, "FadeAmbientMusic");
				netstream.Start(v, "FadeBattleMusic");
				netstream.Start(v, "CosmicRupture");
			end
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("radiocrazy");
	COMMAND.tip = "Faites dérailler la radio que vous regardez.";
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = player:GetEyeTraceNoCursor().Entity;
		
		if IsValid(target) then
			if (target:GetClass() == "cw_radio") then
				if not target:IsCrazy() then
					cwAnomalous:MakeRadioCrazy(target);
				end
			end
		end
	end;
COMMAND:Register();

local COMMAND = Clockwork.command:New("tvhallucination");
	COMMAND.tip = "Déclencher manuellement une hallucination de télévision pour un joueur.";
	COMMAND.text = "<string Name> [bool TriggerOnSelf]"
	COMMAND.access = "s";
	COMMAND.arguments = 1
	COMMAND.optionalArguments = 1;
	COMMAND.types = {"Player"}

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		
		if (target) then
			netstream.Start(target, "StartNearestTVHallucination");
		else
			Schema:EasyText(player, "grey", "["..self.name.."] "..arguments[1].." n’est pas un joueur valide !");
		end
		
		if arguments[2] then
			netstream.Start(player, "StartNearestTVHallucination");
		end
	end;
COMMAND:Register();