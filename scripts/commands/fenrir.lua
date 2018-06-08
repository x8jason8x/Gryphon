---------------------------------------------------------------------------------------------------
-- func: !fenrir
-- desc: summons Fenrir as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasItem(14625) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,10,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Evoker's Ring, or you can't ride mounts here!", 0xE);
    end
end;
