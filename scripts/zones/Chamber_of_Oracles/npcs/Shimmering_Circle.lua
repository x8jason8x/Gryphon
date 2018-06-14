-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Shimmering Circle
-- !pos -220 0 12 168
-------------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil
-------------------------------------
require("scripts/globals/bcnm")
require("scripts/globals/missions")
require("scripts/zones/Chamber_of_Oracles/TextIDs")
-------------------------------------

    --- 1/0: Through the Quicksand Caves
    --- 2/1: Legion XI Comitatensis
    --- 4/2: Shattering Stars (Samurai)
    --- 8/3: Shattering Stars (Ninja)
    --- 16/4: Shattering Stars (Dragoon)
    --- Cactuar Suave
    --- Eye of the Storm
    --- The Scarlet King
    --- Roar! A Cat Burglar Bares Her Fangs

function onTrade(player,npc,trade)

    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return
    end
end

function onTrigger(player,npc)

    local CurrentMission = player:getCurrentMission(WINDURST)
    local MissionStatus = player:getVar("MissionStatus")
    local roarFang = player:getVar("AMK_Fangs")

    if player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA) then
        return
    elseif (CurrentMission == MOON_READING and MissionStatus == 1) then
        player:startEvent(3)
    elseif player:getCurrentMission(AMK) == ROAR_A_CAT_BURGLAR_BARES_HER_FANGS and roarFang == 0 then
        player:startEvent(5)
    elseif (EventTriggerBCNM(player,npc)) then
        return
    end
end

function onEventUpdate(player,csid,option)

    if (EventUpdateBCNM(player,csid,option)) then
        return
    end
end

function onEventFinish(player,csid,option)

    if (csid == 3) then
        player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_ALTEPA)
    elseif (csid == 5) then
        player:setVar("AMK_Fangs", 1)
    elseif (EventFinishBCNM(player,csid,option)) then
        return
    end
end
