local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Abandoned Doll";
	ITEM.model = "models/props_c17/doll01.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "abandoned_doll";
	ITEM.description = "Un vieux jouet d'enfant, vestige d'une ère de prospérité depuis longtemps révolue. Il porte les marques du temps et de l'usage, mais peut encore offrir quelque réconfort en ces temps plus sombres.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit la perte de santé mentale de 50 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 600};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Bronze Ring of Protection";
	ITEM.model = "models/items/magic/ring_basic/ring_copper.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_protection_bronze";
	ITEM.description = "Un anneau à l'aura mystérieuse, apparemment fait de bronze. Le porter au doigt procure une sensation de sécurité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit de 5 % tous les dégâts subis.\n- Réduit de 8 % les dégâts de stabilité subis.";
	ITEM.mutuallyExclusive = {"ring_protection_gold", "ring_protection_silver"};
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 600, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Contortionist's Boot";
	ITEM.model = "models/props_junk/Shoe001a.mdl";
	ITEM.weight = 0.35;
	ITEM.uniqueID = "boot_contortionist";
	ITEM.description = "Une botte en cuir qui, étonnamment, n'a pas encore été mangée. À en juger par son inscription, elle appartenait manifestement à un gymnaste antique.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Rend immunisé contre les fractures des jambes.\n- Réduit les dégâts de chute de 50 %.\n- Réduit la consommation d’endurance des roulades de combat de 25 %.\n- Réduit la consommation d’endurance des sauts de 66,6 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1150};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Courier's Ring";
	ITEM.model = "models/items/magic/ring_basic/ring_silver.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_courier";
	ITEM.description = "Un anneau d'argent ayant appartenu à un messier qui parcourait les districts du comté. Le porter au doigt donne l'impression d'avoir plus d'endurance.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ring_courier.png";
	ITEM.charmEffects = "- Réduit la consommation d’endurance lors des sprints de 25 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Crucifix";
	ITEM.model = "models/begotten/misc/crucifix.mdl";
	ITEM.weight = 0.25;
	ITEM.uniqueID = "crucifix";
	ITEM.description = "Une croix en bois ornée d'une figure sculptée d'un prophète barbu. Bien que relique d'une époque révolue, vous sentez qu'elle offre encore une certaine protection contre le mal.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit toute corruption subie de 25 %.\n- Réduit la corruption subie par les armes sacrificielles de 50 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Distorted Ring";
	ITEM.model = "models/items/magic/ring_secondchance/ring_secondchance.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_distorted";
	ITEM.description = "Un anneau à l'aura mystérieuse. Le porter au doigt donne l'impression d'être plus chanceux.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- A 5 % de chances d’éviter complètement les dégâts lorsqu’il subit des dégâts de toute source, cumulable avec la croyance « Chanceux ».\n- Empêche la mort lors d’un coup mortel infligé par un autre joueur, mais se brise de manière irréparable et devient inutile lorsque cela se produit.";

	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1500, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Earthing Effigy";
	ITEM.model = "models/begotten/misc/effigy2.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "effigy_earthing";
	ITEM.description = "Une rare brindille du Grand Arbre. Elle vous fait vous sentir ancré et résolu ; un rappel de l'ordre naturel.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit la perte de santé mentale de 25 %.\n- Réduit la perte de stabilité de 25 %.";
	
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Embalmed Heart";
	ITEM.model = "models/items/special/l08_momified_heart.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "embalmed_heart";
	ITEM.description = "Un cœur momifié, embaumé avec un soin particulier par une ancienne civilisation.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit la perte de sang de 50 % en cas d’hémorragie.\n- Triple la vitesse de régénération du sang.";
	
	--ITEM.requiredFaiths = {"Faith of the Dark"};
	--ITEM.kinisgerOverride = true;
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1000};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Evil Eye";
	ITEM.model = "models/mosi/fnv/props/gore/gorehead03.mdl";
	ITEM.weight = 0.1;
	ITEM.uniqueID = "evil_eye";
	ITEM.description = "L'œil détaché d'un thrall du Begotten. Une énergie maléfique émane de son iris.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente les dégâts infligés aux thralls de Begotten de 50 %.";
	
	--ITEM.requiredFaiths = {"Faith of the Dark"};
	--ITEM.kinisgerOverride = true;
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Human Effigy";
	ITEM.model = "models/begotten/misc/effigy1.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "effigy_human";
	ITEM.description = "Un assemblage de bâtons liés en forme humaine. Une aura mystérieuse l'entoure, et le porter sur soi procure un sentiment de sécurité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit tous les dégâts aux membres de 50 %.";
	
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Hurler's Talisman";
	ITEM.model = "models/demonssouls/weapons/talisman of beasts.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "hurlers_talisman";
	ITEM.description = "Un charme en bronze pointu au bout d'une chaîne, évoquant les frondes d'antan.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente la vitesse et la portée des projectiles des armes lancées et des arbalètes de 35 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Lesser Ring of Vitality";
	ITEM.model = "models/items/magic/ring_regeneration/ring_regeneration_lesser.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_vitality_lesser";
	ITEM.description = "Un anneau à l'aura mystérieuse. Le porter au doigt vous procure une sensation de bien-être.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente les points de vie maximum de 15.";
	ITEM.mutuallyExclusive = {"ring_vitality"};
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Pummeler's Ring";
	ITEM.model = "models/items/magic/ring_dexterity/ring_dexterity.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_pummeler";
	ITEM.description = "Un anneau à l'aura mystérieuse. Le porter au doigt donne à vos coups une impression de lourdeur accrue.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente les dégâts d’endurance de toutes les armes de mêlée de 15 %.\n- Augmente les dégâts de stabilité de toutes les armes de mêlée de 15 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1000, onGround = false};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Pugilist's Ring";
	ITEM.model = "models/items/magic/ring_strength/ring_strength.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_pugilist";
	ITEM.description = "Un anneau à l'aura mystérieuse. Le porter au doigt vous procure une sensation de force accrue.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente les dégâts et les dégâts d’endurance de vos poings jusqu’à quatre fois leurs valeurs d’origine et leur confère 100 % de pénétration d’armure. Permet également de parer avec vos poings.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 725, onGround = false, bNoSupercrate = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Gold Ring of Protection";
	ITEM.model = "models/items/magic/ring_basic/ring_gold.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_protection_gold";
	ITEM.description = "Un anneau à l'aura mystérieuse, apparemment en or. Le porter au doigt vous procure un sentiment de sécurité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit tous les dégâts subis de 18 %.\n- Réduit les dégâts de stabilité subis de 20 %.\n- Remplace les versions bronze et argent de cet anneau.";
	ITEM.mutuallyExclusive = {"ring_protection_bronze", "ring_protection_silver"};
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 800, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Ring of Fire";
	ITEM.model = "models/items/magic/ring_protectfire/ring_protectfire.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_fire";
	ITEM.description = "Un anneau chaud dégageant une aura mystérieuse.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- A 5 % de chances d’enflammer les ennemis lorsqu’ils sont touchés par une arme de mêlée.\nSe cumule avec les armes sacrificielles de feu pour augmenter la durée d’ignition.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Ring of Penetration";
	ITEM.model = "models/items/magic/ring_dexterity/ring_dexterity.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_penetration";
	ITEM.description = "Un anneau acéré, il s'enfonce dans votre chair lorsque vous le glissez au doigt.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ring_penetration.png";
	ITEM.charmEffects = "- Augmente les dégâts de pénétration d’armure de 10 points.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Ring of Vitality";
	ITEM.model = "models/items/magic/ring_regeneration/ring_regeneration.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_vitality";
	ITEM.description = "Un anneau à l'aura mystérieuse. Le porter au doigt procure une sensation de bien-être.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente les points de vie maximum de 25. Remplace la version inférieure de cet anneau.";
	ITEM.mutuallyExclusive = {"ring_vitality_lesser"};
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 700, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Satchel of Denial";
	ITEM.model = "models/props_c17/briefcase001a.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "satchel_denial";
	ITEM.description = "Une mallette verrouillée qui semble en parfait état. Elle est tiède au toucher.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- À votre mort, votre corps s’évaporera, emportant tout votre butin à l’exception des armes que vous avez équipées.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 800};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Silver Ring of Protection";
	ITEM.model = "models/items/magic/ring_basic/ring_silver.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "ring_protection_silver";
	ITEM.description = "Un anneau à l'aura mystérieuse, apparemment en argent. Le passer à votre doigt vous procure un sentiment de sécurité.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit tous les dégâts subis de 10 %.\n- Réduit les dégâts de stabilité subis de 15 %.\n- Remplace la version bronze de cet anneau.";
	ITEM.mutuallyExclusive = {"ring_protection_bronze", "ring_protection_gold"};
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1000, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Skull of an Animal";
	ITEM.model = "models/begotten/misc/animalskull.mdl";
	ITEM.weight = 0.35;
	ITEM.uniqueID = "skull_animal";
	ITEM.description = "Le crâne d'un cerf, probablement conservé par un Gore comme trophée ou porte-bonheur.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente tous les gains de foi de 25 % si vous appartenez à la Foi de la Famille.";
	ITEM.requiredFaiths = {"Faith of the Family"};
	ITEM.kinisgerOverride = true;
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Skull of a Demon";
	ITEM.model = "models/items/jewels/cr_shadowskull.mdl";
	ITEM.weight = 0.4;
	ITEM.uniqueID = "skull_demon";
	ITEM.description = "Le crâne d'un démon vaincu, sa malignité persiste encore.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente tous les gains de foi de 25 % si vous appartenez à la Foi des Ténèbres.";
	ITEM.requiredFaiths = {"Faith of the Dark"};
	ITEM.kinisgerOverride = true;
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Skull of a Saint";
	ITEM.model = "models/begotten/misc/skull.mdl";
	ITEM.weight = 0.35;
	ITEM.uniqueID = "skull_saint";
	ITEM.description = "Un crâne rituellement gravé appartenant à l'un des nombreux saints anciens de la Hiérarchie Sacrée. Un présage favorable pour les fidèles de la Lumière, assurément.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente tous les gains de foi de 25 % si vous appartenez à la Foi de la Lumière.";
	ITEM.requiredFaiths = {"Faith of the Light"};
	ITEM.kinisgerOverride = true;
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Smoldering Head";
	ITEM.model = "models/gibs/gibhead.mdl";
	ITEM.weight = 0.6;
	ITEM.uniqueID = "smoldering_head";
	ITEM.description = "La tête calcinée d'une personne accusée de sorcellerie. On peut encore sentir sa chaleur couver entre les mains.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente la résistance aux dégâts de brûlure de 50 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 900, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Spine of a Soldier";
	ITEM.model = "models/Gibs/HGIBS_spine.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "spine_soldier";
	ITEM.description = "Un fragment d'os provenant d'un vieux soldat, imprégné d'une mystérieuse aura de force.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/spine.png";
	ITEM.charmEffects = "- Augmente votre capacité d’inventaire de 25%.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 900, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Warding Talisman";
	ITEM.model = "models/demonssouls/weapons/talisman of god.mdl";
	ITEM.weight = 0.4;
	ITEM.uniqueID = "warding_talisman";
	ITEM.description = "Un talisman gravé de runes sacrées, projetant une puissante aura qui repousse les esprits maléfiques.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Réduit les gains de corruption et la perte de santé mentale de 50 %.\n- Supprime entièrement les gains de corruption des armes sacrificielles.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 350, supercrateOnly = true}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Thermal Implant";
	ITEM.model = "models/gibs/shield_scanner_gib1.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "thermal_implant";
	ITEM.description = "Une pièce de technologie élégante, grossièrement insérée dans le lobe occipital, offrant une vision technologiquement améliorée.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/thermal_implant.png";
	ITEM.charmEffects = "- Permet d’utiliser la vision thermique et nocturne via vos Sens.";
	ITEM.requiredSubfaiths = {"Voltism"};
	ITEM.permanent = true;
	
	function ITEM:OnPlayerUnequipped(player, extraData)
		if player:GetSubfaith() == "Voltism" and extraData != "force_unequip" then
			Schema:EasyText(player, "peru", "Cet implant est fusionné à votre lobe occipital et ne peut être retiré !");
			return false;
		end
		
		if Clockwork.equipment:UnequipItem(player, self) then
			local useSound = self.useSound;
			
			if !player:IsNoClipping() and (!player.GetCharmEquipped or !player:GetCharmEquipped("urn_silence")) then
				if (useSound) then
					if (type(useSound) == "table") then
						player:EmitSound(useSound[math.random(1, #useSound)]);
					else
						player:EmitSound(useSound);
					end;
				elseif (useSound != false) then
					player:EmitSound("begotten/items/first_aid.wav");
				end;
			end
		end
	end
	
	ITEM.attributes = {"not_unequippable"};
	ITEM.components = {breakdownType = "meltdown", items = {"tech", "tech"}};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Thief's Hand";
	ITEM.model = "models/gibs/pgib_p1.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "thiefs_hand";
	ITEM.description = "La main tranchée d'un voleur, coupée pour punir son larcin.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Augmente légèrement les chances de trouver du butin dans les conteneurs.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 900, onGround = false}
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Urn of Silence";
	ITEM.model = "models/props_c17/lamp001a.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "urn_silence";
	ITEM.description = "Une urne contenant les cendres d'un assassin autrefois légendaire.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Silence tous les bruits de pas, certains sons d’inventaire et le bruit de fouille des conteneurs (mais pas le crochetage).";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1250, supercrateOnly = true};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Wrench";
	ITEM.model = "models/props_c17/tools_wrench01a.mdl";
	ITEM.weight = 0.5;
	ITEM.uniqueID = "wrench";
	ITEM.description = "Une simple clé à molette, elle peut probablement servir à quelque chose.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png";
	ITEM.charmEffects = "- Active les vannes de l’usine à ferraille 80 % plus rapidement.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 800};
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base")
	ITEM.name = "Toiler's Stone"
	ITEM.model = "models/props_mining/rock_caves01a.mdl"
	ITEM.weight = 1
	ITEM.uniqueID = "toilers_stone"
	ITEM.description = "Une pierre autrefois attachée aux prisonniers glazics condamnés à trimer dans les mines jusqu'à la fin de leurs jours. Elle sert désormais de porte-bonheur aux futurs mineurs en quête de richesses."
	ITEM.iconoverride = "materials/begotten/ui/itemicons/"..ITEM.uniqueID..".png"
	ITEM.charmEffects = "- Réduit le coût en endurance de la pioche de 30 %.\n- Augmente les dégâts infligés aux piles de minerai de 75 %.\n- Augmente légèrement les chances d’extraire des matériaux rares des piles de minerai."

	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1000}
ITEM:Register()

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Holy Sigils";
	ITEM.model = "models/begotten/misc/holysigils.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "holy_sigils";
	ITEM.description = "Une boucle de fer ornée, agrémentée de deux lambeaux de parchemin arrachés au Livre Saint de la Loi, scellés et estampillés par la Hiérarchie Sacrée. Porter ces sceaux du jugement divin confère une autorité suprême et une conviction vertueuse à l'Inquisiteur qui en est digne.";
	ITEM.charmEffects = "- Nécessite de porter une armure d’inquisiteur.\n- Augmente les gains de foi de 15 %.\n- Réduit la perte de santé mentale de 50 %.\n- Réduit les gains de corruption de 50 %.\n- Augmente les dégâts contre tous les personnages non endurcis de 15 %.\n- Augmente modérément les fenêtres de parade et de déviation pour toutes les armes de mêlée.\n- Dévoile tout personnage furtif dans un rayon équivalant à 75 % de la portée de discussion.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/holy_sigils.png";
	ITEM.kinisgerOverride = true;
	ITEM.requiredSubfaiths = {"Hard-Glazed"};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if (self:HasPlayerEquipped(player)) then
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous avez déjà un charme de ce type équipé !")
			end
			
			return false
		end
		
		if self.requiredSubfaiths and not (table.HasValue(self.requiredSubfaiths, player:GetSubfaith())) then
			if !player.spawning then
				Schema:EasyText(player, "chocolate", "Vous n'êtes pas du bon sous-courant pour porter ceci !")
			end
			
			return false
		end

		if (player:Alive()) then
			local clothesItem = player:GetClothesEquipped();
			
			if !clothesItem or !clothesItem.bodygroupCharms or !clothesItem.bodygroupCharms[self.uniqueID] then
				Schema:EasyText(player, "peru", "Ce charme ne peut être porté sans l'armure d'inquisiteur !")
				
				return false;
			end
		
			for i, v in ipairs(self.slots) do
				if !player.equipmentSlots[v] then
					Clockwork.equipment:EquipItem(player, self, v);

					return true
				end
			end
	
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous n'avez pas d'emplacement libre pour équiper ce charme !")
			end
			
			return false;
		else
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous ne pouvez pas effectuer cette action pour le moment.")
			end
		end

		return false
	end
	
	function ITEM:OnBodygroupItemUnequipped(player, itemTable)
		if itemTable.bodygroupCharms[self.uniqueID] then
			Clockwork.kernel:ForceUnequipItem(player, self.uniqueID, self.itemID);
		end
	end
	
	function ITEM:OnPlayerUnequipped(player, extraData)
		if Clockwork.equipment:UnequipItem(player, self) then
			local useSound = self.useSound;
			
			if !player:IsNoClipping() and (!player.GetCharmEquipped or !player:GetCharmEquipped("urn_silence")) then
				if (useSound) then
					if (type(useSound) == "table") then
						player:EmitSound(useSound[math.random(1, #useSound)]);
					else
						player:EmitSound(useSound);
					end;
				elseif (useSound != false) then
					player:EmitSound("begotten/items/first_aid.wav");
				end;
			end
		end
	end
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Codex Solis";
	ITEM.model = "models/props_clutter/book_mg03.mdl";
	ITEM.weight = 0.2;
	ITEM.uniqueID = "codex_solis";
	ITEM.description = "Un livre relié en cuir doré, fermé par une boucle d'acier. Il renferme un assortiment de canons Hard-Glaze depuis longtemps oubliés, accompagnés de leurs annotations et des divagations délirantes de centaines de ministres qui les ont précédés. Porté avec zèle à la hanche, de manière visible, on ne saurait prétendre à l'autorité juste pour prêcher ou réprimander le commun des mortels sans lui.";
	ITEM.charmEffects = "- Nécessite de porter des vêtements de bas ministère.\n- Augmente les gains de foi de 15 %.\n- Réduit la perte de santé mentale de 50 %.\n- Réduit les gains de corruption de 50 %.\n- Augmente les dégâts contre tous les personnages non endurcis de 15 %.\n- Augmente modérément les fenêtres de parade et de déviation pour toutes les armes de mêlée.\n- Dévoile tout personnage furtif dans un rayon équivalant à 75 % de la portée de discussion.\n Le Glaze Voit Tout...";
	ITEM.iconoverride = "materials/begotten_apocalypse/ui/itemicons/book_mg03.png";
	ITEM.kinisgerOverride = true;
	ITEM.requiredSubfaiths = {"Hard-Glazed"};
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if (self:HasPlayerEquipped(player)) then
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous avez déjà un charme de ce type équipé !")
			end
			
			return false
		end
		
		if self.requiredSubfaiths and not (table.HasValue(self.requiredSubfaiths, player:GetSubfaith())) then
			if !player.spawning then
				Schema:EasyText(player, "chocolate", "Vous n'êtes pas du bon sous-courant pour porter ceci !")
			end
			
			return false
		end

		if (player:Alive()) then
			local clothesItem = player:GetClothesEquipped();
			
			if !clothesItem or !clothesItem.bodygroupCharms or !clothesItem.bodygroupCharms[self.uniqueID] then
				Schema:EasyText(player, "peru", "Ce charme ne peut être porté sans la tenue du Bas Ministère !")
				
				return false;
			end
		
			for i, v in ipairs(self.slots) do
				if !player.equipmentSlots[v] then
					Clockwork.equipment:EquipItem(player, self, v);

					return true
				end
			end
	
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous n'avez pas d'emplacement libre pour équiper ce charme !")
			end
			
			return false;
		else
			if !player.spawning then
				Schema:EasyText(player, "peru", "Vous ne pouvez pas effectuer cette action pour le moment.")
			end
		end

		return false
	end
	
	function ITEM:OnBodygroupItemUnequipped(player, itemTable)
		if itemTable.bodygroupCharms[self.uniqueID] then
			Clockwork.kernel:ForceUnequipItem(player, self.uniqueID, self.itemID);
		end
	end
	
	function ITEM:OnPlayerUnequipped(player, extraData)
		if Clockwork.equipment:UnequipItem(player, self) then
			local useSound = self.useSound;
			
			if !player:IsNoClipping() and (!player.GetCharmEquipped or !player:GetCharmEquipped("urn_silence")) then
				if (useSound) then
					if (type(useSound) == "table") then
						player:EmitSound(useSound[math.random(1, #useSound)]);
					else
						player:EmitSound(useSound);
					end;
				elseif (useSound != false) then
					player:EmitSound("begotten/items/first_aid.wav");
				end;
			end
		end
	end
ITEM:Register();

local ITEM = Clockwork.item:New("enchanted_base");
	ITEM.name = "Powderboy's Bandolier";
	ITEM.model = "models/begotten_prelude/items/ncr_bandolier.mdl";
	ITEM.weight = 1;
	ITEM.uniqueID = "bandolier";
	ITEM.description = "Une ceinture en cuir recouverte de poches. Une série de marques de comptage est grossièrement gravée dans le cuir par son précédent propriétaire.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ncr_bandolier.png";
	ITEM.charmEffects = "- Réduit le temps de rechargement des armes à feu et des arbalètes de 15 %.";
	
	ITEM.itemSpawnerInfo = {category = "Charms", rarity = 1100};
ITEM:Register();