--------------------------------------
-- NPC0 (ReiSan)
-- desc: opens the Auction House menu
--------------------------------------
package.loaded["scripts/zones/Reisenjima_Henge/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Reisenjima_Henge/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrigger(player)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Glowing Hearth: Auction House~", 0xD)
    player:sendMenu(3)
end
