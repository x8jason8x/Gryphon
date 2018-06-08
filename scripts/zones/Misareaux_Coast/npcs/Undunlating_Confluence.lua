-----------------------------------
-- Undulating Confluence (MisCoast) Escha Ru'Aun gate
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;	
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();

    if player:hasKeyItem (1325) and mLvl == 75 then
	    player:PrintToPlayer("Undulating Confluence: Warp to Escha-Ru'Aun?", 0xD);
		player:startEvent(554);
	else
	    player:PrintToPlayer("You have tasks to complete before you may come here...", 0xD);
	end	
end;
-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("onEventFinish");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
	if (csid == 554 and option == 1) then
	    player:setPos(0,-34,-466,187,289);
	end
end;