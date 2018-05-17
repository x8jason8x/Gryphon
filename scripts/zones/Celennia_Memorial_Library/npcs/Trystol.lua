-----------------------------------
-- Trystol WS unlocker (Staff)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
	if (trade:getItemCount() == 1) and (trade:hasItemQty(18970,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18990);
		else
			player:tradeComplete();
		    player:addItem(18990,1,35,19,138,0,329,4); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18990);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18974,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18994);
		else
			player:tradeComplete();
		    player:addItem(18994,1,35,19,334,9,516,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18994);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18985,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19005);
		else
			player:tradeComplete();
		    player:addItem(19005,1,109,9,138,1,294,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19005);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19864,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(46);
		player:PrintToPlayer("You have learned the weaponskill 'Myrkr'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local mLvl = player:getMainLvl();
	local stfSkill = player:getSkillLevel(dsp.skill.STAFF);

    if stfSkill < 291 or player:hasLearnedWeaponskill(30) then
        player:PrintToPlayer("Trystol: I have weaponskills or a Staff, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and stfSkill > 291 and player:hasLearnedWeaponskill(12) then
	    player:addLearnedWeaponskill(30);
		player:PrintToPlayer("You have learned the weaponskill 'Vidohunir'!", 0xD);
		player:addLearnedWeaponskill(31);
		player:PrintToPlayer("You have learned the weaponskill 'Garland of Bliss'!", 0xD);
		player:addLearnedWeaponskill(32);
		player:PrintToPlayer("You have learned the weaponskill 'Omniscience'!", 0xD);
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
