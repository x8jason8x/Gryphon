---------------------------------------------------------------------------------------------------
-- func: afk
-- desc: warps player to The Colosseum (afk/bazaar area)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(0,0,0,0,71);
end