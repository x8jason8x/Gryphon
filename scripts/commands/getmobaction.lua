---------------------------------------------------------------------------------------------------
-- func: getmobaction
-- desc: Prints mob's current action to the command user.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "i"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!getmobaction {mobID}");
end;

function onTrigger(player, mobId)

    -- validate mobid
    local targ;
    if (mobId == nil) then
        targ = player:getCursorTarget();
        if (not targ:isMob()) then
            error(player, "You must either provide a mobID or target a mob with your cursor.");
            return;
        end
    else
        targ = GetMobByID(mobId);
        if (targ == nil) then
            error(player, "Invalid mobID.");
            return;
        end
    end

    -- report mob action
    local action = GetMobAction(targ:getID());
    player:PrintToPlayer(string.format("%s %i current action ID is %i.", targ:getName(), targ:getID(), action));
    
end;