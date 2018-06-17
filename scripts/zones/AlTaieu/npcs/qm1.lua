-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Hope Spawn)
-- Allows players to spawn the Jailer of Hope by trading the First Virtue, Deed of Placidity and HQ Phuabo Organ to a ???.
-- !pos -693 -1 -62 33
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs")
require("scripts/zones/AlTaieu/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)

    if (not GetMobByID(JAILER_OF_HOPE):isSpawned() and trade:hasItemQty(1850,1) and 
        trade:hasItemQty(1851,1) and trade:hasItemQty(1852,1) and trade:getItemCount() == 3) then
        player:tradeComplete()
        SpawnMob(JAILER_OF_HOPE):updateClaim(player)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
