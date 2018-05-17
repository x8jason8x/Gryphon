-----------------------------------
-- Area: Metalworks
-- NPC: Iron Eater
-- Involved in Missions
-- !pos 92.936 -19.532 1.814 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(16735,1)) then -- check trial gaxe latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then
	        player:startEvent(793); -- enough points
		else
		    player:startEvent(792); -- not enough points
		end
    end
end;

function onTrigger(player,npc)

    local weightLimits = player:getQuestStatus(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS); -- Gaxe WSNM quest
	local mLvl = player:getMainLvl();
	local gaxSkill = player:getSkillLevel(dsp.skill.GREAT_AXE);
    local currentMission = player:getCurrentMission(BASTOK);
    local missionStatus = player:getVar("MissionStatus");

    if (weightLimits == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and gaxSkill >= 240) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(790); -- start The Weight of Your Limits (Steel Cyclone quest)
		end
	elseif (weightLimits == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(794); -- player has Annals of Truth
		else
		    player:startEvent(791); -- dropped gaxe or quit quest options
		end

    elseif (currentMission == THE_FOUR_MUSKETEERS and missionStatus == 0) then -- Four Musketeers
        player:startEvent(715);
    elseif (currentMission == WHERE_TWO_PATHS_CONVERGE and player:getVar("BASTOK92") == 0) then
        player:startEvent(780);
    elseif (currentMission == WHERE_TWO_PATHS_CONVERGE and player:getVar("BASTOK92") == 2) then
        player:startEvent(782);
    elseif (player:getVar("Flagbastok") == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,182);
        else
            player:setVar("Flagbastok",0);
            player:addItem(182);
            player:messageSpecial(ITEM_OBTAINED,182);
        end
    elseif (currentMission == THE_FOUR_MUSKETEERS and missionStatus == 1) then
        player:startEvent(716);
    elseif (currentMission == THE_CHAINS_THAT_BIND_US and missionStatus == 0) then
        player:startEvent(767); -- First cutscene of mission
    elseif (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 2) then
        player:showText(npc, 8596); -- Dialogue after first cutscene
    elseif (currentMission == THE_CHAINS_THAT_BIND_US) and (missionStatus == 3) then
        player:startEvent(768); -- Cutscene on return from Quicksand Caves
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") == 1) then
            player:startEvent(956);
        else
            player:startEvent(957);
        end
    else
        player:startEvent(604);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 790) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16735);
	    else
	        player:addQuest(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS); -- start The Weight of Your Limits
			player:addItem(16735);
	        player:messageSpecial(ITEM_OBTAINED,16735);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 791) then
	    if (option == 2) then -- lost/dropped gaxe of trials
		    if (player:getFreeSlotsCount() < 1 or player:hasItem(16735)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16735);
		    else	
		        player:addItem(16735);
			    player:messageSpecial(ITEM_OBTAINED,16735);
			end
		elseif (option == 3) then -- quit weight limits
		    player:delQuest(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS);
			player:delKeyItem(343);
			player:delKeyItem(344);
			player:delKeyItem(345);
	    end
	elseif (csid == 793) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);		
	elseif (csid == 794) then -- The Weight of Your Limits end
		player:addLearnedWeaponskill(6);
		player:messageSpecial(STEEL_CYCLONE_LEARNED);
		player:delKeyItem(345);
		player:addFame(BASTOK,250); -- no idea on retail value, using 250 as default
		player:completeQuest(BASTOK,THE_WEIGHT_OF_YOUR_LIMITS);

    elseif (csid == 715 and option == 0) then
        player:setVar("MissionStatus",1);
    elseif (csid == 780) then
        player:setVar("BASTOK92", 1);
    elseif (csid == 767 and option == 0) then
        player:setVar("MissionStatus", 1);
    elseif (csid == 768) then
        finishMissionTimeline(player, 1, csid, option);
    elseif (csid == 782) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,182);
            player:setVar("Flagbastok",1);
        else
            player:addItem(182);
            player:messageSpecial(ITEM_OBTAINED,182);
        end
        player:setVar("BASTOK92",0);
        player:completeMission(BASTOK,WHERE_TWO_PATHS_CONVERGE);
        player:setRank(10);
        player:addGil(GIL_RATE*100000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*100000);
        player:setTitle(296);
    elseif (csid == 956) then
        player:setVar("FiresOfDiscProg",2);
    end
end;
