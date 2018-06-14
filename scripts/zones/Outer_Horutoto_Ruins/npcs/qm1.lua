-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: qm1 (AMK temp)
-----------------------------------
package.loaded["scripts/zones/Outer_Horutoto_Ruins/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Outer_Horutoto_Ruins/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.RIPE_STARFRUIT) then
        return
    elseif player:getCurrentMission(AMK) == AN_ERRAND_THE_PROFESSORS_PRICE then
        player:startEvent(100)
		player:PrintToPlayer("Confrontation BCs are not implemented in DSP. Click 'Yes' to continue AMK missions.")
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 100 and option == 1) then
        player:addKeyItem(dsp.ki.RIPE_STARFRUIT)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.RIPE_STARFRUIT)
        player:addKeyItem(dsp.ki.PEACH_CORAL_KEY)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PEACH_CORAL_KEY)
        player:setVar("AMK_Cardians", 1)
    end
end
