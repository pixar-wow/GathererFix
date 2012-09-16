local region = GetLocale();

local function tableMerge(t1, t2)
   for k,v in pairs(t2) do
      if type(v) == "table" then
         if type(t1[k] or false) == "table" then
            tableMerge(t1[k] or {}, t2[k] or {})
         else
            t1[k] = v
         end
      else
         t1[k] = v
      end
   end
   return t1
end



-- see specialChar_hashMap for special char supported
local function fixSpecialChar(str)
   local mod_str =str
   
   local function step_fix_specialChar(specialChar,replcChar)
      mod_str,_ = string.gsub(mod_str,specialChar,replcChar)
   end
   
   local specialChar_hashMap = {
      ['é']='e',
      ['è']='e',
      ['œ']='oe',
      ['ô']='o',
      ['\195\180']='o',
      ['â'] = 'a',
      ['\195\162']='a',
      
   }
   table.foreach(specialChar_hashMap,step_fix_specialChar)
   return mod_str
end


function Fix_Gatherer_Carbonite()  
   if Nx~= nil and Nx.GaI1 ~= nil then --Carbonite loaded
      Nx.GaI1={[" "]={["Art"]={0,"Trade_Archaeology","Artifact","Artifact","Artifact","Artifact"},["Everfrost"]={0,"spell_shadow_teleport",NXlEverfrost,NXlEverfrost,NXlEverfrost,NXlEverfrost},["Gas"]={0,"inv_gizmo_zapthrottlegascollector",NXlGas,NXlGas,NXlGas,NXlGas},},["H"]={{340,"INV_Misc_Herb_AncientLichen","Ancient Lichen","Urflechte","Lichen ancien","Liquen antiguo"},{220,"INV_Misc_Herb_13","Arthas' Tears","Arthas\226\128\153 Tr\195\164nen","Larmes d'Arthas ","L\195\161grimas de Arthas"},{300,"INV_Misc_Herb_17","Black Lotus","Schwarzer Lotus","Lotus noir","Loto negro"},{235,"INV_Misc_Herb_14","Blindweed","Blindkraut","Aveuglette","Carolina"},{1,"INV_Misc_Herb_11a","Bloodthistle","Blutdistel","Chardon sanglant","Cardo de sangre"},{70,"INV_Misc_Root_01","Briarthorn","Wilddornrose","Eglantine","Brezospina"},{100,"INV_Misc_Herb_01","Bruiseweed","Beulengras","Doulourante","Hierba cardenal"},{270,"INV_Misc_Herb_DreamFoil","Dreamfoil","Traumblatt","Feuiller\195\170ve","Hojasue\195\177o"},{315,"INV_Misc_Herb_Dreamingglory","Dreaming Glory","Traumwinde","Glaurier","Gloria de ensue\195\177o"},{15,"INV_Misc_Herb_07","Earthroot","Erdwurzel","Terrestrine","Ra\195\173z de tierra"},{160,"INV_Misc_Herb_12","Fadeleaf","Blassblatt","P\195\162lerette","P\195\161lida"},{300,"INV_Misc_Herb_Felweed","Felweed","Teufelsgras","Gangrelette","Hierba vil"},{205,"INV_Misc_Herb_19","Firebloom","Feuerbl\195\188te","Fleur de feu","Flor de Fuego"},{335,"INV_Misc_Herb_Flamecap","Flame Cap","Flammenkappe","Chapeflamme","Copo de llamas"},{245,"INV_Mushroom_08","Ghost Mushroom","Geisterpilz","Champignon fant\195\180me","Champi\195\177\195\179n fantasma"},{260,"INV_Misc_Herb_SansamRoot","Golden Sansam","Goldener Sansam","Sansam dor\195\169","Sansam dorado"},{170,"INV_Misc_Herb_15","Goldthorn","Golddorn","Dor\195\169pine","Espina de oro"},{120,"INV_Misc_Dust_02","Grave Moss","Grabmoos","Tombeline","Musgo de tumba"},{250,"INV_Misc_Herb_16","Gromsblood","Gromsblut","Gromsang","Gromsanguina"},{290,"INV_Misc_Herb_IceCap","Icecap","Eiskappe","Chapeglace","Setelo"},{185,"INV_Misc_Herb_08","Khadgar's Whisker","Khadgars Schnurrbart","Moustache de Khadgar","Mostacho de Khadgar"},{125,"INV_Misc_Herb_03","Kingsblood","K\195\182nigsblut","Sang-royal","Sangrerregia"},{150,"INV_Misc_Root_02","Liferoot","Lebenswurz","Viet\195\169rule","Vidarra\195\173z"},{50,"Spell_Shadow_DeathAndDecay","Mageroyal","Magusk\195\182nigskraut","Mage royal","Marregal"},{375,"INV_Misc_Herb_Manathistle","Mana Thistle","Manadistel","Chardon de mana","Cardo de man\195\161"},{280,"INV_Misc_Herb_MountainSilverSage","Mountain Silversage","Bergsilbersalbei","Sauge-argent des montagnes","Salviargenta de monta\195\177a"},{350,"INV_Misc_Herb_Netherbloom","Netherbloom","Netherbl\195\188te","N\195\169antine","Flor abisal"},{350,"INV_Enchant_DustSoul","Netherdust Bush","Netherstaubbusch","Buisson de pruin\195\169ante","Arbusto de polvo abisal"},{365,"INV_Misc_Herb_Nightmarevine","Nightmare Vine","Alptraumranke","Cauchemardelle","Vid Pesadilla"},{1,"INV_Misc_Flower_02","Peacebloom","Friedensblume","Pacifique","Flor de paz"},{285,"inv_misc_herb_plaguebloom","Sorrowmoss","Trauermoos","Chagrinelle","Musgopena"},{210,"INV_Misc_Herb_17","Purple Lotus","Lila Lotus","Lotus pourpre","Loto c\195\161rdeno"},{325,"INV_Misc_Herb_Ragveil","Ragveil","Zottelkappe","Voile-mis\195\168re","Velada"},{1,"INV_Misc_Herb_10","Silverleaf","Silberblatt","Feuillargent","Hojaplata"},{85,"INV_Misc_Herb_11","Stranglekelp","W\195\188rgetang","Etouffante","Alga estranguladora"},{230,"INV_Misc_Herb_18","Sungrass","Sonnengras","Soleillette","Solea"},{325,"INV_Misc_Herb_Terrocone","Terocone","Terozapfen","Teroc\195\180ne","Teropi\195\177a"},{115,"INV_Misc_Flower_01","Wild Steelbloom","Wildstahlblume","Aci\195\169rite sauvage","Ac\195\169rita salvaje"},{195,"inv_misc_flower_03","Dragon's Teeth","Drachenzahn","Dents de dragon","Dientes de drag\195\179n"},{1,"INV_Mushroom_02","Glowcap","Gl\195\188hkappe","Chapeluisant","Fluochampi\195\177\195\179n"},{350,"inv_misc_herb_goldclover","Goldclover","Goldklee","Tr\195\168fle dor\195\169","Tr\195\169bol de oro"},{385,"inv_misc_herb_talandrasrose","Talandra's Rose","Talandras Rose","Rose de Talandra","Rosa de Talandra"},{400,"inv_misc_herb_evergreenmoss","Adder's Tongue","Schlangenzunge","Verp\195\169renne","Lengua de v\195\173boris"},{400,"inv_misc_herb_goldclover","Frozen Herb","Gefrorenes Kraut","Herbe gel\195\169e","Hierba de escarcha"},{400,"inv_misc_herb_tigerlily","Tiger Lily","Tigerlilie","Lys tigr\195\169","Lirio atigrado"},{425,"inv_misc_herb_whispervine","Lichbloom","Lichbl\195\188te","Fleur-de-liche","Flor ex\195\161nime"},{435,"inv_misc_herb_icethorn","Icethorn","Eisdorn","Glac\195\169pine","Espina de hielo"},{450,"inv_misc_herb_frostlotus","Frost Lotus","Frostlotus","Lotus givr\195\169","Loto de escarcha"},{360,"inv_misc_herb_11a","Firethorn","Feuerdorn","Epine de feu","Espino de fuego"},{425,"inv_misc_herb_azsharasveil","Azshara's Veil","Azsharas Schleier","Voile d'Azshara","Velo de Azshara"},{425,"inv_misc_herb_cinderbloom","Cinderbloom","Aschenbl\195\188te","Cendrelle","Flor de ceniza"},{425,"inv_misc_herb_stormvine","Stormvine","Sturmwinde","Vignetincelle","Vign\195\169tincelle","Vi\195\177\aviento"},{475,"inv_misc_herb_heartblossom","Heartblossom","Herzbl\195\188te","Petale de coeur","P\195\169tale de c\195\166ur","Flor de coraz\195\179n"},{500,"inv_misc_herb_whiptail","Whiptail","Gertenrohr","Fouettine","Col\195\161tigo"},{525,"inv_misc_herb_twilightjasmine","Twilight Jasmine","Schattenjasmin","Jasmin crepusculaire","Jazm\195\173n Crepuscular"},},["M"]={{325,"INV_Ore_Adamantium","Adamantite Deposit","Adamantitvorkommen","Gisement d'adamantite","Dep\195\179sito de adamantita"},{375,"INV_Misc_Gem_01","Ancient Gem Vein","Uralte Edelsteinader","Ancien filon de gemmes","Fil\195\179n de gemas antiguo"},{1,"INV_Ore_Copper_01","Copper Vein","Kupferader","Filon de cuivre","Fil\195\179n de cobre"},{230,"INV_Ore_Mithril_01","Dark Iron Deposit","Dunkeleisenvorkommen","Gisement de sombrefer","Dep\195\179sito de hierro negro"},{275,"INV_Ore_FelIron","Fel Iron Deposit","Teufelseisenvorkommen","Gisement de gangrefer","Dep\195\179sito de hierro vil"},{155,"INV_Ore_Copper_01","Gold Vein","Goldader","Filon d'or","Fil\195\179n de oro"},{65,"INV_Ore_Thorium_01","Incendicite Mineral Vein","Pyrophormineralvorkommen","Filon d'incendicite","Fil\195\179n de incendicita"},{150,"INV_Ore_Mithril_01","Indurium Mineral Vein","Induriummineralvorkommen","Filon d'indurium","Fil\195\179n de indurio"},{125,"INV_Ore_Iron_01","Iron Deposit","Eisenvorkommen","Gisement de fer","Dep\195\179sito de hierro"},{375,"INV_Ore_Khorium","Khorium Vein","Khoriumader","Filon de khorium","Fil\195\179n de korio"},{305,"INV_Stone_15","Large Obsidian Chunk","Gro\195\159er Obsidianbrocken","Grand morceau d'obsidienne","Trozo de obsidiana grande"},{75,"INV_Ore_Thorium_01","Lesser Bloodstone Deposit","Geringes Blutsteinvorkommen","Gisement de pierre de sang inf\195\169rieure","Dep\195\179sito de sangrita inferior"},{175,"INV_Ore_Mithril_02","Mithril Deposit","Mithrilvorkommen","Gisement de mithril","Dep\195\179sito de mitril"},{275,"INV_Ore_Ethernium_01","Nethercite Deposit","Netheritvorkommen","Gisement de n\195\169anticite","Dep\195\179sito de abisalita"},{350,"INV_Ore_Adamantium","Rich Adamantite Deposit","Reiches Adamantitvorkommen","Riche gisement d'adamantite","Dep\195\179sito rico en adamantita"},{255,"INV_Ore_Thorium_02","Rich Thorium Vein","Reiche Thoriumader","Riche filon de thorium","Fil\195\179n de torio enriquecido"},{75,"INV_Stone_16","Silver Vein","Silberader","Filon d'argent","Fil\195\179n de plata"},{305,"INV_Misc_StoneTablet_01","Small Obsidian Chunk","Kleiner Obsidianbrocken","Petit morceau d'obsidienne","Trozo de obsidiana peque\195\177o"},{230,"INV_Ore_Thorium_02","Small Thorium Vein","Kleine Thoriumader","Petit filon de thorium","Fil\195\179n peque\195\177o de torio"},{65,"INV_Ore_Tin_01","Tin Vein","Zinnader","Filon d'\195\169tain","Fil\195\179n de esta\195\177o"},{230,"INV_Ore_TrueSilver_01","Truesilver Deposit","Echtsilbervorkommen","Gisement de vrai-argent","Dep\195\179sito de veraplata"},{350,"inv_ore_cobalt","Cobalt Deposit","Kobaltvorkommen","Gisement de cobalt","Dep\195\179sito de cobalto"},{375,"inv_ore_cobalt","Rich Cobalt Deposit","Reiches Kobaltvorkommen","Riche gisement de cobalt","Dep\195\179sito de cobalto rico"},{400,"inv_ore_saronite_01","Saronite Deposit","Saronitvorkommen","Gisement de saronite","Dep\195\179sito de saronita"},{425,"inv_ore_saronite_01","Rich Saronite Deposit","Reiches Saronitvorkommen","Riche gisement de saronite","Dep\195\179sito de saronita rico"},{450,"inv_ore_platinum_01","Titanium Vein","Titanader","Veine de titane","Fil\195\179n de titanio"},{425,"item_elementiumore","Obsidium Deposit","Obsidiumvorkommen","Gisement d'obsidium","Morceau d'obsidium","Dep\195\179sito de obsidium"},{450,"item_elementiumore","Rich Obsidium Deposit","Reiches Obsidiumvorkommen","Enorme bloc d'obsidienne","Dep\195\179sito de obsidium rico"},{475,"item_pyriumore","Elementium Vein","Elementiumader","Filon d'elementium","Filon d\195\169l\195\169mentium","Fil\195\179n de elementium"},{500,"item_pyriumore","Rich Elementium Vein","Reiche Elementiumader","Riche filon d'elementium","Riche filon d'\195\169l\195\169mentium","Filon d'elementium","Fil\195\179n de elementium rico"},{525,"inv_ore_arcanite_01","Pyrite Deposit","Pyritvorkommen","Gisement de pyrite","Dep\195\179sito de pirita"},{525,"inv_ore_arcanite_01","Rich Pyrite Deposit","Reiches Pyritvorkommen","Riche gisement de pyrite","Dep\195\179sito de pirita rico"},}
      }
   end
end


--fix node txt
if Gatherer~= nil and Gatherer.Nodes~= nil and Gatherer.Nodes.Names ~= nil and region == "frFR" then
   local Gatherer_Nodes_Names_noSpecial = {
      ["Petit filon de thorium"] = 324, -- Small Thorium Vein
      ["Filon d'incendicite"] = 1610, -- Incendicite Mineral Vein
      ["Filon de cuivre"] = 1731, -- Copper Vein
      ["Filon d'etain"] = 1732, -- Tin Vein
      ["Filon d'argent"] = 1733, -- Silver Vein
      ["Filon d'or"] = 1734, -- Gold Vein
      ["Gisement de fer"] = 1735, -- Iron Deposit
      ["Gisement de mithril"] = 2040, -- Mithril Deposit
      ["Gisement de vrai-argent"] = 2047, -- Truesilver Deposit
      ["Gisement de pierre de sang inferieure"] = 2653, -- Lesser Bloodstone Deposit
      ["Filon d'indurium"] = 19903, -- Indurium Mineral Vein
      ["Filon d'argent couvert de limon"] = 73940, -- Ooze Covered Silver Vein
      ["Filon d'or couvert de limon"] = 73941, -- Ooze Covered Gold Vein
      ["Gisement de vrai-argent couvert de vase"] = 123309, -- Ooze Covered Truesilver Deposit
      ["Gisement de mithril couvert de vase"] = 123310, -- Ooze Covered Mithril Deposit
      ["Filon de thorium couvert de limon"] = 123848, -- Ooze Covered Thorium Vein
      ["Gisement de sombrefer"] = 165658, -- Dark Iron Deposit
      ["Riche filon de thorium"] = 175404, -- Rich Thorium Vein
      ["Riche filon de thorium couvert de limon"] = 177388, -- Ooze Covered Rich Thorium Vein
      ["Filon de thorium Hakkari"] = 180215, -- Hakkari Thorium Vein
      ["Gisement de gangrefer"] = 181555, -- Fel Iron Deposit
      ["Gisement d'adamantite"] = 181556, -- Adamantite Deposit
      ["Filon de khorium"] = 181557, -- Khorium Vein
      ["Riche gisement d'adamantite"] = 181569, -- Rich Adamantite Deposit
      ["Gisement de neanticite"] = 185877, -- Nethercite Deposit
      ["Gisement de cobalt"] = 189978, -- Cobalt Deposit
      ["Riche gisement de cobalt"] = 189979, -- Rich Cobalt Deposit
      ["Gisement de saronite"] = 189980, -- Saronite Deposit
      ["Riche gisement de saronite"] = 189981, -- Rich Saronite Deposit
      ["Veine de titane"] = 191133, -- Titanium Vein
      ["Gisement d'obsidium"] = 202736, -- Obsidium Deposit
      ["Gisement de pyrite"] = 202737, -- Pyrite Deposit
      ["Filon d'elementium"] = 202738, -- Elementium Vein
      ["Riche gisement d'obsidium"] = 202739, -- Rich Obsidium Deposit
      ["Riche gisement de pyrite"] = 202740, -- Rich Pyrite Deposit
      ["Riche filon d'elementium"] = 202741, -- Rich Elementium Vein
      ["Feuillargent"] = 1617, -- Silverleaf
      ["Pacifique"] = 1618, -- Peacebloom
      ["Terrestrine"] = 1619, -- Earthroot
      ["Mage royal"] = 1620, -- Mageroyal
      ["Eglantine"] = 1621, -- Briarthorn
      ["Doulourante"] = 1622, -- Bruiseweed
      ["Acierite sauvage"] = 1623, -- Wild Steelbloom
      ["Sang-royal"] = 1624, -- Kingsblood
      ["Tombeline"] = 1628, -- Grave Moss
      ["Vieterule"] = 2041, -- Liferoot
      ["Palerette"] = 2042, -- Fadeleaf
      ["Moustache de Khadgar"] = 2043, -- Khadgar's Whisker
      ["Dents de dragon"] = 2044, -- Wintersbite
      ["Etouffante"] = 2045, -- Stranglekelp
      ["Dorepine"] = 2046, -- Goldthorn
      ["Fleur de feu"] = 2866, -- Firebloom
      ["Lotus pourpre"] = 142140, -- Purple Lotus
      ["Larmes d'Arthas"] = 142141, -- Arthas' Tears
      ["Soleillette"] = 142142, -- Sungrass
      ["Aveuglette"] = 142143, -- Blindweed
      ["Champignon fantome"] = 142144, -- Ghost Mushroom
      ["Gromsang"] = 142145, -- Gromsblood
      ["Sansam dore"] = 176583, -- Golden Sansam
      ["Feuillerêve"] = 176584, -- Dreamfoil
      ["Sauge-argent des montagnes"] = 176586, -- Mountain Silversage
      ["Chagrinelle"] = 176587, -- Plaguebloom
      ["Chapeglace"] = 176588, -- Icecap
      ["Lotus noir"] = 176589, -- Black Lotus
      ["Chardon sanglant"] = 181166, -- Bloodthistle
      ["Gangrelette"] = 181270, -- Felweed
      ["Glaurier"] = 181271, -- Dreaming Glory
      ["Voile-misere"] = 181275, -- Ragveil
      ["Chapeflamme"] = 181276, -- Flame Cap
      ["Terocone"] = 181277, -- Terocone
      ["Lichen ancien"] = 181278, -- Ancient Lichen
      ["Neantine"] = 181279, -- Netherbloom
      ["Cauchemardelle"] = 181280, -- Nightmare Vine
      ["Chardon de mana"] = 181281, -- Mana Thistle
      ["Buisson de pruineante"] = 185881, -- Netherdust Bush
      ["Trefle dore"] = 189973, -- Goldclover
      ["Lys tigre"] = 190169, -- Tiger Lily
      ["Rose de Talandra"] = 190170, -- Talandra's Rose
      ["Fleur-de-liche"] = 190171, -- Lichbloom
      ["Glacepine"] = 190172, -- Icethorn
      ["Herbe gelee"] = 190175, -- Frozen Herb
      ["Lotus givre"] = 190176, -- Frost Lotus
      ["Langue de serpent"] = 191019, -- Adder's Tongue
      ["Epine de feu"] = 191303, -- Firethorn
      ["Cendrelle"] = 202747, -- Cinderbloom
      ["Vignetincelle"] = 202748, -- Stormvine
      ["Voile d'Azshara"] = 202749, -- Azshara's Veil
      ["Petale de coeur"] = 202750, -- Heartblossom
      ["Petale de coeur"] = 202750, -- Heartblossom
      ["Jasmin crepusculaire"] = 202751, -- Twilight Jasmine
      ["Fouettine"] = 202752, -- Whiptail
      ["Coffre dissimule"] = 2039, -- Hidden Strongbox
      ["Palourde geante"] = 2744, -- Giant Clam
      ["Coffre endommage"] = 2843, -- Battered Chest
      ["Coffre en morceaux"] = 2844, -- Tattered Chest
      ["Coffre solide"] = 2850, -- Solid Chest
      ["Baril d'eau"] = 3658, -- Water Barrel
      ["Tonneau d'eau"] = 3658, -- Water Barrel
      ["Tonneau de jus de melon"] = 3659, -- Barrel of Melon Juice
      ["Caisse d'armures"] = 3660, -- Armor Crate
      ["Caisse d'armes"] = 3661, -- Weapon Crate
      ["Caisse de nourriture"] = 3662, -- Food Crate
      ["Tonneau de lait"] = 3705, -- Barrel of Milk
      ["Tonneau de nectar sucre"] = 3706, -- Barrel of Sweet Nectar
      ["Coffre de l'Alliance"] = 3714, -- Alliance Strongbox
      ["Boîte de pieces assorties"] = 19019, -- Box of Assorted Parts
      ["Caisse eparpillee"] = 28604, -- Scattered Crate
      ["Grand coffre cercle de fer"] = 74447, -- Large Iron Bound Chest
      ["Grand coffre solide"] = 74448, -- Large Solid Chest
      ["Grand coffre endommage"] = 75293, -- Large Battered Chest
      ["Coffre du boucanier"] = 123330, -- Buccaneer's Strongbox
      ["Grand coffre cercle de mithril"] = 131978, -- Large Mithril Bound Chest
      ["Grand coffre de sombrebois"] = 131979, -- Large Darkwood Chest
      ["Caisse de ravitaillement de la Horde"] = 142191, -- Horde Supply Crate
      ["Tas de poussiere d'Un'Goro"] = 157936, -- Un'Goro Dirt Pile
      ["Cristal de puissance bleu"] = 164658, -- Blue Power Crystal
      ["Cristal de puissance vert"] = 164659, -- Green Power Crystal
      ["Cristal de puissance rouge"] = 164660, -- Red Power Crystal
      ["Cristal de puissance jaune"] = 164661, -- Yellow Power Crystal
      ["Dragon nocturne purifie"] = 164881, -- Cleansed Night Dragon
      ["Fleur-de-chant purifiee"] = 164882, -- Cleansed Songflower
      ["Fleur-de-vent purifiee"] = 164884, -- Cleansed Windblossom
      ["Pousse de Petale-de-sang"] = 164958, -- Bloodpetal Sprout
      ["Navetille purifiee"] = 174622, -- Cleansed Whipper Root
      ["Sang des heros"] = 176213, -- Blood of Heroes
      ["Casier à crustaces"] = 176582, -- Shellfish Trap
      ["Coffret d'entraînement"] = 178244, -- Practice Lockbox
      ["Cantine endommagee"] = 179486, -- Battered Footlocker
      ["Cantine detrempee"] = 179487, -- Waterlogged Footlocker
      ["Cantine abîmee"] = 179492, -- Dented Footlocker
      ["Cantine moisie"] = 179493, -- Mossy Footlocker
      ["Cantine ecarlate"] = 179498, -- Scarlet Footlocker
      ["Coffre funeraire"] = 181665, -- Burial Chest
      ["Coffre en gangrefer"] = 181798, -- Fel Iron Chest
      ["Coffre lourd en gangrefer"] = 181800, -- Heavy Fel Iron Chest
      ["Coffre cercle d'adamantite"] = 181802, -- Adamantite Bound Chest
      ["Coffre en gangracier"] = 181804, -- Felsteel Chest
      ["Chapeluisant"] = 182053, -- Glowcap
      ["Coffre en osier"] = 184740, -- Wicker Chest
      ["Coffre primitif"] = 184793, -- Primitive Chest
      ["Coffre solide en gangrefer"] = 184930, -- Solid Fel Iron Chest
      ["Coffre cercle de gangrefer"] = 184931, -- Bound Fel Iron Chest
      ["oeuf de l'Aile-du-Neant"] = 185915, -- Netherwing Egg
      ["Morceau de permagivre"] = 193997, -- Everfrost Chip
      ["Trouvaille archeologique trolle"] = 202655, -- Troll Archaeology Find
      ["Trouvaille archeologique elfe de la nuit"] = 203071, -- Night Elf Archaeology Find
      ["Objet aqir perdu"] = 203078, -- Nerubian Archaeology Find
      ["Trouvaille archeologique naine"] = 204282, -- Dwarf Archaeology Find
      ["Trouvaille archeologique fossile"] = 206836, -- Fossil Archaeology Find
      ["Trouvaille archeologique orque"] = 207187, -- Orc Archaeology Find
      ["Trouvaille archeologique draeneï"] = 207188, -- Draenei Archaeology Find
      ["Coffre d'archeologie vrykul 01"] = 207189, -- Vrykul Archaeology Find
      ["Trouvaille archeologique tol'vir"] = 207190, -- Tol'vir Archaeology Find
      ["Giant Clam"] = 2744,
      -- enEN chest - archeo find
      ["Battered Chest"] = 2843,
      ["Tattered Chest"] = 2844,
      ["Solid Chest"] = 2850,
      ["Water Barrel"] = 3658,
      ["Barrel of Melon Juice"] = 3659,
      ["Armor Crate"] = 3660,
      ["Weapon Crate"] = 3661,
      ["Food Crate"] = 3662,
      ["Barrel of Milk"] = 3705,
      ["Barrel of Sweet Nectar"] = 3706,
      ["Alliance Strongbox"] = 3714,
      ["Box of Assorted Parts"] = 19019,
      ["Scattered Crate"] = 28604,
      ["Large Iron Bound Chest"] = 74447,
      ["Large Solid Chest"] = 74448,
      ["Large Battered Chest"] = 75293,
      ["Buccaneer's Strongbox"] = 123330,
      ["Large Mithril Bound Chest"] = 131978,
      ["Large Darkwood Chest"] = 131979,
      ["Horde Supply Crate"] = 142191,
      ["Un'Goro Dirt Pile"] = 157936,
      ["Blue Power Crystal"] = 164658,
      ["Green Power Crystal"] = 164659,
      ["Red Power Crystal"] = 164660,
      ["Yellow Power Crystal"] = 164661,
      ["Cleansed Night Dragon"] = 164881,
      ["Cleansed Songflower"] = 164882,
      ["Cleansed Windblossom"] = 164884,
      ["Bloodpetal Sprout"] = 164958,
      ["Cleansed Whipper Root"] = 174622,
      ["Blood of Heroes"] = 176213,
      ["Shellfish Trap"] = 176582,
      ["Practice Lockbox"] = 178244,
      ["Battered Footlocker"] = 179486,
      ["Waterlogged Footlocker"] = 179487,
      ["Dented Footlocker"] = 179492,
      ["Mossy Footlocker"] = 179493,
      ["Scarlet Footlocker"] = 179498,
      ["Burial Chest"] = 181665,
      ["Fel Iron Chest"] = 181798,
      ["Heavy Fel Iron Chest"] = 181800,
      ["Adamantite Bound Chest"] = 181802,
      ["Felsteel Chest"] = 181804,
      ["Glowcap"] = 182053,
      ["Wicker Chest"] = 184740,
      ["Primitive Chest"] = 184793,
      ["Solid Fel Iron Chest"] = 184930,
      ["Bound Fel Iron Chest"] = 184931,
      ["Bound Adamantite Chest"] = 184936,
      ["Netherwing Egg"] = 185915,
      ["Everfrost Chip"] = 193997,
      ["Silverbound Treasure Chest"] = 207472,
      ["Sturdy Treasure Chest"] = 207484,
      ["Dark Iron Treasure Chest"] = 207498,
      ["Silken Treasure Chest"] = 207512,
      ["Maplewood Treasure Chest"] = 207529,
      ["Troll Archaeology Find"] = 202655,
      ["Night Elf Archaeology Find"] = 203071,
      ["Nerubian Archaeology Find"] = 203078,
      ["Dwarf Archaeology Find"] = 204282,
      ["Fossil Archaeology Find"] = 206836,
      ["Orc Archaeology Find"] = 207187,
      ["Draenei Archaeology Find"] = 207188,
      ["Vrykul Archaeology Find"] = 207189,
      ["Tol'vir Archaeology Find"] = 207190,
   }
   Gatherer.Nodes.Names = tableMerge(Gatherer_Nodes_Names_noSpecial, Gatherer.Nodes.Names) 
end


