-----------------------------------
-- Area: Stellar Fulcrum (179)
-- NM: Seed Crystal
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Stellar_Fulcrum/TextIDs");
require("scripts/mixins/job_special");
require("scripts/globals/status");
-----------------------------------

local offsets = {1, 2};

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobFight(mob, target)

    if (mob:actionQueueEmpty() == true) then

        local spawnTime = mob:getLocalVar("spawnTime");

        if (spawnTime == 0) then
            spawnTime = math.random(3, 5);
            mob:setLocalVar("spawnTime", spawnTime);
        end

        if (mob:getBattleTime()/15 > spawnTime) then
            for i, offset in ipairs(offsets) do
                if (GetMobAction(mob:getID()+offset) == dsp.act.SPAWN or GetMobAction(mob:getID()+offset) == dsp.act.NONE) then
                    local pet = SpawnMob(mob:getID()+offset, 60):updateEnmity(target);
                    local pet = SpawnMob(mob:getID()+offset+1, 60):updateEnmity(target);
                    break;
                end
            end
            mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
        end
    end
end;

function onMobWeaponSkill(target, mob, skill)
end;

function onMobDisengage(mob)
end;

function onMobDeath(mob, player, isKiller)

    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
        DespawnMob(mob:getID()+offset+1);
    end
end;

function onMobDespawn(mob)
end;
