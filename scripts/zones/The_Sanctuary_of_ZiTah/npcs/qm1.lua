-----------------------------------
-- Area: The Sanctuary of ZiTah
-- NPC:  qm1 (???)
-- Involved in Quest: The Weight of Your Limits (Steel Cyclone WSNM)
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    
	if (player:getQuestStatus(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("GreenmanKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("GreenmanKill", 0)
		else
		    SpawnMob(17273295):updateClaim(player);
		end
	else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);	
	end
end;

function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)

end;
