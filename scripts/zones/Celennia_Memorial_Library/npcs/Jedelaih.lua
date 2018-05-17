-----------------------------------
-- Jedelaih WS unlocker (Sword)
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(18975,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18995);
		else
			player:tradeComplete();
		    player:addItem(18995,1,35,19,516,9,517,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18995);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18977,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18997);
		else
			player:tradeComplete();
		    player:addItem(18997,1,39,9,45,9,514,9); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,18997);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18986,1)) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19006);
		else
			player:tradeComplete();
		    player:addItem(19006,1,44,4,45,9,138,0); -- augged mythic
		    player:messageSpecial(ITEM_OBTAINED,19006);
		end
	elseif (trade:getItemCount() == 1) and (trade:hasItemQty(19855,1)) then
	    player:tradeComplete();
		player:addLearnedWeaponskill(37);
		player:PrintToPlayer("You have learned the weaponskill 'Chant du Cygne'!", 0xD);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
	local swdSkill = player:getSkillLevel(dsp.skill.SWORD);

    if swdSkill < 291 or player:hasLearnedWeaponskill(20) then
        player:PrintToPlayer("Jedelaih: I have weaponskills or a Sword, if you have the requisite level or item trade...", 0xD);
    elseif mLvl == 75 and swdSkill > 291 and player:hasLearnedWeaponskill(3) then
	    player:addLearnedWeaponskill(20);
		player:PrintToPlayer("You have learned the weaponskill 'Death Blossom'!", 0xD);
		player:addLearnedWeaponskill(21);
		player:PrintToPlayer("You have learned the weaponskill 'Atonement'!", 0xD);
		player:addLearnedWeaponskill(22);
		player:PrintToPlayer("You have learned the weaponskill 'Expiacion'!", 0xD);
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
