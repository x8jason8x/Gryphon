-----------------------------------
-- Bestiary WS unlocker (Club)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18973,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18993);
		else
			player:tradeComplete();
		    player:addItem(18993,1,138,0,140,4,329,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18993);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19863,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(45);
		player:PrintToPlayer("You have learned the weaponskill 'Dagan'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local mLvl = player:getMainLvl();
	local clbSkill = player:getSkillLevel(dsp.skill.CLUB);
	
    if clbSkill < 291 or player:hasLearnedWeaponskill(29) then
        player:PrintToPlayer("Bestiary: I have weaponskills or a Club, if you have the requisite level or item trade...", 0xD);
	elseif mLvl == 75 and clbSkill > 291 and player:hasLearnedWeaponskill(11) then
		player:addLearnedWeaponskill(29);
		player:PrintToPlayer("You have learned the weaponskill 'Mystic Boon'!", 0xD);
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
