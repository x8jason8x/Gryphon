-----------------------------------
-- Area: Mog Garden
-- NPC: Flotsam
-- Add-on completion NPC
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil;
require("scripts/zones/Mog_Garden/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem(1127) then
        player:delKeyItem(1127);
        player:messageSpecial(KEYITEM_LOST, 1127);
        player:addItem(11313);
        player:messageSpecial(ITEM_OBTAINED, 11313);
    elseif player:hasKeyItem(1135) then
        player:delKeyItem(1135);
        player:messageSpecial(KEYITEM_LOST, 1135);
        player:addItem(11488);
        player:messageSpecial(ITEM_OBTAINED, 11488);
    elseif player:hasKeyItem(1190) then
        player:delKeyItem(1190);
        player:messageSpecial(KEYITEM_LOST, 1190);
        player:addItem(16369);
        player:messageSpecial(ITEM_OBTAINED, 16369);
    else
	    player:PrintToPlayer("Mog Dinghy: I help adventurers get add-on armor!", 0xD);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
