-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel GK
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/mixins/job_special")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)

    SpawnMob(17961617):updateEnmity(target)
end

function onMobFight(mob, target)

    local hunfist = mob:getLocalVar("HunFist")

    if (hunfist == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(690)
        mob:setLocalVar("HunFist",1)
		SpawnMob(17961617):updateEnmity(target)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Kirin has spawned at (I-10)!", 0xE)
	DespawnMob(17961617)
    SpawnMob(17961573)
end

function onMobDespawn(mob)
end
