-----------------------------------
-- Area: Port Bastok
--  NPC: Qiji
-- Starts & Ends Quest: Forever to Hold
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(12497,1) and trade:getItemCount() == 1) then -- Trade Brass Hairpin
        if (player:getVar("ForevertoHold_Event") == 1) then
            player:startEvent(124);
            player:setVar("ForevertoHold_Event",2);
        end
    end

end;

function onTrigger(player,npc)

    local ForevertoHold = player:getQuestStatus(BASTOK,FOREVER_TO_HOLD);

    if (player:getFameLevel(BASTOK) >= 2 and ForevertoHold == QUEST_AVAILABLE) then
        player:startEvent(123);
    elseif (ForevertoHold == QUEST_ACCEPTED and player:getVar("ForevertoHold_Event") == 3) then
        player:startEvent(126);
    else
        player:startEvent(33);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 123) then
        player:addQuest(BASTOK,FOREVER_TO_HOLD);
        player:setVar("ForevertoHold_Event",1);
    elseif (csid == 126) then
        player:addTitle(dsp.title.QIJIS_FRIEND);
        player:addGil(GIL_RATE*300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
        player:addFame(BASTOK,80);
        player:completeQuest(BASTOK,FOREVER_TO_HOLD);
    end

end;