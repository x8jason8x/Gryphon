-----------------------------------
-- Area: Escha Ru'Aun (289)
-- NPC:  ??? (Kammavaca's Spawn)
-- Allows players to spawn the NM Kammavaca
-- !pos -470 -42 152
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs");
require("scripts/zones/Escha_RuAun/MobIDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    
    if (not GetMobByID(17961483):isSpawned() and trade:hasItemQty(1134,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(17961483):updateClaim(player);
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
