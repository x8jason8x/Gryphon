---------------------------------------------------------------------------------------------------
-- func: !tulfaire
-- desc: summons PW chair as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)

    local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasKeyItem(dsp.ki.ATMA_OF_THE_WINGED_ENIGMA) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,14,0,duration,true)
    else
	    player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Naga Raja kill, or you can't ride mounts here!", 0xE)
    end
end
