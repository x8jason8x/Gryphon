-----------------------------------
-- Area: Reisenjima Henge
-- NPC: Hades (NPC18)
-- New Player Rewards etc NPC
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:getItemCount() == 1) then
        if (trade:hasItemQty(536,1)) then -- Trade Adventurer Coupon
            player:tradeComplete();
            player:addItem(11538);
			player:addItem(13496);
			player:addItem(13497);
			player:addItem(13495);
			player:addItem(14586,1,516,2,517,2,138);
			player:addItem(14585,1,512,2,513,2,137,2);
            player:messageSpecial(ITEM_OBTAINED,11538);
			player:messageSpecial(ITEM_OBTAINED,13496);
			player:messageSpecial(ITEM_OBTAINED,13497);
			player:messageSpecial(ITEM_OBTAINED,13495);
			player:messageSpecial(ITEM_OBTAINED,14586);
			player:messageSpecial(ITEM_OBTAINED,14585);
		end
	end
end;

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK);
    player:PrintToPlayer("Hades: Welcome to Gryphon, adventurer.", 0xD)
    local stock =
    {
        0x6ba4,100,      -- Echad Ring
        534,100,         -- Gausebit Grass
    }
    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)

end;

function onEventFinish(player,csid,option)
 
end;
