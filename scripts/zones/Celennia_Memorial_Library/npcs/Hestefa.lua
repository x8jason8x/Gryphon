-----------------------------------
-- Hestefa WS unlocker (Scythe)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:getItemCount() == 1) and (trade:hasItemQty(18978,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18998);
		else
			player:tradeComplete();
		    player:addItem(18998,1,23,9,45,14,512,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18998);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19859,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill();
		player:PrintToPlayer("You have learned the weaponskill 'Quietus'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local mLvl = player:getMainLvl();
	local syhSkill = player:getSkillLevel(dsp.skill.SCYTHE);

    if syhSkill < 291 or player:hasLearnedWeaponskill(25) then
        player:PrintToPlayer("Hestefa: I have weaponskills or a Scythe, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and syhSkill > 291 and player:hasLearnedWeaponskill(7) then
	    player:addLearnedWeaponskill(25);
		player:PrintToPlayer("You have learned the weaponskill 'Insurgency'!", 0xD);
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
