-----------------------------------
-- Area: Ifrit's Cauldron (205)
-- NM: Cailleach Bheur (Retribution WSNM)
-- qm3 (???)
-- !pos 117 19 144
-----------------------------------
require("scripts/zones/Ifrits_Cauldron/MobIDs");
require("scripts/globals/quests");
-----------------------------------

function onMobSpawn(mob)

end;

function onMobDeath(mob, player, isKiller)

    if (player:getQuestStatus(WINDURST,BLOOD_AND_GLORY) == QUEST_ACCEPTED and player:hasKeyItem(344)) then    
	    player:setVar("BheurKill", 1);
    end
end;
