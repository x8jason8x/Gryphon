-----------------------------------
-- Area: Bostanieux Oubliette (176)
-- NPC: qm1 (???)
-- NM: Bodach (Asuran Fists WSNM)
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,THE_WALLS_OF_YOUR_MIND) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("BodachKill", 1);
    end
end;
