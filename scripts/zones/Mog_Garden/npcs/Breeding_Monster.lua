-----------------------------------
-- Area: Mog Garden
-- NPC: Breeding Monster
-- Ammo NPC
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

    player:PrintToPlayer("Breeding Monster: Just don't shoot me! Baaaaa!", 0xD);
    local stock =
    {
        0x14de,9900,     -- Corsair Bullet 
        0x14dc,9900,     -- Silver Bullet
		0x4394,100,      -- Platinum Bullet (single)
		0x4b24,10000,    -- Hightail Bullet (single)
        0x14d4,9900,     -- Kabura Arrow
        0x46ef,100,      -- Demon Arrow (single)
		0x46eb,100,		 -- Scorpion Arrow (single)
        0x46ea,100,      -- Beetle Arrow (single)
        0x14d7,9900,     -- Acid Bolts
        0x14d9,9900,     -- Sleep Bolts
        0x14db,9900,     -- Bloody Bolts
		0x14d6,9900,	 -- Blind Bolts
		0xb9e,100,       -- Trump Card
		0x16ee,100,		 -- Trump Card Case
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