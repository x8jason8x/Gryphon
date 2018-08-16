-----------------------------------
-- Area: Western Adoulin
--  NPC: Sylvie
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/zones/Western_Adoulin/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)

    if player:hasKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL) and
    (trade:getItemCount() == 1) and (trade:hasItemQty(703,1)) then
        player:tradeComplete()
        player:startEvent(34)
    end
end

function onTrigger(player,npc)

    local danceLuopans = player:getQuestStatus(ADOULIN,DANCES_WITH_LUOPANS)
    local geoLuopan = player:getVar("GEO_LUO")

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and danceLuopans == QUEST_AVAILABLE) then
        player:startEvent(31)
    elseif (danceLuopans == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL) == false and
        player:hasKeyItem(dsp.ki.LUOPAN) == false) then
        player:startEvent(33)
    elseif (player:hasKeyItem(dsp.ki.LUOPAN) and geoLuopan == 1) then
        player:startEvent(35)
    elseif (player:hasKeyItem(dsp.ki.LUOPAN) and geoLuopan == 2) then
        player:startEvent(36)
    end
end

function onEventFinish(player,csid,option)

    if (csid == 31 and option == 1) then
        player:addQuest(ADOULIN,DANCES_WITH_LUOPANS)
    elseif (csid == 34) then
        player:delKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
        player:addKeyItem(dsp.ki.LUOPAN)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.LUOPAN)
        player:setVar("GEO_LUO",1)
    elseif (csid == 36) then
        player:addItem(6074)
        player:messageSpecial(ITEM_OBTAINED,6074)
        player:addItem(21460)
        player:messageSpecial(ITEM_OBTAINED,21460)
        player:setVar("GEO_LUO",0)
        player:unlockJob(dsp.job.GEO)
        player:addTitle(dsp.title.GEODANCER)
        player:completeQuest(ADOULIN,DANCES_WITH_LUOPANS)
    end
end
