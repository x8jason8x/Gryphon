---------------------------------------------------------------------------------------------------
-- func: hydra
-- desc: warps player to Hydra pop
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-308,-22,-180,8,51);
end