---------------------------------------------------------------------------------------------------
-- func: bomb
-- desc: summons Bomb as a mount
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    local current_rank = player:getRank();

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE)
        and current_rank == 10 then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,6,0,duration,false);
    else
        player:PrintToPlayer("<GryphonMsg> You need Chocobo License and Rank 10, or you can't ride mounts here!", 0xE);
    end
end;
