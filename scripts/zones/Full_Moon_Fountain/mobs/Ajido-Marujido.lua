-----------------------------------
-- Area: Full Moon Fountain
-- Mob: Ajido-Marujido
-- Ally during Windurst Mission 9-2
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/TextIDs");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:addMod(MOD_REGAIN, 30);
end;

function onMobSpawn(mob)
end;

function onMobRoam(mob)
end;

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():lose();
end;
