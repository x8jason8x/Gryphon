-----------------------------------
-- Area: Chamber of Oracles
-- Name: Roar! A Cat Burglar Bares Her Fangs
-- AMK BC
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Sacrificial_Chamber/TextIDs")
require("scripts/globals/bcnm")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)

    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        player:startEvent(32001,1,1,1,instance:getTimeInside(),1,1,0)
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001) then
        player:setVar("AMK_Fangs", 0)
        player:addKeyItem(dsp.ki.RED_CORAL_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.RED_CORAL_KEY)
        player:delKeyItem(dsp.ki.NAVARATNA_TALISMAN)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.NAVARATNA_TALISMAN)
        player:completeMission(AMK,ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
		player:addMission(AMK,RELIEF_A_TRIUMPHANT_RETURN)
    end
end
