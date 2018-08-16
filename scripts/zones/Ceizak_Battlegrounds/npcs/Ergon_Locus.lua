-----------------------------------
-- Area: Ceizak Battlegrounds
--  NPC: Ergon Locus
-----------------------------------
package.loaded["scripts/zones/Ceizak_Battlegrounds/TextIDs"] = nil
-----------------------------------
require("scripts/globals/quests")
require("scripts/zones/Ceizak_Battlegrounds/TextIDs")
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
