-----------------------------------
-- Area: Port Bastok
--  NPC: Oggbi
-- Starts and Finishes: Ghosts of the Past, The First Meeting
-- @zone 236
-- !pos -159 -7 5
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(17507,1)) then -- check trial h2h latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then
	        player:startEvent(289); -- enough points
		else
		    player:startEvent(288); -- not enough points
		end
	elseif (player:getQuestStatus(BASTOK,GHOSTS_OF_THE_PAST) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(13122,1) and trade:getItemCount() == 1) then -- Trade Miner's Pendant
            player:startEvent(232); -- Finish Quest "Ghosts of the Past"
        end
    end
end;

function onTrigger(player,npc)

    local ghostsOfThePast = player:getQuestStatus(BASTOK,GHOSTS_OF_THE_PAST);
    local theFirstMeeting = player:getQuestStatus(BASTOK,THE_FIRST_MEETING);
	local mindWalls = player:getQuestStatus(BASTOK,THE_WALLS_OF_YOUR_MIND); -- h2h WSNM quest
	local h2hSkill = player:getSkillLevel(dsp.skill.HAND_TO_HAND);
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();

    if (mindWalls == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and h2hSkill >= 240) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(286); -- start The Walls of Your Mind (Asuran Fists quest)
		end
	elseif (mindWalls == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(290); -- player has Annals of Truth
		else
		    player:startEvent(287); -- dropped knuckles or quit quest options
		end
    elseif (ghostsOfThePast == QUEST_AVAILABLE and mJob == 2 and mLvl >= 40) then
        player:startEvent(231); -- Start Quest "Ghosts of the Past"
    elseif (ghostsOfThePast == QUEST_COMPLETED and player:needToZone() == false and theFirstMeeting == QUEST_AVAILABLE and mJob == 2 and mLvl >= 50) then
        player:startEvent(233); -- Start Quest "The First Meeting"
    elseif (player:hasKeyItem(dsp.ki.LETTER_FROM_DALZAKK) and player:hasKeyItem(dsp.ki.SANDORIAN_MARTIAL_ARTS_SCROLL)) then
        player:startEvent(234); -- Finish Quest "The First Meeting"
    else
        player:startEvent(230); -- Standard Dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 231) then
        player:addQuest(BASTOK,GHOSTS_OF_THE_PAST);
    elseif (csid == 232) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17478); -- Beat Cesti
        else
            player:tradeComplete();
            player:addItem(17478);
            player:messageSpecial(ITEM_OBTAINED,17478); -- Beat Cesti
            player:needToZone(true);
            player:addFame(BASTOK,AF1_FAME);
            player:completeQuest(BASTOK,GHOSTS_OF_THE_PAST);
        end
    elseif (csid == 233) then
        player:addQuest(BASTOK,THE_FIRST_MEETING);
    elseif (csid == 234) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14090); -- Temple Gaiters
        else
            player:delKeyItem(dsp.ki.LETTER_FROM_DALZAKK);
            player:delKeyItem(dsp.ki.SANDORIAN_MARTIAL_ARTS_SCROLL);
            player:addItem(14090);
            player:messageSpecial(ITEM_OBTAINED,14090); -- Temple Gaiters
            player:addFame(BASTOK,AF2_FAME);
            player:completeQuest(BASTOK,THE_FIRST_MEETING);
        end
    elseif (csid == 286) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17507);
	    else
	        player:addQuest(BASTOK,THE_WALLS_OF_YOUR_MIND); -- start Walls of Your Mind
			player:addItem(17507);
	        player:messageSpecial(ITEM_OBTAINED,17507);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 287) then
	    if (option == 2) then -- lost/dropped h2h of trials
		    if (player:getFreeSlotsCount() == 0 or player:hasItem(17507)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17507);
		    else	
		        player:addItem(17507);
			    player:messageSpecial(ITEM_OBTAINED,17507);
			end
		elseif (option == 3) then -- quit Walls of Your Mind
		    player:delQuest(BASTOK,THE_WALLS_OF_YOUR_MIND);
			player:delKeyItem(343);
			player:delKeyItem(344);
			player:delKeyItem(345);
	    end
	elseif (csid == 289) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 290) then -- Walls of Your Mind end
		player:addLearnedWeaponskill(1);
		player:messageSpecial(ASURAN_FISTS_LEARNED);
		player:delKeyItem(345);
		player:addFame(BASTOK,250); -- no idea on retail value, using 250 as default
		player:completeQuest(BASTOK,THE_WALLS_OF_YOUR_MIND);
    end
end;
