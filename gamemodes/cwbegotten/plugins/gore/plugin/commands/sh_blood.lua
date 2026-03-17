local COMMAND = Clockwork.command:New("Blood");
	COMMAND.tip = "Crée un effet de sang sur l'entité que tu regardes.";
	COMMAND.flags = CMD_DEFAULT;
	COMMAND.access = "s";

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local eyeTrace = player:GetEyeTrace();
		
		if (eyeTrace.Entity and IsValid(eyeTrace.Entity) and !eyeTrace.Entity:IsWorld()) then
			cwGore:BloodEffect(eyeTrace.Entity, eyeTrace.HitPos)
		end;
	end;
COMMAND:Register();