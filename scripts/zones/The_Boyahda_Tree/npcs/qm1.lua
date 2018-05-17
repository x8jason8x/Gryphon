-----------------------------------
-- Area: The Boyahda Tree (153)
-- NPC: qm1 (???)
-- Quests: Shoot First, Ask Questions Later (Detonator WSNM)
-- !pos -11 -19 -177
-----------------------------------
package.loaded["scripts/zones/The_Boyahda_Tree/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Boyahda_Tree/MobIDs");
require("scripts/zones/The_Boyahda_Tree/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	if (player:getQuestStatus(BASTOK,SHOOT_FIRST_ASK_QUESTIONS_LATER) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("BeetHopperKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("BeetHopperKill", 0)
		else
		    SpawnMob(17404338):updateClaim(player);
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
