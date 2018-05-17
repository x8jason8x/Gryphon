-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC: Reisen Crystal
-- Crystal NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:PrintToPlayer("Reisen: Crystal Shop", 0xD);
		local stock =
	{
        0x1008,1000,     -- Fire Cluster
        0x1009,1000,     -- Ice Cluster
        0x100a,1000,     -- Wind Cluster
        0x100b,1000,     -- Earth Cluster
        0x100c,1000,     -- Ltg. Cluster
        0x100d,1000,     -- Water Cluster
		0x100e,1000,     -- Light Cluster
        0x100f,1000,     -- Dark Cluster
        0x108e,1000,    -- Inferno Crystal 
        0x108f,1000,    -- Glacier Crystal
        0x1090,1000,    -- Cyclone Crystal
        0x1091,1000,    -- Terra Crystal
		0x1092,1000,    -- Plasma Crystal
        0x1093,1000,    -- Torrent Crystal
        0x1094,1000,    -- Aurora Crystal
        0x1095,1000,    -- Twilight Crystal
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
