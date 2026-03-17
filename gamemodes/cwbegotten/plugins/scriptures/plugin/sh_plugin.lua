--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

PLUGIN:SetGlobalAlias("cwScriptures");

util.IncludeDirectory("cwbegotten/plugins/scriptures/plugin/booktexts/")

local ITEM = Clockwork.item:New(nil, true)
	ITEM.name = "Book Base"
	ITEM.weight = 0
	ITEM.category = "Scripture"
	ITEM.useText = "Read"
	ITEM.uniqueID = "book_base"
	ITEM.notStackable = true
	ITEM.customFunctions = {"Copy"};
	ITEM.fireplaceFuel = 180;

	-- Called when the item should be setup.
	function ITEM:OnSetup()
		if not self.setup then
			if (self.bookInformation) then
				for i = 1, #self.bookInformation do
					local background = self.background or "https://i.imgur.com/ofkBgu0.png";
					local text = string.gsub(string.gsub(self.bookInformation[i], "\n", "<br>"), "\t", string.rep("&nbsp", 4));
					
					self.bookInformation[i] = "<html><style>#example {padding-top:48px; padding-left:60px; padding-right:60px; padding-bottom:0px; height: 736px; overflow: visible; background-image: url('"..background.."'); background-repeat: no-repeat; background-size: 100% 790px;}</style><font face='Papyrus' size='3'><div id='example'>"..text.."</div></font></html>"
				end
			end
			
			self.setup = true;
		end
	end
	
	-- Called when the player uses item.
	function ITEM:OnUse(player, itemEntity)
		if !cwBeliefs or (cwBeliefs and player:HasBelief("literacy")) then
			if (!cwBeliefs or (self.bookType == "Glazic" or player:HasBelief("anthropologist"))) then
				local booksRead = player:GetCharacterData("BooksRead", {});
				
				if !table.HasValue(booksRead, self.uniqueID) then
					if cwBeliefs and #booksRead < 8 then
						local readXP = cwBeliefs.xpValues["read"] or 50;
						
						if player:GetFaction() ~= "Wanderer" then
							readXP = math.Round(readXP / 2);
						end
						
						player:HandleXP(readXP);
					end
					
					table.insert(booksRead, self.uniqueID);
					
					player:SetCharacterData("BooksRead", booksRead);
					netstream.Start(player, "UpdateBooksRead", booksRead);
				end
				
				if self.model == "models/begoyten/goretablet/goretablet.mdl" then
					player:EmitSound("physics/concrete/rock_impact_soft"..math.random(1, 3)..".wav");
				else
					player:EmitSound("begotten/items/note_turn.wav")
				end;
				
				netstream.Start(player, "OpenBook", self("uniqueID"))
			else
				Schema:EasyText(player, "chocolate", "Vous ne pouvez pas déchiffrer les glyphes de ce grimoire !");
			end
		else
			Schema:EasyText(player, "chocolate", "Vous n'êtes pas lettré !");
		end
		
		return false
	end
	
	function ITEM:OnCustomFunction(player, name)
		if (name == "Copy") then
			local booksCopied = player:GetCharacterData("BooksCopied", {});
			
			if player:HasItemByID("quill") and player:HasItemByID("paper") then
				if !cwBeliefs or (cwBeliefs and player:HasBelief("scribe")) then
					if !table.HasValue(player:GetCharacterData("BooksRead", {}), self.uniqueID) then
						Schema:EasyText(player, "chocolate", "Vous devez avoir lu cette écriture avant de tenter de la copier !");
						
						return false;
					end
				
					if (!cwBeliefs or (self.bookType == "Glazic" or player:HasBelief("anthropologist"))) then
						local itemTable = item.CreateInstance(self.uniqueID);
						local bSuccess, fault = player:GiveItem(itemTable, true);
						
						if bSuccess then
							if table.HasValue(booksCopied, self.uniqueID) then
								if cwBeliefs then
									player:HandleXP(math.Round(cwBeliefs.xpValues["copy"] / 2));
								end
							else
								table.insert(booksCopied, self.uniqueID);
								
								player:SetCharacterData("BooksCopied", booksCopied);
								netstream.Start(player, "UpdateBooksCopied", booksCopied);
							
								if cwBeliefs then
									player:HandleXP(cwBeliefs.xpValues["copy"]);
								end
							end
							
							player:TakeItemByID("paper");
							
							local itemList = Clockwork.inventory:GetItemsAsList(player:GetInventory());
							local quillItemTable;
							
							for k, v in pairs (itemList) do
								if v.uniqueID == "quill" then
									quillItemTable = v;
									break;
								end
							end
							
							if quillItemTable then
								local quillCondition = quillItemTable:GetCondition();
								local condition = quillCondition - 34;
								
								if condition <= 0 then
									player:TakeItem(quillItemTable, true);
								else
									quillItemTable:SetCondition(condition, true);
								end
							end
						else
							Schema:EasyText(player, "chocolate", "Tu ne peux pas déchiffrer les glyphes de ce manuscrit !");
						end
					else
						--Schema:EasyText(player, "firebrick", "Quelque chose a horriblement mal tourné ! Veuillez contacter un administrateur en utilisant /adminhelp.");
						return false;
					end
				else
					Schema:EasyText(player, "chocolate", "Vous n'avez pas la croyance requise pour faire cela !");
					return false;
				end
			else
				Schema:EasyText(player, "chocolate", "Il te faut du papier et une plume pour copier les écritures !");
				return false;
			end
		end;
	end;
	
	-- Called when a player drops the item.
	function ITEM:OnDrop(player, itemEntity) end
	
	-- A function to get the item's weight based on how many pages the book contains.
	function ITEM:GetItemWeight()
		if (!self.bookInformation or #self.bookInformation <= 0) then
			return 0.25;
		else
			return 0.05 + (#self.bookInformation * 0.05);
		end;
	end;
	
	ITEM:AddQueryProxy("weight", ITEM.GetItemWeight);
ITEM:Register()

local ITEM = Clockwork.item:New();
	ITEM.name = "Quill";
	ITEM.uniqueID = "quill";
	ITEM.cost = 50;
	ITEM.model = "models/begotten/misc/quill.mdl";
	ITEM.weight = 0.1;
	ITEM.category = "Tools";
	ITEM.stackable = true;
	ITEM.description = "Une petite plume utilisable pour écrire par ceux qui sont suffisamment instruits.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/quill.png"

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 200, onGround = false, bNoSupercrate = true};

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

ITEM:Register();

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Booby Blagoona: A Bibliography"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_bbab"
	ITEM.description = "Un livre relié en cuir portant le nom de la figure glazique controversée, Booby Blagoona."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Booby_Page1, Book_Booby_Page2, Book_Booby_Page3, Book_Booby_Page4}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Boxer Harvus Krammy: A Bibliography"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_bhkab"
	ITEM.description = "Un livre relié en cuir portant le titre d'un éminent philosophe glazien."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Boxer_Page1, Book_Boxer_Page2, Book_Boxer_Page3, Book_Boxer_Page4, Book_Boxer_Page5}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Vance K. Heimann: A Bibliography"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_vkhab"
	ITEM.description = "Un livre relié en cuir portant le titre du premier Grand Inquisiteur."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Vance_Page1, Book_Vance_Page2, Book_Vance_Page3, Book_Vance_Page4, Book_Vance_Page5}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Folly of the Gore"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_fotgore"
	ITEM.description = "Un livre relié en cuir détaillant un bref résumé sur les Gores."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_GoreFolly_Page1, Book_GoreFolly_Page2, Book_GoreFolly_Page3}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Glorious Seventeen"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_thegs"
	ITEM.description = "Un livre relié en cuir détaillant l'histoire des Chevaliers de Sol."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Seventeen_Page1, Book_Seventeen_Page2, Book_Seventeen_Page3}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Ballad of Saint Ragnar"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_bosr"
	ITEM.description = "Un livre relié de cuir détaillant l'un des deux saints du Nord - le premier, le Givre."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_SaintRagnar_Page1, Book_SaintRagnar_Page2, Book_SaintRagnar_Page3}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 4500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Saga of Saint Jeremiah Matheus the Bald"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_sosjtb"
	ITEM.description = "Un livre relié de cuir qui détaille l'un des deux saints du Nord - le dernier, le Philimonjio."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_SaintMatheus_Page1, Book_SaintMatheus_Page2, Book_SaintMatheus_Page3, Book_SaintMatheus_Page4}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 4500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The County Districts"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_tcd"
	ITEM.description = "Un parchemin détaillant un bref résumé des pauvres quartiers périphériques."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_County1}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Gay King Summit"
	ITEM.model = "models/props_monastery/book_large.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_gks"
	ITEM.description = "Un vaste récit relié en cuir détaillant la première rencontre avec la menace du Nord."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Gay_Page1, Book_Gay_Page2, Book_Gay_Page3, Book_Gay_Page4, Book_Gay_Page5, Book_Gay_Page6, Book_Gay_Page7, Book_Gay_Page8, Book_Gay_Page9, Book_Gay_Page10, Book_Gay_Page11, Book_Gay_Page12, Book_Gay_Page13, Book_Gay_Page14, Book_Gay_Page15, Book_Gay_Page16, Book_Gay_Page17, Book_Gay_Page18, Book_Gay_Page19, Book_Gay_Page20, Book_Gay_Page21, Book_Gay_Page22, Book_Gay_Page23, Book_Gay_Page24, Book_Gay_Page25, Book_Gay_Page26, Book_Gay_Page27}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_large.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 4000, onGround = false, bNoSupercrate = true};
	
ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Spooning"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_s"
	ITEM.description = "Un parchemin décrivant la pratique de la cuillère."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Spooning}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Ride of Tears"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_rot"
	ITEM.description = "Un parchemin décrivant l'usage de la Chevauchée des Larmes."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Tears}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Quotes of Glazic Renewal"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_qogr"
	ITEM.description = "Un parchemin de papier affichant des citations de génie."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Quotes1, Book_Quotes2}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Quotes of Northern Piety"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_qonp"
	ITEM.description = "Un parchemin de papier affichant des citations de la foi Gore-Glazic."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_NorthQuotes_Page1, Book_NorthQuotes_Page2, Book_NorthQuotes_Page3}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 4000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Perpetual Urges"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_tpu"
	ITEM.description = "Un parchemin concernant une publication sur le Quatrième Bannissement Érotique."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Urges1}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2700, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Glaze"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_g"
	ITEM.description = "Un parchemin traitant de l'essence de la création et de la source de toute Lumière."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Glaze1}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 2500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Treachery of the Great Northern Orthodoxy"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_totgno"
	ITEM.description = "Un parchemin détaillant une grande trahison dans une colonie Gore-Glazic."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Treachery1}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 5000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Death Ships"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 1;
	ITEM.uniqueID = "book_ds"
	ITEM.description = "Un livre relié en cuir relatant le voyage inaugural des Vaisseaux de la Mort."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Deathships_Page1, Book_Deathships_Page2, Book_Deathships_Page3, Book_Deathships_Page4, Book_Deathships_Page5}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Assault on Farmstead 8"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_assault"
	ITEM.description = "Un livre relié de cuivre relatant les événements d'une terrible tragédie."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Assault_Page1, Book_Assault_Page2, Book_Assault_Page3, Book_Assault_Page4, Book_Assault_Page5}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Karmine Willtan: A Bibliography"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_karmine"
	ITEM.description = "Un livre relié en cuir intitulé d'après un homme de foi du comté."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Karmine_Page1, Book_Karmine_Page2, Book_Karmine_Page3}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Lord Maximus: A Bibliography"
	ITEM.model = "models/props_monastery/book_large.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_lord"
	ITEM.description = "Un vaste récit relié en cuir, portant le nom de la plus illustre figure glazique."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Maximus_Page1, Book_Maximus_Page2, Book_Maximus_Page3, Book_Maximus_Page4, Book_Maximus_Page5, Book_Maximus_Page6, Book_Maximus_Page7, Book_Maximus_Page8, Book_Maximus_Page9, Book_Maximus_Page10, Book_Maximus_Page11}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_large.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};
	
ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Fucker Joe: A Bibliography"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_fuckerjoe"
	ITEM.description = "Un livre relié en cuir portant le nom d'un célèbre tueur en série."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Fucker_Page1, Book_Fucker_Page2, Book_Fucker_Page3, Book_Fucker_Page4}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Alamos Eulogy"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_alamos"
	ITEM.description = "Un parchemin de papier dépeignant l'éloge funèbre d'un disciple tombé."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Alamos_Page1}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 5000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Undergod"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_underg"
	ITEM.description = "Un livre relié en cuir, intitulé d'après l'ultime antagoniste de l'humanité. Écrit par un auteur glazien inconnu. Sa présence vous remplit d'un malaise."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Undergod_Page1, Book_Undergod_Page2, Book_Undergod_Page3, Book_Undergod_Page4, Book_Undergod_Page5}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The First Inquisition"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_tfi"
	ITEM.description = "Un livre relié en cuir détaillant la Première Inquisition."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_FirstInquisition_Page1, Book_FirstInquisition_Page2, Book_FirstInquisition_Page3, Book_FirstInquisition_Page4}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 3500, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Begotten"
	ITEM.model = "models/props_monastery/book_small.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_tbegot"
	ITEM.description = "Un livre relié de cuir, intitulé d'après la corruption impie qui ravage le monde. Écrit par un auteur glazic inconnu. Sa présence vous remplit d'un profond malaise."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Begotten_Page1, Book_Begotten_Page2, Book_Begotten_Page3, Book_Begotten_Page4, Book_Begotten_Page5, Book_Begotten_Page6}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_small.png";

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Death of Him"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_deadgod"
	ITEM.description = "Un parchemin détaillant le témoignage oculaire d'un paysan anonyme d'un comté inconnu."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_GodSuicide_Page1, Book_GodSuicide_Page2, Book_GodSuicide_Page3, Book_GodSuicide_Page4}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";

	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Order of the Golden Phallus"
	ITEM.model = "models/items/magic/scrolls/scroll_rolled.mdl"
	ITEM.weight = 0.6;
	ITEM.uniqueID = "book_phallus"
	ITEM.description = "Un parchemin de papier venu de l'Extrême-Orient. Il porte des mots étrangers inscrits en caractères rouges."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Phallus_Page1, Book_Phallus_Page2}
	ITEM.bookType = "Darklander"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Succession of the Bark Throne"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_shagalax"
	ITEM.description = "Une pierre runique du Nord. Elle porte des inscriptions en une langue étrangère."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Shagalax_Page1, Book_Shagalax_Page2, Book_Shagalax_Page3, Book_Shagalax_Page4, Book_Shagalax_Page5, Book_Shagalax_Page6}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Reaper King"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_kalkaslash"
	ITEM.description = "Une pierre runique du Nord. Elle porte des inscriptions en une langue étrangère."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Gore_Page1, Book_Gore_Page2, Book_Gore_Page3, Book_Gore_Page4}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "Arrival of the Blade Druids"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_druids"
	ITEM.description = "Une pierre runique du Nord. Des inscriptions étrangères y sont gravées."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Druids_Page1, Book_Druids_Page2, Book_Druids_Page3}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The First Blind Seer"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_crast"
	ITEM.description = "Une pierre runique du Nord. Elle porte des inscriptions en une langue étrangère."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Crast_Page1, Book_Crast_Page2, Book_Crast_Page3, Book_Crast_Page4, Book_Crast_Page5}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Leviathan"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_harald"
	ITEM.description = "Une pierre runique du Nord. Elle porte des inscriptions en une langue étrangère."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Harald_Page1, Book_Harald_Page2, Book_Harald_Page3}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 6000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Sister's Curse"
	ITEM.model = "models/begoyten/goretablet/goretablet.mdl"
	ITEM.weight = 1.4;
	ITEM.uniqueID = "book_reaver"
	ITEM.description = "Une pierre runique du Nord. Elle porte des inscriptions en une langue étrangère."
	ITEM.background = "https://i.imgur.com/1rRASI3.png"
	ITEM.bookInformation = {Book_Reaver_Page1, Book_Reaver_Page2, Book_Reaver_Page3, Book_Reaver_Page4}
	ITEM.bookType = "Goreic"
	ITEM.iconoverride = "begotten/ui/itemicons/goretablet.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 7000, onGround = false, bNoSupercrate = true};

ITEM:Register()

local ITEM = Clockwork.item:New("book_base")
	ITEM.name = "The Doomed Legion"
	ITEM.model = "models/props_monastery/book_large.mdl"
	ITEM.weight = 1.2;
	ITEM.uniqueID = "book_doomed"
	ITEM.description = "Un grand livre relié en cuir contenant les chroniques maudites d'une légion condamnée."
	ITEM.background = "https://i.imgur.com/ofkBgu0.png"
	ITEM.bookInformation = {Book_Doomed_Page1, Book_Doomed_Page2, Book_Doomed_Page3, Book_Doomed_Page4, Book_Doomed_Page5, Book_Doomed_Page6, Book_Doomed_Page7, Book_Doomed_Page8, Book_Doomed_Page9, Book_Doomed_Page10, Book_Doomed_Page11, Book_Doomed_Page12, Book_Doomed_Page13, Book_Doomed_Page14, Book_Doomed_Page15, Book_Doomed_Page16, Book_Doomed_Page17, Book_Doomed_Page18}
	ITEM.bookType = "Glazic"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/book_large.png";
	
	ITEM.itemSpawnerInfo = {category = "City Junk", rarity = 7000, onGround = false, bNoSupercrate = true};
	
ITEM:Register()

if (SERVER) then
	function cwScriptures:PlayerCharacterLoaded(player)
		local booksCopied = player:GetCharacterData("BooksCopied", {});
		local booksRead = player:GetCharacterData("BooksRead", {});
		
		netstream.Start(player, "UpdateBooksCopied", booksCopied);
		netstream.Start(player, "UpdateBooksRead", booksRead);
	end
end

if (CLIENT) then
	local PANEL = {}

	-- Called when the panel is initialized.
	function PANEL:Init()
		local unixTime = SysTime()
		local scrW = ScrW()
		local scrH = ScrH()
		
		self:SetTitle("")
		self:SetBackgroundBlur(true)
		self:SetDeleteOnClose(false)
		self:ShowCloseButton(false)

		self:SetSize(749, 870)
		self:SetPos((scrW / 2) - (self:GetWide() / 2), (scrH / 2) - (self:GetTall() / 2) )
		
		local loadingText = vgui.Create("DLabel", self)
		loadingText:SetText("Chargement...")
		loadingText:SetFont("Subtitle_Yell")
		loadingText:SetTextColor(Color(255, 0, 0, 150))
		loadingText:SetPos((self:GetWide() / 2) - (GetFontWidth("Subtitle_Yell", "Loading...") / 2), (self:GetTall() / 2) - (GetFontHeight("Subtitle_Yell", "Loading...") / 2))
		loadingText:SizeToContents()
		
		-- Called when the button is clicked.
		function self.btnClose.DoClick(button)
			self:Close() self:Remove()
			
			gui.EnableScreenClicker(false)
		end
		
		Clockwork.Client.currentPage = 1
		Clockwork.kernel:RegisterBackgroundBlur(self, unixTime)
	end

	-- Called each frame.
	function PANEL:Think()
		if (self.alwaysDisabled) then
			return
		end
		
		if (IsValid(self.leftButton)) then
			if (Clockwork.Client.currentPage <= 1) then
				self.leftButton:SetEnabled(false)
			else
				self.leftButton:SetEnabled(true)
			end
		end
		
		if (IsValid(self.rightButton)) then
			if (Clockwork.Client.currentPage >= #pages) then
				self.rightButton:SetEnabled(false)
			else
				self.rightButton:SetEnabled(true)
			end
		end
	end

	-- Called each frame.
	function PANEL:Paint()
		
	end

	-- A function to populate the panel.
	function PANEL:Populate(itemTable)
		self.itemTable = itemTable
		pages = itemTable.bookInformation
		
		self.leftButton = vgui.Create("DButton", self)
		self.leftButton:SetSize((self:GetWide() - 8) / 2, 48 + 4 - 8)
		self.leftButton:SetPos(4, 870 - 48 - 4 - 16 + 4)
		self.leftButton:SetText("<")
		
		-- Called when the button is clicked.
		function self.leftButton:DoClick()
			PANEL:DoPage(true)
		end
		
		self.rightButton = vgui.Create("DButton", self)
		self.rightButton:SetSize(((self:GetWide() - 8) / 2), 48 + 4 - 8)
		self.rightButton:SetPos(self.leftButton:GetPos() + self.leftButton:GetWide() + 4, 870 - 48 - 4 - 16 + 4)
		self.rightButton:SetText(">")
		
		-- Called when the button is clicked.
		function self.rightButton:DoClick()
			PANEL:DoPage(false)
		end

		local x, y = self.rightButton:GetPos()
		
		self.closebutton = vgui.Create("DButton", self)
		self.closebutton:SetSize(self:GetWide() - 4, 16)
		self.closebutton:SetPos(4, 870 - 48 - 4 + 36)
		self.closebutton:SetText("Fermer l'Écriture")
		
		if (#pages <= 1) then
			self.alwaysDisabled = true
			self.leftButton:SetVisible(false)
			self.rightButton:SetVisible(false)
			self.closebutton:SetPos(4, 804)
		end
		
		-- Called when the button is clicked.
		function self.closebutton:DoClick()
			if Clockwork.Client.BookPanel.itemTable and Clockwork.Client.BookPanel.itemTable.model == "models/begoyten/goretablet/goretablet.mdl" then
				surface.PlaySound("physics/concrete/rock_impact_soft"..math.random(1, 3)..".wav");
			else
				surface.PlaySound("begotten/items/note_turn.wav")
			end;
		
			Clockwork.Client.BookPanel:Close() Clockwork.Client.BookPanel:Remove()
			gui.EnableScreenClicker(false)
		end

		htmlPanel = vgui.Create("DHTML", self)
		htmlPanel:SetHTML(pages[Clockwork.Client.currentPage])
		htmlPanel:SetWrap(true)
		gui.EnableScreenClicker(true)
	end

	-- A function to change the page.
	function PANEL:DoPage(bLeft)
		if Clockwork.Client.BookPanel.itemTable and Clockwork.Client.BookPanel.itemTable.model == "models/begoyten/goretablet/goretablet.mdl" then
			surface.PlaySound("physics/concrete/rock_impact_soft"..math.random(1, 3)..".wav");
		else
			surface.PlaySound("begotten/items/note_turn.wav")
		end;
		
		if (!Clockwork.Client.currentPage) then
			Clockwork.Client.currentPage = 1
		end
		
		if (bLeft) then
			Clockwork.Client.currentPage = math.Clamp(Clockwork.Client.currentPage - 1, 1, 100)
			htmlPanel:SetHTML(pages[Clockwork.Client.currentPage])
		else
			Clockwork.Client.currentPage = math.Clamp(Clockwork.Client.currentPage + 1, 1, #pages)
			htmlPanel:SetHTML(pages[Clockwork.Client.currentPage])
		end
	end

	-- Called when the layout should be performed.
	function PANEL:PerformLayout()
		--htmlPanel:StretchToParent(4, 24, 4, 52)
		htmlPanel:SetSize(770, 800);
		DFrame.PerformLayout(self)
	end

	-- Called when the panel is closed.
	function PANEL:OnClose()
		Clockwork.kernel:RemoveBackgroundBlur(self)
	end

	vgui.Register("cwViewBook", PANEL, "DFrame")
	
	if (IsValid(Clockwork.Client.BookPanel)) then
		Clockwork.Client.BookPanel:Close()
		Clockwork.Client.BookPanel:Remove()
	end
	
	netstream.Hook("OpenBook", function(data)
		local itemTable = Clockwork.item:FindByID(data)

		if (itemTable and itemTable.bookInformation) then
			if (IsValid(Clockwork.Client.BookPanel)) then
				Clockwork.Client.BookPanel:Close()
				Clockwork.Client.BookPanel:Remove()
			end
			
			Clockwork.Client.BookPanel = vgui.Create("cwViewBook")
			Clockwork.Client.BookPanel:Populate(itemTable)
			Clockwork.Client.BookPanel:MakePopup()
			
			if (Clockwork.menu:GetOpen()) then
				Clockwork.menu:SetOpen(false)
			end
		end
	end)
	
	netstream.Hook("UpdateBooksRead", function(data)
		if data then
			cwScriptures.booksRead = data;
		end
	end)
	
	netstream.Hook("UpdateBooksCopied", function(data)
		if data then
			cwScriptures.booksCopied = data;
		end
	end)
end