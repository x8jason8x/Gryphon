-----------------------------------
-- Area: Bostaunieux Obliette
--  NPC: Novalmauge
-- Starts and Finishes Quest: The Rumor
-- Involved in Quest: The Holy Crest, Trouble at the Sluice
-- !pos 70 -24 21 167
-----------------------------------
package.loaded["scripts/zones/Bostaunieux_Oubliette/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bostaunieux_Oubliette/TextIDs");
require("scripts/globals/pathfind");
-----------------------------------

local path =
{
41.169430, -24.000000, 19.860674,
42.256676, -24.000000, 19.885197,
41.168694, -24.000000, 19.904638,
21.859211, -24.010996, 19.792259,
51.917370, -23.924366, 19.970068,
74.570229, -24.024828, 20.103880,
44.533886, -23.947662, 19.926519
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

function onTrade(player,npc,trade)

    if (trade:getItemCount() == 1) and (trade:hasItemQty(16793,1)) then -- check trial scythe latent points
	    if trade:getItem(0):getWeaponskillPoints() >= 100 then --(retail is 300)
	        player:startEvent(1); -- enough points
			npc:wait();
		else
		    player:startEvent(2); -- not enough points
			npc:wait();
		end

	elseif (player:getVar("troubleAtTheSluiceVar") == 2) then
        if (trade:hasItemQty(959,1) and trade:getItemCount() == 1) then -- Trade Dahlia
            player:startEvent(17);
            npc:wait();
        end
		
    elseif (player:getQuestStatus(SANDORIA,THE_RUMOR) == QUEST_ACCEPTED) then
        local count = trade:getItemCount();
        local BeastBlood = trade:hasItemQty(930,1)
        if (BeastBlood == true and count == 1) then
            player:startEvent(12);
            npc:wait();
        end
    end
end;

function onTrigger(player,npc)

    local soulShadow = player:getQuestStatus(SANDORIA,SOULS_IN_SHADOW); -- Scythe WSNM quest
	local mLvl = player:getMainLvl();
	local syhSkill = player:getSkillLevel(dsp.skill.SCYTHE);
    local troubleAtTheSluice = player:getQuestStatus(SANDORIA,TROUBLE_AT_THE_SLUICE);
    local TheHolyCrest = player:getVar("TheHolyCrest_Event");
    local tatsVar = player:getVar("troubleAtTheSluiceVar");
    local theRumor = player:getQuestStatus(SANDORIA,THE_RUMOR);
    local crestCheck = player:getVar("theHolyCrestCheck");

    npc:wait();

    if (soulShadow == QUEST_AVAILABLE and mLvl >= WSNM_LEVEL and syhSkill >= 240) then -- Souls in Shadow (WSNM quest)
	    if player:hasKeyItem(343) or player:hasKeyItem(344) or player:hasKeyItem (345) then
		    return; -- preempts player from getting quest if another wsnm is active
		else
		    player:startEvent(0); -- start Souls in Shadow (Spiral Hell quest)
		end
	elseif (soulShadow == QUEST_ACCEPTED) then
		if player:hasKeyItem(345) then 
            player:startEvent(5); -- player has Annals of Truth
		elseif player:hasKeyItem(344) then
		    player:startEvent(4); -- player has Map to Annals
        else			
		    player:startEvent(3); -- dropped scythe or quit quest options
		end
     -- The Holy Crest Quest
    elseif (TheHolyCrest == 1) then
        player:startEvent(6);
    elseif (TheHolyCrest == 2 and crestCheck == 0) then
        player:startEvent(7);
        player:setVar("theHolyCrestCheck",1);
     -- Trouble at the Sluice Quest
    elseif (tatsVar == 1) then
        player:startEvent(15);
        player:setVar("troubleAtTheSluiceVar",2);
    elseif (tatsVar == 2) then
        player:startEvent(16);
     -- The Rumor Quest
    elseif (theRumor == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3 and player:getMainLvl() >= 10) then
        player:startEvent(13);
    elseif (theRumor == QUEST_ACCEPTED) then
        player:startEvent(11);
    elseif (theRumor == QUEST_COMPLETED) then
        player:startEvent(14); -- Standard dialog after "The Rumor"
        player:setVar("theHolyCrestCheck",0);
    else
        player:startEvent(10); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0 and option == 1) then
	    if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16793);
	    else
	        player:addQuest(SANDORIA,SOULS_IN_SHADOW); -- start wsnm quest
			player:addItem(16793);
	        player:messageSpecial(ITEM_OBTAINED,16793);
		    player:addKeyItem(343);
	        player:messageSpecial(KEYITEM_OBTAINED,343);
        end
	elseif (csid == 3) then
	    if (option == 1) then -- lost/dropped scythe of trials
		    if (player:getFreeSlotsCount() < 1 or player:hasItem(16793)) then
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16793);
		    else	
		        player:addItem(16793);
			    player:messageSpecial(ITEM_OBTAINED,16793);
			end
		elseif (option == 2) then -- quit wsnm quest
		    player:delQuest(SANDORIA,SOULS_IN_SHADOW);
			player:delKeyItem(343);
	    end
	elseif (csid == 1) then  -- attain Map to Annals
	    player:tradeComplete();
	    player:delKeyItem(343);
	    player:addKeyItem(344);
		player:messageSpecial(KEYITEM_OBTAINED,344);
	elseif (csid == 5) then -- Souls in Shadow end
		player:delKeyItem(345);
		player:addLearnedWeaponskill(7);
		player:messageSpecial(SPIRAL_HELL_LEARNED);
		player:addFame(SANDORIA,250); -- no idea on retail value, using 250 as default
		player:completeQuest(SANDORIA,SOULS_IN_SHADOW);

    elseif (csid == 6) then
        player:setVar("TheHolyCrest_Event",2);
    elseif (csid == 17) then
        player:tradeComplete();
        player:addKeyItem(dsp.ki.NEUTRALIZER);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.NEUTRALIZER);
        player:setVar("troubleAtTheSluiceVar",0);
        player:setVar("theHolyCrestCheck",0);
    elseif (csid == 13 and option == 1) then
        player:addQuest(SANDORIA,THE_RUMOR);
    elseif (csid == 12) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4853); -- Scroll of Drain
        else
            player:tradeComplete();
            player:addItem(4853);
            player:messageSpecial(ITEM_OBTAINED, 4853); -- Scroll of Drain

            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,THE_RUMOR);
        end
    end

    npc:wait(0);
end;