-----------------------------------
-- Area: Sacrificial Chamber
-- NPC:  Mahogany Door
-- !pos 299 0.1 349 163
-------------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");
-------------------------------------

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == SISTERS_IN_ARMS and player:hasKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE)) then
        player:startEvent(4);
    elseif (EventTriggerBCNM(player,npc)) then
        return 1;
    else
        player:messageSpecial(DOOR_SHUT);
    end
end;

function onEventUpdate(player,csid,option)

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

function onEventFinish(player,csid,option)

    if (csid == 4) then
        player:completeMission(ASA,SISTERS_IN_ARMS);
        player:addMission(ASA,PROJECT_SHANTOTTOFICATION);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;
