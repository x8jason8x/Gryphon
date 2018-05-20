----------------------------
-- NPC: Andrause
-- desc: Temp fix for ASA advancement
----------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Norg/TextIDs");
-----------------------------------

function onTrigger(player,npc)

    if (player:getCurrentMission(ASA) == ENEMY_OF_THE_EMPIRE_I and 
    player:hasKeyItem(dsp.ki.BLACK_BOOK) == false) then
        player:addKeyItem(dsp.ki.BLACK_BOOK);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.BLACK_BOOK);
        player:PrintToPlayer("Soultrapper is not implemented in DSP yet, here's your KI!");
        player:completeMission(ASA,ENEMY_OF_THE_EMPIRE_I);
        player:addMission(ASA,ENEMY_OF_THE_EMPIRE_II);
    end
end;