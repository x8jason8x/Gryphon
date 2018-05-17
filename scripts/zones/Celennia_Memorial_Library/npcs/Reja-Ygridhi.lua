-----------------------------------
-- Reja Ygridhi  WS unlocker (Axe)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18979,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18999);
		else
			player:tradeComplete();
		    player:addItem(18999,1,43,9,44,4,518,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18999);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19857,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(39);
		player:PrintToPlayer("You have learned the weaponskill 'Cloudsplitter'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local mLvl = player:getMainLvl();
	local axeSkill = player:getSkillLevel(dsp.skill.AXE);

    if axeSkill < 291 or player:hasLearnedWeaponskill(23) then
        player:PrintToPlayer("Reja Ygridhi: I have weaponskills or an Axe, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and axeSkill > 291 and player:hasLearnedWeaponskill(5) then
		player:addLearnedWeaponskill(23);
		player:PrintToPlayer("You have learned the weaponskill 'Primal Rend'!", 0xD);
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
