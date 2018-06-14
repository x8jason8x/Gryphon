-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: Waterfall Basin (AMK NPC)
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/missions")
require("scripts/zones/Sea_Serpent_Grotto/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local readFine = player:getVar("AMK_Lender")

    if player:getCurrentMission(AMK) == LENDER_BEWARE_READ_THE_FINE_PRINT and readFine == 1 then
        player:startEvent(20)
	end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 20) then
        player:setVar("AMK_Lender", 2)
	end
end
