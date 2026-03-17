PLUGIN:SetGlobalAlias("cwLobotomy");

Clockwork.kernel:IncludePrefixed("cl_hooks.lua");
Clockwork.kernel:IncludePrefixed("sv_hooks.lua");

cwLobotomy.minimumLobotomyDelay = 300; -- 5 minutes
cwLobotomy.maximumLobotomyDelay = 900; -- 15 minutes
cwLobotomy.effectDuration = 5;

local COMMAND = Clockwork.command:New("CharLobotomyEffect");
	COMMAND.tip = "Forcer un joueur à subir l'effet de lobotomie, qu'il soit lobotomisé ou non.";
	COMMAND.text = "<string Name>";
	COMMAND.access = "s";
	COMMAND.arguments = 1;
	COMMAND.alias = {"LobotomyEffect", "PlyLobotomyEffect"};

	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1]);
		if(!IsValid(target)) then Clockwork.player:Notify(player, arguments[1].." is not a valid player!"); end

        cwLobotomy:LobotomyEffect(target, CurTime());

	end

COMMAND:Register();