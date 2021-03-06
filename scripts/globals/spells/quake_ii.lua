-----------------------------------------
-- Spell: Quake II
-- Deals earth damage to an enemy and lowers its resistance against wind.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0;
end;

function onSpellCast(caster, target, spell)
    local spellParams = {};
    spellParams.hasMultipleTargetReduction = false;
    spellParams.resistBonus = 1.0;
    spellParams.V = 710;
    spellParams.V0 = 800;
    spellParams.V50 = 900;
    spellParams.V100 = 1000;
    spellParams.V200 = 1200;
    spellParams.M = 2;
    spellParams.M0 = 2;
    spellParams.M50 = 2;
    spellParams.M100 = 2;
    spellParams.M200 = 2;
    spellParams.I = 780;
    if (caster:getMerit(dsp.merit.QUAKE_II) ~= 0) then
        spellParams.AMIIburstBonus = (caster:getMerit(dsp.merit.QUAKE_II) - 1) * 0.03;
        spellParams.AMIIaccBonus = (caster:getMerit(dsp.merit.QUAKE_II) - 1) * 5;
    end

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster,target,spell,30,10,dsp.mod.WINDRES);

    return doElementalNuke(caster, spell, target, spellParams);
end;
