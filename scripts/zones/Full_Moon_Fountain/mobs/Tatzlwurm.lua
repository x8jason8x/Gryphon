-----------------------------------
-- Area: Full Moon Fountain
-- Mission 9-2 Windurst
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:addMod(MOD_SLEEPRES,50);
end;

function onMobDeath(mob, player, isKiller)
end;