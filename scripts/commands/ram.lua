---------------------------------------------------------------------------------------------------
-- func: ram
-- desc: summons Ram as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasKeyItem(dsp.ki.WHISPER_OF_THE_WYRMKING) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,7,0,duration,false);
    else
        player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Bahamut kill, or you can't ride mounts here!", 0xE);
    end
end;
