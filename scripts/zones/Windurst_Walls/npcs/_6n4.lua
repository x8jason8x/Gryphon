-----------------------------------
-- Area: Windurst Walls
-- Door: Shantotto's Manor
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/zones/Windurst_Walls/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local proPrice = player:getVar("AMK_Cardians")

    if player:getCurrentMission(AMK) == CURSES_A_HORRIFICALLY_HARROWING_HEX then
        player:startEvent(506)
    elseif player:getCurrentMission(AMK) == AN_ERRAND_THE_PROFESSORS_PRICE and
        player:hasKeyItem(dsp.ki.RIPE_STARFRUIT) and proPrice == 1 then
        player:startEvent(507)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 506) then
        player:completeMission(AMK,CURSES_A_HORRIFICALLY_HARROWING_HEX)
        player:addMission(AMK,AN_ERRAND_THE_PROFESSORS_PRICE)
        player:PrintToPlayer("Proceed directly to mission ??? to get key items, Confrontations do not work in DSP.")
    elseif (csid == 507) then
        if (option == 1) then
		    player:delGil(5000)
            player:setVar("AMK_Cardians", 0)
        end
    end
end
