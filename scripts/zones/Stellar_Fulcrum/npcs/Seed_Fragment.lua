------------------------------------
-- Area: Stellar Fulcrum
-- Npc: Seed Fragment
------------------------------------

function onTrigger(player,npc)
    
	if (player:getCurrentMission(ACP) == BANISHING_THE_ECHO) then
        player:addKeyItem(1104);
        player:messageSpecial(KEYITEM_OBTAINED, 1104);
		player:completeMission(ACP,BANISHING_THE_ECHO);
		player:addMission(ACP,ODE_OF_LIFE_BESTOWING);
    end		
end;