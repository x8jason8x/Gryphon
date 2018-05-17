---------------------------------------------------------------------------------------------------
-- NPC9 (ReiSan)
-- desc: sells HQ craft items
---------------------------------------------------------------------------------------------------

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

    player:PrintToPlayer("Alienor: High Quality craft items~", 0xD);
		local stock =
	{
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