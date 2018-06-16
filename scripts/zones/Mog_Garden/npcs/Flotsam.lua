-----------------------------------
-- Area: Mog Garden
-- NPC: Flotsam
-- AF1 NPC
-----------------------------------
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Mog_Garden/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:PrintToPlayer("I'm called Flotsam, what did you think you'd find?", 0xD)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
