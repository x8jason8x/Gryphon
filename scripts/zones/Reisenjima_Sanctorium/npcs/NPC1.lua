-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC1
-- Clothcraft items/support
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-48,0,-115,20,241);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Clothcraft support.", 0xD);
	    player:addStatusEffect(dsp.effect.CLOTHCRAFT_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Hauh: Trade me an Aurora Crystal for advanced Clothcraft support.", 0xD);
	player:PrintToPlayer("Hauh: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x331,100,      -- Grass Thread
        0x338,100,      -- Grass Cloth
        0x350f,100,     -- Cape (Test Item)
        0x332,100,      -- Cotton Thread
        0x735,100,      -- Red Moko Grass
        0x339,100,      -- Cotton Cloth
		0x3510,100,     -- Cotton Cape (Test Item)
        0x333,100,      -- Linen Thread
        0x349,100,      -- Yagudo Feather
        0x3394,100,     -- Heko Obi (Test Item)
        0x33a,100,      -- Linen Cloth
        0x340,100,      -- Sheep Wool
		0x8f8,100,      -- Mohbwa Thread
        0x3313,100,     -- Feather Collar (Test Item)
        0x34f,100,      -- Bird Feather
        0x342,100,      -- Saruta Cotton
        0x33b,100,      -- Wool Cloth
        0x31b3,100,     -- Wool Bracers (Test Item)
		0x347,100,      -- Crawler Cocoon
        0x34e,100,      -- Insect Wing
        0x8ef,100,      -- Karakul Thread
        0x3512,100,     -- Red Cape (Test Item)
        0x9da,100,      -- Gnat Wing
        0x865,100,      -- Apkallu Feather
		0x35b8,100,     -- Wool Doublet (Test Item)
        0x34d,100,      -- Blk. Chocobo Fthr.
        0x346,100,      -- Spider Web
        0x3144,100,     -- Silk Cloak (Test Item)
        0x864,100,      -- Puk Wing
        0x87d,100,      -- Wamoura Cocoon
		0x37ad,100,     -- Arhat's Hakama (Test Item)
        0x34b,100,      -- Giant Bird Plume 
        0x330,100,      -- Silk Thread
        0x335,100,      -- Rainbow Thread
		0x50e,100,      -- Arachne Thread
        0x7da,100,      -- Wolf Felt
        0x924,100,      -- Imp. Silk Cloth
        0x9ac,100,      -- Platinum Silk
		0xabf,100,      -- Amphiptere Leather
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