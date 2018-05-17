---------------------------------------------------------------------------------------------------
-- func: aby3
-- desc: warps player to Abyssea Tahrongi
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(37,24,-642,253,45);
end