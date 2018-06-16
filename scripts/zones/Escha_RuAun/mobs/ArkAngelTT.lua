-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel TT
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/mixins/job_special")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)

    mob:addMod(dsp.mod.UFASTCAST, 30)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)

    local hp = math.random(1,60)
    mob:setLocalVar("BldWep", hp)
end

function onMobFight(mob, target)

    local battletime = mob:getBattleTime()
    local mstime = mob:getLocalVar("Mfont")
    local mghp = mob:getLocalVar("BldWep")

    if (battletime > mstime + 150) then
        mob:useMobAbility(691)
        mob:setLocalVar("Mfont", battletime)
    elseif (mob:getHPP() < mghp) then
        mob:useMobAbility(695)
        mob:setLocalVar("BldWep", 0)
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Ark Angel MR has spawned!", 0xE)
    SpawnMob(17961602)
end

function onMobDespawn(mob)
end
