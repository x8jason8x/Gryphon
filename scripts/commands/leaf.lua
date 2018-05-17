---------------------------------------------------------------------------------------------------
-- func: !leaf
-- desc: warps player to Lower Jeuno
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(1,0.5,0,151,281);
end