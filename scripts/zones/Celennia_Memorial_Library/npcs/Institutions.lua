-----------------------------------
-- Institutions WS unlocker (Dagger)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(18976,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18996);
		else
			player:tradeComplete();
		    player:addItem(18996,1,45,9,147,0,513,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18996);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18980,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19000);
		else
			player:tradeComplete();
		    player:addItem(19000,1,322,9,337,9,518,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19000);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18969,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18989);
		else
			player:tradeComplete();
		    player:addItem(18989,1,44,4,45,9,513,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18989);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19854,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(36);
		player:PrintToPlayer("You have learned the weaponskill 'Rudra's Storm'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local mLvl = player:getMainLvl();
	local dagSkill = player:getSkillLevel(dsp.skill.DAGGER);

    if dagSkill < 291 or player:hasLearnedWeaponskill(17) then
        player:PrintToPlayer("Institutions: I have weaponskills or a Dagger, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and dagSkill > 291 and player:hasLearnedWeaponskill(2) then
	    player:addLearnedWeaponskill(17);
		player:PrintToPlayer("You have learned the weaponskill 'Mandalic Stab'!", 0xD);
		player:addLearnedWeaponskill(18);
		player:PrintToPlayer("You have learned the weaponskill 'Mordant Rime'!", 0xD);
		player:addLearnedWeaponskill(19);
		player:PrintToPlayer("You have learned the weaponskill 'Pyrrhic Kleos'!", 0xD);
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
