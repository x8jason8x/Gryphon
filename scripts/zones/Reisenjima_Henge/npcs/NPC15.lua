-----------------------------------
-- Area: !base
-- NPC: Gilgamesh (NPC15)
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
	player:PrintToPlayer("Gilgamesh: AF shop - Bard to Corsair~", 0xD);
		local stock =
	{
        0x417e,10000,      -- Paper Knife
        0x3621,10000,      -- Choral Roundlet
        0x3167,10000,      -- Choral Jstcps.
        0x3692,10000,      -- Choral Cuffs
        0x378f,10000,      -- Choral Cannions
		0x3712,10000,      -- Choral Slippers
        0x4128,10000,      -- Barbaroi Axe
        0x30e5,10000,      -- Beast Helm
        0x3166,10000,      -- Beast Jackcoat
        0x3691,10000,      -- Beast Gloves
		0x378e,10000,      -- Beast Trousers
        0x3711,10000,      -- Beast Gaiters
        0x440f,10000,      -- Casting Wand
        0x3620,10000,      -- Wizards Petasos
        0x3161,10000,      -- Wizards Coat
		0x368c,10000,      -- Wizards Gloves
        0x3789,10000,      -- Wizards Tonban
        0x370c,10000,      -- Wizards Sabots
        0x4535,10000,      -- Immortals Scimitar
        0x3ba1,10000,      -- Magus Keffiyeh
		0x38b9,10000,      -- Magus Jubbah
        0x3a50,10000,      -- Magus Bazubands
        0x3cf0,10000,      -- Magus Shalwar
        0x3d44,10000,      -- Magus Charuqs
        0x490e,10000,      -- Trump Gun
		0x3ba2,10000,      -- Corsairs Tricorne
        0x38ba,10000,      -- Corsairs Frac
        0x3a51,10000,      -- Corsairs Gants
        0x3cf1,10000,      -- Corsairs Culottes
        0x3d45,10000,      -- Corsairs Bottes
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