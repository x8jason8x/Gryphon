-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: Luminous Convergence
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus") == 5) then
        player:startEvent(204)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 204) then
        player:completeMission(COP,WHEN_ANGELS_FALL)
        player:addMission(COP,DAWN)
        player:setVar("PromathiaStatus",0)
    end
end
