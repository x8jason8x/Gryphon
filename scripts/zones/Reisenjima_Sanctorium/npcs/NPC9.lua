-----------------------------------
-- NPC9 (ReiSan)
-- desc: sells HQ craft items
-----------------------------------
package.loaded["scripts/zones/Reisenjima_Henge/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Reisenjima_Henge/TextIDs")
require("scripts/globals/settings")
require("scripts/globals/shop")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK)
    player:PrintToPlayer("Alienor: High Quality craft items and tools~", 0xD)
    local stock =
    {
        605,100,          -- Pickaxe
        1020,100,         -- Sickle
        1021,100,         -- Hatchet
        0x520,10000,      -- Angel Skin
        0x35c,10000,      -- Behemoth Hide
        0x6b1,10000,      -- Cashmere Thread
        0x878,10000,      -- Cerberus Hide
        0x879,10000,      -- Cerberus Claw
        0x344,1000,       -- Damascene Cloth		
        0x292,10000,      -- Damascus Ingot
        0x2d3,10000,      -- Divine Lumber
        0x1186,10000,     -- Dragon Heart
        0x387,10000,      -- Dragon Talon
        0x6e9,10000,      -- Galateia
        0x46c,1000,       -- Raxa
        0x521,10000,      -- Siren's Hair
        0x385,10000,      -- Venomous Claw
    }
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
