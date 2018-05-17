-----------------------------------
-- Area: Heaven's Tower
--  NPC: Vestal Chamber (chamber of the Star Sibyl)
-- !pos 0.1 -49 37 242
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Heavens_Tower/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (CurrentMission == A_NEW_JOURNEY and MissionStatus == 0) then
        player:startEvent(153);
    elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST)) then
        player:startEvent(166);
    elseif (player:getRank() == 5 and CurrentMission == 255 and player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false) then
        player:startEvent(190);
    elseif (player:hasKeyItem(dsp.ki.BURNT_SEAL)) then
        player:startEvent(192);
    elseif (CurrentMission == THE_SHADOW_AWAITS and MissionStatus == 0) then
        player:startEvent(214);
    elseif (CurrentMission == THE_SHADOW_AWAITS and player:hasKeyItem(dsp.ki.SHADOW_FRAGMENT)) then
        player:startEvent(216);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 0) then
        player:startEvent(310);
    elseif (CurrentMission == SAINTLY_INVITATION and MissionStatus == 3) then
        player:startEvent(312);
    elseif (CurrentMission == DOLL_OF_THE_DEAD and MissionStatus == 2) then
        player:startEvent(362);
    elseif (player:getVar("Flagwindurst") == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,181);
        else
            player:setVar("Flagwindurst",0);
            player:addItem(181);
            player:messageSpecial(ITEM_OBTAINED,181);
		end	
    elseif (CurrentMission == MOON_READING and MissionStatus == 0) then
        player:startEvent(384);
	elseif (CurrentMission == MOON_READING and player:hasKeyItem(ANCIENT_VERSE_OF_ALTEPA and ANCIENT_VERSE_OF_ROMAEVE and ANCIENT_VERSE_OF_UGGALEPIH)) then
        player:startEvent(385);
	elseif (CurrentMission == MOON_READING and MissionStatus == 3) then
        player:startEvent(386);
	elseif (CurrentMission == MOON_READING and MissionStatus == 4) then
        player:startEvent(407);	
    else
        player:startEvent(154);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 153) then
        player:setVar("MissionStatus",1);
        player:delKeyItem(dsp.ki.STAR_CRESTED_SUMMONS);
        player:addKeyItem(dsp.ki.LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_AMBASSADOR);
    elseif (csid == 166 or csid == 190) then
        if (option == 0) then
            player:addMission(WINDURST,THE_FINAL_SEAL);
            player:addKeyItem(dsp.ki.NEW_FEIYIN_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.NEW_FEIYIN_SEAL);
            player:setVar("MissionStatus",10);
        end
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_WINDURST);
    elseif (csid == 214) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(dsp.ki.STAR_CRESTED_SUMMONS);
        player:addTitle(dsp.title.STARORDAINED_WARRIOR);
    elseif (csid == 310) then
        player:setVar("MissionStatus",1);
        player:addTitle(dsp.title.HERO_ON_BEHALF_OF_WINDURST);
        player:addKeyItem(dsp.ki.HOLY_ONES_INVITATION);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.HOLY_ONES_INVITATION);
    elseif (csid == 312) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 192 or csid == 216) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 362) then
        player:setVar("MissionStatus",3);
    elseif (csid == 384) then
        player:setVar("MissionStatus",1);
	elseif (csid == 385) then
		player:delKeyItem(ANCIENT_VERSE_OF_ALTEPA);
		player:delKeyItem(ANCIENT_VERSE_OF_ROMAEVE);
		player:delKeyItem(ANCIENT_VERSE_OF_UGGALEPIH);
		player:setVar("MissionStatus",2);
	elseif (csid == 386) then
        player:setVar("MissionStatus",4);
	elseif (csid == 407) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,183);
            player:setVar("Flagwindurst",1);
        else
		    player:setPos(0,-50,35,64,242);
            player:addItem(183);
            player:messageSpecial(ITEM_OBTAINED,183);
        end
        player:setVar("MissionStatus",0);
        player:completeMission(WINDURST,MOON_READING);
        player:setRank(10);
        player:addGil(GIL_RATE*100000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*100000);
        player:setTitle(300);
        player:setVar("WindyEpilogue",1);
    end
end;
