-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: Particle Gate
-- !pos -39 0 -319 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:startEvent(172)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
