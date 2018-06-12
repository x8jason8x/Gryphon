-----------------------------------
-- desc: temp NPC for ACP directions
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");
-----------------------------------

function onTrigger(player,npc)

    if player:getCurrentMission(ACP) == BORN_OF_HER_NIGHTMARES then
        player:PrintToPlayer("Level restriction and key items are not yet implemented.")
        player:PrintToPlayer("Check the Seed Fragment in Stellar Fulcrum to proceed.")
    end
end
