-----------------------------------
-- Undulating Confluence (Escha-Zi) Qufim gate
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_ZiTah/TextIDs")
require("scripts/globals/status")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    player:startEvent(4)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

	if (csid == 4 and option == 1) then
	    player:setPos(-206,-20,76,172,126)
	end
end
