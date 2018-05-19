---------------------------------------------------------------------------------------------------
-- func: !stage
-- desc: warps player to Reisenjima Henge (server gather spot)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-12,5,17,54,292);
end