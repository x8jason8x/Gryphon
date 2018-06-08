---------------------------------------------------------------------------------------------------
-- func: magipot
-- desc: summons Magic Pot as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasTitle(dsp.title.KIRIN_CAPTIVATOR) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,13,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Kirin kill, or you can't ride mounts here!", 0xE);
    end
end;
