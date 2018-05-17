---------------------------------------------------------------------------------------------------
-- func: ah
-- desc: opens the Auction House menu anywhere in the world
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 9,
    parameters = ""
};

function onTrigger(player)
    player:sendMenu(3);
end;