-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC6
-- Goldsmithing NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-203,-6,-70,193,235);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Goldsmithing support.", 0xD);
	    player:addStatusEffect(dsp.effect.GOLDSMITHING_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Ellard: Trade me an Aurora Crystal for advanced Goldsmithing support.", 0xD);
	player:PrintToPlayer("Ellard: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x280,100,      -- Copper Ore
        0x282,100,      -- Zinc Ore
        0x288,100,      -- Copper Ingot
        0x30d0,100,     -- Copper Hairpin (Test Item)
        0x28a,100,      -- Brass Ingot
        0x295,100,      -- Brass Sheet
		0x30d1,100,     -- Brass Hairpin (Test Item)
        0x2e0,100,      -- Silver Ore
        0x2e8,100,      -- Silver Ingot
        0x30cf,100,     -- Silver Hairpin (Test Item)
        0x2ed,100,      -- Mythril Beastcoin
        0x284,100,      -- Mythril Ore
		0x331a,100,     -- Chain Gorget (Test Item)
        0x28d,100,      -- Mythril Ingot
        0x2a6,100,      -- Aluminum Ore
        0x2a7,100,      -- Aluminum Ingot
        0x3486,100,     -- Mythril Ring (Test Item)
        0x2e1,100,      -- Gold Ore
		0x2e9,100,      -- Gold Ingot
        0x331c,100,     -- Mythril Gorget (Test Item)
        0x2e2,100,      -- Platinum Ore
        0x2ea,100,      -- Platinum Ingot
        0x3101,100,     -- Mythril Breastplate (Test Item)
        0x3485,100,     -- Gold Ring
		0x325,100,      -- Zircon
        0x34d0,100,     -- Gold Ring +1
        0x3345,100,     -- Torque (Test Item)
        0x3404,100,     -- Platinum Earring
        0x313,100,      -- Diamond
        0x3455,100,     -- Platinum Earring +1
		0x4083,100,     -- Colichemarde (Test Item)
        0x2eb,100,      -- Orichalcum Ingot
		0x3487,100,     -- Platinum Ring
        0x34ba,100,     -- Platinum Ring +1
        0x349a,100,     -- Orichalcum Ring
        0x516,100,      -- Earth Bead
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