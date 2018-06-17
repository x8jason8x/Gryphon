-----------------------------------
-- Area: Empyreal Paradox
-- NPC: Transcendental
-----------------------------------
package.loaded["scripts/zones/Empyreal_Paradox/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/zones/Empyreal_Paradox/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
-----------------------------------

function onTrade(player,npc,trade)

    if (TradeBCNM(player,npc,trade)) then
        return
    end
end

function onTrigger(player,npc)

    local pm92Dawn = player:getVar("PromathiaStatus")

    if player:getCurrentMission(COP) == DAWN and pm92Dawn == 1 then
        player:startEvent(2)
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

    if (csid == 2) then
        player:setVar("PromathiaStatus",2)
    elseif (EventFinishBCNM(player,csid,option)) then
        return
    end
end
