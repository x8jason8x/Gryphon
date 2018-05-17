-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC3
-- Woodworking NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-135,12,248,159,231);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Woodworking support.", 0xD);
	    player:addStatusEffect(dsp.effect.WOODWORKING_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Andreas: Trade me an Aurora Crystal for advanced Woodworking support.", 0xD);
	player:PrintToPlayer("Andreas: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x2b3,100,      -- Maple Log
        0x2ba,100,      -- Ash Log
        0x16,100,       -- Workbench (Test Item)
        0x2b7,100,      -- Willow Log
        0x2c4,100,      -- Maple Lumber
        0x17,100,       -- Maple Table (Test Item)
		0x2c6,100,      -- Chestnut Lumber
        0x2b2,100,      -- Elm Log
        0x2b6,100,      -- Chestnut Log
        0x43ca,100,     -- Harp (Test Item)
        0x34f,100,      -- Bird Feather
        0x2bb,100,      -- Oak Log
		0x2cc,100,      -- Oak Lumber
        0x43c4,100,     -- Traversiere (Test Item)
        0x2bd,100,      -- Rosewood Log
        0x34d,100,      -- Blk. Chocobo Fthr.
        0x429d,100,     -- Rose Wand (Test Item)
        0x2bc,100,      -- Mahogany Log
		0x4304,100,     -- Kaman (Test Item)
        0x2be,100,      -- Ebony Log
        0x2cd,100,      -- Mahogany Lumber
        0x429e,100,     -- Ebony Wand (Test Item)
        0x2bf,100,      -- Petrified Log
        0x2ce,100,      -- Rosewood Lumber
		0x38,100,       -- Commode (Test Item)
        0x2b4,100,      -- Beech Log
        0x9e4,100,      -- Teak Log
        0x2d0,100,      -- Ancient Lumber
        0x42cd,100,     -- Mythic Pole (Test Item)
        0x5a6,100,      -- Lacquer Tree Log
		0x9e6,100,      -- Jacaranda Log
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