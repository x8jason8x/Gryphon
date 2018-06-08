---------------------------------------------------------------------------------------------------
-- func: morbol
-- desc: summons Morbol as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasKeyItem(dsp.ki.DYNAMIS_TAVNAZIA_SLIVER) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,8,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Dynamis-Tavnazia win, or you can't ride mounts here!", 0xE);
    end
end;
