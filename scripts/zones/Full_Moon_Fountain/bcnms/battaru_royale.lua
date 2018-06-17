-----------------------------------
-- Area: Full Moon Fountain
-- Name: Battaru Royale
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if  player:hasKeyItem(dsp.ki.FIRE_SAP_CRYSTAL) or player:hasKeyItem(dsp.ki.WATER_SAP_CRYSTAL) or
        player:hasKeyItem(dsp.ki.WIND_SAP_CRYSTAL) or player:hasKeyItem(dsp.ki.EARTH_SAP_CRYSTAL) or
        player:hasKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL) or player:hasKeyItem(dsp.ki.ICE_SAP_CRYSTAL) or
        player:hasKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL) or player:hasKeyItem(dsp.ki.DARK_SAP_CRYSTAL) then
        player:delKeyItem(dsp.ki.FIRE_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.WATER_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.WIND_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.EARTH_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.ICE_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL)
        player:delKeyItem(dsp.ki.DARK_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.FIRE_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.WATER_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.WIND_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.EARTH_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.LIGHTNING_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.ICE_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.LIGHT_SAP_CRYSTAL)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.DARK_SAP_CRYSTAL)
    end

    if (leavecode == 2) then
        player:addExp(1500)
        if player:getCurrentMission(ASA) == BATTARU_ROYALE then
            player:startEvent(64,1,1,1,instance:getTimeInside(),1,0,1)
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 64) then
        player:completeMission(ASA,BATTARU_ROYALE)
        player:addMission(ASA,ROMANCING_THE_CLONE)
        player:setPos(338,14,385,191,170)
        player:addKeyItem(dsp.ki.CHOCOBO_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CHOCOBO_KEY)
    end
end
