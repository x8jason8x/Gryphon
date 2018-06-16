-----------------------------------
-- Garden Strongbox (75cap spell unlocks) (Mog Garden)
-----------------------------------
package.loaded["scripts/zones/Mog_Garden/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Mog_Garden/TextIDs")
require("scripts/globals/settings")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local ValidSpells = 
    {
        1,2,3,4,5,7,8,9,10,12,13,14,15,16,17,18,19,20,21,23,24,28,29,33,38,43,44,45,46,48,49,50,51,53,54,55,56,
        57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,81,82,83,86,87,88,89,90,91,92,93,94,
        95,96,97,98,99,100,101,102,103,104,105,106,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,
        123,124,125,126,127,128,130,131,132,133,135,136,137,138,139,140,141,142,143,144,145,146,147,149,150,151,
        152,154,155,156,157,159,160,161,162,164,165,166,167,169,170,171,172,174,175,176,179,180,181,184,185,186,
        189,190,191,194,195,196,199,200,201,204,206,208,210,212,214,216,220,221,225,230,231,235,236,237,238,239,
        240,241,242,245,246,247,249,250,251,252,253,254,258,259,260,261,262,263,264,266,267,268,269,270,271,272,
        273,274,275,276,277,278,279,280,281,282,283,284,285,287,288,289,290,291,292,293,294,295,312,313,314,315,
        316,317,318,320,321,323,324,326,327,329,330,332,333,335,336,338,339,341,344,345,347,348,350,351,353,354,
        368,369,370,371,372,373,376,378,379,380,381,382,383,386,387,389,390,391,392,394,395,396,397,399,400,401,
        402,403,404,405,406,407,408,409,410,412,414,415,419,420,421,422,424,425,426,427,428,429,430,431,432,433,
        434,435,436,437,438,439,440,441,442,443,444,445,454,455,456,457,458,459,460,461,462,463,464,465,466,467,
        841,845
    }
     -- validate target
    local targ
    if player:hasSpell(1) then
        player:PrintToPlayer("You already have your spells!")
        return
    elseif (target == nil) then
        targ = player
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target))
            return
        end
    end
     -- add all 75 cap spells (no avatars or blu magic)
    local save = true
    local silent = true -- prevent packet spam
    for i = 1, #ValidSpells do
        if i == #ValidSpells then
            silent = false
        end
        targ:addSpell(ValidSpells[i], silent, save)
    end
    player:PrintToPlayer("All non-BLU or SMN avatar spells now unlocked!", 0xD)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
