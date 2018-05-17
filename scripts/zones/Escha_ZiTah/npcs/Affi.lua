-----------------------------------
-- NPC: Affi
-- Area: Escha Zitah
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    player:PrintToPlayer("Affi: Pop item?", 0xD);
    local stock =
    {
        4363,100,     -- Faerie Apple
	}
    showShop(player, STATIC, stock);
end;