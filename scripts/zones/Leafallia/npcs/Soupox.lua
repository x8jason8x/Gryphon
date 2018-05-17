-----------------------------------
-- Soupox (Leafallia)
-- Accessory Trade NPC
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
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
			    player:addItem(19219,1,514,4,515,5,39,4,1,19);
	            player:messageSpecial(ITEM_OBTAINED,19219);
		    end
		end	
	end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	local current_rank = player:getRank();
	
	if current_rank == 10 then
        player:PrintToPlayer("Soupox: Youse gots rare armors? Soupox gots rare ammos! Youse trades Soupox?", 0xD);
	else
	    player:PrintToPlayer("Soupox: Soupox gots no times for scruffys aggrobaits adventurers!", 0xD);
	end	
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
end;
