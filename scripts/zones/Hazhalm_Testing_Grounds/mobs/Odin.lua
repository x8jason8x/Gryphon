-----------------------------------
-- Area: Hazhalm Testing Grounds
-- NM: Odin Prime
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
    
	local OdinWS = mob:getLocalVar("OdinWS"); -- ws var

    if (mob:getHPP() <= 9 and OdinWS == 11) then
        mob:useMobAbility(2126); -- Zantetsuken
        mob:setLocalVar("OdinWS", 12);
    elseif (mob:getHPP() <= 19 and OdinWS == 10) then
        mob:useMobAbility(2560); -- Sanngetall
        mob:setLocalVar("OdinWS", 11);
    elseif (mob:getHPP() <= 24 and OdinWS == 9) then
         mob:useMobAbility(2561); -- Geirrothr
        mob:setLocalVar("OdinWS", 10);
    elseif (mob:getHPP() <= 29 and OdinWS == 8) then
        mob:useMobAbility(2556); -- Ofnir
        mob:setLocalVar("OdinWS", 9);
    elseif (mob:getHPP() <= 39 and OdinWS == 7) then
        mob:useMobAbility(2557); -- Valfodr
        mob:setLocalVar("OdinWS", 8);
    elseif (mob:getHPP() <= 49 and OdinWS == 6) then
        mob:useMobAbility(2560); -- Sanngetall
        mob:setLocalVar("OdinWS", 7);
    elseif (mob:getHPP() <= 49 and OdinWS == 5) then
        mob:useMobAbility(2561); -- Geirrothr
        mob:setLocalVar("OdinWS", 6);
    elseif (mob:getHPP() <= 59 and OdinWS == 4) then
        mob:useMobAbility(2558); -- Yggr
        mob:setLocalVar("OdinWS", 5);
    elseif (mob:getHPP() <= 69 and OdinWS == 3) then
        mob:useMobAbility(2560); -- Sanngetall
        mob:setLocalVar("OdinWS", 4);
    elseif (mob:getHPP() <= 74 and OdinWS == 2) then
        mob:useMobAbility(2561); -- Geirrothr
        mob:setLocalVar("OdinWS", 3);
    elseif (mob:getHPP() <= 79 and OdinWS == 1) then
        mob:useMobAbility(2559); -- Gagnrath
        mob:setLocalVar("OdinWS", 2);
    elseif (mob:getHPP() <= 89 and OdinWS == 0) then
        mob:useMobAbility(2560); -- Sanngetall
        mob:setLocalVar("OdinWS", 1);
    end
end;

function onMobDisengage(mob)

    mob:resetLocalVars();
end;

function onMobDeath(mob, player, isKiller)
    
	if (player:getMainJob() == JOBS.SMN and player:hasSpell(305) == false) then
        player:addSpell(305);
		PrintToPlayer:("You can now summon Odin!", 0xD);
    end
	player:addTitle(dsp.title.ELITE_EINHERJAR);
end;
