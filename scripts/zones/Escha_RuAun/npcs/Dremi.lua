-----------------------------------
-- Area: Escha RuAun
-- NPC: Dremi
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/shop")
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Dremi: Congratulations on making it here! Pop items?", 0xD)
    local stock =
    {
        1134,100,     -- Bast Parchment (Kamma PI)
        1408,100,     -- Illuminink (AA EV PI)
    }
    dsp.shop.general(player, stock)
end
