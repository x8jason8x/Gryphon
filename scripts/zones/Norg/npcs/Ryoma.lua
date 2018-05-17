-----------------------------------
-- Area: Norg
--  NPC: Ryoma
-- Start and Finish Quest: 20 in Pirate Years, I'll Take the Big Box, True Will
-- Involved in Quest: Ayame and Kaede
-- !pos -23 0 -9 252
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(17773,1)) then -- check trial katana latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then --(retail is 300)
	        player:startEvent(187); -- enough points
		else
		    player:startEvent(186); -- not enough points
		end
    end
end;

function onTrigger(player,npc)

    local twentyInPirateYears = player:getQuestStatus(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
    local illTakeTheBigBox = player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
    local trueWill = player:getQuestStatus(OUTLANDS,TRUE_WILL);
	local bugiSoden = player:getQuestStatus(OUTLANDS,BUGI_SODEN); -- Katana WSNM quest
	local katSkill = player:getSkillLevel(dsp.skill.KATANA);
    local mJob = player:getMainJob();
    local mLvl = player:getMainLvl();
	
    if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then
        if (player:getVar("AyameAndKaede_Event") == 3) then
            player:startEvent(95); -- During Quest "Ayame and Kaede"
        else
            player:startEvent(94);
        end

    elseif (bugiSoden == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and katSkill >= 240) then -- WSNM quest
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(184); -- start Bugi Soden (Blade:Ku quest)
		end
	elseif (bugiSoden == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(189); -- player has Annals of Truth
		elseif player:hasKeyItem(344) then
		    player:startEvent(188); -- player has Map to Annals
        else			
		    player:startEvent(185); -- quit quest option
		end

    elseif (twentyInPirateYears == QUEST_AVAILABLE and mJob == 13 and mLvl >= 40) then
        player:startEvent(133); -- Start Quest "20 in Pirate Years"
    elseif (twentyInPirateYears == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.TRICK_BOX)) then
        player:startEvent(134); -- Finish Quest "20 in Pirate Years"
    elseif (twentyInPirateYears == QUEST_COMPLETED and illTakeTheBigBox == QUEST_AVAILABLE and mJob == 13 and mLvl >= 50 and player:needToZone() == false) then
        player:startEvent(135); -- Start Quest "I'll Take the Big Box"
    elseif (illTakeTheBigBox == QUEST_COMPLETED and trueWill == QUEST_AVAILABLE and mJob == 13) then
        player:startEvent(136); -- Start Quest "True Will"
    elseif (player:hasKeyItem(dsp.ki.OLD_TRICK_BOX) and player:getVar("trueWillCS") == 0) then
        player:startEvent(137);
    elseif (player:getVar("trueWillCS") == 1) then
        player:startEvent(138);
    else
        player:startEvent(94);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 95) then
        player:addKeyItem(dsp.ki.SEALED_DAGGER);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.SEALED_DAGGER);
        player:delKeyItem(dsp.ki.STRANGELY_SHAPED_CORAL);
        player:setVar("AyameAndKaede_Event", 4);
    elseif (csid == 133) then
        player:addQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
        player:setVar("twentyInPirateYearsCS",1);
    elseif (csid == 134) then
        if (player:getFreeSlotsCount() <= 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17771);
        else
            player:delKeyItem(dsp.ki.TRICK_BOX);
            player:addItem(17771);
            player:addItem(17772);
            player:messageSpecial(ITEM_OBTAINED, 17771); -- Anju
            player:messageSpecial(ITEM_OBTAINED, 17772); -- Zushio
            player:needToZone();
            player:setVar("twentyInPirateYearsCS",0);
            player:addFame(NORG,30);
            player:completeQuest(OUTLANDS,TWENTY_IN_PIRATE_YEARS);
        end
    elseif (csid == 135) then
        player:addQuest(OUTLANDS,I_LL_TAKE_THE_BIG_BOX);
    elseif (csid == 136) then
        player:addQuest(OUTLANDS,TRUE_WILL);
    elseif (csid == 137) then
        player:setVar("trueWillCS",1);

    elseif (csid == 184 and option == 1) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17773);
	    else
	        player:addQuest(OUTLANDS,BUGI_SODEN); -- start wsnm quest
			player:addItem(17773);
	        player:messageSpecial(ITEM_OBTAINED,17773);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 185 and option == 2) then -- quit wsnm quest
		player:delQuest(OUTLANDS,BUGI_SODEN);
		player:delKeyItem(343);
	elseif (csid == 187) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 189) then -- Bugi Soden end
		player:delKeyItem(345);
		player:addLearnedWeaponskill(9);
		player:messageSpecial(BLADE_KU_LEARNED);
		player:addFame(NORG,250); -- no idea on retail value, using 250 as default
		player:completeQuest(OUTLANDS,BUGI_SODEN);
    end
end;
