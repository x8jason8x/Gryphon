-----------------------------
-- Moogle
-----------------------------
package.loaded["scripts/zones/Reisenjima_Henge/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Reisenjima_Henge/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/shop")
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Moogle: Change job, Kupo?", 0xD)
    player:sendMenu(1)
end
