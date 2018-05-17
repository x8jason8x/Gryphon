--------------------------------------------------------------
-- Morimar (Leafallia)
-- desc: Custom NPC for buying CoP/Zilart accessories
--------------------------------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

function onTrigger(player)

    -- Must have RoZ, CoP, and Storms of Fate complete
    if player:hasKeyItem(WHISPER_OF_THE_WYRMKING) then
        player:PrintToPlayer("Morimar: You are a true hero to all! I can do business with you.", 0xD);
            local stock = 
		{ 
            14739, 5000000, -- Suppanomimi
			14740, 5000000, -- Knights Earring
			14741, 5000000, -- Abyssal Earring
			14742, 5000000, -- Beastly Earring
			14743, 5000000, -- Bushinomimi
		    15965, 5000000, -- Ethereal Earring
            15964, 5000000, -- Hollow Earring
            15963, 5000000, -- Magnetic Earring
            15962, 5000000, -- Static Earring
            15543, 5000000, -- Rajas Ring
            15544, 5000000, -- Sattva Ring
            15545, 5000000, -- Tamas Ring
        };
        showShop(player, STATIC, stock);
    else
		player:PrintToPlayer("Morimar: Novice 'adventurer'! Rank presumption! I have no business with amateurs.", 0xD);
		player:PrintToPlayer("Morimar scowls at you like he just stepped in Chocobo dung...", 0xF)
    end
end;
