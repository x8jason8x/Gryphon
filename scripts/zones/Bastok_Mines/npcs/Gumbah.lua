-----------------------------------
-- Area: Bastok Mines
--  NPC: Gumbah
-- Finishes Quest: Blade of Darkness
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(16952,1)) then -- check trial gswd latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then
	        player:startEvent(193); -- enough points
		else
		    player:startEvent(192); -- not enough points
		end
    end
end;

function onTrigger(player,npc)

    local mLvl = player:getMainLvl();
    local inheritAnce = player:getQuestStatus(BASTOK,INHERITANCE); -- Gswd WSNM quest
	local gsdSkill = player:getSkillLevel(dsp.skill.GREAT_SWORD);
    local bladeDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);

    if (inheritAnce == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and gsdSkill >= 240) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(190); -- start Inheritance (Ground Strike quest)
		end
	elseif (inheritAnce == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(194); -- player has Annals of Truth
		else
		    player:startEvent(191); -- dropped gswd or quit quest options
		end
		
	elseif (player:getMainLvl() >= ADVANCED_JOB_LEVEL and  bladeDarkness == QUEST_AVAILABLE) then
        --DARK KNIGHT QUEST
        player:startEvent(99);
    elseif (bladeDarkness == QUEST_COMPLETED and player:getQuestStatus(BASTOK,BLADE_OF_DEATH) == QUEST_AVAILABLE) then
        player:startEvent(130);
    elseif ((player:hasCompletedMission(BASTOK, ON_MY_WAY) == true)
    or ((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 3)))
        and (player:getVar("[B7-2]Werei") == 0) then
        player:startEvent(177);
    else
        --DEFAULT
        player:startEvent(52);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 190) then
	    if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16952);
	    else
	        player:addQuest(BASTOK,INHERITANCE); -- start Inheritance
			player:addItem(16952);
	        player:messageSpecial(ITEM_OBTAINED,16952);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 191) then
	    if (option == 2) then -- lost/dropped gswd of trials
		    if (player:getFreeSlotsCount() == 0 or player:hasItem(16952)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16952);
		    else	
		        player:addItem(16952);
			    player:messageSpecial(ITEM_OBTAINED,16952);
			end
		elseif (option == 3) then -- quit Inheritance
		    player:delQuest(BASTOK,INHERITANCE);
			player:delKeyItem(343);
			player:delKeyItem(344);
			player:delKeyItem(345);
	    end
	elseif (csid == 193) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 194) then -- Inheritance end
		player:addLearnedWeaponskill(4);
		player:messageSpecial(GROUND_STRIKE_LEARNED);
		player:delKeyItem(345);
		player:addFame(BASTOK,250); -- no idea on retail value, using 250 as default
		player:completeQuest(BASTOK,INHERITANCE);

    elseif (csid == 99) then
        player:addQuest(BASTOK, BLADE_OF_DARKNESS);
    elseif (csid == 130) then
        player:addQuest(BASTOK, BLADE_OF_DEATH);
        player:addKeyItem(dsp.ki.LETTER_FROM_ZEID);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LETTER_FROM_ZEID);
    elseif (csid == 177) then
        player:setVar("[B7-2]Werei", 1);
    end
end;