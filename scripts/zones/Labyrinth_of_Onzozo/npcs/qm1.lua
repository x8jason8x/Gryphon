-----------------------------------
-- Area: Labyrinth of Onzozo (213)
-- NPC: qm1 (???)
-- !pos 110 15 162
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
	
    if (player:getQuestStatus(OUTLANDS,BUGI_SODEN) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("MegalopsKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("MegalopsKill", 0)
		else
		    SpawnMob(17649861):updateClaim(player);
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
