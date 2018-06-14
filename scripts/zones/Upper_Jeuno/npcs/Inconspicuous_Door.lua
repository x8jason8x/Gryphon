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
	local readFine = player:getVar("AMK_Lender")
    local amkFincs = player:getVar("AMK_FinCS")

    if player:getCurrentMission(AMK) == HASTEN_IN_A_JAM_IN_JEUNO then
        player:startEvent(10178)
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 1 and player:hasKeyItem(dsp.ki.STURDY_METAL_STRIP) then
        player:startEvent(10179)
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 2 and player:hasKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK) then
        player:startEvent(10180)
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE and
        welcDecr == 3 and player:hasKeyItem(dsp.ki.SAVORY_LAMB_ROAST) then
        player:startEvent(10181)
    elseif player:getCurrentMission(AMK) == AN_ERRAND_THE_PROFESSORS_PRICE and
        player:hasKeyItem(dsp.ki.RIPE_STARFRUIT) then
        player:startEvent(10182)
    elseif player:getCurrentMission(AMK) == SHOCK_ARRANT_ABUSE_OF_AUTHORITY and
        player:hasKeyItem(dsp.ki.MOLDY_WORMEATEN_CHEST) then
        player:startEvent(10183)
    elseif player:getCurrentMission(AMK) == LENDER_BEWARE_READ_THE_FINE_PRINT and
        readFine == 2 then
        player:startEvent(10184)
    elseif player:getCurrentMission(AMK) == RELIEF_A_TRIUMPHANT_RETURN then
        player:startEvent(10185)
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
    elseif (csid == 10182) then
        player:delKeyItem(dsp.ki.RIPE_STARFRUIT)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.RIPE_STARFRUIT)
        player:completeMission(AMK,AN_ERRAND_THE_PROFESSORS_PRICE)
		player:addMission(AMK,SHOCK_ARRANT_ABUSE_OF_AUTHORITY)
    elseif (csid == 10183) then
        player:delKeyItem(dsp.ki.MOLDY_WORMEATEN_CHEST)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.MOLDY_WORMEATEN_CHEST)
        player:completeMission(AMK,SHOCK_ARRANT_ABUSE_OF_AUTHORITY)
		player:addMission(AMK,LENDER_BEWARE_READ_THE_FINE_PRINT)
    elseif (csid == 10184) then
        player:setVar("AMK_Lender", 0)
        player:completeMission(AMK,LENDER_BEWARE_READ_THE_FINE_PRINT)
		player:addMission(AMK,RESCUE_A_MOOGLES_LABOR_OF_LOVE)
    elseif (csid == 10185) then
        player:completeMission(AMK,RELIEF_A_TRIUMPHANT_RETURN)
		player:addMission(AMK,JOY_SUMMONED_TO_A_FABULOUS_FETE)
    end
end
