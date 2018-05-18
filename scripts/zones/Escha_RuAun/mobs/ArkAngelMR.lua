-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- NM: ArkAngel MR
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

    SpawnMob(17961603):updateEnmity(target);
    SpawnMob(17961606):updateEnmity(target);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

    local charm = mob:getLocalVar("Charm");

    if (charm == 0 and mob:getHPP() <  50) then
        mob:useMobAbility(710);
        mob:setLocalVar("Charm",1);
		SpawnMob(17961605):updateEnmity(target);
		SpawnMob(17961608):updateEnmity(target);
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

    player:PrintToPlayer("<GryphonMsg> Ark Angel EV has spawned!", 0xE);
	DespawnMob(17961605);
	DespawnMob(17961608);
    SpawnMob(17961611);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
