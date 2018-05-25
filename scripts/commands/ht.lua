---------------------------------------------------------------------------------------------------
-- func: ht
-- desc: warps gm to heavens tower, zone command puts you in fountain
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(0,0,-20,190,242);
end