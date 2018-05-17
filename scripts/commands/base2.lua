---------------------------------------------------------------------------------------------------
-- func: !base2
-- desc: warps player to Reisenjima Henge (server start base)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-12,5,17,54,292);
end