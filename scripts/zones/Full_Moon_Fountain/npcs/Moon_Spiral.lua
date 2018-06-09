-----------------------------------
-- Area: Full Moon Fountain
-- NPC:  Moon Spiral
-- Involved in: The Moonlit Path, Moon Reading (Windurst 9-2 BCNM)
-- !pos -302 9 -260 170
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Full_Moon_Fountain/TextIDs");
-----------------------------------
	-- 0: The Moonlit Path
	-- 1: Moon Reading
-----------------------------------

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == FOUNTAIN_OF_TROUBLE and player:hasKeyItem(dsp.ki.DARK_SAP_CRYSTAL)) then
        player:startEvent(63);
    elseif (EventTriggerBCNM(player,npc)) then
        return 1;
    end
end;

function onEventUpdate(player,csid,option)

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)

    if (csid == 63) then
        player:completeMission(ASA,FOUNTAIN_OF_TROUBLE);
        player:addMission(ASA,BATTARU_ROYALE);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;
