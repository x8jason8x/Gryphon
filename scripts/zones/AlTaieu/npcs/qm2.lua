-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Justice Spawn)
-- Allows players to spawn the Jailer of Justice by trading the Second Virtue, Deed of Moderation, and HQ Xzomit Organ to a ???.
-- !pos , -278 0 -463
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/MobIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (not GetMobByID(JAILER_OF_JUSTICE):isSpawned() and trade:hasItemQty(1853,1) and
        trade:hasItemQty(1854,1) and trade:hasItemQty(1855,1) and trade:getItemCount() == 3) then
        player:tradeComplete()
        SpawnMob(JAILER_OF_JUSTICE):updateClaim(player)
    end
end

function onTrigger(player,npc)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
