-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: Kammavaca (17961483)
-- !pos -500 -42 162
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs")
require("scripts/mixins/job_special")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    
	mob:setMobMod(dsp.mobMod.MAGIC_COOL, 30)
end

function onMobSpawn(mob)
end

function onMobEngaged(mob,target)
end

function onMobFight(mob, target)

    if (mob:hasStatusEffect(dsp.effect.HUNDRED_FISTS) == false and mob:actionQueueEmpty() == true) then
        
		local twohourTime = mob:getLocalVar("twohourTime")
    
        if (twohourTime == 0) then
            twohourTime = math.random(8, 14)
            mob:setLocalVar("twohourTime", twohourTime)
        end
	
	    if (mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(690)
            mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+20)
		end
    end
end

function onMobWeaponSkill(target, mob, skill)
end

function onMobDisengage(mob)
end

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Balamor has spawned!", 0xE)
    SpawnMob(17961639)
end

function onMobDespawn(mob)
end
