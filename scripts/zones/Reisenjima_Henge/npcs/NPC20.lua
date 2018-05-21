-----------------------------
-- Moogle
-----------------------------
function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK);
    player:PrintToPlayer("Moogle: Change job, Kupo?", 0xD);
    player:sendMenu(1);
end;