-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC5
-- Smithing NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-92,2,26,171,237);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Smithing support.", 0xD);
	    player:addStatusEffect(dsp.effect.SMITHING_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Lorena: Trade me an Aurora Crystal for advanced Smithing support.", 0xD);
	player:PrintToPlayer("Lorena: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x289,100,      -- Bronze Ingot
        0x294,100,      -- Bronze Sheet
        0x4092,100,     -- Xiphos (Test Item)
        0x281,100,      -- Tin Ore
        0x283,100,      -- Iron Ore
        0x300b,100,     -- Aspis (Test Item)
		0x296,100,      -- Iron Sheet
        0x28b,100,      -- Iron Ingot
        0x4080,100,     -- Bilbo (Test Item)
        0x28c,100,      -- Steel Ingot
        0x29a,100,      -- Steel Sheet
        0x410a,100,     -- War Pick (Test Item)
		0x28d,100,      -- Mythril Ingot
        0x353,100,      -- Ram Leather
        0x410b,100,     -- Mythril Pick (Test Item)
        0x1f5,100,      -- Quadav Helm
        0x28e,100,      -- Darksteel Ingot
        0x298,100,      -- Darksteel Sheet
		0x40af,100,     -- Darksteel Falchion (Test Item)
        0x291,100,      -- Tama-Hagane
        0x354,100,      -- Lizard Skin
        0x308b,100,     -- Bascinet (Test Item)
        0x7c5,100,      -- Dark Bronze Ingot
        0x40c1,100,     -- Bastard Sword (Test Item)
		0x8fe,100,      -- Troll Bronze Ingot
        0x28f,100,      -- Adaman Ingot
        0x7d0,100,      -- Dark Adaman Ingot
        0x308c,100,     -- Celata (Test Item)
        0x5ba,100,      -- Relic Iron
        0x2de,100,      -- Thokcha Ore
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
    if (trade:hasItemQty(4245,1)) then	
	    player:delItem(4245,1);
    elseif (trade:hasItemQty(4244,1)) then
        player:delItem(4244,1);
    end
end;