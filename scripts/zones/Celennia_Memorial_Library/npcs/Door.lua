-----------------------------------
-- Door WS unlocker (Bow)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18981,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19001);
		else
			player:tradeComplete();
		    player:addItem(19001,1,27,9,29,14,515,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19001);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19865,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(47);
		player:PrintToPlayer("You have learned the weaponskill 'Jishnu's Radiance'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	local mLvl = player:getMainLvl();
	local arcSkill = player:getSkillLevel(dsp.skill.ARCHERY);

    if arcSkill < 284 or player:hasLearnedWeaponskill(33) then
        player:PrintToPlayer("Door: I have weaponskills or a Crossbow, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and arcSkill > 284 and player:hasLearnedWeaponskill(13) then
	    player:addLearnedWeaponskill(33);
		player:PrintToPlayer("You have learned the weaponskill 'Trueflight'!", 0xD);
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
