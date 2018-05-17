-----------------------------------
-- Area: Ifrit's Cauldron
-- NPC: qm3 (???)
-- Involved in Retribution wsnm
-- !pos 117 19 144 205
-----------------------------------
package.loaded["scripts/zones/Ifrits_Cauldron/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Ifrits_Cauldron/TextIDs");
require("scripts/zones/Ifrits_Cauldron/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
	
    if (player:getQuestStatus(WINDURST,BLOOD_AND_GLORY) == QUEST_ACCEPTED and player:hasKeyItem(344) and not player:hasKeyItem(345)) then
	    if player:getVar("BheurKill") == 1 then
		    player:delKeyItem(344);
		    player:addKeyItem(345);
			player:messageSpecial(KEYITEM_OBTAINED,345);
			player:setVar("BheurKill", 0)
		else
		    SpawnMob(17617165):updateClaim(player);
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
