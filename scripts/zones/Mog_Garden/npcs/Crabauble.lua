--------------------------------------
-- Crabauble (Mog Garden)
-- desc: opens the Auction House menu
--------------------------------------
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Mog_Garden/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrigger(player)

    player:PrintToPlayer("Crabauble: Auction House~", 0xD)
    player:sendMenu(3)
end
