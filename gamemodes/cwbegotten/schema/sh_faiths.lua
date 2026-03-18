--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

library.New("faiths", Schema);
Schema.faiths.stored = Schema.faiths.stored or {};
local FAITHS = {__index = FAITHS};

-- Called when the faith is converted to a string.
function FAITHS:__tostring()
	return self.uniqueID;
end;

-- Called when the faith is invoked as a function.
function FAITHS:__call(varName, failSafe)
	return self[varName] or failSafe;
end;

-- A function to register a faith..
function FAITHS:Register()
	Schema.faiths:Register(self);
end;

-- A function to get a new faith.
function Schema.faiths:New(uniqueID)
	if (!uniqueID) then
		return;
	end;
	
	local object = Clockwork.kernel:NewMetaTable(FAITHS);
		object.uniqueID = Schema.faiths:SafeName(uniqueID);
	return object;
end;

-- A function to register a faith.
function Schema.faiths:Register(faith)
	if (faith) then
		if (!faith.uniqueID) then
			return;
		end
		
		local tab = {};
		
		if (CLIENT) then
			tab = table.Copy(faith);
		else
			tab.uniqueID = faith.uniqueID;
			tab.name = faith.name or "Faith";
			tab.subfaiths = faith.subfaiths;
		end
		
		self.stored[faith.uniqueID] = tab;
	end;
end;

-- A function to convert a string to a uniqueID.
function Schema.faiths:SafeName(uniqueID)
	return string.lower(string.gsub(uniqueID, "['%.]", ""));
end;

-- A function to get all of the faiths.
function Schema.faiths:GetFaiths()
	return self.stored;
end;

-- A function to find a specific faith.
function Schema.faiths:GetFaith(identifier)
	if identifier then
		identifier = string.lower(identifier);
		
		if (self.stored[identifier]) then
			return self.stored[identifier];
		else
			for k, v in pairs(self.stored) do
				if v.uniqueID == identifier or string.lower(v.name) == identifier then
					return self.stored[k];
				end;
			end;
		end;
	end;
end;

local LIGHT = Schema.faiths:New("light")
	LIGHT.name = "Faith of the Light";
	LIGHT.color = Color(230, 209, 87, 255);
	LIGHT.subfaiths = {"Sol Orthodoxy", "Hard-Glazed", "Voltism"};
	
	-- for character creation
	LIGHT.description = "La Foi de la Lumière, également connue sous le nom de Hard-Glaze ou abrégée en Glaze, est un ensemble d'idées et de croyances largement répandues par la plupart des habitants du territoire de l'Empire de Lumière aujourd'hui disparu. On dit que la foi est née pendant les cent années de souffrance, jusqu'à ce qu'elle déclenche finalement les Guerres de la Sainte Hiérarchie qui menèrent à la création ultime dudit gouvernement. \n\nLa grande majorité de ceux qui suivent et pratiquent la Foi de la Lumière n'en ont qu'une compréhension simpliste et vague. Les gens du commun, loin des rouages du gouvernement, créent souvent leurs propres interprétations qui sont très différentes des textes officiels. En effet, la véritable compréhension de la Glaze est extrêmement complexe, mêlant souvent des enquêtes philosophiques, des œuvres d'art abstrait, et même des équations mathématiques avancées. Les 'Pauvres Cons Non-Éclairés', critiques des voies Glazic, prétendent souvent que la raison pour laquelle la Glaze est si difficile à comprendre est que les roturiers soient incapables de la saisir, et ne puissent ainsi pas remettre en question les ordres de leur seigneur.\n\nBien que les enseignements de la Glaze soient dispersés parmi des milliers d'anciennes écritures, il existerait soi-disant un Manifeste unique - le tout premier texte original de la Glaze. Bien que de nombreuses recherches d'artefacts aient été commandées par divers clergés, aucun homme vivant ne connaît l'emplacement de cette relique sacrée. Un dicton populaire parmi la Sainte Hiérarchie est que \"Tous les liens vers le manifeste...\".";
	LIGHT.image = "begotten/ui/bgtbtnfaithlight.png";
Schema.faiths:Register(LIGHT)

local FAMILY = Schema.faiths:New("family")
	FAMILY.name = "Faith of the Family";
	FAMILY.color = Color(163, 153, 143, 255);
	FAMILY.subfaiths = {"Faith of the Father", "Faith of the Mother", "Faith of the Old Son", "Faith of the Young Son", "Faith of the Sister"};
	
	-- for character creation
	FAMILY.description = "La Foi de la Famille est une forme de polythéisme suivie par les Gores et de nombreuses bandes de ferrailleurs. Les fondateurs originels de cette religion étaient les Druides des Lames, nommés ainsi pour leur capacité à forger des armes en acier. On dit que ces druides plantèrent une graine dans le sol qui fit germer un arbre grand et glorieux atteignant le ciel. Les Gores de cette époque étaient des hommes sans dieu, s'entretuant avec des massues en os et des bâtons pointus car le Nord était une terre trop rude pour qu'un progrès quelconque puisse être réalisé. Lorsqu'ils arrivèrent au Grand Arbre, les Druides des Lames leur enseignèrent leurs voies, ce qui incluait la croyance envers les Cinq Dieux.\n\nBien que ces druides aient bientôt été trahis par les Gores sauvages et que les véritables noms des Cinq Dieux aient été oubliés, ils perdurent en tant que la Famille : la Mère, le Père, le Vieux Fils, la Sœur et le Jeune Fils. Depuis l'incendie du Grand Arbre par la main du Seigneur Maximus, les Gores restants se sont unis avec l'objectif unique de venger leur arbre. Lorsque le Dieu de la Lumière se suicida peu après, son pouvoir fragmenté pleuva sur le Grand Arbre, lui accordant un fragment de vie. Maintenant, les Gores ont une lueur d'espoir d'empêcher leur arbre de mourir par des sacrifices de sang, bien qu'il faille des centaines de cadavres par an simplement pour le maintenir en vie.";
	FAMILY.image = "begotten/ui/bgtbtnfaithfamily.png";
Schema.faiths:Register(FAMILY)

local DARK = Schema.faiths:New("dark")
	DARK.name = "Faith of the Dark";
	DARK.color = Color(137, 0, 0, 255);
	DARK.subfaiths = {"Primevalism", "Satanism"};
	
	-- for character creation
	DARK.description = "La Foi des Ténèbres est le nom donné à la croyance la plus vraie de toutes. L'humanité a fait le choix de se priver de plaisir pour l'espoir de quelque chose de plus, une sorte de justification derrière leur misère. Ils ont commis l'erreur de suivre la Lumière, quelque chose qui n'existe que pour éloigner les hommes de leurs véritables désirs. Ces hommes prient un dieu qui n'écoute jamais, un dieu qui est mort à plus d'un titre. Ils croient qu'ils doivent souffrir une vie de misère et de douleur pour un au-delà de félicité et d'ignorance. La Foi des Ténèbres est l'inverse de cette croyance.\n\nLa Foi des Ténèbres a existé en secret pendant des milliers d'années, mais il n'y avait jamais eu de véritable Légion sous sa domination jusqu'à la venue du Dieu-Dessous, lorsque ses disciples ont finalement décidé qu'il était temps de sortir de la clandestinité. Il y avait aussi ceux qui adoraient Satan sans le savoir, leurs propres dieux étant des manifestations déformées de sa présence. Personne ne sait vraiment lesquels des dieux étaient réels et lesquels n'étaient que des proxys du Ténébreux. Loin à l'est des terres de l'Empire de Lumière se trouvait le vaste Empire du Nigerii, divisé en États en conflits gouvernés par de nombreux princes. Cet Empire est souvent considéré par les sources de la Hiérarchie comme la première Légion Noire, car tous leurs dieux étaient des marionnettes ou des formes intermédiaires de Satan. Cependant, avec la venue du Dieu-Dessous, ce paysage tout entier a été dévoré, prouvant qu'il ne faisait pas le poids face à la puissance du némésis de Satan."
	DARK.image = "begotten/ui/bgtbtnfaithdark.png";
Schema.faiths:Register(DARK)

local COMMAND = Clockwork.command:New("CharTransferFaith");
	COMMAND.tip = "Transférer un personnage vers une foi.";
	COMMAND.text = "<string Name> <string Faith>";
	COMMAND.access = "o";
	COMMAND.arguments = 2;
	COMMAND.alias = {"TransferFaith", "PlyTransferFaith", "SetFaith", "CharSetFaith", "PlySetFaith"};

	-- Called when the command has been run.
	function COMMAND:OnRun(player, arguments)
		local target = Clockwork.player:FindByID(arguments[1])
		
		if (target) then
			local faith = string.gsub(arguments[2], "\"", "");
			local faithTable = Schema.faiths:GetFaith(faith);
			
			if faithTable then
				if target:GetFaith() ~= faithTable.name then
					local name = target:Name();

					if cwBeliefs then
						local beliefTrees = cwBeliefs.beliefTrees.stored;
						local targetBeliefs = target:GetCharacterData("beliefs", {});
						local oldFaith = target:GetFaith();
						local points = target:GetCharacterData("points", 0);
						
						for k, beliefTree in pairs(beliefTrees) do
							if beliefTree.requiredFaiths and table.HasValue(beliefTree.requiredFaiths, oldFaith) then
								for k2, v2 in pairs(beliefTree.beliefs) do
									for k3, v3 in pairs(v2) do
										for k4, v4 in pairs(targetBeliefs) do
											if k3 == k4 and v4 == true then
												targetBeliefs[k4] = false;
												points = points + 1;
											end
										end
									end
								end
								
								if beliefTree.hasFinisher and targetBeliefs[k.."_finisher"] then
									targetBeliefs[k.."_finisher"] = false;
								end
							end
						end
						
						target:SetCharacterData("beliefs", targetBeliefs);
						target:SetCharacterData("points", points);
					end
					
					target:SetCharacterData("Faith", faithTable.name, true);
					target.cwCharacter.subfaith = nil;
					
					local targetAngles = target:EyeAngles();
					local targetPos = target:GetPos();
					
					Clockwork.player:LoadCharacter(target, Clockwork.player:GetCharacterID(target));
					
					target:SetPos(targetPos);
					target:SetEyeAngles(targetAngles);
					
					Clockwork.player:NotifyAll(player:Name().." has transferred "..name.." to the "..faithTable.name.." faith.");
				else
					Clockwork.player:Notify(player, target:GetName().." is already a member of the "..faithTable.name.." faith!");
				end
			else
				Clockwork.player:Notify(player, arguments[2].." is not a valid faith!");
			end
		else
			Clockwork.player:Notify(player, arguments[1].." is not a valid player!");
		end;
	end;
COMMAND:Register();