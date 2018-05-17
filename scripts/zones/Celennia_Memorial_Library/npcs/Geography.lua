-----------------------------------
-- Geography WS unlocker (Gaxe)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18971,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18991);
		else
	        player:tradeComplete();
		    player:addItem(18991,1,23,14,45,9,512,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18991);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19858,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(40);
		player:PrintToPlayer("You have learned the weaponskill 'Ukko's Fury'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
	local gaxSkill = player:getSkillLevel(dsp.skill.GREAT_AXE);

    if gaxSkill < 291 or player:hasLearnedWeaponskill(24) then
        player:PrintToPlayer("Geography: I have weaponskills or a Great Axe, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and gaxSkill > 291 and player:hasLearnedWeaponskill(6) then
		player:addLearnedWeaponskill(24);
		player:PrintToPlayer("You have learned the weaponskill 'King's Justice'!", 0xD);
    end		
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
