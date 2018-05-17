-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Windurst 9-2 NPC)
-- !pos -238 -2 -19 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
	local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if player:hasKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH) then
	    return;
    elseif (CurrentMission == MOON_READING and MissionStatus == 1) then
        player:startEvent(68);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)

	if (csid == 68 and player:getCurrentMission(WINDURST) == MOON_READING) then
	    player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_UGGALEPIH);
	elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;