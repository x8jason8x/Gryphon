---------------------------------------------------------------------------------------------------
-- func: xzomit
-- desc: summons Blue Crab as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasKeyItem(dsp.ki.TEAR_OF_ALTANA) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,16,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Promathia kill, or you can't ride mounts here!", 0xE);
    end
end;
