-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel MR
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

    SpawnMob(17961603):updateEnmity(target)
    SpawnMob(17961606):updateEnmity(target)
end

function onMobFight(mob, target)

    local charm = mob:getLocalVar("Charm")

    if (charm == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(710)
        mob:setLocalVar("Charm",1)
		SpawnMob(17961603):updateEnmity(target)
		SpawnMob(17961606):updateEnmity(target)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Ark Angel EV has spawned!", 0xE)
	DespawnMob(17961603)
	DespawnMob(17961606)
    SpawnMob(17961611)
end

function onMobDespawn(mob)
end
