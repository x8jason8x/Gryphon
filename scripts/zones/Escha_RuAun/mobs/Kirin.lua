-----------------------------------
-- Area: Escha-Ru'Aun (zone 289)
-- HNM: Kirin
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

    mob:resetLocalVars();
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
	
    if (mob:getHPP() < math.random(95) and (GetMobByID(17961564):isSpawned()) == false) then
        SpawnMob(17961564):updateEnmity(target);
    end
    
	if (mob:getHPP() < math.random(85) and (GetMobByID(17961567):isSpawned()) == false) then
        SpawnMob(17961567):updateEnmity(target);
    end
    
	if (mob:getHPP() < math.random(75) and (GetMobByID(17961570):isSpawned()) == false) then
        SpawnMob(17961570):updateEnmity(target);
    end
	
	if (mob:getHPP() < math.random(65) and (GetMobByID(17961561):isSpawned()) == false) then
        SpawnMob(17961561):updateEnmity(target);
	end
	
    if (mob:getHPP() < math.random(51)) then
        SpawnMob(17961579):updateClaim(target);
        DespawnMob(17961573);
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

end;	

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
