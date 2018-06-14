-----------------------------------
-- Area: Throne Room
-- Name: AMK Smash! A Malevolent Menace
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil
-------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/zones/Throne_Room/TextIDs")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if (leavecode == 2) then
        if (player:getCurrentMission(AMK) == SMASH_A_MALEVOLENT_MENACE and
            player:hasKeyItem(dsp.ki.MEGA_BONANZA_KUPON)) then
            player:startEvent(5,1,1,1,0,1,0,1)
        else
            player:startEvent(32001,1,1,1,0,1,0,0)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 5) then
        player:completeMission(AMK,SMASH_A_MALEVOLENT_MENACE)
		player:addMission(AMK,A_MOOGLE_KUPO_DETAT_FIN)
        player:setPos(-109,-6,0,255,165)
        player:delKeyItem(dsp.ki.MEGA_BONANZA_KUPON)
        player:addKeyItem(dsp.ki.OXBLOOD_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.OXBLOOD_KEY)
    end
end
