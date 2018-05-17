-----------------------------------
-- Area: Cape Teriggan
-- NM: Stolas (Namas Arrow WSNM)
-----------------------------------
require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(WINDURST,FROM_SAPLINGS_GROW) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("StolasKill", 1);
    end
end;