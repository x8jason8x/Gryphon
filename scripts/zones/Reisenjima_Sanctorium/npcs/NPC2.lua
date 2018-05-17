-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC2
-- Bonecraft NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(6,-4,-137,128,241);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Bonecraft support.", 0xD);
	    player:addStatusEffect(dsp.effect.BONECRAFT_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Samigo: Trade me an Aurora Crystal for advanced Bonecraft support.", 0xD);
	player:PrintToPlayer("Samigo: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
        local stock =
	{
        0x370,100,      -- Bone Chip
        0x3482,100,     -- Shell Ring (Test Item)
        0x382,100,      -- Chicken Bone
        0x457,100,      -- Gelatin
        0x1184,100,     -- Shall Shell
        0x3481,100,     -- Bone Ring (Test Item)
		0x379,100,      -- Beetle Shell
        0x37e,100,      -- Beetle Jaw
        0x37f,100,      -- Ram Horn
        0x340b,100,     -- Beetle Earring (Test Item)
        0x360,100,      -- Fish Scale
        0x117c,100,     -- Titanictus
		0x3493,100,     -- Horn Ring (Test Item)
        0x371,100,      -- Crab Shell
        0x350,100,      -- Dhalmel Leather
        0x3323,100,     -- Carapace Gorget (Test Item)
        0x381,100,      -- Scorpion Claw
        0x380,100,      -- Scorpion Shell
		0x4393,100,     -- Astragalos (Test Item)
        0x386,100,      -- Demon Horn
        0x9ca,100,      -- Ladybug Wing
        0x4024,100,     -- Bone Patas (Test Item)
        0x2cf,100,      -- Ebony Lumber
        0x863,100,      -- Marid Tusk
		0x30dc,100,     -- Coral Hairpin (Test Item)
        0x377,100,      -- Coral Fragment
        0x373,100,      -- Behemoth Horn
        0x36a3,100,     -- Coral Bangles (Test Item)
        0x376,100,      -- Demon Skull
        0x352,100,      -- Sheep Leather
		0x5ed,100,      -- Giant Frozen Head
        0x5ee,100,      -- Colossal Skull
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