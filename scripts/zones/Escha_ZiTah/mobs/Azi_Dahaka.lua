-----------------------------------
-- Area: Escha-Zi'Tah (288)
-- HNM: Azi Dahaka (17957397)
-----------------------------------
package.loaded["scripts/zones/Escha_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Escha_ZiTah/TextIDs");
require("scripts/zones/Escha_ZiTah/MobIDs");
require("scripts/mixins/job_special");
require("scripts/globals/status");
-----------------------------------
local offsets = {1, 3, 5, 2, 4, 6};

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

    if mob:actionQueueEmpty() == true then

        local spawnTime = mob:getLocalVar("spawnTime");

		if (spawnTime == 0) then
            spawnTime = math.random(3, 5);
            mob:setLocalVar("spawnTime", spawnTime);
        end
			
        if (mob:getBattleTime()/15 > spawnTime) then
            for i, offset in ipairs(offsets) do
                if (GetMobAction(mob:getID()+offset) == dsp.act.SPAWN or GetMobAction(mob:getID()+offset) == dsp.act.NONE) then
                    local pet = SpawnMob(mob:getID()+offset, 120):updateEnmity(target);
					local pet = SpawnMob(mob:getID()+offset+1, 120):updateEnmity(target);
                    break;
				end
            end
            mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
        end
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

    mob:resetLocalVars();
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)

    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
        DespawnMob(mob:getID()+offset+1);
    end
    
	local dahaAtma = player:hasKeyItem(1325);
	
	if dahaAtma == true then
	    return
	elseif dahaAtma == false then
	    player:addKeyItem(1325);
		player:messageSpecial(KEYITEM_OBTAINED, 1325);
    end
end;	

-----------------------------------
-- onMobDespawn Action
-----------------------------------

function onMobDespawn(mob)

end;
