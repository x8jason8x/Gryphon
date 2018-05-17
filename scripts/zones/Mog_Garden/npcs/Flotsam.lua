-----------------------------------
-- Area: Mog Garden
-- NPC: Flotsam
-- AF1 NPC
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
    player:PrintToPlayer("I'm called Flotsam, what did you think you'd find?", 0xD);
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
