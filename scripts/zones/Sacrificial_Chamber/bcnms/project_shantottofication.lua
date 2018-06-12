-----------------------------------
-- Area: Sacrificial Chamber
-- Name: Project: Shantottofication
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Sacrificial_Chamber/TextIDs");
-------------------------------------

function onBcnmRegister(player,instance)
end;

function onBcnmEnter(player,instance)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
    
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:getCurrentMission(ASA) == PROJECT_SHANTOTTOFICATION) then
            player:startEvent(5,1,1,1,0,1,0,0);
        else
            player:startEvent(5,1,1,1,0,1,1,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 5) then
        if (player:getCurrentMission(ASA) == PROJECT_SHANTOTTOFICATION) then
            player:completeMission(ASA,PROJECT_SHANTOTTOFICATION);
            player:addMission(ASA,AN_UNEASY_PEACE);
            player:setPos(299,0,349,60,163);
            player:addKeyItem(1189);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TONBERRY_KEY);
        else
            player:setPos(299,0,349,60,163);
        end
    end
end;
