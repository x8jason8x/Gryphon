-----------------------------------
-- Personages WS unlocker (Gsword)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(19856,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(38);
		player:PrintToPlayer("You have learned the weaponskill 'Torcleaver'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	player:PrintToPlayer("Personages: I have a Greatsword weaponskill, if you have the requisite item trade...", 0xD);
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("onEventFinish");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
