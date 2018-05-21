-----------------------------------
-- Yeestog (Mog Garden)
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:PrintToPlayer("Yeestog: ......", 0xD);
    player:PrintToPlayer("He appears to be asleep...", 0xD);
end;

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
--print("onEventFinish");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
