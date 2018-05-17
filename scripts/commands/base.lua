---------------------------------------------------------------------------------------------------
-- func: !base
-- desc: warps player to mog garden (gather area)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(13,1,-19,162,280);
end