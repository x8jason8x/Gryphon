-----------------------------------
-- Area: Eastern Adoulin
--  NPC: Octavien
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/settings")
require("scripts/zones/Western_Adoulin/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local runeChild = player:getQuestStatus(ADOULIN,CHILDREN_OF_THE_RUNE)

    if (player:getMainLvl() >= ADVANCED_JOB_LEVEL and runeChild == QUEST_AVAILABLE) then
        player:startEvent(23)
    elseif (runeChild == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL) == false) then
        player:startEvent(25)
    elseif (player:hasKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL) and runeChild == QUEST_ACCEPTED) then
        player:startEvent(26)
    end
end

function onEventFinish(player,csid,option)

    if (csid == 23 and option == 1) then
        player:addQuest(ADOULIN,CHILDREN_OF_THE_RUNE)
    elseif (csid == 26 and option == 1) then
        player:addItem(20781)
        player:messageSpecial(ITEM_OBTAINED,20781)
        player:unlockJob(dsp.job.RUN)
        player:addTitle(dsp.title.RUNIC_ENGRAVER)
        player:completeQuest(ADOULIN,CHILDREN_OF_THE_RUNE)
    end
end
