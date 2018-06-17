-----------------------------------
-- Area: Full Moon Fountain
-- Name: Moon Reading
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onBcnmRegister(player,instance)
end;

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if (leavecode == 2) then
        if (player:getCurrentMission(WINDURST) == MOON_READING and player:getVar("MissionStatus") == 2) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1)
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end
        
function onEventFinish(player,csid,option)

    if (csid == 32001) then
        player:setVar("MissionStatus", 3)
    end
end
