---------------------------------------------------------------------------------------------------
-- func: aby9
-- desc: warps player to Abyssea Altepa
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    player:setPos(397,0,307,69,218);
end