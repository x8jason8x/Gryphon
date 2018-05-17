---------------------------------------------------------------------------------------------------
-- func: !mount1
-- desc: Spawns a chocobo.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player)

    if player:getZone():canUseMisc(dsp.zoneMisc.MOUNT) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) then
        player:addStatusEffectEx(dsp.effect.MOUNTED,dsp.effect.MOUNTED,17,0,duration,false);
    else
	    player:PrintToPlayer("<GryphonMsg> You must obtain a Chocobo License, or you can't ride mounts here!", 0xE);
    end
--[[CHOCOBO        = 0,
    QUEST_RAPTOR   = 1,
    RAPTOR         = 2,
    TIGER          = 3,
    CRAB           = 4,
    RED_CRAB       = 5,
    BOMB           = 6,
    RAM            = 7,
    MORBOL         = 8,
    CRAWLER        = 9,
    FENRIR         = 10,
    BEETLE         = 11,
    MOOGLE         = 12,
    MAGIC_POT      = 13,
    TULFAIRE       = 14,
    WARMACHINE     = 15,
    XZOMIT         = 16,
    HIPPOGRYPH     = 17,
    SPECTRAL_CHAIR = 18,
    SPHEROID       = 19,
    OMEGA          = 20,
    -- 20 yellow
    -- 21 black
    -- 22 blue
    -- 23 red
    -- 24 green]]
end;
