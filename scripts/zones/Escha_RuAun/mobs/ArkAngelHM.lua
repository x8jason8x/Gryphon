-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel HM
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/mixins/job_special")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)

    mob:addMod(dsp.mod.REGAIN, 50)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)

    local hp = math.random(1,60)
    mob:setLocalVar("Mijin", hp)
end

function onMobFight(mob, target)

    local battletime = mob:getBattleTime()
    local mstime = mob:getLocalVar("Mighty")
    local mghp = mob:getLocalVar("Mijin")

    if (battletime > mstime + 150) then
        mob:useMobAbility(688)
        mob:setLocalVar("Mighty", battletime)
    elseif (mob:getHPP() < mghp) then
        mob:useMobAbility(731)
        mob:setLocalVar("Mijin", 0)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Ark Angel TT has spawned!", 0xE)
    SpawnMob(17961599)
end

function onMobDespawn(mob)
end
