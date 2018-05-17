-----------------------------------
-- Area: Sea Serpent Grotto (176)
-- NPC: qm1 (???)
-- Involved in quest: Methods Create Madness (Impulse Drive WSNM)
-- !pos 107 1 -125
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Sea_Serpent_Grotto/MobIDs");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(SANDORIA,METHODS_CREATE_MADNESS) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("WaterLeapKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("WaterLeapKill", 0)
		else
		    SpawnMob(17498565):updateClaim(player);
		end
	else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);	
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;