---------------------------------------------------------------------------------------------------
-- func: sandy
-- desc: warps player to s. sandy signet NPC
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-98.6,1,-44,95,230);
end