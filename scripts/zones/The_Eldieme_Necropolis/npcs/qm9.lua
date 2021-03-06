-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: qm9 (??? - Ancient Papyrus Shreds)
-- Involved in Quest: In Defiant Challenge
-- !pos 92.272 -32 -64.676 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (OldSchoolG1 == false) then
        if (player:hasItem(1088) == false and player:hasKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED3) == false
        and player:getQuestStatus(JEUNO,IN_DEFIANT_CHALLENGE) == QUEST_ACCEPTED) then
            player:addKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED3);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_PAPYRUS_SHRED3);
        end

        if (player:hasKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED1) and player:hasKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED2) and player:hasKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED3)) then
            if (player:getFreeSlotsCount() >= 1) then
                player:addItem(1088, 1);
                player:messageSpecial(ITEM_OBTAINED, 1088);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1088);
            end
        end

        if (player:hasItem(1088)) then
            player:delKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED1);
            player:delKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED2);
            player:delKeyItem(dsp.ki.ANCIENT_PAPYRUS_SHRED3);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
end;