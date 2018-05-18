-----------------------------------
-- Area: Halzham Testing Grounds
-- NM: Alexander sub for Nyzul
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");

function onMobInitialize(mob)
    -- setMobMod
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 25);
    mob:setMobMod(dsp.mobMod.DRAW_IN, 2); -- Alliance Draw In

    -- addMod
    mob:addMod(dsp.mod.MDEF,70);
    mob:addMod(dsp.mod.DEF,100);
    mob:addMod(dsp.mod.ATT,200);
end;

function onMobSpawn(mob)
    -- setMod
    mob:setMod(dsp.mod.UFASTCAST, 55);
    mob:setMod(dsp.mod.MACC,1250);
    mob:setMod(dsp.mod.MATT,60);
    mob:setMod(dsp.mod.ACC,1250);
    mob:setMod(dsp.mod.TERRORRES,100);
    mob:setMod(dsp.mod.STUNRES,99);
end;

function onMobEngaged(mob, target)
end;

function onMobFight(mob, target)
    local Boost_Used = mob:getLocalVar("Boost");

    if (mob:getHPP() <= 25) then
        if (Boost_Used == 1) then
            mob:setMod(dsp.mod.UFASTCAST, 75);
            mob:setMod(dsp.mod.REGAIN, 30);
            mob:setLocalVar("Boost", 2);
        end
    elseif (mob:getHPP() <= 50) then
        if (Boost_Used == 0) then
            mob:setMod(dsp.mod.UFASTCAST, 50);
            mob:setMod(dsp.mod.REGAIN, 10);
            mob:setLocalVar("Boost", 1);
        end
    end
end;

function onMobDisengage(mob)

    mob:resetLocalVars();
end;

function onMobDeath(mob, player, isKiller)
    
	if player:hasSpell(305) == true then
        player:addSpell(306);
		player:PrintToPlayer("You can now summon Alexander!", 0xD);
    end
	player:addTitle(dsp.title.PREVENTER_OF_RAGNAROK);
end;

function onMobDespawn(mob)

    mob:setRespawnTime(math.random(432000,604800)); -- 5 to 7 days
end;
