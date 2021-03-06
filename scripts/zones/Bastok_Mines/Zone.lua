-----------------------------------
--
-- Zone: Bastok_Mines (234)
--
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/globals/events/harvest_festivals")
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/zones/Bastok_Mines/MobIDs")
require("scripts/globals/conquest")
require("scripts/globals/missions")
require("scripts/globals/settings")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    SetExplorerMoogles(BASTOK_MINES_EXPLORER_MOOGLE)

    applyHalloweenNpcCostumes(zone:getID())
end

function onZoneIn(player,prevZone)
    local cs = -1

    -- FIRST LOGIN (START CS)
    if player:getPlaytime(false) == 0 then
        if OPENING_CUTSCENE_ENABLE == 1 then
            cs = 1
        end
        player:setPos(-45, -0, 26, 213)
        player:setHomePoint()
    end
    
    -- MOG HOUSE EXIT
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        position = math.random(1, 5) - 75
        player:setPos(116, 0.99, position, 127)
        if player:getMainJob() ~= player:getVar("PlayerMainJob") then
            cs = 30004
        end
        player:setVar("PlayerMainJob", 0)
    end
    
    -- ENTER THE TALEKEEPER
    if prevZone == 172 and player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 5 then
        cs = 176
    end

    return cs
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 1 then
        player:messageSpecial(ITEM_OBTAINED, 536) -- adventurer coupon
    elseif csid == 30004 and option == 0 then
        player:setHomePoint()
        player:messageSpecial(HOMEPOINT_SET)
    elseif csid == 176 then
        finishMissionTimeline(player, 1, csid, option)
    end
end