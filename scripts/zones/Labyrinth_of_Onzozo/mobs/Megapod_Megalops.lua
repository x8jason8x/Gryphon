-----------------------------------
-- Area: Labyrinth of Onzozo (213)
-- NM: Megapod Megalops (Blade: Ku WSNM)
-- qm1 (???)
-- !pos 115 15 164
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OUTLANDS,BUGI_SODEN) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("MegalopsKill", 1);
    end
end;
