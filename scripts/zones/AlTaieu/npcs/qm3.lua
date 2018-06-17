-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Prudence Spawn)
-- Allows players to spawn the Jailer of Prudence by trading the Third Virtue, Deed of Sensibility, and High-Quality Hpemde Organ to a ???.
-- !pos , 706 -1 22
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs")
require("scripts/zones/AlTaieu/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)

    if (not GetMobByID(JAILER_OF_PRUDENCE_1):isSpawned() and not GetMobByID(JAILER_OF_PRUDENCE_2):isSpawned() and
        trade:hasItemQty(1856,1) and trade:hasItemQty(1870,1) and trade:hasItemQty(1871,1) and
        trade:getItemCount() == 3) then
        player:tradeComplete()
        SpawnMob(JAILER_OF_PRUDENCE_1):updateClaim(player)
        SpawnMob(JAILER_OF_PRUDENCE_2)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
