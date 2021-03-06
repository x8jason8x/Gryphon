-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Goblin Grenadier
-- Type: Mission NPC (AMK)
-- !pos -26.283 -60.49 -76.640 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local couldWin = player:getVar("AMK_Winner")

    if player:getCurrentMission(AMK) == A_CHALLENGE_YOU_COULD_BE_A_WINNER and couldWin == 1 then
        player:startEvent(509)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 509) then
        player:PrintToPlayer("This part of the mission is not implemented. Return to the Evergreen to get your Key Item.")
        player:setVar("AMK_Winner", 2)
    end
end
