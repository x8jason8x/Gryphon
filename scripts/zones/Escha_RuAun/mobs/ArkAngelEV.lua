-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel EV
-----------------------------------
package.loaded["scripts/zones/Escha_RuAun/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_RuAun/TextIDs");
require("scripts/zones/Escha_RuAun/MobIDs");
require("scripts/mixins/job_special");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)

    local hp = math.random(40,60)
    mob:setLocalVar("Benediction", hp);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

    local battletime = mob:getBattleTime();
    local invtime = mob:getLocalVar("Invincible");
    local bhp = mob:getLocalVar("Benediction");

    if (battletime > invtime + 150) then
        mob:useMobAbility(694);
        mob:setLocalVar("Invincible", battletime);
    elseif (mob:getHPP() < bhp) then
        mob:useMobAbility(689);
        mob:setLocalVar("Benediction", 0);
    end
end;

-----------------------------------
-- onMobWeaponSkill Action
-----------------------------------

function onMobWeaponSkill(target, mob, skill)

end;

-----------------------------------
-- onMobDisengage Action
-----------------------------------

function onMobDisengage(mob)
    
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    player:PrintToPlayer("<GryphonMsg> Ark Angel GK has spawned!", 0xE);
    SpawnMob(17961614);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
