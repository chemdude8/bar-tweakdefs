-- gungame grunt/pawn xp evo
-- no need to copy since I'm not making new unit types altogether UnitDefs.armflea = table.copy(UnitDefs.armpw)
local evolveOrder = {"armpw","corstorm", "armham", "legcen", "legbar", "cormort", "cortrem", "armsptk", "corkorg" }
 -- corkorg jugg to finish
local unitDef

UnitDefs["corkorg"].autoheal=100000

local function unit(name)
	unitDef = UnitDefs[name]
	return unitDef
end

for i=1 , #evolveOrder - 1 do
	unit(evolveOrder[i])
        UnitDefs["zggeff"..i] = table.copy(UnitDefs["comeffigylvl1"])

        -- UnitDefs["zggeff"..i].customparams.iseffigy = true

        -- effigy theories
		--[[
        UnitDefs["zggeff"..i].maxacc = 0.0
		UnitDefs["zggeff"..i].activatewhenbuilt = true
		UnitDefs["zggeff"..i].autoheal = 1000
		UnitDefs["zggeff"..i].maxdec = 0
		UnitDefs["zggeff"..i].builddistance = 145
		UnitDefs["zggeff"..i].buildpic = "COMEFFIGY.DDS"
		UnitDefs["zggeff"..i].buildtime = 6000
		UnitDefs["zggeff"..i].cancloak = true
		UnitDefs["zggeff"..i].canmove = false
		UnitDefs["zggeff"..i].canselfdestruct = false
		UnitDefs["zggeff"..i].capturable = false
		UnitDefs["zggeff"..i].cloakcost = 0
	    UnitDefs["zggeff"..i].cloakcostmoving = 0
		UnitDefs["zggeff"..i].cloaktimeout = 0
		UnitDefs["zggeff"..i].collisionvolumeoffsets = "0 3 0"
		UnitDefs["zggeff"..i].collisionvolumescales = "0 0 0"
		UnitDefs["zggeff"..i].collisionvolumetype = "CylY"
		UnitDefs["zggeff"..i].corpse = "HEAP"
		UnitDefs["zggeff"..i].explodeas = "decoycommander"
		UnitDefs["zggeff"..i].footprintx = 2
		UnitDefs["zggeff"..i].footprintz = 2
		UnitDefs["zggeff"..i].hidedamage = false
    	UnitDefs["zggeff"..i].holdsteady = true
		UnitDefs["zggeff"..i].initcloaked = false
		UnitDefs["zggeff"..i].sightemitheight = 40
		UnitDefs["zggeff"..i].mass = 4900
		UnitDefs["zggeff"..i].health = 9999
        UnitDefs["zggeff"..i].weapons = {}
        UnitDefs["zggeff"..i].weapondefs = {}
		
        -- UnitDefs[evolveOrder[i].."eff"].canfly = true
        -- UnitDefs[evolveOrder[i].."eff"].cruisealtitude = 100
        UnitDefs["zggeff"..i].customparams.destructive_respawn = false
        UnitDefs["zggeff"..i].customparams.respawn_pad = true
        UnitDefs["zggeff"..i].customparams.i18nfromunit = "zggeff"..i -- evolveOrder[i].."eff" -- "armpweff" -- evolveOrder[i].."eff"
        -- UnitDefs[evolveOrder[i].."eff"].customparams.effigy = evolveOrder[i].."eff"
        --
		]]
		UnitDefs["zggeff"..i].destructive_respawn = false
		--UnitDefs["zggeff"..i].respawn_pad = true
		UnitDefs["zggeff"..i].customparams.destructive_respawn = false
		UnitDefs["zggeff"..i].customparams.respawn_pad = true

		-- unitDef.builder = true
		-- unitDef.customparams.iscommander = true
        unitDef.customparams.evolution_target = evolveOrder[i+1]
        unitDef.customparams.evolution_condition = "xp"
		unitDef.customparams.inheritxpratemultiplier = 0.0
        -- may need to move the xp threshold into the unit list...
        unitDef.customparams.evolution_xp_threshold = 0.02 * i
        unitDef.customparams.respawn_condition = "health"
		-- try using one effigy as the effigy for all units?
	    unitDef.customparams.effigy = "zggeff".."1"
        -- unitDef.customparams.effigy = evolveOrder[i].."eff"
       -- unitDef.customparams.destructive_respawn = 0
		-- unitDef.destructive_respawn = false
		unitDef.customparams.respawn_health_threshold = 0
        unitDef.customparams.respawn_pad = true
		unitDef.respawn_pad = true
        unitDef.customparams.effigy_offset = 1
        unitDef.customparams.minimum_respawn_stun = 0
        unitDef.customparams.distance_stun_multiplier = 0
         unitDef.customparams.respawn_health = 123
        unitDef.customparams.respawn_stun_duration = 0
end


coms = {"corcom", "armcom", "legcom"}
for _, i in pairs(coms) do
	unit(i)
		unitDef.weapons = {}
        unitDef.weapondefs = {}
        unitDef.customparams.evolution_target = "armpw"
        unitDef.customparams.evolution_condition = "xp"
        unitDef.customparams.evolution_xp_threshold = 0
end

Spring.Echo("Welcome to gun game!")


-- could you make the effigies targetable by the end-unit? i.e. make them air and end unit have AA?


-- woot need to figure out how to get it to respawn the flea with effigies ideally....


--[[ **** why multiple respawns are not working
unit_respawning.lua:165 has the following:
                destructive_respawn = udcp.destructive_respawn or true,

So even if you set the customparams to false, the above line will still set it to true I believe.  Really should be checking if udcp.destructive_respawn is not nil and using true as a default instead of true overridding always.

]]

