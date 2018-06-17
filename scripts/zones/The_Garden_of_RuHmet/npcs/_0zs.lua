-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: _0zs
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if (player:hasCompletedMission(COP,WHEN_ANGELS_FALL)) then
        player:startEvent(112)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid== 112 and option == 1) then
        player:setPos(-20,0,-355,192,34);
    end
end
