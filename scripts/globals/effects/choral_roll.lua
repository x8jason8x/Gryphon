-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(dsp.mod.SPELLINTERRUPT, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(dsp.mod.SPELLINTERRUPT, effect:getPower());
end;
