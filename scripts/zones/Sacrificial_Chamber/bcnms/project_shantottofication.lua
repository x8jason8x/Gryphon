-----------------------------------
-- Area: Sacrificial Chamber
-- Name: Project: Shantottofication
-----------------------------------
package.loaded["scripts/zones/Sacrificial_Chamber/TextIDs"] = nil
-------------------------------------
require("scripts/zones/Sacrificial_Chamber/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-------------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if (player:hasKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE)) then
        player:delKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.TABLET_OF_HEXES_MALICE)
    end
	
    if (leavecode == 2) then
        if (player:getCurrentMission(ASA) == PROJECT_SHANTOTTOFICATION and
            player:hasKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE)) then
            player:startEvent(5,1,1,1,0,1,0,0)
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

    if (csid == 5) then
        if (player:getCurrentMission(ASA) == PROJECT_SHANTOTTOFICATION) then
            player:completeMission(ASA,PROJECT_SHANTOTTOFICATION)
            player:addMission(ASA,AN_UNEASY_PEACE)
            player:setPos(299,0,349,60,163)
            player:addKeyItem(1189)
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TONBERRY_KEY)
        end
    end
end
