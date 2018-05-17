-----------------------------------
-- Area: Gustav Tunnel (212)
-- NM: Baronial Bat (Evisceration WSNM)
-- qm1 (???)
-- !pos 67 0 21
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("BaronBatKill", 1);
    end
end;
