---------------------------------------------------------------------------------------------------
-- func: redcrab
-- desc: summons Red Crab as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasTitle(dsp.title.TIAMAT_TROUNCER) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,5,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Tiamat kill, or you can't ride mounts here!", 0xE);
    end
end;
