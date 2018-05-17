-----------------------------------
-- Area: Bostanieux Oubliette (167)
-- NPC: qm1 (???)
-- !pos 20 16 -139
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
	
    if (player:getQuestStatus(BASTOK,THE_WALLS_OF_YOUR_MIND) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("BodachKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("BodachKill", 0)
		else
		    SpawnMob(17461479):updateClaim(player);
		end
	else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);	
	end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
