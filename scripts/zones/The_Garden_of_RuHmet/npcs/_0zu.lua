-----------------------------------
-- Area: The Garden of Ru'Hmet
--  NPC: particle gate
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/globals/settings")
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if (player:hasKeyItem(dsp.ki.BRAND_OF_DAWN)==false) then
        player:startEvent(110)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 110 and option==1) then
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.BRAND_OF_DAWN)
        player:addKeyItem(dsp.ki.BRAND_OF_DAWN)
    end
end
