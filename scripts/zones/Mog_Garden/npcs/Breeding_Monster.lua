-----------------------------------
-- Area: Mog Garden
-- NPC: Breeding Monster
-- Ammo NPC
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
    player:PrintToPlayer("Breeding Monster: Just don't shoot me! Baaaaa!", 0xD)
    local stock =
    {
        0x14de,9900,     -- Corsair Bullet 
        0x14dc,9900,     -- Silver Bullet
        0x4394,100,      -- Platinum Bullet (single)
        0x4b24,10000,    -- Hightail Bullet (single)
        0x14d4,9900,     -- Kabura Arrow
        0x46ef,100,      -- Demon Arrow (single)
        0x46eb,100,	     -- Scorpion Arrow (single)
        0x46ea,100,      -- Beetle Arrow (single)
        0x14d7,9900,     -- Acid Bolts
        0x14d9,9900,     -- Sleep Bolts
        0x14db,9900,     -- Bloody Bolts
        0x14d6,9900,     -- Blind Bolts
        0xb9e,100,       -- Trump Card
        0x16ee,100,	     -- Trump Card Case
    }
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
