-----------------------------------
-- Area: North Gustaberg (S)
-- Mob: Huge Spider (Ankabut PH)
-----------------------------------
require("scripts/zones/North_Gustaberg_[S]/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ANKABUT_PH,20,math.random(3600,28800)); -- 1 to 8 hours
end;
