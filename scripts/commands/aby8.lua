---------------------------------------------------------------------------------------------------
-- func: aby8
-- desc: warps player to Abyssea Grauberg
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-509,32,-796,1,254);
end