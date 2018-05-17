-----------------------------------
-- Area: !base
-- NPC: Iroha (NPC16)
-- NIN tools NPC
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

    player:PrintToPlayer("Iroha: Ninja tools for your journey.", 0xD);
		local stock =
	{
        0x16eb,100,      -- Inoshishinofuda bag 
        0x16ec,100,      -- Shikanofuda bag
        0x16ed,100,      -- Chonofuda bag
        0x14c2,100,      -- Shihei bag
        0x1529,100,      -- Sanjaku-Tengui bag
        0x14c7,100,      -- Shinobi-Tabi bag
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