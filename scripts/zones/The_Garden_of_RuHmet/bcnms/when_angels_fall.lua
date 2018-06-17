-----------------------------------
-- Area: The_Garden_of_RuHmet
-- Name: when_angels_fall
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/missions")
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)
    
    if (leavecode == 2) then
    
        if (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==4) then
            player:startEvent(32001,0,0,0,instance:getTimeInside(),0,0,0)
            player:setVar("PromathiaStatus",5)
        else
            player:startEvent(32001,0,0,0,instance:getTimeInside(),0,0,1)
        end
    elseif (leavecode == 4) then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end
    
function onEventFinish(player,csid,option)

    if (csid== 32001) then
        player:setPos(420,0,445,192)
    end
end
