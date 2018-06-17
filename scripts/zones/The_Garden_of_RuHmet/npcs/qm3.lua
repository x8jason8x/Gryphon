-----------------------------------
-- Area: The_Garden_of_RuHmet
--  NPC: ??? (Jailer of Faith Spawn)
-- Allows players to spawn the Jailer of Faith by trading 1 High-Quality Euvhi Organ to a ???.
-- !pos -260 0 -645
-----------------------------------
package.loaded["scripts/zones/The_Garden_of_RuHmet/TextIDs"] = nil
-----------------------------------
require("scripts/zones/The_Garden_of_RuHmet/TextIDs")
require("scripts/zones/The_Garden_of_RuHmet/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)

    if (GetMobAction(Jailer_of_Faith) == 0 and trade:hasItemQty(1899,1) and trade:getItemCount() == 1) then
        local qm3 = GetNPCByID(Jailer_of_Faith_QM)
        player:tradeComplete()
        qm3:setStatus(dsp.status.DISAPPEAR)
        GetMobByID(Jailer_of_Faith):setSpawn(qm3:getXPos(),qm3:getYPos(),qm3:getZPos())
        SpawnMob(Jailer_of_Faith):updateClaim(player)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
