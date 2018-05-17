-----------------------------------
-- Area: Kuftal Tunnel
-- NM: Kettenkaefer (Tachi: Kasha WSNM)
-- qm3 (???)
-- !pos 204.052 10.25 96.414
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(OUTLANDS,THE_POTENTIAL_WITHIN) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("KkaeferKill", 1);
    end
end;
