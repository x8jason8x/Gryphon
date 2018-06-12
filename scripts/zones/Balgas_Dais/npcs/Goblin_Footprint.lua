-----------------------------------
-- desc: Temp script for AMK KI
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Balgas_Dais/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/settings")
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem (dsp.ki.STURDY_METAL_STRIP) then
        return
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE then
        player:addKeyItem(dsp.ki.STURDY_METAL_STRIP)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.STURDY_METAL_STRIP)
    end
end
