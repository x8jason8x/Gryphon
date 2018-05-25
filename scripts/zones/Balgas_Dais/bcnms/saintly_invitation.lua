-----------------------------------
-- Area: Horlais Peak
-- Name: Saintly Invitation
-- !pos 299 -123 345 146
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Balgas_Dais/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onBcnmRegister(player,instance)
end;

function onBcnmEnter(player,instance)
end;

function onBcnmLeave(player,instance,leavecode)

    if (leavecode == 2) then
        if (player:hasCompletedMission(WINDURST,SAINTLY_INVITATION)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,3,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,3,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 32001) then
        if (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION) then
            player:delKeyItem(dsp.ki.HOLY_ONES_INVITATION);
            player:addTitle(dsp.title.VICTOR_OF_THE_BALGA_CONTEST);
            player:addKeyItem(dsp.ki.BALGA_CHAMPION_CERTIFICATE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.BALGA_CHAMPION_CERTIFICATE);
            player:setVar("MissionStatus",2);
        end
    end
end;
