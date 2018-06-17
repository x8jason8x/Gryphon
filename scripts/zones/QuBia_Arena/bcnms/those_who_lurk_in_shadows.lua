-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Those Who Lurk in Shadows
-- !pos -221 -24 19 206
-----------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil
-----------------------------------
require("scripts/zones/QuBia_Arena/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)

    if (player:hasKeyItem(dsp.ki.MARK_OF_SEED)) then
        player:delKeyItem(dsp.ki.MARK_OF_SEED)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.MARK_OF_SEED)
    end

    if (leavecode == 2) then
        player:addExp(700)
        if (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,20,0)
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,20,1)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 32001) then
        if (player:getCurrentMission(ACP) == THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:completeMission(ACP,THOSE_WHO_LURK_IN_SHADOWS_III);
            player:addMission(ACP,REMEMBER_ME_IN_YOUR_DREAMS);
        end

        if (player:hasKeyItem(dsp.ki.IVORY_KEY) == false and player:getCurrentMission(ACP) >= THOSE_WHO_LURK_IN_SHADOWS_III) then
            player:addKeyItem(dsp.ki.IVORY_KEY);
            player:setVar("LastIvoryKey", os.date("%j"));
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.IVORY_KEY);
        end
    end
end
