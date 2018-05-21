-----------------------------------
-- NPC: Affi
-- Area: Escha Zitah
-----------------------------------

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK);
    player:PrintToPlayer("Affi: Pop item?", 0xD);
    local stock =
    {
        4363,100,     -- Faerie Apple
    }
    showShop(player, STATIC, stock);
end;