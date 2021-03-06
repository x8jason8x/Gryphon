-----------------------------------
-- Area: Bastok Mines
--  NPC: Tibelda
-- Valdeaunia Regional Merchant
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs")
require("scripts/globals/conquest")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if GetRegionOwner(dsp.region.VALDEAUNIA) ~= dsp.nation.BASTOK then
        player:showText(npc, TIBELDA_CLOSED_DIALOG)
    else
        local stock =
        {
            4382,  29,    --Frost Turnip
            638,  170,     --Sage
        }

        player:showText(npc, TIBELDA_OPEN_DIALOG)
        dsp.shop.general(player, stock, BASTOK)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
