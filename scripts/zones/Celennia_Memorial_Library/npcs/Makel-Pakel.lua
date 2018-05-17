-----------------------------------
-- Makel-Pakel WS unlocker (Gun)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(18987,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19007);
		else
			player:tradeComplete();
		    player:addItem(19007,1,44,4,45,9,515,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19007);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19866,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(48);
		player:PrintToPlayer("You have learned the weaponskill 'Wildfire'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
	local mrkSkill = player:getSkillLevel(dsp.skill.MARKSMANSHIP);

    if mrkSkill < 284 or player:hasLearnedWeaponskill(34) then
        player:PrintToPlayer("Makel-Pakel: I have weaponskills or a Gun, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and mrkSkill > 284 and player:hasLearnedWeaponskill(14) then
	    player:addLearnedWeaponskill(34);
		player:PrintToPlayer("You have learned the weaponskill 'Leaden Salute'!", 0xD);
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
