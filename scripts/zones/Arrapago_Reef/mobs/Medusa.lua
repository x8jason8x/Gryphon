-----------------------------------
-- Area: Arrapago Reef
--  MOB: Medusa
-- !pos -458 -20 458
-- TODO: resists, attack/def boosts
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/titles");
-----------------------------------

function onMobInitialize(mob)
    
    mob:addMod(MOD_REGAIN,27);
    mob:addMod(MOD_MATT,58);
    mob:addMod(MOD_MACC,375);
    mob:addMod(MOD_ACC,185);
    mob:addMod(MOD_ATT,36);
    mob:addMod(MOD_DEF,36);
end;

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_LAMIA);
    mob:setLocalVar("useSpecAtHpMin", 5);
    mob:setLocalVar("useSpecAtHpMax", 99);
    mob:setLocalVar("useMainSpecAtHPP", math.random(5,99));
end;

function onMobEngaged(mob, target)
    local mobID = mob:getID();
    target:showText(mob, MEDUSA_ENGAGE);
    SpawnMob(mobID+1, 180):updateEnmity(target);
    SpawnMob(mobID+2, 180):updateEnmity(target);
    SpawnMob(mobID+3, 180):updateEnmity(target);
    SpawnMob(mobID+4, 180):updateEnmity(target);
end;

function onMobDeath(mob, player, isKiller)
    player:showText(mob, MEDUSA_DEATH);
    player:addTitle(dsp.title.GORGONSTONE_SUNDERER);
end;

function onMobDespawn(mob)

    mob:setRespawnTime(math.random(172800,259200)); -- 2 to 3 days
end;
