-----------------------------------
-- Area: Gustav Tunnel (212)
-- NPC: Outcropping 
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local asaStatus = player:getVar("empireiiCS");

    if (player:getCurrentMission(ASA) == ENEMY_OF_THE_EMPIRE_II and asaStatus == 0) then
        player:startEvent(13);
    elseif (player:getCurrentMission(ASA) == ENEMY_OF_THE_EMPIRE_II and asaStatus == 1) then
        player:startEvent(15);
    --elseif (player:getCurrentMission(ASA) == ENEMY_OF_THE_EMPIRE_II and asaStatus == 2) then
        --player:startEvent(14); cs is broken on windower/ashita
	elseif (player:getCurrentMission(ASA) == ENEMY_OF_THE_EMPIRE_II and asaStatus == 2) then -- CS workaround
        player:setVar("empireiiCS", 0);
        player:completeMission(ASA,ENEMY_OF_THE_EMPIRE_II);
        player:addMission(ASA,SUGAR_COATED_SUBTERFUGE);
        player:PrintToPlayer("Mission complete! Go talk to Aldo in Jeuno!");
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 13) then
        player:setVar("empireiiCS", 1);
    elseif (csid == 15 and option == 1) then
        player:PrintToPlayer("Confrontation Battles are not working yet in DSP. Click to continue ASA missions.");
        player:setVar("empireiiCS", 2);
		player:delKeyItem(dsp.ki.BLACK_BOOK);
        player:addKeyItem(dsp.ki.CACTUAR_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CACTUAR_KEY);
    --[[elseif (csid == 14) then
        player:setVar("empireiiCS", 0);
        player:completeMission(ASA,ENEMY_OF_THE_EMPIRE_II);
        player:addMission(ASA,SUGAR_COATED_SUBTERFUGE);]]
    end
end;
