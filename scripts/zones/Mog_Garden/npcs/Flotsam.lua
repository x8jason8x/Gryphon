-----------------------------------
-- Area: Mog Garden
-- NPC: Flotsam
-- AF1 NPC
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:PrintToPlayer("I'm called Flotsam, what did you think you'd find?", 0xD);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
