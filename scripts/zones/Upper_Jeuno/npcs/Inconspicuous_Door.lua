-----------------------------------
-- Area: Upper Jeuno
--  NPC: Inconspicuous Door
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local welcDecr = player:getVar("AMK_Domicile")

    if player:getCurrentMission(AMK) == HASTEN_IN_A_JAM_IN_JEUNO then
        player:startEvent(10178)
    elseif (player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 1 and player:hasKeyItem(dsp.ki.STURDY_METAL_STRIP)) then
        player:startEvent(10179)
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 2 and player:hasKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK) then
        player:startEvent(10180)
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 3 and player:hasKeyItem(dsp.ki.SAVORY_LAMB_ROAST) then
        player:startEvent(10181)
    end
end

function onEventUpdate(player,csid,option)
    moogleEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 10178) then
        player:completeMission(AMK,HASTEN_IN_A_JAM_IN_JEUNO)
		player:addMission(AMK,WELCOME_TO_MY_DECREPIT_DOMICILE)
        player:setVar("AMK_Domicile", 1)
    elseif (csid == 10179) then
        player:delKeyItem(dsp.ki.STURDY_METAL_STRIP)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.STURDY_METAL_STRIP)
        player:setVar("AMK_Domicile", 2)
    elseif (csid == 10180) then
        player:delKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
        player:setVar("AMK_Domicile", 3)
    elseif (csid == 10181) then
        player:delKeyItem(dsp.ki.SAVORY_LAMB_ROAST)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.SAVORY_LAMB_ROAST)
        player:setVar("AMK_Domicile", 0)
        player:completeMission(AMK,WELCOME_TO_MY_DECREPIT_DOMICILE)
		player:addMission(AMK,CURSES_A_HORRIFICALLY_HARROWING_HEX)
    end
end
