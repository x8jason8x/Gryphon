-----------------------------------
-- Area: Toraimarai Canal
--  NPC: qm4
-- desc: temp solution for ASA "Fountain of Trouble" KIs
-----------------------------------
package.loaded["scripts/zones/Toraimarai_Canal/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Toraimarai_Canal/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.DARK_SAP_CRYSTAL) then
        return;
    elseif (player:getCurrentMission(ASA) == FOUNTAIN_OF_TROUBLE) then
        player:addKeyItem(dsp.ki.FIRE_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.WATER_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.WIND_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.EARTH_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.ICE_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL);
        player:addKeyItem(dsp.ki.DARK_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.FIRE_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.WATER_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.WIND_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.EARTH_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LIGHTNING_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ICE_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LIGHT_SAP_CRYSTAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DARK_SAP_CRYSTAL);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
