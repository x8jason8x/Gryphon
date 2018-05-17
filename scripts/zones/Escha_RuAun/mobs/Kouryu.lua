-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- HNM: Kouryu
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs");
require("scripts/zones/Escha_RuAun/MobIDs");
require("scripts/mixins/job_special");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

    mob:SetMobSkillAttack(0); -- reset so he doesn't spawn in flight mode.
    mob:AnimationSub(0); -- subanim 0 is only used when he spawns, until first flight.
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

    if (mob:hasStatusEffect(dsp.effect.INVINCIBLE) == false and mob:actionQueueEmpty() == true) then

        local changeTime = mob:getLocalVar("changeTime");
        local twohourTime = mob:getLocalVar("twohourTime");

        if (mob:getHPP() < math.random(20) and (GetMobByID(17961564):isSpawned()) == false) then
            SpawnMob(17961564):updateEnmity(target);
        end

        if (mob:getHPP() < math.random(15) and (GetMobByID(17961567):isSpawned()) == false) then
            SpawnMob(17961567):updateEnmity(target);
        end

        if (mob:getHPP() < math.random(10) and (GetMobByID(17961570):isSpawned()) == false) then
            SpawnMob(17961570):updateEnmity(target);
        end
	
        if (mob:getHPP() < math.random(5) and (GetMobByID(17961561):isSpawned()) == false) then
            SpawnMob(17961561):updateEnmity(target);
        end
		
        if (twohourTime == 0) then
            twohourTime = math.random(8, 14);
            mob:setLocalVar("twohourTime", twohourTime);
        end

        if (mob:AnimationSub() == 2) and (mob:getBattleTime()/15 > twohourTime) then
            mob:useMobAbility(694);
            mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+20);
		
        elseif (mob:AnimationSub() == 0) and (mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(dsp.effect.ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(731);
            --record the time this phase was started
            mob:setLocalVar("changeTime", mob:getBattleTime());
			
        -- subanimation 1 is flight mode, check if he should land
        elseif (mob:AnimationSub() == 1) and (mob:getBattleTime() - changeTime > 60) then
            mob:useMobAbility(1304);
            mob:useMobAbility(1302);
            mob:setLocalVar("changeTime", mob:getBattleTime());

        -- subanimation 2 is ground mode, check if he should take off
        elseif (mob:AnimationSub() == 2) and (mob:getBattleTime() - changeTime > 120) then
            mob:AnimationSub(1);
            mob:addStatusEffectEx(dsp.effect.ALL_MISS, 0, 1, 0, 0);
            mob:SetMobSkillAttack(731);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

-----------------------------------
-- onMobWeaponSkill Action
-----------------------------------

function onMobWeaponSkill(target, mob, skill)
	
    if (skill:getID() == 1306 and mob:getHPP() <= 30) then
        local roarCounter = mob:getLocalVar("roarCounter");

        roarCounter = roarCounter +1;
        mob:setLocalVar("roarCounter", roarCounter);

        if (roarCounter > 2) then
            mob:setLocalVar("roarCounter", 0);
        else
            mob:useMobAbility(1306);
        end
    end
end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob)

    mob:resetLocalVars();
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    DespawnMob(17961561);
    DespawnMob(17961564);
	DespawnMob(17961567);
	DespawnMob(17961570);
end;	

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
