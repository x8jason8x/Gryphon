-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Lonely Evergreen
-- Type: Mission NPC (AMK)
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

    if player:getCurrentMission(AMK) == A_CHALLENGE_YOU_COULD_BE_A_WINNER and couldWin == 0 then
        player:startEvent(504)
    elseif player:getCurrentMission(AMK) == A_CHALLENGE_YOU_COULD_BE_A_WINNER and couldWin == 2 then
        player:startEvent(501)
        player:PrintToPlayer("Here's your key item, proceed to the Throne Room BC.")
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 504 and option == 1) then
        player:setVar("AMK_Winner", 1)
    elseif (csid == 501) then
        player:addKeyItem(dsp.ki.MEGA_BONANZA_KUPON)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MEGA_BONANZA_KUPON)
        player:setVar("AMK_Winner", 3)
    end
end
