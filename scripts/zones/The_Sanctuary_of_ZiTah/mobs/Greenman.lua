-----------------------------------
-- Area: The Sanctuary of ZiTah
-- NM: Greenman (Steel Cyclone WSNM)
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("GreenmanKill", 1);
    end
end;