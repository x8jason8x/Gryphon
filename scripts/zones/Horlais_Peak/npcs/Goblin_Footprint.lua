-----------------------------------
-- desc: Temp script for AMK KI
-----------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/zones/Horlais_Peak/TextIDs")
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem (dsp.ki.SAVORY_LAMB_ROAST) then
        return
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE then
        player:addKeyItem(dsp.ki.SAVORY_LAMB_ROAST)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SAVORY_LAMB_ROAST)
    end
end
