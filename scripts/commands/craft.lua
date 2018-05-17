---------------------------------------------------------------------------------------------------
-- func: !craft
-- desc: warps player to craft center (Reisenjima Sanctorium)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(0,4,-28,193,293);
end