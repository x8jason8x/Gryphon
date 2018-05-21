-----------------------------------
-- Porter Moogle (Mog Garden)
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,NPC_BLANK);
    player:PrintToPlayer("Moogle: Change job, Kupo?", 0xD);
    player:sendMenu(1);
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
