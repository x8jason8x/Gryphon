-----------------------------------
-- Area: Ro'Maeve
--  NPC: Ensorcelled Door
-- desc: continues ASA missions
-- todo: everything (cs is broken, mobs are not implemented)
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.BOMB_KEY) then
        return;
    elseif (player:getCurrentMission(ASA) == SHANTOTTO_IN_CHAINS) then
        player:PrintToPlayer("Mission complete, as mobs are not yet implemented in DSP! Proceed to the next mission!");
        player:completeMission(ASA,SHANTOTTO_IN_CHAINS);
        player:addMission(ASA,FOUNTAIN_OF_TROUBLE);
        player:addKeyItem(dsp.ki.BOMB_KEY);
	    player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.BOMB_KEY);
    end
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,menuchoice)
end;

function onEventFinish(player,csid,option)
end;

-- csid 71, key items 1204-1209