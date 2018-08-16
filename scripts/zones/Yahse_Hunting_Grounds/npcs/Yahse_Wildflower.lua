-----------------------------------
-- Area: Yahse Hunting Grounds
--  NPC: Ergon Locus
-----------------------------------
package.loaded["scripts/zones/Yahse_Hunting_Grounds/TextIDs"] = nil
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/zones/Yahse_Hunting_Grounds/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local runeChild = player:getQuestStatus(ADOULIN,CHILDREN_OF_THE_RUNE)

    if (player:hasKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL) == false and runeChild == QUEST_ACCEPTED) then
        player:addKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.YAHSE_WILDFLOWER_PETAL)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
