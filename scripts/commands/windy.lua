---------------------------------------------------------------------------------------------------
-- func: windy
-- desc: warps player to windurst woods signet NPC
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(99.2,-5,-50,238,241);
end