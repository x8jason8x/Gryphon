-----------------------------------
-- Area: Western Altepa Desert (125)
-- NPC:  qm1 (???)
-- Involved in Quest: Inheritance (Ground Strike WSNM)
-- !pos -660 0 -338
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Altepa_Desert/TextIDs");
require("scripts/zones/Western_Altepa_Desert/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    
	if (player:getQuestStatus(BASTOK,INHERITANCE) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("MaharajaKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("MaharajaKill", 0)
		else
		    SpawnMob(17289656):updateClaim(player);
		end
	else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);	
	end
end;

function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)

end;
