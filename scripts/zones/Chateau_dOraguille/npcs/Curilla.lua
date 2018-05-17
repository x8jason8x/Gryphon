-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit, Lure of the Wildcat (San d'Oria)
-- !pos 27 0.1 0.1 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(17654,1)) then -- check trial sword latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then --(retail is 300)
	        player:startEvent(44); -- enough points
		else
		    player:startEvent(45); -- not enough points
		end
    elseif (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    local mLvL = player:getMainLvl();
    local mJob = player:getMainJob();
	local oldWounds = player:getQuestStatus(SANDORIA,OLD_WOUNDS); -- Sword WSNM quest
    local swdSkill = player:getSkillLevel(dsp.skill.SWORD);
    local theGeneralSecret = player:getQuestStatus(SANDORIA,THE_GENERAL_S_SECRET);
    local envelopedInDarkness = player:getQuestStatus(SANDORIA,ENVELOPED_IN_DARKNESS);
    local peaceForTheSpirit = player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT);
    local WildcatSandy = player:getVar("WildcatSandy");

    if (oldWounds == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and swdSkill >= 240) then -- Souls in Shadow (WSNM quest)
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(43); -- start Old Wounds (Savage Blade quest)
		end
	elseif (oldWounds == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(48); -- player has Annals of Truth
		elseif player:hasKeyItem(344) then
		    player:startEvent(47); -- player has Map to Annals
        else			
		    player:startEvent(46); -- dropped scythe or quit quest options
		end

    elseif (player:getQuestStatus(SANDORIA,LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,15) == false) then
        player:startEvent(562);
    elseif (theGeneralSecret == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(55); -- Start Quest "The General's Secret"
    elseif (mJob == 5 and mLvL >= AF2_QUEST_LEVEL and player:getQuestStatus(SANDORIA,THE_CRIMSON_TRIAL) == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(94); -- Start Quest "Enveloped in Darkness"
    elseif (player:hasKeyItem(dsp.ki.OLD_POCKET_WATCH) and player:hasKeyItem(dsp.ki.OLD_BOOTS) == false) then
        player:startEvent(93);
    elseif (player:hasKeyItem(dsp.ki.OLD_BOOTS) and player:getVar("needs_crawler_blood") == 0) then
        player:startEvent(101);
    elseif (player:getVar("needs_crawler_blood") == 1) then
        player:startEvent(117);
    elseif (mJob == 5 and mLvL >= AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(109); -- Start Quest "Peace for the Spirit"
    elseif (peaceForTheSpirit == QUEST_ACCEPTED) then
        player:startEvent(108); -- Standard dialog during Peace of the spirit
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (player:getVar("peaceForTheSpiritCS") >= 2 and player:getVar("peaceForTheSpiritCS") <= 4)) then
        player:startEvent(113);
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and player:getVar("peaceForTheSpiritCS") == 5) then
        player:startEvent(51);
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)) then
        player:startEvent(53);
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)) then
        player:startEvent(54);
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(114); -- Standard dialog after Enveloped in darkness
    elseif (peaceForTheSpirit == QUEST_COMPLETED) then
        player:startEvent(52); -- Standard dialog after Peace of the spirit
    else
        player:startEvent(530); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 43 and option == 1) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17654);
	    else
	        player:addQuest(SANDORIA,OLD_WOUNDS); -- start wsnm quest
			player:addItem(17654);
	        player:messageSpecial(ITEM_OBTAINED,17654);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 46) then
	    if (option == 1) then -- lost/dropped sword of trials
		    if (player:getFreeSlotsCount() < 1 or player:hasItem(17654)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17654);
		    else	
		        player:addItem(17654);
			    player:messageSpecial(ITEM_OBTAINED,17654);
			end
		elseif (option == 2) then -- quit wsnm quest
		    player:delQuest(SANDORIA,OLD_WOUNDS);
			player:delKeyItem(343);
	    end
	elseif (csid == 44) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 48) then -- Old Wounds end
		player:delKeyItem(345);
		player:addLearnedWeaponskill(3);
		player:messageSpecial(SAVAGE_BLADE_LEARNED);
		player:addFame(SANDORIA,250); -- no idea on retail value, using 250 as default
		player:completeQuest(SANDORIA,OLD_WOUNDS);

    elseif (csid == 55 and option == 1) then
        player:addQuest(SANDORIA,THE_GENERAL_S_SECRET)
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_EMPTY);
    elseif (csid == 54) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16409); -- Lynx Baghnakhs
        else
            player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL);
            player:addItem(16409);
            player:messageSpecial(ITEM_OBTAINED,16409); -- Lynx Baghnakhs
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_GENERAL_S_SECRET);
        end
    elseif (csid == 94 and option == 1) then
        player:addQuest(SANDORIA,ENVELOPED_IN_DARKNESS);
        player:addKeyItem(dsp.ki.OLD_POCKET_WATCH);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.OLD_POCKET_WATCH);
    elseif (csid == 109 and option == 1) then
        player:addQuest(SANDORIA,PEACE_FOR_THE_SPIRIT);
        player:setVar("needs_crawler_blood",0);
    elseif (csid == 101) then
        player:setVar("needs_crawler_blood",1);
    elseif (csid == 562) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",15,true);
    end

end;
