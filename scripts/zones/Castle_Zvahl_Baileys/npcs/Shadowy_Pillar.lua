-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Shadowy Pillar
-- AMK Temp NPC (cs needs moved to zone.lua, everything needs found/scripted)
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:getCurrentMission(AMK) == JOY_SUMMONED_TO_A_FABULOUS_FETE then
        player:startEvent(88)
        player:PrintToPlayer("This mission is mostly not implemented. Proceed to Throne Room BC.")
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 88) then
        player:completeMission(AMK,JOY_SUMMONED_TO_A_FABULOUS_FETE)
		player:addMission(AMK,A_CHALLENGE_YOU_COULD_BE_A_WINNER)
        player:addKeyItem(dsp.ki.MEGA_BONANZA_KUPON)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MEGA_BONANZA_KUPON)
    end
end
