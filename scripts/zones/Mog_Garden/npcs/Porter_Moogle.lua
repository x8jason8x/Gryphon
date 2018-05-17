-----------------------------------
-- Nomad Moogle (Porter Moogle) (Mog Garden)
-- npcid 17924220
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
    player:PrintToPlayer("Moogle: Change job kupo?", 0xD);
    player:sendMenu(1);
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--print("onEventUpdate");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--print("onEventFinish");
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;