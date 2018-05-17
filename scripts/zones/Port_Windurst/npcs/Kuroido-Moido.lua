-----------------------------------
-- Area: Port Windurst
-- NPC: Kuriodo-Moido
-- Involved In Quest: Making Amends, Wonder Wands
-- Starts and Finishes: Making Amens!, Orastery Woes
-- Working 100%
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Port_Windurst/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(17456,1)) then -- check trial club latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then
	        player:startEvent(581); -- enough points
		else
		    player:startEvent(580); -- not enough points
		end	
    end
end;

function onTrigger(player,npc)

    local orastWoes = player:getQuestStatus(WINDURST,ORASTERY_WOES); -- Club WSNM quest
	local mLvl = player:getMainLvl();
	local clbSkill = player:getSkillLevel(dsp.skill.CLUB);
    local MakingAmends = player:getQuestStatus(WINDURST,MAKING_AMENDS); --First quest in series
    local MakingAmens = player:getQuestStatus(WINDURST,MAKING_AMENS); --Second quest in series
    local WonderWands = player:getQuestStatus(WINDURST,WONDER_WANDS); --Third and final quest in series
    local pfame = player:getFameLevel(WINDURST);
    local needToZone = player:needToZone();
    local BrokenWand = player:hasKeyItem(128);

    if (orastWoes == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and clbSkill >= 240) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem(345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
	        player:startEvent(578);-- start Orastery Woes (Black Halo quest)
		end
	elseif (orastWoes == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then -- player has Annals of Truth
            player:startEvent(583); 
		elseif player:hasKeyItem(344) then -- player has Map to Annals
		    player:startEvent(582);
		else
		    player:startEvent(579); -- dropped club or quit quest options
		end

    elseif (MakingAmends == QUEST_ACCEPTED) then -- MAKING AMENDS: During Quest
        player:startEvent(276);
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens ~= QUEST_COMPLETED and WonderWands ~= QUEST_COMPLETED and needToZone) then -- MAKING AMENDS: After Quest
        player:startEvent(279);
    elseif (MakingAmends == QUEST_COMPLETED and MakingAmens == QUEST_AVAILABLE) then
        if (pfame >=4 and not needToZone) then
            player:startEvent(280); -- Start Making Amens! if prerequisites are met
        else
            player:startEvent(279); -- MAKING AMENDS: After Quest
        end
    elseif (MakingAmens == QUEST_ACCEPTED and not BrokenWand) then -- Reminder for Making Amens!
        player:startEvent(283);
    elseif (MakingAmens == QUEST_ACCEPTED and BrokenWand) then -- Complete Making Amens!
        player:startEvent(284,GIL_RATE*6000);
    elseif (MakingAmens == QUEST_COMPLETED) then
        if (WonderWands == QUEST_ACCEPTED) then -- During Wonder Wands dialogue
            player:startEvent(261);
        elseif (WonderWands == QUEST_COMPLETED) then -- Post Wonder Wands dialogue
            player:startEvent(266);
        else
            player:startEvent(286,0,937); -- Post Making Amens! dialogue (before Wonder Wands)
        end
    elseif (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD) then
        local item = 0;
        local asaStatus = player:getVar("ASA_Status");

        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
        end

        -- The Parameters are Item IDs for the Recipe
        player:startEvent(858, item, 1134, 2778, 2778, 4099, 2778);
    else
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(225);   -- Standard Conversation
        else
            player:startEvent(226);   -- Standard Conversation
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 578) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17456);
	    else
	        player:addQuest(WINDURST,ORASTERY_WOES); -- start Orastery Woes
		    player:addItem(17456);
	        player:messageSpecial(ITEM_OBTAINED,17456);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 579) then
	    if (option == 2) then -- lost/dropped club of trials
		    if (player:getFreeSlotsCount() < 1 or player:hasItem(17456)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17456);
		    else	
		        player:addItem(17456);
			    player:messageSpecial(ITEM_OBTAINED,17456);
			end
		elseif (option == 3) then -- quit Orastery Woes
		    player:delQuest(WINDURST,ORASTERY_WOES);
			player:delKeyItem(343);
			player:delKeyItem(344);
			player:delKeyItem(345);
	    end
	elseif (csid == 581) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 583) then -- Orastery Woes end
		player:addLearnedWeaponskill(11);
		player:messageSpecial(BLACK_HALO_LEARNED);
		player:delKeyItem(345);
		player:addFame(WINDURST,250); -- no idea on retail value, using 250 as default
		player:completeQuest(WINDURST,ORASTERY_WOES);

    elseif (csid == 280) then
        player:addQuest(WINDURST,MAKING_AMENS);
    elseif (csid == 284) then
        player:needToZone(true);
        player:delKeyItem(dsp.ki.BROKEN_WAND);
        player:addTitle(dsp.title.HAKKURURINKURUS_BENEFACTOR);
        player:addGil(GIL_RATE*6000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*6000);
        player:addFame(WINDURST,150);
        player:completeQuest(WINDURST,MAKING_AMENS);
    end
end;
