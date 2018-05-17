---------------------------------------------------------------------------------------------------
-- func: !jeuno
-- desc: warps player to Lower Jeuno
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-18.5,0,-15,19,245);
end