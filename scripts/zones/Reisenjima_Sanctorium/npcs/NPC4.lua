-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC4
-- Leathercraft NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-187,-1,23,79,230);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Leathercraft support.", 0xD);
	    player:addStatusEffect(dsp.effect.LEATHERCRAFT_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Alivatand: Trade me an Aurora Crystal for advanced Leathercraft support.", 0xD);
	player:PrintToPlayer("Alivatand: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x1f9,100,      -- Sheepskin
        0x338,100,      -- Grass Cloth
        0x352,100,      -- Sheep Leather
        0x351a,100,     -- Rabbit Mantle (Test Item)
        0x354,100,      -- Lizard Skin
        0x35a,100,      -- Wolf Hide
		0x4002,100,     -- Lizard Cesti (Test Item)
        0x350,100,      -- Dhalmel Leather
        0x2a8,100,      -- Iron Chain
        0x359,100,      -- Dhalmel Hide
        0x3514,100,     -- Dhalmel Mantle (Test Item)
        0x334,100,      -- Wool Thread
		0x332,100,      -- Cotton Thread
        0x338b,100,     -- Magic Belt (Test Item)
        0x331,100,      -- Grass Thread
        0x353,100,      -- Ram Leather
        0x35b,100,      -- Ram Hide
        0x311b,100,     -- Cuir Bouilli (Test Item)
		0x355,100,      -- Raptor Skin
        0x311c,100,     -- Raptor Jerkin (Test Item)
        0x665,100,      -- Bugard Leather
        0x356,100,      -- Cockatrice Skin
        0x32b4,100,     -- Battle Boots (Test Item)
        0x35d,100,      -- Tiger Hide
		0x35f,100,      -- Coeurl Hide
        0x319e,100,     -- Tiger Gloves (Test Item)
        0x9d0,100,      -- Lynx Hide
        0x2f9,100,      -- Gold Chain
        0x45d,100,      -- Manticore Leather
        0x309f,100,     -- Coeurl Mask (Test Item)
		0x462,100,      -- Wyvern Skin
        0x637,100,      -- HQ Coeurl Hide
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