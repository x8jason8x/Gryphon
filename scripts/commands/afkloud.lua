---------------------------------------------------------------------------------------------------
-- func: afk2
-- desc: warps player to Yorcia Weald (U) (afk/bazaar area)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(10,-1,-59,135,264);
end