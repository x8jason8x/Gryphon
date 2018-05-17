-----------------------------------
-- Area: Sea Serpent Grotto (176)
-- NM: Water Leaper (Impulse Drive WSNM)
-- qm1 (???)
-----------------------------------
require("scripts/zones/Sea_Serpent_Grotto/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(SANDORIA,METHODS_CREATE_MADNESS) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("WaterLeapKill", 1);
    end
end;