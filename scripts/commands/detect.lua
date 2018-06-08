---------------------------------------------------------------------------------------------------
-- func: detector
-- desc: summons Spheroid as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasKeyItem(dsp.ki.ATMA_OF_THE_RAPID_REPTILIAN) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,19,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Azi Dahaka kill, or you can't ride mounts here!", 0xE);
    end
end;
