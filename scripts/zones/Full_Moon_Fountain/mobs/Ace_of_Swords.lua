-----------------------------------
-- Area: Full Moon Fountain
-- Mission 9-2 Windurst
-----------------------------------

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
require("scripts/zones/Full_Moon_Fountain/MobIDs");

-----------------------------------
-- onMobInitialize
-----------------------------------

function onMobInitialize(mob)

    mob:addMod(MOD_SLEEPRES,50);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    local inst = player:getBattlefield():getBattlefieldNumber();
    for i,v in ipairs(MOON_READING_MOBLIST[inst]) do
        if (not GetMobByID(v):isDead()) then
            return;
        end
    end
    player:startEvent(32004,0,0,1);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    
	if (csid == 32004) then
	    SpawnMob(17473544);
	    SpawnMob(17473545);
    end
end;
