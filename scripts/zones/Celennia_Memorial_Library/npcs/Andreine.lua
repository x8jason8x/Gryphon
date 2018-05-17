-----------------------------------
-- Andreine WS unlocker (H2H)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18972,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18992);
		else
			player:tradeComplete();
		    player:addItem(18992,1,44,4,45,6,23,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18992);
		end
    elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18988,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19008);
		else
			player:tradeComplete();
		    player:addItem(19008,1,44,4,45,6,23,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19008);
        end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19853,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(35);
		player:PrintToPlayer("You have learned the weaponskill 'Victory Smite'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local mLvl = player:getMainLvl();
	local h2hSkill = player:getSkillLevel(dsp.skill.HAND_TO_HAND);
	
    if h2hSkill < 291 or player:hasLearnedWeaponskill(15) then
        player:PrintToPlayer("Andreine: I have weaponskills or a Cesti, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and h2hSkill > 291 and player:hasLearnedWeaponskill(1) then
	    player:addLearnedWeaponskill(15);
		player:PrintToPlayer("You have learned the weaponskill 'Ascetic's Fury'!", 0xD);
		player:addLearnedWeaponskill(16);
		player:PrintToPlayer("You have learned the weaponskill 'Stringing Pummel'!", 0xD);
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
