-----------------------------------
-- NPC: Affi
-- Area: Escha Zitah
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/shop")
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Affi: Pop item?", 0xD)
    local stock =
    {
        4363,100,     -- Faerie Apple
    }
    dsp.shop.general(player, stock)
end
