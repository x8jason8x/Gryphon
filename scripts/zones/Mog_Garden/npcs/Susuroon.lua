-----------------------------------
-- Area: Mog Garden
-- NPC: Susuroon
-- Food NPC
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
    player:PrintToPlayer("Susuroon: Hungry? I've got all the best foods here!", 0xD);
    local stock =
    {
        0x11ce,100,      -- Yagudo Drink
        0x10cf,100,      -- Persikos au Lait
		0x162d,100,		 -- Patriarch Saute	
        0x1426,100,      -- Vermillion Jelly
        0x1692,100,      -- Crepe Belle Helene
        0x1656,100,      -- Creme Puff
        0x15e3,100,      -- Hydra Kofte +1
        0x142b,100,      -- Sole Sushi +1
        0x1685,100,      -- Red Curry Bun +1
		0x1437,100,      -- Leremieu Taco
		0x143b,100,		 -- Dorado Sushi +1
		0x142a,100,		 -- Squid Sushi +1
        0x145c,100,      -- Arrabbiata +1
		0x1450,100,		 -- Pescatora +1
		0x1679,100,      -- Pot-au-Feu +1
		
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
