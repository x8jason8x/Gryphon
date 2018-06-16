-----------------------------------
-- Area: Quicksand Caves
--  NPC: Goblin Geologist
-- Type: AMK npc (can't find proper csid, needs qm's)
-- !pos -737.000 -11.125 -550.000 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs")
require("scripts/globals/missions")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.NAVARATNA_TALISMAN) then
        return
    elseif player:getCurrentMission(AMK) == ROAR_A_CAT_BURGLAR_BARES_HER_FANGS then
        player:addKeyItem(dsp.ki.NAVARATNA_TALISMAN)
    elseif player:getCurrentMission(AMK) == RESCUE_A_MOOGLES_LABOR_OF_LOVE then
        player:startEvent(100)
        player:PrintToPlayer("Ignore the Gob, here's your KI! Proceed to Chamber of Oracles.")
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 100) then
        player:addKeyItem(dsp.ki.NAVARATNA_TALISMAN)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.NAVARATNA_TALISMAN)
        player:completeMission(AMK,RESCUE_A_MOOGLES_LABOR_OF_LOVE)
		player:addMission(AMK,ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
    end
end
