--------------------------------------
-- NPC0 (ReiSan)
-- desc: opens the Auction House menu
--------------------------------------
function onTrigger(player)

    player:showText(npc,NPC_BLANK);
    player:PrintToPlayer("Glowing Hearth: Auction House~", 0xD);
    player:sendMenu(3);
end;
