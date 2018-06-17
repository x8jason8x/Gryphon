-----------------------------------
-- Area: The Garden of Ru'Hmet
--  NPC: Cermet Portal
-- !pos -419 0.1 356 35
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if ((player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") > 0) or
        player:getCurrentMission(COP) > DAWN) then
        if (player:getZPos() <= 360) then
            player:startEvent(140)
        else
            player:startEvent(141)
        end
    else
        if (player:getZPos() <= 360) then
            player:messageSpecial(PORTAL_SEALED)
        else
            player:startEvent(139)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
