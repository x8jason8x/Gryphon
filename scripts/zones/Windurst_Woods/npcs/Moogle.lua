-----------------------------------
-- Area: Windurst Woods
--  NPC: Moogle
--
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs")
require("scripts/globals/moghouse")

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 3) and (trade:hasItemQty(2757,1)) and
        (trade:hasItemQty(2758,1)) and (trade:hasItemQty(2759,1)) then
        player:tradeComplete();
        player:startEvent(30024)
    else
        moogleTrade(player,npc,trade)
    end
end

function onTrigger(player,npc)

    if (ENABLE_AMK == 1 and player:getCurrentMission(AMK) == A_MOOGLE_KUPO_DETAT and player:getMainLvl() >= 10) then
        player:startEvent(30023)
    else
        moogleTrigger(player,npc)
    end
end

function onEventUpdate(player,csid,option)
    moogleEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if (csid == 30023) then
        player:completeMission(AMK,A_MOOGLE_KUPO_DETAT)
		player:addMission(AMK,DRENCHED_IT_BEGAN_WITH_A_RAINDROP)
    elseif (csid == 30024) then
        player:completeMission(AMK,DRENCHED_IT_BEGAN_WITH_A_RAINDROP)
		player:addMission(AMK,HASTEN_IN_A_JAM_IN_JEUNO)
    else
        moogleEventFinish(player,csid,option)
    end
end
