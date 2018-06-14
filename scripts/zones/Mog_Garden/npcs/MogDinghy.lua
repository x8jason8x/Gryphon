-----------------------------------
-- Area: Mog Garden
-- NPC: Mog Dinghy
-- Add-on completion NPC
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/keyitems")
require("scripts/zones/Mog_Garden/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:hasKeyItem(dsp.ki.PRISMATIC_KEY) then
        player:delKeyItem(dsp.ki.PRISMATIC_KEY)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.PRISMATIC_KEY)
        player:addItem(11313)
        player:messageSpecial(ITEM_OBTAINED,11313)
    elseif player:hasKeyItem(dsp.ki.OXBLOOD_KEY) then
        player:delKeyItem(dsp.ki.OXBLOOD_KEY);
        player:messageSpecial(KEYITEM_LOST,dsp.ki.OXBLOOD_KEY)
        player:addItem(11488)
        player:messageSpecial(ITEM_OBTAINED,11488)
    elseif player:hasKeyItem(dsp.ki.BEHEMOTH_KEY) then
        player:delKeyItem(dsp.ki.BEHEMOTH_KEY)
        player:messageSpecial(KEYITEM_LOST,dsp.ki.BEHEMOTH_KEY)
        player:addItem(16369)
        player:messageSpecial(ITEM_OBTAINED,16369)
    else
	    player:PrintToPlayer("Mog Dinghy: I help adventurers get add-on armor!", 0xD)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
