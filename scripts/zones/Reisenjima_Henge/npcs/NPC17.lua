-----------------------------------
-- Area: !base
-- NPC: Naja Salaheem (NPC17)
-- AF1 NPC
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
	player:PrintToPlayer("Naja: AF shop - Scholar to White Mage~", 0xD);
		local stock =
	{
        0x17aa,10000,      -- Klimaform
        0x3f0c,10000,      -- Scholars Mortarboard
        0x38f4,10000,      -- Scholars Gown
        0x3a9c,10000,      -- Scholars Bracers
        0x3fb7,10000,      -- Scholars Pants
		0x3d84,10000,      -- Scholars Loafers
        0x447c,10000,      -- Kukulcan's Staff
        0x30e8,10000,      -- Evokers Horn
        0x316a,10000,      -- Evokers Doublet
        0x3697,10000,      -- Evokers Bracers
		0x3794,10000,      -- Evokers Spats
        0x3717,10000,      -- Evokers Pigaches
        0x417c,10000,      -- Marauders Knife
        0x30e2,10000,      -- Rogues Bonnet
        0x3163,10000,      -- Rogues Vest
		0x368e,10000,      -- Rogues Armlets
        0x378b,10000,      -- Rogues Culottes
        0x370e,10000,      -- Rogues Poulaines
        0x4126,10000,      -- Razor Axe
        0x30df,10000,      -- Fighters Mask
		0x315e,10000,      -- Fighters Lorica
        0x3689,10000,      -- Fighters Mufflers
        0x3786,10000,      -- Fighters Cuisses
        0x3709,10000,      -- Fighters Calligae
        0x440e,10000,      -- Blessed Hammer
		0x361f,10000,      -- Healers Cap
        0x3160,10000,      -- Healers Briault
        0x368b,10000,      -- Healers Mitts
        0x3788,10000,      -- Healers Pantaloons
        0x370b,10000,      -- Healers Duckbills
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