-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:PrintToPlayer("Moogle: Change job, Kupo?", 0xD);
    player:sendMenu(1);
end;
