-----------------------------------
-- Area: Mog Garden
-- NPC: Kuyin Hathdenna
-- Meds NPC
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil;
require("scripts/zones/Mog_Garden/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:PrintToPlayer("Kuyin: Dia? Curse? I can cure what ails you!", 0xD);
    local stock =
    {
        0x1035,100,      -- Panacea
        0x103b,100,      -- Remedy
        0x152a,100,      -- Tincture
        0x1039,100,      -- Antacid
		0x103a,100,      -- Holy Water
        0x39c6,100,      -- Reraise Earring
        0x3b6b,100,      -- Reraise Hairpin
        0x1044,100,      -- Prism Powder
        0x1045,100,      -- Silent Oil
		0x1041,100,      -- Sleeping Potion
		0x103d,100,		 -- Poison Potion
		0x1030,50000,	 -- Hi-Elixir
        0x104f,200000,   -- Vile Elixir +1
    }
    showShop(player, STATIC, stock);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
