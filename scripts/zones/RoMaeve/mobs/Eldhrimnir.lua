-----------------------------------
-- Area: Ro'Maeve
-- NM: Eldhrimnir (Black Halo WSNM)
-- qm1 (???)
-----------------------------------
require("scripts/zones/RoMaeve/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(WINDURST,ORASTERY_WOES) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("EldhrimnirKill", 1);
    end
end;