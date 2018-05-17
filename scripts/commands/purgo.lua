---------------------------------------------------------------------------------------------------
-- func: purgo
-- desc: warps player to Bibiki Bay - Purgonorgo Island
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-398,-3,-415,66,4);
end