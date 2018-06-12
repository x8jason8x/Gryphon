-----------------------------------
-- desc: Temp script for AMK KI
-----------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/zones/Waughroon_Shrine/TextIDs")
-----------------------------------

function onTrigger(player,npc)

    if player:hasKeyItem (dsp.ki.PIECE_OF_RUGGED_TREE_BARK) then
        return
    elseif player:getCurrentMission(AMK) == WELCOME_TO_MY_DECREPIT_DOMICILE then
        player:addKeyItem(dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.PIECE_OF_RUGGED_TREE_BARK)
    end
end
