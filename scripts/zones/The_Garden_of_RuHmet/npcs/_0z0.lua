-----------------------------------
-- Area: The_Garden_of_RuHmet
-- NPC:  _0z0
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
-----------------------------------

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return
    end
end

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(203)
    elseif (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus") == 5) then
        player:startEvent(205)
    elseif (EventTriggerBCNM(player,npc)) then
        return
    end
end

function onEventUpdate(player,csid,option)

    if (EventUpdateBCNM(player,csid,option)) then
        return
    end
end

function onEventFinish(player,csid,option)

    if ( csid == 203) then
        player:setVar("PromathiaStatus",4)
    elseif (EventFinishBCNM(player,csid,option)) then
        return
    end
end
