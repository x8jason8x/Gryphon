-----------------------------------
-- Area: Escha-Zi'tah (zone 288)
-- NM: Bucca (17957337)
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_ZiTah/TextIDs");
require("scripts/zones/Escha_ZiTah/MobIDs");
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

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

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

    player:PrintToPlayer("<GryphonMsg> Wepwawet has spawned at (J-9)!", 0xE);
    SpawnMob(17957298);
end;

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
