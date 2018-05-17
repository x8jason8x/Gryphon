-----------------------------------
-- Vainrachault WS unlocker (Gkatana)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(18982,1)) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19002);
		else
			player:tradeComplete();
		    player:addItem(19002,1,23,14,45,9,512,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19002);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19862,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(44);
		player:PrintToPlayer("You have learned the weaponskill 'Tachi: Fudo'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
	local gktSkill = player:getSkillLevel(dsp.skill.GREAT_KATANA);

    if gktSkill < 291 or player:hasLearnedWeaponskill(29) then
        player:PrintToPlayer("Vainrachault: I have weaponskills or a Great Katana, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and gktSkill > 291 and player:hasLearnedWeaponskill(10) then
		player:addLearnedWeaponskill(29);
		player:PrintToPlayer("You have learned the weaponskill 'Tachi: Rana'!", 0xD);
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
