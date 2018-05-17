-----------------------------------
-- Area: Western Altepa Desert (125)
-- NM: Maharaja (Ground Strike WSNM)
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("MaharajaKill", 1);
    end
end;