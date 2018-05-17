-----------------------------------
-- Area: Quicksand Caves
-- NM: Girtablulu (Savage Blade WSNM)
-- !pos -161 2 447
-----------------------------------
require("scripts/zones/Quicksand_Caves/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(SANDORIA,OLD_WOUNDS) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("GirtabluluKill", 1);
    end
end;
