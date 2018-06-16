-----------------------------------
-- Area: Escha-Zi'tah (zone 288)
-- NM: Bucca (17957337)
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_ZiTah/TextIDs")
require("scripts/mixins/job_special")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
end

function onMobFight(mob, target)
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Wepwawet has spawned at (J-9)!", 0xE)
    SpawnMob(17957298)
end

function onMobDespawn(mob)
end
