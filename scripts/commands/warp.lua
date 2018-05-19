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
    
	player:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.WARP,0,2);
end