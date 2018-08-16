---------------------------------------------------------------------------------------------------
-- func: tank
-- desc: summons Warmachine as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)

    local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasTitle(dsp.title.PREVENTER_OF_RAGNAROK) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,15,0,duration,true)
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Alexander kill, or you can't ride mounts here!", 0xE)
    end
end
