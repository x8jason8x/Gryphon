-----------------------------------
-- Area: !base
-- NPC: Arciela (NPC13)
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
	player:PrintToPlayer("Arciela: AF shop - Dancer to Ninja~", 0xD);
		local stock =
	{
        0x4b03,10000,      -- War Hoop
        0x3f0b,10000,      -- Dancers Tiara
        0x38f3,10000,      -- Dancers Casaque
        0x3a9b,10000,      -- Dancers Bangles
        0x3d2c,10000,      -- Dancers Tights
		0x3d83,10000,      -- Dancers Shoes
        0x419e,10000,      -- Raven Scythe
        0x30e4,10000,      -- Chaos Burgeonet
        0x3165,10000,      -- Chaos Cuirass
        0x3690,10000,      -- Chaos Gauntlets
		0x378d,10000,      -- Chaos Flanchard
        0x3710,10000,      -- Chaos Sollerets
        0x41f7,10000,      -- Peregrine
        0x30e7,10000,      -- Drachen Armet
        0x3169,10000,      -- Drachen Mail
		0x3696,10000,      -- Drachen Fgr. Glt.
        0x3793,10000,      -- Drachen Brais
        0x3716,10000,      -- Drachen Greaves
        0x4446,10000,      -- Beat Cesti
        0x30e0,10000,      -- Temple Crown
		0x315f,10000,      -- Temple Cyclas
        0x368a,10000,      -- Temple Gloves
        0x3787,10000,      -- Temple Hose
        0x370a,10000,      -- Temple Gaiters
        0x456b,10000,      -- Anju
		0x456c,10000,      -- Zushio
        0x362d,10000,      -- Ninja Hatsuburi
        0x35d6,10000,      -- Ninja Chainmail
        0x3695,10000,      -- Ninja Tekko
        0x3792,10000,      -- Ninja Hakama
		0x3715,10000,      -- Ninja Kyahan
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