---------------------------------------------------------------------------------------------------
-- func: blucrab
-- desc: summons Blue Crab as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
}

function onTrigger(player)

    local duration = 1800 + (player:getMod(dsp.mod.CHOCOBO_RIDING_TIME) * 60)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and player:hasTitle(dsp.title.WORLD_SERPENT_SLAYER) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,4,0,duration,true)
    else
        player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Jormungand kill, or you can't ride mounts here!", 0xE)
    end
end
