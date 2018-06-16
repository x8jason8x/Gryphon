-----------------------------------
-- Porter Moogle (Mog Garden)
-----------------------------------
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Mog_Garden/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Moogle: Change job, Kupo?", 0xD)
    player:sendMenu(1)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
