-----------------------------------
-- Undulating Confluence (Escha-Ru) Misareaux Coast gate
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:startEvent(1)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

	if (csid == 1 and option == 1) then
	    player:setPos(-54,-22,569,119,25)
	end
end
