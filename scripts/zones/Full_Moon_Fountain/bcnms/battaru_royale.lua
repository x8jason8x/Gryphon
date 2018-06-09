-----------------------------------
-- Area: Full Moon Fountain
-- Name: Battaru Royale
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Full_Moon_Fountain/TextIDs");
-----------------------------------

function onBcnmRegister(player,instance)
end;

function onBcnmEnter(player,instance)
end;

function onBcnmLeave(player,instance,leavecode)
	
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:getCurrentMission(ASA) == BATTARU_ROYALE and player:hasKeyItem(dsp.ki.DARK_SAP_CRYSTAL)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        end
    elseif (leavecode == 3) then
        player:delKeyItem(dsp.ki.FIRE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WATER_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WIND_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.EARTH_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.ICE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.DARK_SAP_CRYSTAL);
    elseif (leavecode == 4) then
        player:startEvent(32002);
        player:delKeyItem(dsp.ki.FIRE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WATER_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WIND_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.EARTH_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.ICE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.DARK_SAP_CRYSTAL);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 32001) then
        player:delKeyItem(dsp.ki.FIRE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WATER_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.WIND_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.EARTH_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHTNING_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.ICE_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.LIGHT_SAP_CRYSTAL);
        player:delKeyItem(dsp.ki.DARK_SAP_CRYSTAL);
        player:completeMission(ASA,BATTARU_ROYALE);
        player:addMission(ASA,ROMANCING_THE_CLONE);
        player:addKeyItem(dsp.ki.CHOCOBO_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CHOCOBO_KEY);
    end
end;
