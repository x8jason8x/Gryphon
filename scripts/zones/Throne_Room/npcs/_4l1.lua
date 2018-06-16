-----------------------------------
-- Area: Throne Room
-- NPC:  Throne Room
-- Type: Door
-- !pos -111 -6 0 165
-------------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil
-------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/bcnm")
require("scripts/globals/missions")
require("scripts/zones/Throne_Room/TextIDs")
-------------------------------------
    -- events:
    -- 7D00 : BC menu
    -- Param 4 is a bitmask for the choice of battlefields in the menu:

    -- 0: Mission 5-2
    -- 1:
    -- 2:
    -- 3:
    -- 4:
    -- 5:

    -- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

    -- 7D01 : final BC event.
    -- param 2: #time record for this mission
    -- param 3: #clear time in seconds
    -- param 6: #which mission (linear numbering as above)
    -- 7D03 : stay/run away

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return
    end
end

function onTrigger(player,npc)

    local couldWin = player:getVar("AMK_Winner")

    if player:getCurrentMission(AMK) == A_CHALLENGE_YOU_COULD_BE_A_WINNER and couldWin == 3 then
        player:startEvent(4)
    elseif (player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 2) then
        player:startEvent(6)
    elseif (EventTriggerBCNM(player,npc)) then
        return 1
    end
end

function onEventUpdate(player,csid,option)

    if (EventUpdateBCNM(player,csid,option)) then
        return
    end
end

function onEventFinish(player,csid,option)

    if (csid == 4) then
        player:completeMission(AMK,A_CHALLENGE_YOU_COULD_BE_A_WINNER)
		player:addMission(AMK,SMASH_A_MALEVOLENT_MENACE)
        player:setVar("AMK_Winner", 0)
    elseif (csid == 6) then
        player:setVar("MissionStatus",3)
    elseif (EventFinishBCNM(player,csid,option)) then
        return
    end
end
