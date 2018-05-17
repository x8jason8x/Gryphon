-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- HNM: Naga Raja
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs");
require("scripts/zones/Escha_RuAun/MobIDs");
require("scripts/mixins/job_special");
require("scripts/globals/status");
-----------------------------------

local offsets = {1, 3, 5, 2, 4, 6};

function onMobInitialize(mob)

end;

function onMobSpawn(mob)

    mob:SetMobSkillAttack(0); -- reset so she doesn't spawn in flight mode.
    mob:AnimationSub(0); -- subanim 0 is only used when she spawns, until first flight.
end;

function onMobEngaged(mob,target)
    
end;

function onMobFight(mob, target)

    if (mob:hasStatusEffect(dsp.effect.INVINCIBLE) == false and mob:actionQueueEmpty() == true) then

        local changeTime = mob:getLocalVar("changeTime");
        local twohourTime = mob:getLocalVar("twohourTime");
        local spawnTime = mob:getLocalVar("spawnTime");

        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setLocalVar("twohourTime", twohourTime);
        end
		
		if (spawnTime == 0) then
            spawnTime = math.random(3, 5);
            mob:setLocalVar("spawnTime", spawnTime);
        end

        if (mob:AnimationSub() == 2) and (mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(694);
            mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+20);
			
        elseif (mob:getBattleTime()/15 > spawnTime) then
            for i, offset in ipairs(offsets) do
                if (GetMobAction(mob:getID()+offset) == dsp.act.SPAWN or GetMobAction(mob:getID()+offset) == dsp.act.NONE) then
                    local pet = SpawnMob(mob:getID()+offset, 60):updateEnmity(target);
					local pet = SpawnMob(mob:getID()+offset+1, 60):updateEnmity(target);
                    break;
				end
            end
            mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
		
        elseif (mob:AnimationSub() == 0) and (mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(dsp.effect.ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(732);
            --record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime());
			
        -- subanimation 1 is flight mode, check if she should land
        elseif (mob:AnimationSub() == 1) and (mob:getBattleTime() - changeTime > 30) then
            mob:useMobAbility(1293);
            mob:useMobAbility(1292);
            mob:setLocalVar("changeTime", mob:getBattleTime());
			
        -- subanimation 2 is ground mode, check if she should take off
        elseif (mob:AnimationSub() == 2) and (mob:getBattleTime() - changeTime > 60) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(dsp.effect.ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(732);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

function onMobWeaponSkill(target, mob, skill)

    if (skill:getID() == 1296 and mob:getHPP() <= 30) then
        local roarCounter = mob:getLocalVar("roarCounter");

        roarCounter = roarCounter +1;
        mob:setLocalVar("roarCounter", roarCounter);

        if (roarCounter > 2) then
            mob:setLocalVar("roarCounter", 0);
        else
            mob:useMobAbility(1296);
        end
    end
end;

function onMobDisengage(mob)

    mob:resetLocalVars();
end;

function onMobDeath(mob, player, isKiller)

    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
        DespawnMob(mob:getID()+offset+1);
    end
    
	local rajaAtma = player:hasKeyItem(1326);
	
	if rajaAtma == true then
	    return
	elseif rajaAtma == false then
	    player:addKeyItem(1326);
		player:messageSpecial(KEYITEM_OBTAINED, 1326);
    end
end;	

function onMobDespawn(mob)

end;
