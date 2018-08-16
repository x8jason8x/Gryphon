-----------------------------------
-- Area: Yahse Hunting Grounds
--  NPC: Ergon Locus
-----------------------------------
package.loaded["scripts/zones/Yahse_Hunting_Grounds/TextIDs"] = nil
-----------------------------------
require("scripts/globals/quests")
require("scripts/zones/Yahse_Hunting_Grounds/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local danceLuopans = player:getQuestStatus(ADOULIN,DANCES_WITH_LUOPANS)
    local geoLuopan = player:getVar("GEO_LUO")

    if (player:hasKeyItem(dsp.ki.LUOPAN) and danceLuopans == QUEST_ACCEPTED and geoLuopan == 1) then
        player:PrintToPlayer("You feel a mystical warmth welling up inside you!", 0xD)
        player:setVar("GEO_LUO",2)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
