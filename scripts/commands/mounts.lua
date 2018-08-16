---------------------------------------------------------------------------------------------------
-- func: mounts
-- desc: prints a list of mounts to the player

--[[CHOCOBO        = 0, QUEST_RAPTOR   = 1, RAPTOR         = 2, TIGER          = 3,
    CRAB           = 4, RED_CRAB       = 5, BOMB           = 6, RAM            = 7,
    MORBOL         = 8, CRAWLER        = 9, FENRIR         = 10, BEETLE         = 11,
    MOOGLE         = 12, MAGIC_POT      = 13, TULFAIRE       = 14, WARMACHINE     = 15,
	XZOMIT         = 16, HIPPOGRYPH     = 17, SPECTRAL_CHAIR = 18, SPHEROID       = 19,
    OMEGA          = 20 ]]
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    player:PrintToPlayer("~ !beetle !blucrab !bomb !crawler !detect !fenrir !gryphon !magipot !moogle", 0xE);
	player:PrintToPlayer("~ !morbol !omega !ram !raptor !redcrab !tank !tiger !tulfy !warden !xzomit", 0xE);
end;
