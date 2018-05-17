-----------------------------------
-- Area: !base
-- NPC: Nashmeira (NPC14)
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
	player:PrintToPlayer("Nashmeira: AF shop - Paladin to Samurai~", 0xD);
		local stock =
	{
        0x44eb,10000,      -- Honor Sword
        0x30e3,10000,      -- Gallant Coronet
        0x3164,10000,      -- Gallant Surcoat
        0x368f,10000,      -- Gallant Gauntlets
        0x378c,10000,      -- Gallant Breeches
		0x370f,10000,      -- Gallant Leggings
        0x45c2,10000,      -- Turbo Animator
        0x3ba3,10000,      -- Puppetry Taj
        0x38bb,10000,      -- Puppetry Tobe
        0x3a52,10000,      -- Puppetry Dastanas
		0x3cf2,10000,      -- Puppetry Churidars
        0x3d46,10000,      -- Puppetry Babouches
        0x4324,10000,      -- Sniping Bow
        0x30e6,10000,      -- Hunters Beret
        0x3168,10000,      -- Hunters Jerkin
		0x3693,10000,      -- Hunters Bracers
        0x3790,10000,      -- Hunters Braccae
        0x3713,10000,      -- Hunters Socks
        0x41bd,10000,      -- Fencing Degen
        0x30e1,10000,      -- Warlocks Chapeau
		0x3162,10000,      -- Warlocks Tabard
        0x368d,10000,      -- Warlocks Gloves
        0x378a,10000,      -- Warlocks Tights
        0x370d,10000,      -- Warlocks Boots
        0x4594,10000,      -- Magoroku
		0x362c,10000,      -- Myochin Kabuto
        0x35d5,10000,      -- Myochin Domaru
        0x3694,10000,      -- Myochin Kote
        0x3791,10000,      -- Myochin Haidate
        0x3714,10000,      -- Myochin Sune-Ate
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