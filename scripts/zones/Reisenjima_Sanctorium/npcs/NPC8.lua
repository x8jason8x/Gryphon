-----------------------------------
-- Area: Reisenjima Sanctorum
-- NPC8
-- Cooking NPC
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
        
    if (trade:hasItemQty(4245,1)) then -- Trade Twilight Crystal
        player:tradeComplete();
	    player:setPos(-103,-2,48,175,238);
    elseif (trade:hasItemQty(4244,1)) then -- Trade Aurora Crystal
        player:tradeComplete();
	    player:PrintToPlayer("You are now receiving Cooking support.", 0xD);
	    player:addStatusEffect(dsp.effect.COOKING_IMAGERY,3,0,480);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	player:PrintToPlayer("Qhum: Trade me an Aurora Crystal for advanced Cooking support.", 0xD);
	player:PrintToPlayer("Qhum: Trade me a Twilight Crystal for an instant warp to my guild.", 0xD);
	    local stock =
	{
        0x119d,100,     -- Distilled Water
        0x300,100,      -- Flint Stone
        0x1128,100,     -- Saruta Orange
        0x1103,100,     -- Salmon Sub (Test Item)
        0x112f,100,     -- Bluetail
        0x110b,100,     -- Faerie Apple
		0x1140,100,     -- Pea Soup (Test Item)
        0x9c7,100,      -- Almonds
        0x1150,100,     -- Kazham Pineapple
        0x1189,100,     -- Vegetable Gruel (Test Item)
        0x1106,100,     -- Hare Meat
        0x262,100,      -- San d'Orian Flour
		0x113c,100,     -- Thundermelon
        0x118b,100,     -- Watermelon
        0x111d,100,     -- Meat Mithkabob (Test Item)
        0x1180,100,     -- Gugru Tuna
        0x114f,100,     -- San d'Orian Grapes
        0x113d,100,     -- Apple Pie (Test Item)
		0x11db,100,     -- Beaugreens
        0x267,100,      -- Selbina Butter
        0x1197,100,     -- Buburimu Grapes
        0x115d,100,     -- Yagudo Cherry
        0x11ce,100,     -- Yagudo Drink (Test Item)
        0x276,100,      -- Ogre Pumpkin
		0x3a8,100,      -- Rock Salt
        0x27e,100,      -- Sage
        0x111a,100,     -- Selbina Milk
        0x273,100,      -- Maple Sugar
        0x27b,100,      -- Wind. Tea Leaves
        0x11c2,100,     -- Raisin Bread (Test Item)
		0x110a,100,     -- Lizard Egg
        0x10b1,100,     -- Kitron
        0x457,100,      -- Gelatin
        0x1420,100,     -- Buffalo Meat
        0x16af,100,     -- Bladefish
        0x1158,100,     -- Whitefish Stew (Test Item)
		0x11da,100,     -- Bird Egg
        0x274,100,      -- Cinnamon
        0x268,100,      -- Pie Dough
        0x1558,100,     -- Kaplumbaga
        0x1126,100,     -- Mithran Tomato
        0x110d,100,     -- Rolanberry
		0x11d1,100,     -- Seafood Stew (Test Item)
        0x10b3,100,     -- Emperor Roe
        0x103a,100,     -- Holy Water
        0x15ba,100,     -- White Honey
        0x1159,100,     -- Grape Juice
        0x8bd,100,      -- Imp. Flour
		0x15c0,100,     -- Apkallu Egg
        0x161d,100,     -- Walnut
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