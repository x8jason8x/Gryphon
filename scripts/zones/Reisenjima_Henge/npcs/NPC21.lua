-------------------------------------
-- NPC 21 Aldo
-- desc: Custom NPC for buying CoP/Zilart accessories
-------------------------------------
require("scripts/globals/settings");
-------------------------------------

function onTrigger(player)

    -- Must have RoZ, CoP, and Storms of Fate complete
    if player:hasKeyItem(dsp.ki.WHISPER_OF_THE_WYRMKING) then
        player:showText(npc,NPC_BLANK);
        player:PrintToPlayer("Aldo: I see you have defeated the Wyrmking! Let's talk accessories!", 0xD);
        local stock = 
        { 
            14739, 5000000, -- Suppanomimi
            14740, 5000000, -- Knights Earring
            14741, 5000000, -- Abyssal Earring
            14742, 5000000, -- Beastly Earriing
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
        player:PrintToPlayer("Aldo: You must kill Bahamut before we can do business friend...", 0xD);
    end
end;
