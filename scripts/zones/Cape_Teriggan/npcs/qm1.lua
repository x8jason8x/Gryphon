-----------------------------------
-- Area: Cape Teriggan
-- NPC: qm1 (???)
-- Quests: From Saplings Grow (Empyrean Arrow WSNM "Stolas")
-- !pos -157 -8 198.2
-----------------------------------
package.loaded["scripts/zones/Cape_Teriggan/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Cape_Teriggan/TextIDs");
require("scripts/zones/Cape_Teriggan/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    
	if (player:getQuestStatus(WINDURST,FROM_SAPLINGS_GROW) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("StolasKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("StolasKill", 0)
		else
		    SpawnMob(17240424):updateClaim(player);
		end
	else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);	
	end
end;

function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)

end;
