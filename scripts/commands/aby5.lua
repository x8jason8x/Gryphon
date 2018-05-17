---------------------------------------------------------------------------------------------------
-- func: aby5
-- desc: warps player to Abyssea Misareaux
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(619,-15,282,114,216);
end