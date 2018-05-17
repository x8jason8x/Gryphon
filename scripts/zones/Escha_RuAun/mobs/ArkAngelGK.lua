-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel GK
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

    SpawnMob(17961617):updateEnmity(target);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

    local hunfist = mob:getLocalVar("HunFist");

    if (hunfist == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(690);
        mob:setLocalVar("HunFist",1);
		SpawnMob(17961617):updateEnmity(target);
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

    player:PrintToPlayer("<GryphonMsg> Kirin has spawned at (I-10)!", 0xE);
	DespawnMob(17961617);
    SpawnMob(17961573);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
