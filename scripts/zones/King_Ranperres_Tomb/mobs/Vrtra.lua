-----------------------------------
-- Area: King Ranperre's Tomb
--  MOB: Vrtra
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

local offsets = {1, 3, 5, 2, 4, 6};

function onMobInitialize(mob)
end;

function onMobEngaged(mob, target)
    mob:resetLocalVars();
end;

function onMobFight(mob, target)

    local spawnTime = mob:getLocalVar("spawnTime");
    local twohourTime = mob:getLocalVar("twohourTime");

    if (twohourTime == 0) then
        twohourTime = math.random(4, 6);
        mob:setLocalVar("twohourTime", twohourTime);
    end

    if (spawnTime == 0) then
        spawnTime = math.random(3, 5);
        mob:setLocalVar("spawnTime", spawnTime);
    end

    if (mob:getBattleTime()/15 > twohourTime) then
        mob:useMobAbility(710);
        mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+math.random(4,6));
    elseif (mob:getBattleTime()/15 > spawnTime) then
        for i, offset in ipairs(offsets) do
            if (GetMobAction(mob:getID()+offset) == dsp.act.SPAWN or GetMobAction(mob:getID()+offset) == dsp.act.NONE) then
                local pet = SpawnMob(mob:getID()+offset, 60);
                local pos = mob:getPos();
                pet:setPos(pos.x, pos.y, pos.z);
                pet:updateEnmity(target)
                break;
            end
        end
        mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
    end
end;

function onMobDisengage(mob, weather)
    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VRTRA_VANQUISHER);
end;

function onMobDespawn(mob)

    -- Set Vrtra's spawnpoint and respawn time (2-3 days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(172800,259200));

end;
