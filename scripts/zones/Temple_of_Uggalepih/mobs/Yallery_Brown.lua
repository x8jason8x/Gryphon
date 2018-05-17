-----------------------------------
-- Area: Temple of Uggalepih
-- NM: Yallery Brown 17428817 (Decimation WSNM)
-- qm9 (???)
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(JEUNO,AXE_THE_COMPETITION) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("YalBrownKill", 1);
    end
end;