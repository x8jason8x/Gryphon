---------------------------------------------------------------------------------------------------
-- func: !gryphon
-- desc: summons Hippogryph as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,17,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You must obtain a Chocobo License, or you can't ride mounts here!", 0xE);
    end
end;
