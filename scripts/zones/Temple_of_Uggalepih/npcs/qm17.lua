-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  qm17 (ASA mission NPC)
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE) then
        return;
    elseif player:getCurrentMission(ASA) == SISTERS_IN_ARMS then
        player:addKeyItem(dsp.ki.TABLET_OF_HEXES_MALICE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.TABLET_OF_HEXES_MALICE);
    end
end;

function onEventFinish(player,csid,option)
end;
