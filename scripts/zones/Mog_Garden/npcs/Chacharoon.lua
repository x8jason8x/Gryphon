-----------------------------------
-- Area: Mog Garden
-- NPC: Chacharoon
-- NIN tools NPC
-----------------------------------
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Mog_Garden/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Chacharoon: Ninja! Vanish!", 0xD)
    local stock =
    {
        0x16eb,100,      -- Inoshishinofuda bag 
        0x16ec,100,      -- Shikanofuda bag
        0x16ed,100,      -- Chonofuda bag
        0x14c2,100,      -- Shihei bag
        0x1529,100,      -- Sanjaku-Tengui bag
        0x14c7,100,      -- Shinobi-Tabi bag
    }
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
