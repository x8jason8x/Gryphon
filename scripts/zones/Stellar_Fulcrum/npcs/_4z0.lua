-----------------------------------
-- Area: Stellar Fulcrum
-- Door: Qe'Lov Gate
-- !pos -520 -4 17 179
-------------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Stellar_Fulcrum/TextIDs");

    -- events:
    -- 7D00 : BC menu
    -- Param 4 is a bitmask for the choice of battlefields in the menu:

    -- 1/0: Zilart Mission 8
    -- 2/1:
    -- 3/2:

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ACP) == ODE_OF_LIFE_BESTOWING and player:getVar("ACP_Ode_CS") == 0) then
	    player:startEvent(12);
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

    if (csid == 12) then
        player:setVar("ACP_Ode_CS", 1);
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;
