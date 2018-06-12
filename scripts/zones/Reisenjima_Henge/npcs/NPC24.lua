-----------------------------------
-- NPC 24 Maat
-- Accessory Trade NPC
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)

    -- Must have current rank 10 to activate trades
    local current_rank = player:getRank();

    if current_rank == 10 then
        if (trade:getItemCount() == 1) and (trade:hasItemQty(2357,1)) then -- Tonz Bomb
            if (player:getFreeSlotsCount() < 1) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17277);
		    else	
                player:tradeComplete();
                player:addItem(17277,1,35,3,133,3,40,1,138);
	            player:messageSpecial(ITEM_OBTAINED,17277);
		    end
	    elseif (trade:getItemCount() == 1) and (trade:hasItemQty(2355,1)) then -- Goblin Bomb
            if (player:getFreeSlotsCount() < 1) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19220);
		    else	
                player:tradeComplete();
                player:addItem(19220,1,512,5,513,5,44,2);
	            player:messageSpecial(ITEM_OBTAINED,19220);
		    end
	    elseif (trade:getItemCount() == 1) and (trade:hasItemQty(2356,1)) then -- Stoutsubute
            if (player:getFreeSlotsCount() < 1) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19219);
		    else	
                player:tradeComplete();
                player:addItem(19219,1,514,4,54,2,39,4,1,19);
	            player:messageSpecial(ITEM_OBTAINED,19219);
            end
	    elseif (trade:getItemCount() == 1) and (trade:hasItemQty(18121,1)) then -- Bullseye Grip
            if (player:getFreeSlotsCount() < 1) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,19029);
		    else	
                player:tradeComplete();
                player:addItem(19029,1,515,5,27,2,29,2,211,2);
	            player:messageSpecial(ITEM_OBTAINED,19029);
            end
        end	
    end
end;

function onTrigger(player,npc)

    local current_rank = player:getRank();

    if current_rank == 10 then
        player:showText(npc,NPC_BLANK);
        player:PrintToPlayer("Maat: Well now, you got some Aht Uhrgan king armor for me? I'll give you some power ammo in return...", 0xD);
    else
        player:PrintToPlayer("Maat: Gotta hit rank 10 befor we can talk trades, kiddo.", 0xD);
    end	
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
