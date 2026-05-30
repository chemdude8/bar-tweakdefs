-- gungame v1
-- no need to copy since I'm not making new unit types altogether UnitDefs.armflea = table.copy(UnitDefs.armpw)
local evolveOrder = {{unitname= "armpw", evolvexpmod= 0.03},{unitname= "corstorm", evolvexpmod= 0.06}, {unitname= "armham", evolvexpmod= 0.09},
 {unitname= "legcen", evolvexpmod= 0.12},{unitname= "legbar", evolvexpmod= 0.15}, {unitname= "cormort", evolvexpmod= 0.18}, {unitname= "cortrem", evolvexpmod= 0.20},
 {unitname= "armsptk", evolvexpmod= 0.35}, {unitname= "legeheatraymech", evolvexpmod= 1}}
local unitDef

-- Ending unit increase AA to clear spawners
UnitDefs["legeheatraymech"].autoheal=100000
UnitDefs["legeheatraymech"].sightdistance=100000
UnitDefs["legeheatraymech"].radardistance=100000
UnitDefs["legeheatraymech"].weapondefs["legflak_gun"].range = 10000
UnitDefs["legeheatraymech"].weapondefs["legflak_gun"].reloadtime = 0.5
UnitDefs["legeheatraymech"].weapondefs["legflak_gun"].damage.vtol = 10000

UnitDefs["legeheatraymech"].weapondefs["heatray1"].range = 10000
UnitDefs["legeheatraymech"].weapondefs["heatray1"].energypershot = 0.1


local function unit(name)
	unitDef = UnitDefs[name]
	return unitDef
end

-- UnitDefs["ggeff"] = table.copy(UnitDefs["comeffigylvl1"])
for i=1 , #evolveOrder - 1 do
	
	unit(evolveOrder[i].unitname)
	
		UnitDefs[evolveOrder[i].unitname.."eff"] = table.copy(UnitDefs[ "armhvytrans" ])
		--UnitDefs[evolveOrder[i].unitname.."eff"] = table.copy(UnitDefs[ evolveOrder[i].unitname ])
		UnitDefs[evolveOrder[i].unitname.."eff"].customparams.iseffigy = true
		UnitDefs[evolveOrder[i].unitname.."eff"].sightdistance = 0
		UnitDefs[evolveOrder[i].unitname.."eff"].radardistance = 0
		UnitDefs[evolveOrder[i].unitname.."eff"].weapondefs = {}
        UnitDefs[evolveOrder[i].unitname.."eff"].cruisealtitude = 400
		-- make it healthy against everything but the gameender
		UnitDefs[evolveOrder[i].unitname.."eff"].health = 10000
		-- set low metal cost since that impacts the xp given
		UnitDefs[evolveOrder[i].unitname.."eff"].metalcost = 1
		-- hopefully makes it fly on start?
		UnitDefs[evolveOrder[i].unitname.."eff"].activatewhenbuilt = true
		-- UnitDefs["zggeff"..i] = table.copy(UnitDefs["comeffigylvl1"])
        

        -- effigy theories
		
		--[[
        UnitDefs[evolveOrder[i].unitname.."eff"].maxacc = 0.0
		UnitDefs[evolveOrder[i].unitname.."eff"].activatewhenbuilt = true
		UnitDefs[evolveOrder[i].unitname.."eff"].autoheal = 1000
		UnitDefs[evolveOrder[i].unitname.."eff"].maxdec = 0
		UnitDefs[evolveOrder[i].unitname.."eff"].builddistance = 145
		UnitDefs[evolveOrder[i].unitname.."eff"].buildpic = "COMEFFIGY.DDS"
		UnitDefs[evolveOrder[i].unitname.."eff"].buildtime = 6000
		UnitDefs[evolveOrder[i].unitname.."eff"].cancloak = true
		UnitDefs[evolveOrder[i].unitname.."eff"].canmove = false
		UnitDefs[evolveOrder[i].unitname.."eff"].canselfdestruct = true
		UnitDefs[evolveOrder[i].unitname.."eff"].capturable = false
		UnitDefs[evolveOrder[i].unitname.."eff"].cloakcost = 0
	    UnitDefs[evolveOrder[i].unitname.."eff"].cloakcostmoving = 0
		UnitDefs[evolveOrder[i].unitname.."eff"].cloaktimeout = 0
		UnitDefs[evolveOrder[i].unitname.."eff"].collisionvolumeoffsets = "0 3 0"
		UnitDefs[evolveOrder[i].unitname.."eff"].collisionvolumescales = "0 0 0"
		UnitDefs[evolveOrder[i].unitname.."eff"].collisionvolumetype = "CylY"
		UnitDefs[evolveOrder[i].unitname.."eff"].corpse = "HEAP"
		UnitDefs[evolveOrder[i].unitname.."eff"].explodeas = "decoycommander"
		UnitDefs[evolveOrder[i].unitname.."eff"].footprintx = 2
		UnitDefs[evolveOrder[i].unitname.."eff"].footprintz = 2
		UnitDefs[evolveOrder[i].unitname.."eff"].hidedamage = false
    	UnitDefs[evolveOrder[i].unitname.."eff"].holdsteady = true
		UnitDefs[evolveOrder[i].unitname.."eff"].initcloaked = false
		UnitDefs[evolveOrder[i].unitname.."eff"].sightemitheight = 40
		UnitDefs[evolveOrder[i].unitname.."eff"].mass = 1
		UnitDefs[evolveOrder[i].unitname.."eff"].health = 9999
        UnitDefs[evolveOrder[i].unitname.."eff"].weapons = {}
		]]


		

		-- unitDef.builder = true
		unitDef.customparams.iscommander = true
        unitDef.customparams.evolution_target = evolveOrder[i+1].unitname
        unitDef.customparams.evolution_condition = "xp"
		unitDef.customparams.inheritxpratemultiplier = 0.0
        -- may need to move the xp threshold into the unit list...
        unitDef.customparams.evolution_xp_threshold = evolveOrder[i].evolvexpmod
        unitDef.customparams.respawn_condition = "health"
		-- try using one effigy as the effigy for all units?
	    -- unitDef.customparams.effigy = "ggeff"
        unitDef.customparams.effigy = evolveOrder[i].unitname.."eff"
		
		unitDef.customparams.respawn_health_threshold = 0
        unitDef.customparams.respawn_pad = 1
        unitDef.customparams.effigy_offset = 1
        unitDef.customparams.minimum_respawn_stun = 0
        unitDef.customparams.distance_stun_multiplier = 0
        unitDef.customparams.respawn_health = unitDef.health
        unitDef.customparams.respawn_stun_duration = 0
		-- how many times you get to attempt a given level
		unitDef.customparams.destructive_respawn = 20
end


coms = {"corcom", "armcom", "legcom"}
for _, i in pairs(coms) do
	unit(i)
		if (unitDef) then
		unitDef.weapons = {}
        unitDef.weapondefs = {}
        unitDef.customparams.evolution_target = "armpw"
		-- unitDef.customparams.evolution_target ="corkorg"
        unitDef.customparams.evolution_condition = "xp"
        unitDef.customparams.evolution_xp_threshold = 0
		end
end

Spring.Echo("Welcome to gun game!")



