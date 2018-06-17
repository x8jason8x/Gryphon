-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Love and Absolute Virtue Spawn)
-- Allows players to spawn the Jailer of Love by trading the Fourth Virtue, Fifth Virtue and Sixth Virtue to a ???.
-- Allows players to spawn Absolute Virtue by killing Jailer of Love.
-- !pos , 431 -0 -603
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs")
require("scripts/zones/AlTaieu/MobIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)

    if (not GetMobByID(JAILER_OF_LOVE):isSpawned() and not GetMobByID(ABSOLUTE_VIRTUE):isSpawned() and
        trade:hasItemQty(1848,1) and trade:hasItemQty(1847,1) and trade:hasItemQty(1849,1) and
        trade:getItemCount() == 3) then
        player:tradeComplete()
        SpawnMob(JAILER_OF_LOVE):updateClaim(player)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
