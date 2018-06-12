------------------------------------
-- Area: Stellar Fulcrum
-- Npc: Seed Fragment
------------------------------------

function onTrigger(player,npc)
    
	if (player:getCurrentMission(ACP) == BANISHING_THE_ECHO) then
        player:addKeyItem(dsp.ki.OMNIS_STONE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.OMNIS_STONE);
		player:completeMission(ACP,BANISHING_THE_ECHO);
		player:addMission(ACP,ODE_OF_LIFE_BESTOWING);
    end		
end;
