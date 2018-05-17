---------------------------------------------------------------------------------------------------
-- func: aby2
-- desc: warps player to Abyssea Konschtat
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(88,-72,-789,171,15);
end