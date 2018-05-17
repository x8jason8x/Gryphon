---------------------------------------------------------------------------------------------------
-- func: adoulin
-- desc: warps player to Western Adoulin
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(-142,4,-18,4,256);
end