--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local function UpdateActiveRituals(player, ritualName, endTime)
    local activeRituals = player:GetNetVar("activeRituals", {})
    if endTime then
        activeRituals[ritualName] = endTime
    else
        activeRituals[ritualName] = nil
    end
    player:SetNetVar("activeRituals", activeRituals)
end

local function IsAreaClear(position, radius, player)
	for k, v in pairs (ents.FindInSphere(position, radius)) do
		if v:IsPlayer() or v:IsNPC() or v:IsNextBot() then
			if player and v == player then continue end;
			
			return false;
		end
	end
	
	return true;
end

local RITUAL = cwRituals.rituals:New("purifying_stone_rite");
	RITUAL.name = "(T2) Rituel de la Pierre Purificatrice";
	RITUAL.description = "Imprégner quelque chose non seulement de pureté, mais aussi de la capacité à répandre sa nature purifiée à son environnement est un acte de foi pratiqué par peu. L'exécution de ce rituel invoque un objet Pierre de Purification. Supprime 10 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shieldwall", "shedskin", "flagellant", "acolyte", "soothsayer", "heretic"}; -- Tier II Shared Ritual
	
	RITUAL.requirements = {"light_catalyst", "up_catalyst", "trinity_catalyst"};
	RITUAL.result = {
		["purifying_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = -10; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
		if cwSanity then
			player:HandleSanity(20);
		end
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("yellow_banner_of_quelling");
	RITUAL.name = "(T2) Bannière Jaune de l'Apaisement";
	RITUAL.description = "Les enfants fuient lorsqu'ils aperçoivent la bannière invisible. Que cette ordure satanique tremble en réalisant qu'elle est désormais enchaînée à ces terres mortelles qu'elle a souillées si longtemps. L'exécution de ce rituel empêche les voyages infernaux dans un large rayon et le camouflage dans un rayon plus restreint autour de vous pendant 30 minutes. Attention : les Enfants de Satan seront informés de votre présence ! Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shieldwall", "shedskin", "flagellant", "acolyte"}; -- Tier II Light/Family Ritual
	
	RITUAL.requirements = {"purifying_stone", "xolotl_catalyst", "down_catalyst"};

	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.

	function RITUAL:OnPerformed(player)
		player:SetNetVar("yellowBanner", true)
		local endTime = CurTime() + 1800
		UpdateActiveRituals(player, "Yellow Banner of Quelling", endTime)
		timer.Create("YellowBannerTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player:GetNetVar("yellowBanner", false) then
					player:SetNetVar("yellowBanner", false)
					UpdateActiveRituals(player, "Yellow Banner of Quelling", nil)
					Clockwork.hint:Send(player, "Le rituel de la 'Bannière Jaune de l'Apaisement' s'est dissipé...", 10, Color(175, 100, 100), true, true)
				end
			end
		end)
	end
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("xolotl_catalyst");
	RITUAL.name = "(T2) Rituel du Catalyseur Xolotl";
	RITUAL.description = "L'énergie est canalisée dans la pierre. Elle pourrait servir à quelque chose de plus grand. L'exécution de ce rituel invoque un objet Xolotl Catalyst. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shieldwall", "shedskin", "flagellant", "acolyte", "soothsayer", "heretic"}; -- Tier II Shared Ritual
	
	RITUAL.requirements = {"down_catalyst", "up_catalyst", "ice_catalyst"};
	RITUAL.result = {
		["xolotl_catalyst"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("holy_spirit_rite");
	RITUAL.name = "(T2) Rite de l'Esprit Saint";
	RITUAL.description = "Depuis la mort de Dieu, les esprits errent sur les terres des hommes. Capturez-en un dans la pierre avant qu'il ne soit corrompu par l'impureté ! L'exécution de ce rituel invoque un objet Esprit Saint. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"flagellant", "acolyte"}; -- Tier II Faith of the Light Ritual
	
	RITUAL.requirements = {"light_catalyst", "trinity_catalyst", "light_catalyst"};
	RITUAL.result = {
		["holy_spirit"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("tortured_spirit_rite");
	RITUAL.name = "(T2) Rite de l'Esprit Torturé";
	RITUAL.description = "Piège un esprit lumineux condamné à une éternité de tourments et utilise-le comme source de pouvoir interdit. L'exécution de ce rituel invoque un objet Esprit Torturé. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"down_catalyst", "belphegor_catalyst", "belphegor_catalyst"};
	RITUAL.result = {
		["tortured_spirit"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("pentagram_catalyst_rite");
	RITUAL.name = "(T2) Rituel du Pentagramme Catalyseur";
	RITUAL.description = "Peur, souffrance et cris du malheur cristallisés dans ta paume. L'exécution de ce rituel invoque un objet Pentagram Catalyst. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"down_catalyst", "belphegor_catalyst", "down_catalyst"};
	RITUAL.result = {
		["pentagram_catalyst"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("judgement_sigil_rite");
	RITUAL.name = "(Rituel Unique) Rite de la Pierre Sigillaire du Jugement";
	RITUAL.description = "Manifestez votre haine et votre honte en une pierre sigillaire. L'exécution de ce rituel invoque une Pierre Sigillaire du Jugement. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"extinctionist"}; -- Unique Sol Orthodoxy Ritual
	
	RITUAL.requirements = {"down_catalyst", "light_catalyst", "purifying_stone"};
	RITUAL.result = {
		["judgemental_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("judgement_sigil_vengeful");
	RITUAL.name = "(T3) Rituel de la Pierre Sigillaire Vengeresse";
	RITUAL.description = "Manifestez votre courroux dans une pierre sigillaire. L'exécution de ce rituel invoque une Pierre Sigillaire Vengeresse. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"familial_catalyst", "xolotl_catalyst", "purifying_stone"};
	RITUAL.result = {
		["vengeful_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("unholy_sigil_stone_rite");
	RITUAL.name = "(T2) Rituel de la Pierre Sigillaire Impie";
	RITUAL.description = "Tu ris au nez de tout ce qui est bon et vertueux. L'exécution de ce rituel invoque un objet Pierre de Sigil Impie. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual

	RITUAL.requirements = {"down_catalyst", "belphegor_catalyst", "pentagram_catalyst"};
	RITUAL.result = {
		["unholy_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("fire_sigil_stone_rite");
	RITUAL.name = "(T3) Rituel de la Pierre Sigillaire de Feu";
	RITUAL.description = "Crée un sceau de flammes. L'exécution de ce rituel invoque un objet Pierre de Sceau de Feu. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer", "watchful_raven", "emissary", "extinctionist"}; -- Tier III Shared Ritual
	
	RITUAL.requirements = {"light_catalyst", "belphegor_catalyst", "xolotl_catalyst"};
	RITUAL.result = {
		["fire_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("ice_sigil_stone_rite");
	RITUAL.name = "(T3) Rituel de la Pierre Sigillaire de Glace";
	RITUAL.description = "Crée un sceau de glace. L'exécution de ce rituel invoque un objet Pierre de Sceau de Glace. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer", "watchful_raven", "emissary", "extinctionist"}; -- Tier III Shared Ritual
	
	RITUAL.requirements = {"ice_catalyst", "ice_catalyst", "xolotl_catalyst"};
	RITUAL.result = {
		["ice_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("glazic_sigil_stone_rite");
	RITUAL.name = "(T3) Rituel de la Pierre Sigillaire Glazic";
	RITUAL.description = "Crée un sceau de majesté. L'exécution de ce rituel invoque un objet Pierre de Sceau Glazique. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"emissary"}; -- Hard-Glazed Unique Ritual
	
	RITUAL.requirements = {"holy_spirit", "xolotl_catalyst", "xolotl_catalyst"};
	RITUAL.result = {
		["glazic_sigil_stone"] = {amount = 1},
	};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("a_feast_of_ash_and_twig");
	RITUAL.name = "Un Festin de Cendres et de Branches";
	RITUAL.description = "Un rituel populaire à la mesure de la condition paysanne. Lorsque l'offrande est faite, l'appétit s'élargit pour inclure des déchets, de la terre, ou tout ce qui peut être trouvé et qui était auparavant franchement peu nourrissant. L'exécution de ce rituel restaure 80% de la faim et de la soif, ainsi que 80% du niveau de sang. Supprime 5 points de corruption.";
	RITUAL.onerequiredbelief = {"repentant", "disciple"}; -- Tier I Faith of the Light Ritual
	
	RITUAL.requirements = {"up_catalyst", "up_catalyst", "trinity_catalyst"};
	RITUAL.corruptionCost = -5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;
	
	function RITUAL:OnPerformed(player)
		player:HandleNeed("hunger", -80);
		player:HandleNeed("thirst", -80);
		player:ModifyBloodLevel(4000);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("aura_of_the_mother");
	RITUAL.name = "(T3) Aura de la Mère";
	RITUAL.description = "Les Druides peuvent canaliser leurs pouvoirs de guérison et les étendre à leur entourage. Chaque guerrier revigoré, la guerre contre les ronge-racines fait rage. L'exécution de ce rituel soignera passivement tout personnage de la Foi de la Famille à portée de conversation pendant les 10 prochaines minutes. Inflige 20 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"familial_catalyst", "pantheistic_catalyst", "purifying_stone"};
	RITUAL.corruptionCost = 20;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 75;

	function RITUAL:OnPerformed(player)
		player:SetNetVar("auraMotherActive", true);
		
		local auraMotherTick = 0;
		
		local endtime = CurTime() + 600
		UpdateActiveRituals(player, "Aura of the Mother", endtime);
		timer.Create("auraMotherTimer_"..player:EntIndex(), 5, 120, function() 
			auraMotherTick = auraMotherTick + 1;
			
			if IsValid(player) then
				local curTime = CurTime();
			
				for k, v in pairs (ents.FindInSphere(player:GetPos(), config.Get("talk_radius"):Get())) do
					if (v:IsPlayer() and v:GetFaith() == "Faith of the Family") then
						if !v.nextAuraMotherHeal or v.nextAuraMotherHeal <= curTime then
							v:SetHealth(math.min(v:Health() + 4, v:GetMaxHealth()));
							v:ModifyBloodLevel(15);
							v.nextAuraMotherHeal = curTime + 4.9;
						end
					end
				end
				
				if auraMotherTick == 120 then
					player:SetNetVar("auraMotherActive", false);
					UpdateActiveRituals(player, "Aura of the Mother", nil);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("blessing_of_coin");
	RITUAL.name = "Bénédiction de la Pièce";
	RITUAL.description = "Est-ce vraiment une faveur du Glazé, ou une illusion statistique ? Rien ne vous empêchera d'offrir des aumônes pour une récolte abondante. L'exécution de ce rituel augmente la quantité de pièces trouvées dans les contenants pendant 40 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"repentant", "disciple"}; -- Tier I Faith of the Light Ritual
	
	RITUAL.requirements = {"trinity_catalyst", "up_catalyst", "light_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;

	function RITUAL:OnPerformed(player)
		player:SetNetVar("blessingOfCoin", true);
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Blessing of Coin", endtime);
		timer.Create("BlessingOfCoinTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player:GetNetVar("blessingOfCoin", false) then
					player:SetNetVar("blessingOfCoin", false);
					UpdateActiveRituals(player, "Blessing of Coin", nil);
					Clockwork.hint:Send(player, "Le rituel de la 'Bénédiction de la Pièce' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("bloodhowl");
	RITUAL.name = "(T2) Hurlement de Sang";
	RITUAL.description = "La frénésie du combat vous galvanise ! Ce rituel fera en sorte que vos cris de guerre restaurent 50 points d'endurance et drainent 150 points de sang pendant 40 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shedskin"}; -- Tier II Faith of the Family Ritual
	
	RITUAL.requirements = {"down_catalyst", "familial_catalyst", "pantheistic_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.bloodHowlActive = true;
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Bloodhowl", endtime);
		timer.Create("BloodhowlTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player.bloodHowlActive then
					player.bloodHowlActive = nil;
					UpdateActiveRituals(player, "Bloodhowl", nil);
					Clockwork.hint:Send(player, "Le rituel 'Bloodhowl' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("bloodwings");
	RITUAL.name = "(T3) Ailes de Sang";
	RITUAL.description = "Les cieux saignent quand les anges battent des ailes. L'exécution de ce rituel accorde la capacité de double saut au prix de 15 points de sang pour les 30 prochaines minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer"}; -- Tier III Faith of the Dark Ritual
	RITUAL.requiredBeliefsSubfactionOverride = {["Rekh-khet-sa"] = {"embrace_the_darkness"}}; -- Tier III Faith of the Dark Ritual
	
	RITUAL.requirements = {"belphegor_catalyst", "up_catalyst", "up_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.bloodWingsActive = true;
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Bloodwings", endtime);
		timer.Create("BloodwingsTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player.bloodWingsActive then
					player.bloodWingsActive = nil;
					UpdateActiveRituals(player, "Bloodwings", nil);
					Clockwork.hint:Send(player, "Le rituel des 'Ailes de Sang' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("call_of_the_blood_moon");
	RITUAL.name = "(Appel de la Lune de Sang)";
	RITUAL.description = "Comme tout primitiviste le sait, la Lune de Sang exige des sacrifices réguliers pour être apaisée. Pour ceux prêts à tuer en son nom, son emprise sur les terres désolées peut être prolongée quelque temps. Accomplir ce rituel allongera le cycle nocturne de quinze minutes. Inflige 75 points de corruption.";
	RITUAL.onerequiredbelief = {"thirst_blood_moon"}; -- Primevalist Unique Ritual
	
	RITUAL.requirements = {"tortured_spirit", "down_catalyst", "pentagram_catalyst"};
	RITUAL.corruptionCost = 75;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 100;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Call of the Blood Moon' ritual!");

		if cwDayNight then
			if cwDayNight.currentCycle == "night" then
				Clockwork.chatBox:Add(player, nil, "event", "Tu sens la lueur de la Lune de Sang palpiter, comme si elle puisait son pouvoir de quelque chose.");
				netstream.Start(player, "PlaySound", "begotten/ui/sanity_touch.mp3");
			
				for _, v in _player.Iterator() do
					if IsValid(v) and v:HasInitialized() then
						local lastZone = v:GetCharacterData("LastZone");

						if lastZone == "wasteland" or lastZone == "tower" then
							if v ~= player then
								Clockwork.chatBox:Add(v, nil, "event", "Tu sens les radiations de la Lune de Sang palpiter, comme si elle puisait son pouvoir dans quelque chose.");
								netstream.Start(v, "PlaySound", "begotten/ambient/hits/wall_stomp5.mp3");
							end
							
							v:Disorient(3);
							
							for i = 1, 5 do
								timer.Simple(i * 3, function()
									if IsValid(v) then
										netstream.Start(v, "PlaySound", "begotten/ambient/hits/wall_stomp"..tostring(i)..".mp3");
										v:Disorient(3);
									end
								end);
							end
						end
					end
				end
				
				cwDayNight:ModifyCycleTimeLeft(900);
				return true;
			end
		end
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if cwDayNight then
			if cwDayNight.currentCycle == "night" then
				if cwDayNight.nextCycleTime - CurTime() <= 10 then
					-- Add enough time to complete the ritual!
					cwDayNight:ModifyCycleTimeLeft(10);
				end
				
				return true;
			else
				Schema:EasyText(player, "peru", "La Lune de Sang doit être visible pour que tu puisses accomplir ce rituel !");
				
				return false;
			end
		end
		
		return false;
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("call_of_the_blood_storm");
	RITUAL.name = "(Appel unique) Appel de la Tempête de Sang";
	RITUAL.description = "Depuis des millénaires, les tribus lunaires et les fétiches de la jungle ont dansé autour de leurs autels imprégnés de sang, implorant des pluies purificatrices qui ne sont jamais venues. Seuls ceux qui ont continué à danser après l'extinction de leurs feux ont pu sentir la goutte écarlate et tiède sur leur joue. L'exécution de ce rituel invoquera une tempête de sang dans la minute qui suit. Inflige 75 points de corruption.";
	RITUAL.onerequiredbelief = {"thirst_blood_moon"}; -- Primevalist Unique Ritual
	
	RITUAL.requirements = {"tortured_spirit", "down_catalyst", "tortured_spirit"};
	RITUAL.corruptionCost = 75;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 200;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Call of the Blood Storm' ritual!");

		if cwWeather then
			cwWeather:SetWeather("bloodstorm");
			
			return true;
		end
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if cwWeather then
			if !cwWeather.weatherTypes["bloodstorm"] then
				Schema:EasyText(player, "peru", "Ce climat ne convient pas à une pluie de sang !");
				
				return false;
			end
			
			if cwWeather.weather ~= "bloodstorm" then
				if cwWeather.nextWeatherTime - CurTime() <= 10 then
					-- Add enough time to complete the ritual!
					cwWeather.nextWeatherTime = CurTime() + 10;
				end
				
				return true;
			else
				Schema:EasyText(player, "peru", "Il y a déjà une tempête de sang active !");
				
				return false;
			end
		end
		
		return false;
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("call_to_darkness");
	RITUAL.name = "(T2) Appel des Ténèbres";
	RITUAL.description = "S'ouvrir entièrement à une hôte obscure est l'ultime preuve de dévotion envers ses maîtres. Les puissances ténébreuses utilisent souvent les mortels comme réceptacles temporaires pour accomplir plus directement leur volonté. Accomplir ce rituel invitera l'une d'elles à utiliser votre corps comme réceptacle, tout en la forçant à obéir à vos ordres. Inflige 40 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"down_catalyst", "down_catalyst", "pentagram_catalyst"};
	RITUAL.corruptionCost = 40;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Call to Darkness' ritual, meaning that an admin should probably possess them!");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("cherished_by_evil");
	RITUAL.name = "(T2) Chéri par le Mal";
	RITUAL.description = "La folie est pour les faibles, et votre âme ne sera certainement pas prise sans une somme raisonnable. L'exécution de ce rituel restaure instantanément votre santé mentale au maximum, reconstitue 50% de votre niveau de sang et purifie toute corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"ice_catalyst", "purifying_stone", "elysian_catalyst"};
	RITUAL.corruptionCost = -100;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;
	
	function RITUAL:OnPerformed(player)
		player:HandleSanity(100);
		player:SetBloodLevel(player:GetNWInt("bloodLevel", 5000) + 1250);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("cloak_of_always_burning");
	RITUAL.name = "(T2) Cape de la Brûlure Éternelle";
	RITUAL.description = "Avec une offrande de catalyseurs, de pierres runiques et de branches d'osier, vous serez imprégné d'une résistance aux forces naturelles et surnaturelles de la vie. L'accomplissement de ce rituel vous conférera une résistance de 100% aux dégâts de feu et de glace pendant 40 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shedskin"}; -- Tier II Faith of the Family Ritual
	
	RITUAL.requirements = {"belphegor_catalyst", "ice_catalyst", "familial_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.cloakBurningActive = true;
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Cloak of Always Burning", endtime);
		timer.Create("CloakBurnTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player.cloakBurningActive then
					player.cloakBurningActive = nil;
					UpdateActiveRituals(player, "Cloak of Always Burning", nil);
					Clockwork.hint:Send(player, "Le rituel de la 'Cape de la Combustion Éternelle' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("cries_of_the_drowned_king");
	RITUAL.name = "(T1) Les Cris du Roi Noyé";
	RITUAL.description = "Après un long moment en mer, vous pourriez entendre les gargouillis et les lamentations d'une légende engloutie. Faites une offrande aux Dieux et vous pourrez bénéficier de sa sagesse. L'exécution de ce rituel vous rendra incapable de perdre de l'oxygène sous l'eau ou de l'endurance en nageant pendant 1 heure. Durant ce temps, vous pourrez boire aux plans d'eau sans conséquence.";
	RITUAL.onerequiredbelief = {"honor_the_gods", "one_with_the_druids", "the_black_sea", "witch_druid", "taste_of_iron"}; -- Tier I Faith of the Family Ritual
	
	RITUAL.requirements = {"down_catalyst", "down_catalyst", "down_catalyst"};
	--RITUAL.corruptionCost = 5; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;

	function RITUAL:OnPerformed(player)
		player.drownedKingActive = true;
		local endtime = CurTime() + 3600
		UpdateActiveRituals(player, "Cries of the Drowned King", endtime);
		timer.Create("DrownedKingTimer_"..player:EntIndex(), 3600, 1, function()
			if IsValid(player) then
				if player.drownedKingActive then
					player.drownedKingActive = nil;
					UpdateActiveRituals(player, "Cries of the Drowned King", nil);
					Clockwork.hint:Send(player, "Le rituel des 'Cris du Roi Noyé' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("demon_hunter");
	RITUAL.name = "(T1) Chasseur de Démons";
	RITUAL.description = "Montre ton orgueil, demande un défi à la hauteur de ta prouesse martiale ! Exécuter ce rituel te donnera 25 minutes pour vaincre un nombre aléatoire de thralls, ce qui te récompensera ensuite avec 1000 points de foi (expérience).";
	RITUAL.onerequiredbelief = {"honor_the_gods", "one_with_the_druids", "the_black_sea", "witch_druid", "taste_of_iron"}; -- Tier I Faith of the Family Ritual
	
	RITUAL.requirements = {"light_catalyst", "elysian_catalyst", "pantheistic_catalyst"};
	--RITUAL.corruptionCost = 5; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;

	function RITUAL:OnPerformed(player)
		player.demonHunterActive = true;
		player.thrallsToKill = math.random(1, 3);
		
		Schema:EasyText(player, "goldenrod", "Vous avez maintenant 25 minutes pour éliminer"..player.thrallsToKill.." Begotten thralls for your reward.");
		
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." just activated the 'Demon Hunter' ritual! Make sure there are enough thrall NPCs ("..player.thrallsToKill..") for him to kill!");
		if(math.random(1,10) == 1) then Schema:EasyText(GetAdmin(), "tomato", "Les dés sont jetés... par le hasard, un thrall administrateur a été désigné pour participer à ce rituel !"); end
		local endtime = CurTime() + 1500
		UpdateActiveRituals(player, "Demon Hunter", endtime);
		timer.Create("DemonHunterTimer_"..player:EntIndex(), 1500, 1, function()
			if IsValid(player) then
				if player.demonHunterActive then
					player.demonHunterActive = nil;
					UpdateActiveRituals(player, "Demon Hunter", nil);
					Clockwork.hint:Send(player, "Le rituel du 'Chasseur de Démons' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

-- This is apparently quite unbalanced, so gabs has asked me to remove it.
--[[RITUAL = cwRituals.rituals:New("infernal_incursion");
	RITUAL.name = "(T1) Incursion Infernal";
    RITUAL.description = "Affaiblis le voile entre les mondes et agite quelques démons au passage. Exécuter ce rituel te donnera vingt-cinq minutes pour éliminer un nombre aléatoire de thralls, ce qui te récompensera ensuite avec 1000 points de foi (expérience).";
	RITUAL.onerequiredbelief = {"soothsayer", "witch", "witch_druid"}; -- Tier I Faith of the Dark Ritual
	RITUAL.requirements = {"belphegor_catalyst", "pentagram_catalyst", "up_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 5;
	
	function RITUAL:OnPerformed(player)
		player.thrallsToKill = math.random(1, 3);
		
		Schema:EasyText(player, "goldenrod", "Vous avez maintenant 25 minutes pour éliminer"..player.thrallsToKill.." Begotten thralls for your reward.");
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." just activated the 'Infernal Incursion' ritual! Make sure there are enough thrall NPCs ("..player.thrallsToKill..") for him to kill!");
		if(math.random(1,10) == 1) then Schema:EasyText(GetAdmin(), "tomato", "Les dés sont jetés... par le hasard, un thrall administrateur a été convoqué pour participer à ce rituel !"); end
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()]]--

RITUAL = cwRituals.rituals:New("empowered_blood");
	RITUAL.name = "(T2) Sang Renforcé";
	RITUAL.description = "Les lignées sanguines sont tout pour les Enfants de Satan, en particulier celles qui descendent d'anciens rois et sorciers. Ceux dont le sang est le plus pur peuvent puiser dans la force de leurs ancêtres pour augmenter temporairement leur santé maximale de 50 pendant 20 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"pentagram_catalyst", "belphegor_catalyst", "elysian_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player.maxHealthBoost = 50;
		player:SetMaxHealth(player:GetMaxHealth());
		player:SetHealth(player:Health() + 50);
		local endtime = CurTime() + 1200
		UpdateActiveRituals(player, "Empowered Blood", endtime);
		timer.Create("EmpoweredBloodTimer_"..player:EntIndex(), 1200, 1, function()
			if IsValid(player) then
				player.maxHealthBoost = nil;
				
				local maxHealth = player:GetMaxHealth();
				
				player:SetMaxHealth(maxHealth);
				
				if player:Health() > maxHealth then
					player:SetHealth(maxHealth);
				end
				UpdateActiveRituals(player, "Empowered Blood", nil);
				Clockwork.hint:Send(player, "Le rituel du 'Sang Renforcé' s'est dissipé...", 10, Color(175, 100, 100), true, true);
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("familial_seed");
	RITUAL.name = "(T1) Graine Familiale";
	RITUAL.description = "La Forêt de Gore est luxuriante et grouillante de vie comparée aux royaumes qu'habitent les adeptes du Glaze. Les chamans goreiques peuvent invoquer la magie de la Forêt Goreique pour soigner leurs blessures. L'exécution de ce rituel restaure 150 points de santé, 60% de sang, et guérit les blessures du membre spécifié. Supprime 25 points de corruption.";
	RITUAL.onerequiredbelief = {"honor_the_gods", "one_with_the_druids", "the_black_sea", "witch_druid", "taste_of_iron"}; -- Tier I Faith of the Family Ritual
	
	RITUAL.requirements = {"familial_catalyst", "familial_catalyst", "familial_catalyst"};
	RITUAL.corruptionCost = -25; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;
	
	function RITUAL:OnPerformed(player)
		player.selectingRegrowthLimb = true;
		
		netstream.Start(player, "OpenRegrowthMenu");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("hail_prince_thieves");
	RITUAL.name = "Gloire au Prince des Voleurs";
	RITUAL.description = "Des bas-fonds des Ténèbres aux champs immaculés des Comtés, tous les voleurs prient le même prince. Exécuter ce rituel facilite considérablement le crochetage et augmente de 10% les chances de trouver du butin dans les conteneurs verrouillés pendant les 30 minutes suivantes. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "witch", "witch_druid"}; -- Tier I Faith of the Dark Ritual
	
	RITUAL.requirements = {"down_catalyst", "ice_catalyst", "ice_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 30;

	function RITUAL:OnPerformed(player)
		player:SetNetVar("princeOfThieves", true);
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Hail Be to the Prince of Thieves", endtime);
		timer.Create("PrinceOfThievesTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player:GetNetVar("princeOfThieves", false) then
					player:SetNetVar("princeOfThieves", false);
					UpdateActiveRituals(player, "Hail Be to the Prince of Thieves", nil);
					Clockwork.hint:Send(player, "Le rituel 'Gloire au Prince des Voleurs' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("hear_me");
	RITUAL.name = "(T1) Écoutez-Moi";
	RITUAL.description = "Tu n'es rien du tout tant que tu ne t'es pas fait connaître. L'exécution de ce rituel t'accorde 300 points de foi (expérience). Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "witch", "witch_druid"}; -- Tier I Faith of the Dark Ritual
	
	RITUAL.requirements = {"belphegor_catalyst", "belphegor_catalyst", "belphegor_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 300;
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if(player:GetFaction() == "Children of Satan" and bit.band(Schema.hearMeFlags, HEARME_ENABLED) <= 0 and (bit.band(Schema.hearMeFlags, HEARME_INCLUDEHELLBARON) > 0 or Schema:GetRankTier("Children of Satan", player:GetCharacterData("rank", 1)) <= 3)) then
			Schema:EasyText(player, "peru", "Le Baron de l'Enfer a coupé votre lien avec le Seigneur des Ténèbres !")

			return false
		
		end

	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("hellgorge");
	RITUAL.name = "(T1) Gouffre infernal";
	RITUAL.description = "Avec une simple offrande, tu recevras la plus petite bouchée de la corne d'abondance. Cela pourrait suffire à te rassasier, mais cela te laissera certainement l'envie d'obtenir davantage. Exécuter ce rituel réduira instantanément ta faim, ta soif et ta fatigue à zéro. Il réduira également ta corruption de 15 points.";
	RITUAL.onerequiredbelief = {"soothsayer", "witch", "witch_druid"}; -- Tier I Faith of the Dark Ritual
	
	RITUAL.requirements = {"up_catalyst", "down_catalyst", "belphegor_catalyst"};
	RITUAL.corruptionCost = -15;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;
	
	function RITUAL:OnPerformed(player)
		player:SetNeed("thirst", 0);
		player:SetNeed("hunger", 0);
		player:SetNeed("sleep", 0);
		
		Clockwork.chatBox:Add(player, nil, "itnofake", "Un immense soulagement vous submerge alors que vous vous sentez revigoré.");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("holy_powderkeg");
	RITUAL.name = "(Poudre sainte unique)";
	RITUAL.description = "Passez-moi vos fusils, confiez-moi vos poivrières épuisées et vos gueules-de-loup ! Je vais armer, charger, pomper et approvisionner chaque arme de chaque fidèle Philimonjio dans l'armée de notre Seigneur, comme j'ai été conçu et élevé pour le faire ! L'exécution de ce rituel augmente considérablement la vitesse de rechargement pendant les 30 prochaines minutes. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"emissary"}; -- Hard-Glazed Unique Ritual
	
	RITUAL.requirements = {"holy_spirit", "light_catalyst", "trinity_catalyst"};
	RITUAL.corruptionCost = 5; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
		player.holyPowderkegActive = true;
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Holy Powderkeg", endtime);
		timer.Create("HolyPowderTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player.holyPowderkegActive then
					player.holyPowderkegActive = nil;
					UpdateActiveRituals(player, "Holy Powderkeg", nil);
					Clockwork.hint:Send(player, "Le rituel de la 'Poudre Sainte' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("cloak_of_the_black_hat");
	RITUAL.name = "(Unique) Cape du Chapeau Noir";
	RITUAL.description = "Tout enfant sait se cacher dans l'obscurité. Le Chapeau Noir apporte les ténèbres avec lui, rôdant dans les couloirs de la noblesse qui se croit à tort en sécurité. Ils ne seront plus jamais seuls. Exécuter ce rituel vous rendra invisible en position accroupie pendant les 30 prochaines minutes, mais vous serez incapable d'attaquer sous cet état. Inflige 25 points de corruption.";
	RITUAL.requiredSubfaction = {"Kinisger"}; -- Subfaction Ritual
	
	RITUAL.requirements = {"pentagram_catalyst", "ice_catalyst", "ice_catalyst"};
	RITUAL.corruptionCost = 25; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 15;
	
	function RITUAL:OnPerformed(player)
		player:SetNetVar("kinisgerCloak", true);
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Cloak of the Black Hat", endtime);
		timer.Create("KinisgerCloakTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player:GetNetVar("kinisgerCloak", false) then
					player:SetNetVar("kinisgerCloak", false);
					
					if player.cloaked then
						player:Uncloak();
					end
					UpdateActiveRituals(player, "Cloak of the Black Hat", nil);
					Clockwork.hint:Send(player, "Le rituel de la 'Cape du Chapeau Noir' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("kinisger_appearance_alteration");
	RITUAL.name = "(Apparence Unique) Altération de l'Apparence Kinisger";
	RITUAL.description = "Les membres de la Maison Kinisger sont des maîtres de l'infiltration, grâce à leur utilisation de magie noire et de leur sang mutant pour modifier leur apparence. Inflige 50 points de corruption.";
	RITUAL.requiredSubfaction = {"Kinisger"}; -- Subfaction Ritual
	
	RITUAL.requirements = {"down_catalyst", "down_catalyst", "ice_catalyst"};
	--RITUAL.corruptionCost = 50; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 15;
	RITUAL.isSilent = true;
	
	function RITUAL:OnPerformed(player)
		player.selectingNewAppearance = true;
		
		netstream.Start(player, "OpenAppearanceAlterationMenu");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("apostle_of_many_faces");
	RITUAL.name = "(Apostat) Apôtre aux Mille Visages";
	RITUAL.description = "L'épreuve ultime de foi pour un véritable blackhat : porter les effigies de cultes païens et dévots qui s'opposent au tien. Jouer le rôle d'un acolyte étranger avec une telle maîtrise que tu trompes les Dieux eux-mêmes, voilà la marque d'un maître blackhat ! L'accomplissement de ce rituel te permet définitivement d'équiper ou d'utiliser tout équipement lié à une foi non-Voltiste. Inflige 50 points de corruption.";
	RITUAL.requiredSubfaction = {"Kinisger"}; -- Subfaction Ritual
	
	RITUAL.requirements = {"xolotl_catalyst", "xolotl_catalyst", "xolotl_catalyst"};
	RITUAL.corruptionCost = 50;
	RITUAL.ritualTime = 15;
	
	function RITUAL:OnPerformed(player)
		player:SetCharacterData("apostle_of_many_faces", true);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player:GetCharacterData("apostle_of_many_faces") then
			Schema:EasyText(player, "firebrick", "Vous avez déjà accompli ce rituel !");
		
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("ritual_of_shadow");
	RITUAL.name = "(Rare) Rituel de l'Ombre";
	RITUAL.description = "Bien que les membres de la Maison Rekh-khet-sa ne puissent normalement parcourir la surface en plein jour, il existe un rituel capable de les envelopper temporairement d'obscurité et de les protéger de la lumière. L'accomplissement de ce rituel vous évitera de subir des dégâts durant la journée dans le Désolation pour les 40 prochaines minutes.";
	RITUAL.requiredSubfaction = {"Rekh-khet-sa"}; -- Subfaction Ritual
	
	RITUAL.requirements = {"light_catalyst", "down_catalyst", "ice_catalyst"};
	RITUAL.ritualTime = 30;

	function RITUAL:OnPerformed(player)
		player.ritualOfShadow = true;
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Ritual of Shadow", endtime);
		timer.Create("RitualOfShadowTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player.ritualOfShadow then
					player.ritualOfShadow = nil;
					UpdateActiveRituals(player, "Ritual of Shadow", nil);
					Clockwork.hint:Send(player, "Le rituel 'Ritual of Shadow' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("mark_of_the_devil");
	RITUAL.name = "(T2) Marque du Diable";
	RITUAL.description = "Le destin de ceux qui offensent le Seigneur des Ténèbres ou Ses serviteurs est une mort atroce et terrifiante, car ils seront désignés pour mourir par la main des Enfants de Satan. L'exécution de ce rituel marquera un personnage pour la mort, le rendant visible à tous les fidèles de la Foi des Ténèbres à proximité. Tuer les personnages marqués apportera de grandes récompenses, particulièrement s'ils sont sacrifiés.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"down_catalyst", "pentagram_catalyst", "down_catalyst"};
	--RITUAL.corruptionCost = 30; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 10;
	RITUAL.takeCatalysts = false;
	
	function RITUAL:OnPerformed(player)
		Clockwork.dermaRequest:RequestString(player, "Mark A Character", "Tapez le nom d'un personnage à marquer pour la mort.", nil, function(result)
			local target = Clockwork.player:FindByID(result)
			
			if IsValid(target) then
				if target:Alive() then
					if target:GetFaction() ~= "Children of Satan" then
						Clockwork.dermaRequest:RequestConfirmation(player, "Mark Confirmation", "Êtes-vous sûr de vouloir marquer "..target:Name().." pour la mort?", function()
							
							if IsValid(target) and target:Alive() and target:GetFaction() ~= "Children of Satan" then
								local ritualTable = cwRituals.rituals.stored["mark_of_the_devil"];
								
								if !cwRituals:PlayerMeetsRitualItemRequirements(player, ritualTable, ritualTable.requirements, true) then return end;
								
								target:SetCharacterData("markedBySatanist", true);
								target:SetNetVar("markedBySatanist", true);
								
								Schema:EasyText(player, "maroon", target:Name().." has been marked for death.");
								Schema:EasyText(Schema:GetAdmins(), "tomato", target:Name().." a été marqué pour la mort par "..player:Name().."!");
								
								for _, v in _player.Iterator() do
									if v:HasInitialized() then
										if v == player or v:GetFaith() == "Faith of the Dark" then
											Clockwork.chatBox:Add(v, nil, "darkwhispernoprefix", player:Name().." convoque les serviteurs du Seigneur Obscur, marquant celui du nom de "..target:Name().." pour être tué pour ses transgressions.");
										end
									end
								end
							end
						end);
						
						return true;
					else
						Schema:EasyText(player, "firebrick", "Ce personnage est protégé par une aura magique et ne peut être marqué !");
					end
				else
					Schema:EasyText(player, "darkgrey", "Le personnage ciblé est déjà mort !");
				end
			else
				Schema:EasyText(player, "grey", tostring(result).." n'est pas un personnage valide!");
			end
		end)

		return false;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("mark_of_the_devil_target");
	RITUAL.name = "(T2) Marque du Démon (Cible)";
	RITUAL.description = "Le destin de ceux qui offensent le Seigneur des Ténèbres ou Ses serviteurs est une mort atroce et terrifiante, car ils seront désignés pour mourir par la main des Enfants de Satan. L'exécution de ce rituel marquera un personnage pour la mort, le rendant visible à tous les fidèles de la Foi des Ténèbres à proximité. Tuer les personnages marqués conférera de grandes récompenses, particulièrement s'ils sont sacrifiés. Ce rituel est silencieux.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"pentagram_catalyst", "down_catalyst", "down_catalyst"};
	--RITUAL.corruptionCost = 30; -- Corruption gets added once the UI is closed.
	RITUAL.ritualTime = 2;
	RITUAL.isSilent = true;
	RITUAL.takeCatalysts = false;
	
	function RITUAL:OnPerformed(player)
		local ent = player:GetEyeTraceNoCursor().Entity;
		local target;
		
		if IsValid(ent) then
			if ent:IsPlayer() then
				target = ent;
			elseif Clockwork.entity:IsPlayerRagdoll(ent) then
				target = Clockwork.entity:GetPlayer(ent);
			end
		end
		
		if target then
			if target:Alive() then
				--if target:GetFaith() ~= "Faith of the Dark" then
				if target:GetFaction() ~= "Children of Satan" then
					if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
						Clockwork.dermaRequest:RequestConfirmation(player, "Mark Confirmation", "Êtes-vous sûr de vouloir marquer "..target:Name().." pour la mort?", function()
							if IsValid(target) and target:Alive() and target:GetFaction() ~= "Children of Satan" then
								local ritualTable = cwRituals.rituals.stored["mark_of_the_devil_target"];
								
								if !cwRituals:PlayerMeetsRitualItemRequirements(player, ritualTable, ritualTable.requirements, true) then return end;
							
								target:SetCharacterData("markedBySatanist", true);
								target:SetNetVar("markedBySatanist", true);
								
								Schema:EasyText(player, "maroon", target:Name().." a été marqué pour la mort.");
								Schema:EasyText(Schema:GetAdmins(), "tomato", target:Name().." a été marqué pour la mort par "..player:Name().."!");
							end
						end);
						
						return true;
					else
						Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
					end
				else
					Schema:EasyText(player, "firebrick", "Ce personnage est protégé par une aura magique et ne peut être marqué !");
				end
			else
				Schema:EasyText(player, "darkgrey", "Le personnage ciblé est déjà mort !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage valide !");
		end
		
		Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage valide !");

		return false;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local ent = player:GetEyeTraceNoCursor().Entity;
		local target;
		
		if IsValid(ent) then
			if ent:IsPlayer() then
				target = ent;
			elseif Clockwork.entity:IsPlayerRagdoll(ent) then
				target = Clockwork.entity:GetPlayer(ent);
			end
		end
		
		if target then
			if target:Alive() then
				--if target:GetFaith() ~= "Faith of the Dark" then
				if target:GetFaction() ~= "Children of Satan" then
					if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
						return true;
					else
						Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
					end
				else
					Schema:EasyText(player, "firebrick", "Ce personnage est protégé par une aura magique et ne peut être marqué !");
				end
			else
				Schema:EasyText(player, "darkgrey", "Le personnage ciblé est déjà mort !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage valide !");
		end
		
		return false;
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("noble_stature");
	RITUAL.name = "(T2) Noble Stature";
	RITUAL.description = "Montrer de la peur face au grognement d'une bête ne fait qu'attirer ses crocs. Tu te tiendras ferme et droit, inébranlable face à la sauvagerie. L'exécution de ce rituel réduit de 50 % les dégâts et les dégâts de stabilité subis lorsque tu restes parfaitement immobile. Ce rituel dure 15 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"flagellant", "acolyte"}; -- Tier II Faith of the Light Ritual
	
	RITUAL.requirements = {"ice_catalyst", "down_catalyst", "light_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.nobleStatureActive = true;
		local endtime = CurTime() + 900
		UpdateActiveRituals(player, "Noble Stature", endtime);
		timer.Create("NobleStatureTimer_"..player:EntIndex(), 900, 1, function()
			if IsValid(player) then
				if player.nobleStatureActive then
					player.nobleStatureActive = nil;
					UpdateActiveRituals(player, "Noble Stature", nil);
					Clockwork.hint:Send(player, "Le rituel de 'Noble Stature' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("payment_of_light");
	RITUAL.name = "Paiement de la Lumière";
	RITUAL.description = "Ramasse les restes brisés de Dieu et offre-les au Glacis du Sol. Accomplir ce rituel t'accorde 300 points de foi (expérience). Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"repentant", "disciple"}; -- Tier I Faith of the Light Ritual
	
	RITUAL.requirements = {"light_catalyst", "light_catalyst", "light_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 300;
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("perseverance");
	RITUAL.name = "(T3) Persévérance";
	RITUAL.description = "Dans les Districts, le labeur est incessant, éreintant et purificateur. L'exécution de ce rituel double le taux de régénération de votre Endurance pendant 30 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"emissary", "extinctionist"}; -- Tier III Faith of the Light Ritual
	
	RITUAL.requirements = {"light_catalyst", "elysian_catalyst", "holy_spirit"};
	RITUAL.corruptionCost = 10; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 25; -- XP gained from performing the ritual.
	
	function RITUAL:OnPerformed(player)
		player.perseveranceActive = true;
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Perseverance", endtime);
		timer.Create("PerseveranceTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player.perseveranceActive then
					player.perseveranceActive = nil;
					UpdateActiveRituals(player, "Perseverance", nil);
					Clockwork.hint:Send(player, "Le rituel de 'Persévérance' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("regrowth");
	RITUAL.name = "(T3) Repousse";
	RITUAL.description = "La Forêt de Gore est luxuriante et grouillante de vie comparée aux royaumes qu'habitent les adeptes du Glaze. Les chamans goreïques peuvent invoquer la magie de la Forêt Goreïque pour soigner leurs blessures. L'exécution de ce rituel vous guérira complètement de toutes blessures, afflictions et corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"purifying_stone", "familial_catalyst", "up_catalyst"};
	RITUAL.corruptionCost = 0;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		--local max_poise = player:GetMaxPoise();
		local max_stability = player:GetMaxStability();
		local max_stamina = player:GetMaxStamina();
	
		player:ResetInjuries();
		player:TakeAllDiseases();
		player:SetHealth(player:GetMaxHealth() or 100);
		player:SetNeed("thirst", 0);
		player:SetNeed("hunger", 0);
		player:SetNeed("corruption", 0);
		player:SetNeed("sleep", 0);
		player:SetNetVar("sanity", 100);
		player:SetCharacterData("sanity", 100);
		player:SetCharacterData("Stamina", max_stamina);
		player:SetNWInt("Stamina", max_stamina);
		player:SetCharacterData("stability", max_stability);
		--player:SetCharacterData("meleeStamina", max_poise);
		--player:SetNWInt("meleeStamina", max_poise);
		player:SetLocalVar("freeze", 0);
		player:SetBloodLevel(5000);
		player:StopAllBleeding();
		Clockwork.limb:HealBody(player, 100);
		Clockwork.player:SetAction(player, "die", false);
		Clockwork.player:SetAction(player, "die_bleedout", false);
		
		if player:GetRagdollState() == RAGDOLL_KNOCKEDOUT then
			Clockwork.player:SetRagdollState(player, RAGDOLL_NONE);
		end
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("regrowth_target");
	RITUAL.name = "(T3) Repousse (Cible)";
	RITUAL.description = "La Forêt de Gore est luxuriante et grouillante de vie comparée aux royaumes qu'habitent les adeptes du Glaze. Les chamans goreiques peuvent invoquer la magie de la Forêt Goreique pour soigner leurs blessures. L'exécution de ce rituel guérira complètement un autre personnage de toutes blessures, afflictions et corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"familial_catalyst", "up_catalyst", "purifying_stone"};
	RITUAL.corruptionCost = 0;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local ent = player:GetEyeTraceNoCursor().Entity;
		local target;
		
		if IsValid(ent) then
			if ent:IsPlayer() then
				target = ent;
			elseif Clockwork.entity:IsPlayerRagdoll(ent) then
				target = Clockwork.entity:GetPlayer(ent);
			end
		end
		
		if target then
			if target:Alive() then
				if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
					return true;
				else
					Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
				end
			else
				Schema:EasyText(player, "darkgrey", "Le personnage ciblé est déjà mort !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage valide !");
		end
		
		return false;
	end;
	function RITUAL:EndRitual(player)
		local ent = player:GetEyeTraceNoCursor().Entity;
		local target;
		
		if IsValid(ent) then
			if ent:IsPlayer() then
				target = ent;
			elseif Clockwork.entity:IsPlayerRagdoll(ent) then
				target = Clockwork.entity:GetPlayer(ent);
			end
		end
		
		if target then
			if target:Alive() then
				if (target:GetShootPos():Distance(player:GetShootPos()) <= 192) then
					--local max_poise = target:GetMaxPoise();
					local max_stability = target:GetMaxStability();
					local max_stamina = target:GetMaxStamina();

					target:ResetInjuries();
					target:TakeAllDiseases();
					target:SetHealth(target:GetMaxHealth() or 100);
					target:SetNeed("thirst", 0);
					target:SetNeed("hunger", 0);
					target:SetNeed("corruption", 0);
					target:SetNeed("sleep", 0);
					target:SetNetVar("sanity", 100);
					target:SetCharacterData("sanity", 100);
					target:SetCharacterData("Stamina", max_stamina);
					target:SetNWInt("Stamina", max_stamina);
					target:SetCharacterData("stability", max_stability);
					--target:SetCharacterData("meleeStamina", max_poise);
					--target:SetNWInt("meleeStamina", max_poise);
					target:SetLocalVar("freeze", 0);
					target:SetBloodLevel(5000);
					target:StopAllBleeding();
					Clockwork.limb:HealBody(target, 100);
					Clockwork.player:SetAction(target, "die", false);
					Clockwork.player:SetAction(target, "die_bleedout", false);
					
					if target:GetRagdollState() == RAGDOLL_KNOCKEDOUT then
						Clockwork.player:SetRagdollState(target, RAGDOLL_NONE);
					end
					
					return true;
				else
					Schema:EasyText(player, "firebrick", "Ce personnage est trop éloigné !");
				end
			else
				Schema:EasyText(player, "darkgrey", "Le personnage ciblé est déjà mort !");
			end
		else
			Schema:EasyText(player, "firebrick", "Vous devez regarder un personnage valide !");
		end
		
		return false;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("aura_of_powderheel");
	RITUAL.name = "(T3) Aura de Powderheel";
	RITUAL.description = "Invoque la puissance du Grand Arbre en temps de bataille contre ses ennemis pour te protéger de leurs armes non conventionnelles. L'exécution de ce rituel génère un champ de force sphérique pendant 30 minutes, réduisant de 25 % les dégâts des projectiles pour tous ceux autour de toi à portée de voix. Inflige 30 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"pantheistic_catalyst", "xolotl_catalyst", "trinity_catalyst"};
	RITUAL.corruptionCost = 30; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 75; -- XP gained from performing the ritual.

	function RITUAL:OnPerformed(player)
		player:SetNetVar("powderheelActive", true);
		local endtime = CurTime() + 1800
		UpdateActiveRituals(player, "Aura of Powderheel", endtime);
		timer.Create("PowderheelTimer_"..player:EntIndex(), 1800, 1, function()
			if IsValid(player) then
				if player:GetNetVar("powderheelActive") then
					player:SetNetVar("powderheelActive", false);
					UpdateActiveRituals(player, "Aura of Powderheel", nil);
					Clockwork.hint:Send(player, "Le rituel de l'« Aura de Powderheel » s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("druids_staff");
	RITUAL.name = "(T3) Bâton du Druide";
	RITUAL.description = "Imprégnez votre bâton de la force durable du chêne le plus puissant. Augmente les dégâts de votre bâton de combat de 25 points, accroît sa pénétration d'armure de 100%, et supprime ses dégâts de stabilité pendant 15 minutes. Inflige 20 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"pantheistic_catalyst", "familial_catalyst", "trinity_catalyst"};
	RITUAL.corruptionCost = 20; -- Corruption incurred from performing rituals.
	RITUAL.ritualTime = 10; -- Time it takes for the ritual action bar to complete.
	RITUAL.experience = 50; -- XP gained from performing the ritual.

	function RITUAL:OnPerformed(player)
		player:SetNetVar("druidStaffActive", true);
		local endtime = CurTime() + 900
		UpdateActiveRituals(player, "Druid's Staff", endtime);
		timer.Create("DruidStaffTImer_"..player:EntIndex(), 900, 1, function()
			if IsValid(player) then
				if player:GetNetVar("druidStaffActive") then
					player:SetNetVar("druidStaffActive", false);
					UpdateActiveRituals(player, "Druid's Staff", nil);
					Clockwork.hint:Send(player, "Le rituel du 'Bâton du Druide' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

if game.GetMap() == "rp_district21" then
	RITUAL = cwRituals.rituals:New("eye_of_the_storm");
		RITUAL.name = "(Unique) Œil de la Tempête";
		RITUAL.description = "Les Haraldrs affirment que chaque coup de tonnerre provient de la Hache de Guerre du Vieux Fils lorsqu'Il abat des bêtes célestes dont le sang se répand en pluie sur les terres. Les Crasters soutiennent que les nuages d'orage émanent de la Mère, qui pleure pour donner naissance à une vie nouvelle. L'exécution de ce rituel invoquera un blizzard de plus longue durée en quelques instants seulement. Inflige 50 points de corruption.";
		RITUAL.onerequiredbelief = {"daring_trout", "watchful_raven"}; -- Unique Mother/Old Son Ritual
		
		RITUAL.requirements = {"purifying_stone", "up_catalyst", "elysian_catalyst"};
		RITUAL.corruptionCost = 50;
		RITUAL.ritualTime = 10;
		RITUAL.experience = 150;
		
		function RITUAL:OnPerformed(player)
			Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Eye of the Storm' ritual!");

			if cwWeather then
				cwWeather:SetWeather("blizzard", 0, 900);
				
				return true;
			end
		end;
		function RITUAL:OnFail(player)
		end;
		function RITUAL:StartRitual(player)
			if cwWeather then
				if !cwWeather.weatherTypes["blizzard"] then
					Schema:EasyText(player, "peru", "Ce climat ne convient pas à une tempête de neige !");
					
					return false;
				end
			
				if cwWeather.weather ~= "blizzard" then
					if cwWeather.nextWeatherTime - CurTime() <= 10 then
						-- Add enough time to complete the ritual!
						cwWeather.nextWeatherTime = CurTime() + 10;
					end
					
					return true;
				else
					Schema:EasyText(player, "peru", "Il y a déjà une tempête de neige en cours !");
					
					return false;
				end
			end
			
			return false;
		end;
		function RITUAL:EndRitual(player)
		end;
	RITUAL:Register()
else
	RITUAL = cwRituals.rituals:New("eye_of_the_storm");
		RITUAL.name = "(Unique) Œil de la Tempête";
		RITUAL.description = "Les Haraldrs affirment que chaque coup de tonnerre provient de la hache de guerre du Vieux Fils lorsqu'Il abat des bêtes célestes dont le sang se répand en pluie sur les terres. Les Crasters prétendent que les nuages d'orage émanent de la Mère, qui pleure pour donner naissance à une vie nouvelle. L'exécution de ce rituel invoquera un orage dans la minute qui suit. Inflige 50 points de corruption.";
		RITUAL.onerequiredbelief = {"daring_trout", "watchful_raven"}; -- Unique Mother/Old Son Ritual
		
		RITUAL.requirements = {"purifying_stone", "up_catalyst", "elysian_catalyst"};
		RITUAL.corruptionCost = 50;
		RITUAL.ritualTime = 10;
		RITUAL.experience = 150;
		
		function RITUAL:OnPerformed(player)
			Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Eye of the Storm' ritual!");

			if cwWeather then
				cwWeather:SetWeather("thunderstorm");
				
				return true;
			end
		end;
		function RITUAL:OnFail(player)
		end;
		function RITUAL:StartRitual(player)
			if cwWeather then
				if !cwWeather.weatherTypes["thunderstorm"] then
					Schema:EasyText(player, "peru", "Ce climat ne convient pas à un orage !");
					
					return false;
				end
			
				if cwWeather.weather ~= "thunderstorm" then
					if cwWeather.nextWeatherTime - CurTime() <= 10 then
						-- Add enough time to complete the ritual!
						cwWeather.nextWeatherTime = CurTime() + 10;
					end
					
					return true;
				else
					Schema:EasyText(player, "peru", "Il y a déjà un orage actif !");
					
					return false;
				end
			end
			
			return false;
		end;
		function RITUAL:EndRitual(player)
		end;
	RITUAL:Register()
end

RITUAL = cwRituals.rituals:New("glazic_rite_of_clear_skies");
	RITUAL.name = "(Rituel Unique) Rite Glazic des Ciels Dégagés";
	RITUAL.description = "Avec les fragments brisés de Dieu, la Ligue des Astronomes Glazic oppose fièrement un Non aux shamans sauvages qui convoitent le pouvoir sur les cieux. L'exécution de ce rituel rétablira la météo à la normale après un délai d'une minute. Inflige 50 points de corruption.";
	RITUAL.onerequiredbelief = {"emissary"}; -- Hard-Glazed Unique Ritual
	
	RITUAL.requirements = {"purifying_stone", "up_catalyst", "purifying_stone"};
	RITUAL.corruptionCost = 50;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 150;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Glazic Rite of Clear Skies' ritual!");
		
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "wasteland" or lastZone == "hotspring" then
			for _, v in _player.Iterator() do
				if IsValid(v) and v:HasInitialized() then
					local vLastZone = v:GetCharacterData("LastZone");
						
					Clockwork.chatBox:Add(v, nil, "event", "Loué soit ! Un Astronome Glazic a manipulé les cieux, et bientôt le ciel sera dégagé !");
				end
			end
		end

		timer.Simple(60, function()
			if cwWeather then
				cwWeather:SetWeather("normal", 0, 900);
				
				return true;
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone ~= "wasteland" and lastZone ~= "hotspring" then
			Schema:EasyText(player, "peru", "Vous devez être dans le désert pour accomplir ce rituel !")
			return false
		end

		if cwWeather then
			if !cwWeather.weatherTypes["normal"] then
				Schema:EasyText(player, "peru", "Ce climat ne convient pas pour cela !");
				
				return false;
			end
		
			if cwWeather.weather ~= "normal" then
				if cwWeather.nextWeatherTime - CurTime() <= 10 then
					-- Add enough time to complete the ritual!
					cwWeather.nextWeatherTime = CurTime() + 10;
				end
				
				return true;
			else
				Schema:EasyText(player, "peru", "Le ciel est déjà dégagé !");
				
				return false;
			end
		end
		
		return false;
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("Sister's Blessing");
	RITUAL.name = "(Bénédiction de la Sœur)";
	RITUAL.description = "Le fleuve Styx est décrit comme un torrent de lave bouillonnante, refuge des morts et des damnés. Grâce à un rituel de magie sanguine approprié, les Saccageurs ont pu négocier avec les démons, leur promettant que leur passage serait payé par les âmes de leur moisson. Inflige 75 points de corruption.";
	RITUAL.onerequiredbelief = {"shedskin", "watchful_raven"}; -- Unique Mother/Sister Ritual

	RITUAL.requirements = {"xolotl_catalyst", "down_catalyst", "familial_catalyst"};
	RITUAL.corruptionCost = 75;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 200;

	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local target = player:GetEyeTraceNoCursor().Entity;

		if target:GetClass() != "cw_longship" then 
			Schema:EasyText(player, "firebrick", "Tu dois regarder un drakkar !");
			return false;
		end

		if (target:GetPos():Distance(player:GetShootPos()) > 256) then
			Schema:EasyText(player, "firebrick", "Vous êtes trop loin du drakkar !");
			return false;
		end

		if target.enchantment == true then
			Schema:EasyText(player, "firebrick", "Ce drakkar est déjà enchanté !");
			return false;
		end

		return true;

	end;
	
	function RITUAL:EndRitual(player)
		local target = player:GetEyeTraceNoCursor().Entity;

		if target:GetClass() != "cw_longship" then 
			Schema:EasyText(player, "firebrick", "Tu dois regarder un drakkar !");
			return false;
		end

		if (target:GetPos():Distance(player:GetShootPos()) > 256) then
			Schema:EasyText(player, "firebrick", "Vous êtes trop loin du drakkar !");
			return false;
		end

		if target.enchantment == true then
			Schema:EasyText(player, "firebrick", "Ce drakkar est déjà enchanté !");
			return false;
		end

		Schema:EasyText(player, "icon16/anchor.png", "bleuet", "This ship can now navigate the River Styx!");
		Schema:EasyText(Schema:GetAdmins(), "icon16/anchor.png", "goldenrod", player:Name() .. " has enchanted a boat to navigate the River Styx! You can perform the /ToggleHellSailing command to allow them to sail to the Hell Manor!")
		target.enchantment = true;
			
		local itemID = target.itemID;
		
		if itemID then
			local itemTable = item.FindInstance(itemID);

			if itemTable then
				itemTable:SetData("enchantment", true);
			end
		end
		
		return true;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("rooting");
	RITUAL.name = "(T1) Enracinement";
	RITUAL.description = "Quand les incessants chants démoniaques vous exaspèrent, songez à les renvoyer dans les enfers qui les ont engendrés. Exécuter ce rituel éliminera 65 points de corruption.";
	RITUAL.onerequiredbelief = {"honor_the_gods", "one_with_the_druids", "the_black_sea", "witch_druid", "taste_of_iron"}; -- Tier I Faith of the Family Ritual
	
	RITUAL.requirements = {"pantheistic_catalyst", "familial_catalyst", "familial_catalyst"};
	RITUAL.corruptionCost = -65;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("scornificationism");
	RITUAL.name = "(Unique) Méprisificationnisme";
	RITUAL.description = "Tu hais à ce point la nature pécheresse de l'homme que tu refuses de mourir sans entraîner des pécheurs avec toi ! L'exécution de ce rituel te protège des dégâts infligés par les joueurs ou les PNJ qui pourraient te tuer ou te mettre en état critique pendant les 120 prochaines secondes, mais tu peux toujours être éliminé ou maîtrisé par d'autres moyens. Inflige 15 points de corruption.";
	RITUAL.onerequiredbelief = {"extinctionist"}; -- Unique Sol Orthodoxy Ritual
	
	RITUAL.requirements = {"purifying_stone", "light_catalyst", "elysian_catalyst"};
	RITUAL.corruptionCost = 15;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 100;

	function RITUAL:OnPerformed(player)
		player.scornificationismActive = true;
		local endtime = CurTime() + 120
		UpdateActiveRituals(player, "Scornificationism", endtime);
		timer.Create("ScornificationismTimer_"..player:EntIndex(), 120, 1, function()
			if IsValid(player) then
				if player.scornificationismActive then
					player.scornificationismActive = nil;
					UpdateActiveRituals(player,"Scornificationism", nil);
					Clockwork.hint:Send(player, "Le rituel de 'Scornificationism' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("sprouting");
	RITUAL.name = "(T2) Germination";
	RITUAL.description = "Il y a quelque chose à apprendre des feuilles, de la terre et des os. Exécuter ce rituel restaurera 200 points de vie et 100% du sang, tout en soignant toutes les blessures. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shedskin"}; -- Tier II Faith of the Family Ritual
	
	RITUAL.requirements = {"pantheistic_catalyst", "pantheistic_catalyst", "pantheistic_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 25;
	
	function RITUAL:OnPerformed(player)
		player:ResetInjuries();
		player:StopAllBleeding();
		player:SetHealth(math.min(player:Health() + 200, player:GetMaxHealth()));
		player:SetBloodLevel(5000);
		
		Clockwork.chatBox:Add(player, nil, "itnofake", "Un immense soulagement vous submerge alors que vous vous sentez revigoré.");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("soulscorch");
	RITUAL.name = "(Unique) Brûlure d'âme";
	RITUAL.description = "Deviens un catalyseur de l'extinction de l'humanité. Lorsque tu seras terrassé, la Lumière les frappera ainsi ! L'exécution de ce rituel te fera irradier pendant 5 minutes, et à ta mort, tu infligeras des dégâts correspondant à ton niveau de sacrement à toute personne n'appartenant pas à la Foi de la Lumière, à l'exception des Voltistes (ou la moitié s'ils le sont), dans un rayon de conversation. Inflige 15 points de corruption.";
	RITUAL.onerequiredbelief = {"extinctionist"}; -- Unique Sol Orthodoxy Ritual
	
	RITUAL.requirements = {"light_catalyst", "holy_spirit", "light_catalyst"};
	RITUAL.corruptionCost = 15;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.soulscorchActive = true;
		player:SetNetVar("soulscorchActive", true);
		local endtime = CurTime() + 300
		UpdateActiveRituals(player, "Soulscorch", endtime);
		timer.Create("SoulScorchTimer_"..player:EntIndex(), 300, 1, function()
			if IsValid(player) then
				if player.soulscorchActive then
					player.soulscorchActive = nil;
					player:SetNetVar("soulscorchActive", false);
					UpdateActiveRituals(player, "Soulscorch", nil);
					Clockwork.hint:Send(player, "Le rituel 'Soulscorch' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
		
		Clockwork.chatBox:AddInTargetRadius(player, "me", "commence à rayonner d'une lumière divine !", player:GetPos(), config.Get("talk_radius"):Get() * 2);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("steel_will");
	RITUAL.name = "(T2) Volonté d'Acier";
	RITUAL.description = "Intact, inaltéré - le Vernis est avec vous ! Exécuter ce rituel restaure entièrement votre santé mentale, réduit la perte de raison de 90%, et vous immunise contre les effets de la peur pendant 40 minutes. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"flagellant", "acolyte"}; -- Tier II Faith of the Light Ritual
	
	RITUAL.requirements = {"light_catalyst", "elysian_catalyst", "light_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player:SetNetVar("steelWill", true);
		player:HandleSanity(100);
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Steel Will", endtime);
		timer.Create("SteelWillTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player:GetNetVar("steelWill", false) then
					player:SetNetVar("steelWill", false);
					UpdateActiveRituals(player, "Steel Will", nil);
					Clockwork.hint:Send(player, "Le rituel 'Volonté d'Acier' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
		
		Clockwork.chatBox:Add(player, nil, "itnofake", "Tu as l'impression que ton esprit est une forteresse inébranlable !");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

--[[
RITUAL = cwRituals.rituals:New("enlightenment");
	RITUAL.name = "(T3) Illumination";
	RITUAL.description = "Vous avez atteint le sommet de la compréhension Glazique. L'exécution de ce rituel illumine une vaste zone autour de vous pendant 15 minutes d'une lumière sacrée. Il augmentera la santé mentale de tous les personnages à Glaçure Dure se trouvant dans sa lumière et brûlera également tout hérétique Rekh-khet-sa qui s'approcherait. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"emissary", "extinctionist"}; -- Tier III Faith of the Light Ritual
	
	RITUAL.requirements = {"holy_spirit", "light_catalyst", "light_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player:SetNetVar("enlightenmentActive", true);
		
		timer.Create("EnlightenmentTimer_"..player:EntIndex(), 900, 1, function()
			if IsValid(player) then
				if player:GetNetVar("enlightenmentActive", false) then
					player:SetNetVar("enlightenmentActive", false);
					
					Clockwork.hint:Send(player, "Le rituel de l'« Éveil » s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
		
		Clockwork.chatBox:Add(player, nil, "itnofake", "Tu sens une chaleureuse lumière sacrée émaner de chaque orifice de ton corps !");
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()
--]]

RITUAL = cwRituals.rituals:New("summon_champion");
	RITUAL.name = "(Unique) Invocation du Champion";
	RITUAL.description = "Fais surgir un mercenaire éternellement damné pour qu'il exécute tes ordres. Il manie un bouclier et une arme d'acier. Il sera hostile envers quiconque n'appartient pas à la Foi des Ténèbres. Temps d'incantation : 10 secondes. Ajoute un délai de récupération de 8 minutes à toutes les invocations. Inflige 15 points de corruption.";
	RITUAL.requiredSubfaction = {"Rekh-khet-sa"}; -- Tier III Subfaction Ritual
	
	RITUAL.requirements = {"tortured_spirit", "down_catalyst", "down_catalyst"};
	RITUAL.corruptionCost = 15;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 60;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Champion' ritual, spawning a Hell Champion near their position!");
		
		player.nextRitualSummon = CurTime() + 480;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
	
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end

		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end

		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end

			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_bgt_hell_champion");
				
				if IsValid(entity) then
					entity:CustomInitialize();
					entity:Spawn();
					entity:Activate();

					entity:SetColor(Color(255,0,0));
					entity:SetMaterial("models/effects/splode_sheet");
					
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);
					
					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant marquent l'apparition d'un champion impie des Enfers !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("summon_soldier");
	RITUAL.name = "(T3) Invocation de Soldat";
	RITUAL.description = "Fais surgir un soldat damné des Enfers pour qu'il accomplisse tes ordres. Il manie une arme de fer. Il sera hostile envers quiconque ne professe pas la Foi des Ténèbres. Temps d'incantation : 3 secondes. Ajoute un délai de 2 minutes à toutes les invocations. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer"}; -- Tier III Faith of the Dark Ritual
	RITUAL.requiredBeliefsSubfactionOverride = {["Rekh-khet-sa"] = {"embrace_the_darkness"}}; -- Tier III Faith of the Dark Ritual
	
	RITUAL.requirements = {"trinity_catalyst", "down_catalyst", "down_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 3;
	RITUAL.experience = 35;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Soldier' ritual, spawning a Hell Soldier near their position!");
		
		player.nextRitualSummon = CurTime() + 120;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
	
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end

		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end

		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end

			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_bgt_soldier_hell");
				
				if IsValid(entity) then
					entity:CustomInitialize();
					entity:Spawn();
					entity:Activate();

					entity:SetColor(Color(255,0,0));
					entity:SetMaterial("models/effects/splode_sheet");
					
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);
					
					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant annoncent l'apparition soudaine d'une créature impie des Enfers !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("abyssalhowl");
	RITUAL.name = "(Hors du commun) Hurlement abyssal";
	RITUAL.description = "Murmure des mots dans une langue antique jamais prononcée par l'homme, et quelque chose des profondeurs pourrait s'y intéresser. L'exécution de ce rituel augmentera l'efficacité de ton Cri de guerre amélioré, te permettant de soigner 100 % de tous les dégâts subis dans les 2 secondes, et ce pendant 20 minutes. Inflige 30 points de corruption.";
	RITUAL.onerequiredbelief = {"shedskin"}; -- Unique Sister ritual
	
	RITUAL.requirements = {"down_catalyst", "belphegor_catalyst", "pantheistic_catalyst"};
	RITUAL.corruptionCost = 30;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	function RITUAL:OnPerformed(player)
		player.abyssalHowlActive = true;
		local endtime = CurTime() + 1200
		UpdateActiveRituals(player, "Abyssalhowl", endtime);
		timer.Create("AbyssalhowlTimer_"..player:EntIndex(), 1200, 1, function()
			if IsValid(player) then
				if player.abyssalHowlActive then
					player.abyssalHowlActive = nil;
					UpdateActiveRituals(player, "Abyssalhowl", nil);
					Clockwork.hint:Send(player, "Le rituel du 'Hurlement Abyssal' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

--[[
RITUAL = cwRituals.rituals:New("summon_otis");
	RITUAL.name = "(T3) Invocation Démoniaque (Otis)";
	RITUAL.description = "Invoque un puissant Thrall du Néant maniant une tronçonneuse, devenu l'hôte d'un démon des enfers. Il sera hostile envers quiconque n'appartient pas à la Foi des Ténèbres. Temps d'incantation de 15 secondes. Ajoute un délai de récupération de 3 minutes pour toutes les invocations. Inflige 25 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer"}; -- Tier III Faith of the Dark Ritual
	RITUAL.requiredBeliefsSubfactionOverride = {["Rekh-khet-sa"] = {"embrace_the_darkness"}}; -- Tier III Faith of the Dark Ritual
	
	RITUAL.requirements = {"pentagram_catalyst", "tortured_spirit", "pentagram_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 15;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Demon' ritual, spawning an Otis near their position!");
		
		player.nextRitualSummon = CurTime() + 180;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
	
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche d'agir ainsi ici !");
				return false;
			end
		end

		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end

		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end
			
			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_bgt_otis");
				
				if IsValid(entity) then
					entity:CustomInitialize();
					entity:Spawn();
					entity:Activate();
					entity:SetHealth(350);

					entity:SetColor(Color(255,0,0));
					entity:SetMaterial("models/effects/splode_sheet");
					
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);
					
					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant annoncent l'apparition soudaine d'une créature impie des Enfers !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("summon_sprinter");
	RITUAL.name = "(T3) Invocation de Démon (Coureurs)";
	RITUAL.description = "Invoque deux Coureurs Engendrés possédés par des démons loyaux. Ils seront hostiles envers quiconque ne professe pas la Foi des Ténèbres. Que leur divinité protectrice sauve vos ennemis. Temps d'incantation : 15 secondes. Ajoute un délai de récupération de 3 minutes à toutes les invocations. Inflige 25 points de corruption.";
	RITUAL.onerequiredbelief = {"sorcerer"}; -- Tier III Faith of the Dark Ritual
	RITUAL.requiredBeliefsSubfactionOverride = {["Rekh-khet-sa"] = {"embrace_the_darkness"}}; -- Tier III Faith of the Dark Ritual
	
	RITUAL.requirements = {"tortured_spirit", "tortured_spirit", "pentagram_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 15;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Sprinter' ritual, spawning 2 sprinters near their position! God save their enemies.");
		
		player.nextRitualSummon = CurTime() + 180;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
		
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche d'agir ainsi ici !");
			return false;
		end

		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire cela ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");


		if lastZone == "gore_tree" or lastZone == "gore_hallway" or lastZone == "gore" or lastZone == "sea_rough" or lastZone == "sea_calm" or lastZone == "sea_styx" or lastZone == "gore_soil" then
			Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
			return false;
		end
		
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end

			local positions = {
				["1"] = trace.HitPos + (player:GetRight() * 25),
				["2"] = trace.HitPos - (player:GetRight() * 25),
			};

			local playerFaith = player:GetFaith();

			for _, v in pairs(positions) do
				ParticleEffect("teleport_fx", v, Angle(0,0,0), nil)
				sound.Play("misc/summon.wav", v, 100, 100)

			end
			
			timer.Simple(0.5, function()
				for _, v in pairs(positions) do
					local entity = ents.Create("npc_bgt_another");

					if !IsValid(entity) then continue; end

					entity:CustomInitialize();
					entity:Spawn();
					entity:Activate();
					entity:SetModel("models/begotten/thralls/another_sprinter.mdl");
					entity:SetHealth(275);
					
					entity:SetColor(Color(255,0,0));
					entity:SetMaterial("models/effects/splode_sheet");

					entity:AddEntityRelationship(player, D_LI, 99);
					entity.summonedFaith = playerFaith;
					entity.RunAnimation = ACT_RUN;
					entity.Summoned = true;

					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						end
					end

					--Clockwork.entity:MakeFlushToGround(entity, v + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(v + Vector(0, 0, 16));
				end
					
				Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant annoncent l'arrivée de deux Sprinters infernaux dans ce plan ! Oh merde !", trace.HitPos, config.Get("talk_radius"):Get() * 3);

			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("summon_familiar_bear");
	RITUAL.name = "(T3) Invocation de Familier (Ours)";
	RITUAL.description = "Invoque un ours spirituel de la Forêt de Gore pour qu'il accomplisse tes ordres. Il sera hostile envers quiconque ne professe pas la Foi de la Famille. Temps d'incantation de 15 secondes. Ajoute un délai de récupération de 3 minutes à toutes les invocations. Inflige 25 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"xolotl_catalyst", "familial_catalyst", "xolotl_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 15;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Familiar' ritual, spawning a spirit bear near their position!");
		
		player.nextRitualSummon = CurTime() + 180;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
		
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end
			
			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_drg_animals_bear_spirit");
				
				if IsValid(entity) then
					entity:Spawn();
					entity:SetHealth(575);
					entity:Activate(); 
					entity:SetMaterial("models/props_combine/portalball001_sheet")
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.XPValue = 250;
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						else					
							local faction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
							
							if faction == "Goreic Warrior" then
								entity:AddEntityRelationship(v, D_LI, 99);
							end
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);

					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant annoncent l'apparition soudaine d'une créature de la Forêt de Gore !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()
--]]

--[[
RITUAL = cwRituals.rituals:New("summon_familiar_leopard");
	RITUAL.name = "(T3) Invocation de Familier (Léopard)";
	RITUAL.description = "Invoque un léopard spirituel de la Forêt de Gore pour qu'il accomplisse tes ordres. Il sera hostile envers quiconque ne suit pas la Foi de la Famille. Temps d'incantation de 15 secondes. Ajoute un temps de recharge de 10 minutes à toutes les invocations. Inflige 25 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"xolotl_catalyst", "xolotl_catalyst", "pantheistic_catalyst"};
	RITUAL.corruptionCost = 30;
	RITUAL.ritualTime = 15;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Familiar' ritual, spawning a spirit leopard near their position!");
		
		player.nextRitualSummon = CurTime() + 600;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
		
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end
		
			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_drg_animals_snowleopard_spirit");
				
				if IsValid(entity) then
					entity:Spawn();
					entity:SetHealth(400);
					entity:Activate(); 
					entity:SetMaterial("models/props_combine/portalball001_sheet")
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.XPValue = 200;
					
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						else					
							local faction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
							
							if faction == "Goreic Warrior" then
								entity:AddEntityRelationship(v, D_LI, 99);
							end
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);
					
					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement tonitruant annoncent l'apparition soudaine d'une créature de la Forêt de Gore !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()
--]]

RITUAL = cwRituals.rituals:New("summon_familiar_elk");
	RITUAL.name = "(T3) Invocation de Familier (Élan)";
	RITUAL.description = "Invoque un esprit-cerf de la Forêt de Gore pour qu'il accomplisse tes ordres. Il sera hostile envers quiconque ne suit pas la Foi de la Famille. Temps d'incantation de 7 secondes. Ajoute un temps de recharge de 2 minutes à toutes les invocations. Inflige 10 points de corruption.";
	RITUAL.onerequiredbelief = {"watchful_raven"}; -- Tier III Faith of the Family Ritual
	
	RITUAL.requirements = {"elysian_catalyst", "trinity_catalyst", "elysian_catalyst"};
	RITUAL.corruptionCost = 10;
	RITUAL.ritualTime = 7;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		Schema:EasyText(Schema:GetAdmins(), "tomato", player:Name().." has performed the 'Summon Familiar' ritual, spawning a spirit elk near their position!");
		
		player.nextRitualSummon = CurTime() + 120;
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		if player.nextRitualSummon and player.nextRitualSummon > CurTime() then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer à nouveau avant"..tostring(math.ceil(player.nextRitualSummon - CurTime())).." more seconds!");
			return false;
		end
		
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) > 192) then
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
		
		if !IsAreaClear(trace.HitPos, 32, player) then
			Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
			
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
		local lastZone = player:GetCharacterData("LastZone");
		
		if lastZone == "theater" or lastZone == "tower" then
			if Schema.towerSafeZoneEnabled then
				Schema:EasyText(player, "firebrick", "Une force surnaturelle t'empêche de faire ça ici !");
				return false;
			end
		end
		
		local trace = player:GetEyeTraceNoCursor();
		
		if (trace.HitPos:Distance(player:GetShootPos()) <= 192) then
			if !IsAreaClear(trace.HitPos, 32, player) then
				Schema:EasyText(player, "firebrick", "La zone où vous tentez d'invoquer n'est pas dégagée !");
				
				return false;
			end
		
			local playerFaith = player:GetFaith();
			
			ParticleEffect("teleport_fx",trace.HitPos, Angle(0,0,0), nil)
			sound.Play("misc/summon.wav",trace.HitPos, 100, 100)
			
			timer.Simple(0.5, function()
				local entity = ents.Create("npc_drg_animals_deer_spirit");
				
				if IsValid(entity) then
					entity:Spawn();
					entity:Activate(); 
					entity:SetMaterial("models/props_combine/portalball001_sheet")
					entity:AddEntityRelationship(player, D_LI, 99);
					entity.XPValue = 250;
					
					entity.summonedFaith = playerFaith;
					
					for _, v in _player.Iterator() do
						if v:GetFaith() == playerFaith then
							entity:AddEntityRelationship(v, D_LI, 99);
						else					
							local faction = v:GetNetVar("kinisgerOverride") or v:GetFaction();
							
							if faction == "Goreic Warrior" then
								entity:AddEntityRelationship(v, D_LI, 99);
							end
						end
					end
					
					if !cwRituals.summonedNPCs then
						cwRituals.summonedNPCs = {};
					end
					
					table.insert(cwRituals.summonedNPCs, entity);
					
					--Clockwork.entity:MakeFlushToGround(entity, trace.HitPos + Vector(0, 0, 64), trace.HitNormal);
					entity:SetPos(trace.HitPos + Vector(0, 0, 16));
					
					Clockwork.chatBox:AddInTargetRadius(player, "it", "Un éclair aveuglant et un grondement assourdissant annoncent l'apparition soudaine d'une créature de la Forêt de Gore !", trace.HitPos, config.Get("talk_radius"):Get() * 3);
				end
			end);
		else
			Schema:EasyText(player, "firebrick", "Vous ne pouvez pas invoquer aussi loin !");
			
			return false;
		end;
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("triumph_of_the_bark");
	RITUAL.name = "(T2) Triomphe de l'Écorce";
	RITUAL.description = "La Mère est peut-être la créatrice des afflictions, mais elle peut guérir ceux jugés dignes. Accomplir ce rituel vous délivrera de toutes les maladies. Inflige 20 points de corruption.";
	RITUAL.onerequiredbelief = {"man_become_beast", "one_with_the_druids", "daring_trout", "shedskin"}; -- Tier II Faith of the Family Ritual
	
	RITUAL.requirements = {"up_catalyst", "pantheistic_catalyst", "pantheistic_catalyst"};
	RITUAL.corruptionCost = 20;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 30;
	
	function RITUAL:OnPerformed(player)
		local diseases = player:GetCharacterData("diseases", {});
		
		for i = 1, #diseases do
			local disease = diseases[i];
			
			if istable(disease) --[[and disease.uniqueID ~= "begotten_plague"]] then
				diseases[i] = nil;
			end
		end
		
		player:SetCharacterData("diseases", diseases);
		player:NetworkDiseases();
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("upstaged");
	RITUAL.name = "(T2) Éclipsé";
	RITUAL.description = "N'osez pas rivaliser avec la danse d'un bouffon. Un faux pas et vous serez banni en enfer. L'exécution de ce rituel fait que les attaques de riposte désarment votre adversaire. Cet effet dure 40 minutes. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"soothsayer", "heretic", "shedskin"}; -- Tier II Faith of the Dark Ritual
	
	RITUAL.requirements = {"up_catalyst", "belphegor_catalyst", "belphegor_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 30;
	
	function RITUAL:OnPerformed(player)
		player.upstagedActive = true;
		local endtime = CurTime() + 2400
		UpdateActiveRituals(player, "Upstaged", endtime);
		timer.Create("UpstagedTimer_"..player:EntIndex(), 2400, 1, function()
			if IsValid(player) then
				if player.upstagedActive then
					player.upstagedActive = nil;
					UpdateActiveRituals(player, "Upstaged", nil);
					Clockwork.hint:Send(player, "Le rituel 'Upstaged' s'est dissipé...", 10, Color(175, 100, 100), true, true);
				end
			end
		end);
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

RITUAL = cwRituals.rituals:New("waste_not_want_not");
	RITUAL.name = "(Unique) Rien ne se perd, rien ne se crée";
	RITUAL.description = "Les forgerons du Nord savent trop bien ne pas gaspiller leurs biens - chaque dernier morceau, du plus petit bout de ficelle au clou le plus rouillé, trouvera son utilité. En accomplissant ce rituel, tout objet démonté ou fondu fournira des rendements plus élevés, se rapprochant du prix de fabrication d'origine. Ce rituel dure trente minutes. Inflige 5 points de corruption.";
	RITUAL.onerequiredbelief = {"acolyte"}; -- Unique Servus ritual
	RITUAL.requiredSubfaction = {"Servus"}; -- Subfaction Ritual
	
	RITUAL.requirements = {"light_catalyst", "xolotl_catalyst", "elysian_catalyst"};
	RITUAL.corruptionCost = 5;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;

	RITUAL.time = 1800;
	RITUAL.onTimerEnd = function(self, player)
	end
	
	function RITUAL:OnPerformed(player)
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

-- CoS ascension rituals
RITUAL = cwRituals.rituals:New("ascension_house_varazdat");
	RITUAL.name = "(Ascension Unique) Vers la Maison Varazdat";
	RITUAL.description = "Rejette ton héritage paysan insignifiant et renais en tant qu'Enfant de Satan. Avec la lignée du Roi des Rois, ta soif de sang et ta prouesse meurtrière seront sans égales !";
	RITUAL.requiredFaction = {"Children of Satan"}; -- Faction Ritual
	RITUAL.requiredSubfaction = {""}; -- Subfaction Ritual
	
	RITUAL.requirements = {"tortured_spirit", "up_catalyst", "pentagram_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player:SetCharacterData("subfaction", "Varazdat", true);
		player:SetCharacterData("rank", 1);
		Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
	
		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player));
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local subfaction = player:GetSubfaction();
		
		if subfaction and subfaction ~= "" and subfaction ~= "N/A" then
			Schema:EasyText(player, "peru", "Tu as déjà accédé à une lignée sanguine !");
		
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

-- CoS ascension rituals
RITUAL = cwRituals.rituals:New("ascension_house_philimaxio");
	RITUAL.name = "(Ascension Unique) Vers la Maison Philimaxio";
	RITUAL.description = "Rejette ton héritage paysan insignifiant et renais en tant qu'Enfant de Satan. Avec la lignée des Sentinelles Blanches, tu conquerras les âmes des indignes !";
	RITUAL.requiredFaction = {"Children of Satan"}; -- Faction Ritual
	RITUAL.requiredSubfaction = {""}; -- Subfaction Ritual
	
	RITUAL.requirements = {"tortured_spirit", "light_catalyst", "pentagram_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player:SetCharacterData("subfaction", "Philimaxio", true);
		player:SetCharacterData("rank", 1);
		Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
	
		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player));
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local subfaction = player:GetSubfaction();
		
		if subfaction and subfaction ~= "" and subfaction ~= "N/A" then
			Schema:EasyText(player, "peru", "Tu as déjà accédé à une lignée sanguine !");
		
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

-- CoS ascension rituals
RITUAL = cwRituals.rituals:New("ascension_house_rekh-khet-sa");
	RITUAL.name = "(Ascension Unique) Vers la Maison Rekh-khet-sa";
	RITUAL.description = "Rejette ton héritage paysan insignifiant et renais en tant qu'Enfant de Satan. Avec l'antique lignée des sorciers, tu deviendras omniscient et la vie sera éternelle !";
	RITUAL.requiredFaction = {"Children of Satan"}; -- Faction Ritual
	RITUAL.requiredSubfaction = {""}; -- Subfaction Ritual
	RITUAL.onerequiredbelief = {"primevalism"};
	
	RITUAL.requirements = {"tortured_spirit", "up_catalyst", "xolotl_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player:SetCharacterData("subfaction", "Rekh-khet-sa", true);
		player:SetCharacterData("rank", 1);
		Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
	
		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player));
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local subfaction = player:GetSubfaction();
		
		if subfaction and subfaction ~= "" and subfaction ~= "N/A" then
			Schema:EasyText(player, "peru", "Tu as déjà accédé à une lignée sanguine !");
		
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()

-- CoS ascension rituals
RITUAL = cwRituals.rituals:New("ascension_house_kinisger");
	RITUAL.name = "(Ascension Unique) Élévation à la Maison Kinisger";
	RITUAL.description = "Rejette ton héritage paysan insignifiant et renais en tant qu'Enfant de Satan. Avec la lignée maudite des mutants des Black Hats, tu deviendras un maître des ombres et de la tromperie !";
	RITUAL.requiredFaction = {"Children of Satan"}; -- Faction Ritual
	RITUAL.requiredSubfaction = {""}; -- Subfaction Ritual
	
	RITUAL.requirements = {"tortured_spirit", "down_catalyst", "pentagram_catalyst"};
	RITUAL.corruptionCost = 25;
	RITUAL.ritualTime = 10;
	RITUAL.experience = 50;
	
	function RITUAL:OnPerformed(player)
		player:SetCharacterData("subfaction", "Kinisger", true);
		player:SetCharacterData("rank", 1);
		Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
	
		Clockwork.player:LoadCharacter(player, Clockwork.player:GetCharacterID(player));
	end;
	function RITUAL:OnFail(player)
	end;
	function RITUAL:StartRitual(player)
		local subfaction = player:GetSubfaction();
		
		if subfaction and subfaction ~= "" and subfaction ~= "N/A" then
			Schema:EasyText(player, "peru", "Tu as déjà accédé à une lignée sanguine !");
		
			return false;
		end
	end;
	function RITUAL:EndRitual(player)
	end;
RITUAL:Register()
