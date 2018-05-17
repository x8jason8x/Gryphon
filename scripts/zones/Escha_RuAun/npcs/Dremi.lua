-------------------------------
-- Area: Escha RuAun
-- NPC: Dremi
-------------------------------

function onTrigger(player,npc)

    player:PrintToPlayer("Dremi: Congratulations on making it here! Pop items?", 0xD);
	local stock =
    {
        1134,100,     -- Bast Parchment (Kamma PI)
		1408,100,     -- Illuminink (AA EV PI)
	}
    showShop(player, STATIC, stock);
end;