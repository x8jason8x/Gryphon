-----------------------------------
-- Area: Full Moon Fountain
-- NPC:  Moon Spiral
-- Involved in: The Moonlit Path, Moon Reading (Windurst 9-2 BCNM)
-- !pos -302 9 -260 170
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Full_Moon_Fountain/TextIDs");

-----------------------------------

	-- 0: The Moonlit Path
	-- 1: Moon Reading
	
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
    if (player:getCurrentMission(WINDURST) == MOON_READING and "MissionStatus" == 2) then
		player:startEvent(225);
	elseif (EventTriggerBCNM(player,npc)) then
        return 1;
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
	
	if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    --printf("onFinish CSID: %u",csid);
    --printf("onFinish RESULT: %u",option);

    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;