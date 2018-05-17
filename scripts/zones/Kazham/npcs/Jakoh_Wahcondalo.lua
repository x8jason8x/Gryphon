-----------------------------------
-- Area: Kazham
--  NPC: Jakoh Wahcondalo
-- !pos 101 -16 -115 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(17616,1)) then -- check trial dagger latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then -- retail is 300, custom setting
	        player:startEvent(282); -- enough points
		else
		    player:startEvent(281); -- not enough points
		end	
    end
end;

function onTrigger(player,npc)

    local cloakDagger = player:getQuestStatus(OUTLANDS,CLOAK_AND_DAGGER); -- Dagger WSNM quest
	local dagSkill = player:getSkillLevel(dsp.skill.DAGGER);
    local mLvl = player:getMainLvl();
	
    if (player:getCurrentMission(ZILART) == KAZAMS_CHIEFTAINESS) then
        player:startEvent(114);
    elseif (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(115);
    elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
        player:startEvent(265);

    elseif (cloakDagger == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and dagSkill >= 230) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem(345) then
		    return -- preempts player from getting quest if another wsnm is active
		else
	        player:startEvent(279);-- start Cloak and Dagger (Evisceration quest)
		end
	elseif (cloakDagger == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then -- player has Annals of Truth
            player:startEvent(284); 
		elseif player:hasKeyItem(344) then -- player has Map to Annals
		    player:startEvent(283);
		else
		    player:startEvent(280); -- dropped dagger or quit quest options
		end
    else
        player:startEvent(113);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 114) then
        player:addKeyItem(dsp.ki.SACRIFICIAL_CHAMBER_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SACRIFICIAL_CHAMBER_KEY);
        player:completeMission(ZILART,KAZAMS_CHIEFTAINESS);
        player:addMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
    elseif (csid == 265) then
        player:setVar("MissionStatus",3);

    elseif (csid == 279) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17616);
	    else
	        player:addQuest(OUTLANDS,CLOAK_AND_DAGGER); -- start Cloak and Dagger
		    player:addItem(17616);
	        player:messageSpecial(ITEM_OBTAINED,17616);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 280) then
	    if (option == 2) then -- lost/dropped dagger of trials
		    if (player:getFreeSlotsCount() < 1 or player:hasItem(17616)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17616);
		    else	
		        player:addItem(17616);
			    player:messageSpecial(ITEM_OBTAINED,17616);
			end
		elseif (option == 3) then -- quit Cloak and Dagger
		    player:delQuest(OUTLANDS,CLOAK_AND_DAGGER);
			player:delKeyItem(343);
	    end
	elseif (csid == 282) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 284) then -- Cloak and Dagger end
		player:addLearnedWeaponskill(2);
		player:messageSpecial(EVISCERATION_LEARNED);
		player:delKeyItem(345);
		player:addFame(KAZHAM,250); -- no idea on retail value, using 250 as default
		player:completeQuest(OUTLANDS,CLOAK_AND_DAGGER);
    end
end;
