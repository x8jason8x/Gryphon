-----------------------------------
-- Area: Chamber of Oracles
-- Name: Roar! A Cat Burglar Bares Her Fangs
-- AMK BC
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Sacrificial_Chamber/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if (leavecode == 2) then
        if (player:getCurrentMission(AMK) == ROAR_A_CAT_BURGLAR_BARES_HER_FANGS and
            player:hasKeyItem(dsp.ki.NAVARATNA_TALISMAN)) then
            player:startEvent(6,1,1,1,0,1,0,0)
        else
            player:startEvent(32001,1,1,1,0,1,1,0)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 32001) then
        player:completeMission(AMK,ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
		player:addMission(AMK,RELIEF_A_TRIUMPHANT_RETURN)
        player:setPos(-220,0,7,62,168)
        player:setVar("AMK_Fangs", 0)
        player:addKeyItem(dsp.ki.RED_CORAL_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.RED_CORAL_KEY)
        player:delKeyItem(dsp.ki.NAVARATNA_TALISMAN)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.NAVARATNA_TALISMAN)
    end
end
