---------------------------------------------------------------------------------------------------
-- func: aby4
-- desc: warps player to Abyssea Vunkerl
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-324,-38,660,61,217);
end