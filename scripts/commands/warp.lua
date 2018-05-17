---------------------------------------------------------------------------------------------------
-- func: warp
-- desc: warps player to homepoint
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    
	player:addStatusEffectEx(dsp.effect.TELEPORT,0,TELEPORT_WARP,0,2);
end