---------------------------------------------------------------------------------------------------
-- func: bastok
-- desc: warps player to Bastok Mines signet NPC
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-6.1,-1,-116,63,234);
end