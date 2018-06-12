-----------------------------------
-- Area: Stellar Fulcrum
-- Name: ACP Ode of Life Bestowing
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Stellar_Fulcrum/TextIDs");
-----------------------------------

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

    if (leavecode == 2) then
        if (player:getCurrentMission(ACP) == ODE_OF_LIFE_BESTOWING and player:hasKeyItem(dsp.ki.OMNIS_STONE)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 32001) then
        if (player:getCurrentMission(ACP) == ODE_OF_LIFE_BESTOWING) then
            player:delKeyItem(dsp.ki.OMNIS_STONE);
            player:addKeyItem(dsp.ki.PRISMATIC_KEY);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PRISMATIC_KEY);
            player:setVar("ACP_Ode_CS", 0);
        end
        -- Play last CS if not skipped.
        if (option == 1) then
            player:startEvent(14);
        end
    end
end;
