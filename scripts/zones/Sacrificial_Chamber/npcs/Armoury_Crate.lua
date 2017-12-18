-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Armoury Crate
-------------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil
-------------------------------------

require("scripts/globals/bcnm")
require("scripts/zones/Sacrificial_Chamber/TextIDs")
require("scripts/globals/battlefield")
-------------------------------------

local loot =
{
    -- BCNM Jungle Boogymen
    [129] = 
    {
        {
            {itemid = 13153, droprate = 250}, -- Dark Torque
            {itemid = 13156, droprate = 250}, -- Elemental Torque
            {itemid = 13157, droprate = 250}, -- Healing Torque
            {itemid = 13161, droprate = 250}, -- Wind Torque
        },
        {
            {itemid = 751, droprate = 258},   -- Platinum Beastcoin
            {itemid = 4874, droprate = 48},   -- Scroll Of Absorb-STR
            {itemid = 4751, droprate = 143},  -- Scroll Of Erase
            {itemid = 4714, droprate = 119},  -- Scroll Of Phalanx
            {itemid = 4896, droprate = 48},   -- Fire Spirit Pact
            {itemid = 1255, droprate = 48},   -- Chunk Of Fire Ore
            {itemid = 1256, droprate = 48},   -- Chunk Of Ice Ore
            {itemid = 1257, droprate = 48},   -- Chunk Of Wind Ore
            {itemid = 1258, droprate = 48},   -- Chunk Of Earth Ore
            {itemid = 1259, droprate = 48},   -- Chunk Of Lightning Ore
            {itemid = 1260, droprate = 48},   -- Chunk Of Water Ore
            {itemid = 1261, droprate = 48},   -- Chunk Of Light Ore
            {itemid = 1262, droprate = 48},   -- Chunk Of Dark Ore
        },
        {
            {itemid = 751, droprate = 833},   -- Platinum Beastcoin
            {itemid = 1256, droprate = 169},  -- Chunk Of Ice Ore
        },
        {
            {itemid = 13155, droprate = 250}, -- Enfeebling Torque
            {itemid = 13148, droprate = 250}, -- Evasion Torque
            {itemid = 13151, droprate = 250}, -- Guarding Torque
            {itemid = 13158, droprate = 250}, -- Summoning Torque
        },
        {
            {itemid = 654, droprate = 154},   -- Darksteel Ingot
            {itemid = 797, droprate = 154},   -- Painite
            {itemid = 745, droprate = 154},   -- Gold Ingot
            {itemid = 791, droprate = 77},    -- Aquamarine
            {itemid = 4175, droprate = 77},   -- Vile Elixir +1
            {itemid = 653, droprate = 153},   -- Mythril Ingot
            {itemid = 801, droprate = 30},    -- Chrysoberyl
            {itemid = 802, droprate = 30},    -- Moonstone
            {itemid = 803, droprate = 30},    -- Sunstone
            {itemid = 805, droprate = 30},    -- Zircon
            {itemid = 791, droprate = 30},    -- Aquamarine
            {itemid = 702, droprate = 30},    -- Ebony Log
            {itemid = 700, droprate = 30},    -- Mahogany Log
            {itemid = 942, droprate = 30},    -- Philosophers Stone
        },
        {
            {itemid = 654, droprate = 77},    -- Darksteel Ingot
            {itemid = 802, droprate = 134},   -- Moonstone
            {itemid = 652, droprate = 154},   -- Steel Ingot
            {itemid = 801, droprate = 50},    -- Chrysoberyl
            {itemid = 4173, droprate = 154},  -- Hi-reraiser
            {itemid = 784, droprate = 121},   -- Jadeite
            {itemid = 837, droprate = 10},    -- Spool Of Malboro Fiber
            {itemid = 1110, droprate = 10},   -- Vial Of Black Beetle Blood
            {itemid = 769, droprate = 30},    -- Red Rock
            {itemid = 770, droprate = 30},    -- Blue Rock
            {itemid = 771, droprate = 30},    -- Yellow Rock
            {itemid = 772, droprate = 30},    -- Green Rock
            {itemid = 773, droprate = 30},    -- Translucent Rock
            {itemid = 774, droprate = 30},    -- Purple Rock
            {itemid = 775, droprate = 30},    -- Black Rock
            {itemid = 776, droprate = 30},    -- White Rock
            {itemid = 810, droprate = 50},    -- Fluorite
        },
    },

    -- BCNM Amphibian Assault
    [156] = 
    {
        {
            {itemid = 13155, droprate = 100}, -- Enfeebling Torque
            {itemid = 13152, droprate = 100}, -- Divine Torque
            {itemid = 13150, droprate = 100}, -- Shield Torque
            {itemid = 13160, droprate = 100}, -- String Torque
        },
        {
            {itemid = 13156, droprate = 250}, -- Elemental Torque
            {itemid = 13148, droprate = 250}, -- Evasion Torque
            {itemid = 13151, droprate = 250}, -- Guarding Torque
            {itemid = 13154, droprate = 250}, -- Enhancing Torque
            {itemid = 13158, droprate = 250}, -- Summoning Torque
        },
        {
            {itemid = 4896, droprate = 48},   -- Fire Spirit Pact
            {itemid = 4874, droprate = 48},   -- Scroll Of Absorb-str
            {itemid = 4751, droprate = 143},  -- Scroll Of Erase
            {itemid = 4714, droprate = 119},  -- Scroll Of Phalanx
            {itemid = 4621, droprate = 150},  -- Scroll Of Raise Ii
        },
        {
            {itemid = 4175, droprate = 77},   -- Vile Elixir +1
            {itemid = 4173, droprate = 154},  -- Hi-reraiser
        },
        {
            {itemid = 1260, droprate = 48},   -- Chunk Of Water Ore
            {itemid = 1257, droprate = 48},   -- Chunk Of Wind Ore
            {itemid = 1256, droprate = 48},   -- Chunk Of Ice Ore
            {itemid = 1259, droprate = 48},   -- Chunk Of Lightning Ore
            {itemid = 1261, droprate = 48},   -- Chunk Of Light Ore
            {itemid = 1255, droprate = 48},   -- Chunk Of Fire Ore
            {itemid = 1262, droprate = 48},   -- Chunk Of Dark Ore
            {itemid = 1258, droprate = 48},   -- Chunk Of Earth Ore
        },
        {
            {itemid = 887, droprate = 150},   -- Coral Fragment
            {itemid = 837, droprate = 10},    -- Spool Of Malboro Fiber
            {itemid = 751, droprate = 850},   -- Platinum Beastcoin
            {itemid = 810, droprate = 50},    -- Fluorite
            {itemid = 797, droprate = 50},    -- Painite
            {itemid = 803, droprate = 50},    -- Sunstone
            {itemid = 784, droprate = 50},    -- Jadeite
            {itemid = 791, droprate = 50},    -- Aquamarine
            {itemid = 802, droprate = 50},    -- Moonstone
            {itemid = 652, droprate = 100},   -- Steel Ingot
            {itemid = 702, droprate = 30},    -- Ebony Log
            {itemid = 771, droprate = 30},    -- Yellow Rock
            {itemid = 769, droprate = 30},    -- Red Rock
            {itemid = 776, droprate = 30},    -- White Rock
            {itemid = 772, droprate = 30},    -- Green Rock
            {itemid = 773, droprate = 30},    -- Translucent Rock
            {itemid = 801, droprate = 30},    -- Chrysoberyl
            {itemid = 775, droprate = 30},    -- Black Rock
            {itemid = 774, droprate = 30},    -- Purple Rock
        },
    }
}

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local battlefield = player:getBattlefield()
    if battlefield then
        g_Battlefield.HandleLootRolls(battlefield, loot[battlefield:getID()], nil, npc)
    end
end

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
end
