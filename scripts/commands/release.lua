---------------------------------------------------------------------------------------------------
-- func: release
-- desc: Releases the player from current events.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = ""
};

function onTrigger(player)
    player:release();
end