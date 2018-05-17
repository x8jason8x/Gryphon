-----------------------------------
-- Area: Escha Zi'Tah (288)
-- NPC:  ??? (Bucca's Spawn)
-- Allows players to spawn the HNM Bucca
-- !pos 242 0 -293
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_ZiTah/TextIDs");
require("scripts/zones/Escha_ZiTah/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    
    if (not GetMobByID(17957337):isSpawned() and trade:hasItemQty(4363,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(17957337):updateClaim(player);
        npc:hideNPC(172800);
    end
end;

function onTrigger(player,npc)

    player:PrintToPlayer("There is nothing out of the ordinary here.", 0xD);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
