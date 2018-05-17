-----------------------------------
-- Undulating Confluence (Qufim) Escha Zitah gate
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

    if player:hasKeyItem(490) and mLvl == 75 then
        player:PrintToPlayer("Undulating Confluence: Warp to Escha-Zi'tah?", 0xD);
	    player:startEvent(300);
    else
	    player:PrintToPlayer("You must complete more battles before you can come here!", 0xD);
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
	if (csid == 300 and option == 1) then
	    player:setPos(-341,1,-182,172,288);
	end
end;