-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC7
-- Alchemy NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(87,7,-3,254,234);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Alchemy support.", 0xD);
	    player:addStatusEffect(dsp.effect.ALCHEMY_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Hemewmew: Trade me an Aurora Crystal for advanced Alchemy support.", 0xD);
	player:PrintToPlayer("Hemewmew: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x119d,100,     -- Distilled Water
        0x390,100,      -- Beehive Chip
        0x275,100,      -- Millioncorn
        0x3a9,100,      -- Animal Glue (Test Item)
        0x1133,100,     -- Yellow Globe
        0x115b,100,     -- Cobalt Jellyfish
		0x155a,100,     -- Trumpet Shell
        0x103d,100,     -- Poison Potion (Test Item)
        0x1eb,100,      -- Bkn. Gls. Fbr. Rod
        0x399,100,      -- Ahriman Tears
        0x27c,100,      -- Chamomile
        0x1043,100,     -- Blinding Potion (Test Item)
		0x8fd,100,      -- Polyflan
        0x3a0,100,      -- Bomb Ash
        0x454,100,      -- Sulfur
        0x3b3,100,      -- Firesand (Test Item)
        0x65e,100,      -- Cluster Ash
        0x1ea,100,      -- Bkn. Carbon Rod
		0x409f,100,     -- Fire Sword (Test Item)
        0x3ba,100,      -- Magic Pot Shard
        0x3a3,100,      -- Cermet Chunk
        0x1014,10000,   -- Hi Potion (Test Item)
        0x1d8,100,      -- Bkn. Sgl. Hk. Rod
        0x760,100,      -- Silica
		0x405f,100,     -- Acid Kukri (Test Item)
        0x87f,100,      -- Flan Meat
        0x392,100,      -- Mercury
        0x3b1,100,      -- Paralysis Dust
        0x8b5,100,      -- Chimera Blood
        0x1018,10000,   -- X Potion (Test Item)
		0x946,100,      -- Viper Dust
        0x1fa,100,      -- Coeurl Leather
        0x40e1,100,     -- Bloody Sword (Test Item)
        0x5f0,100,      -- Goblin Grease
        0x5f1,100,      -- Slime Juice
		0x3a2,100,      -- Beastman Blood
        0x638,100,      -- Cactuar Root
        0x3ae,100,      -- Philo. Stone
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