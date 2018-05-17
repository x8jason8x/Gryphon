-----------------------------------
-- Area: The Boyahda Tree
-- NM: Beet Leafhopper (Detonator WSNM)
-- qm1 (???)
-----------------------------------
require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,SHOOT_FIRST_ASK_QUESTIONS_LATER) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("BeetHopperKill", 1);
    end
end;