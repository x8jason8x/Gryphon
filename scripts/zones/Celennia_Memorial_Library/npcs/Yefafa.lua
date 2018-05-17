-----------------------------------
-- Yefafa WS unlocker (Polearm)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(18984,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19004);
		else
			player:tradeComplete();
		    player:addItem(19004,1,23,14,45,9,512,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19004);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19860,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(42);
		player:PrintToPlayer("You have learned the weaponskill 'Camlann's Torment'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
	local polSkill = player:getSkillLevel(dsp.skill.POLEARM);

    if polSkill < 291 or player:hasLearnedWeaponskill(26) then
        player:PrintToPlayer("Yefafa: I have weaponskills or a Polearm, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and polSkill >= 290 and player:hasLearnedWeaponskill(8) then
		player:addLearnedWeaponskill(26);
		player:PrintToPlayer("You have learned the weaponskill 'Drakesbane'!", 0xD);
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
