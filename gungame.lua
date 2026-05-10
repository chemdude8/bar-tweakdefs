-- gungame v1
-- no need to copy since I'm not making new unit types altogether UnitDefs.armflea = table.copy(UnitDefs.armpw)
local evolveOrder = {"armpw","corstorm", "armham", "legcen", "legbar", "cormort", "cortrem", "armsptk", "corkorg" }
 -- corkorg jugg to finish
local unitDef

UnitDefs["corkorg"].autoheal=100000
UnitDefs["corkorg"].sightdistance=100000
UnitDefs["corkorg"].radardistance=100000

UnitDefs["corkorg"].weapondefs['cor_advsam'] = {
				areaofeffect = 425,
				avoidfeature = false,
				avoidfriendly = false,
				burnblow = true,
				canattackground = false,
				castshadow = false,
				cegtag = "missiletrailaa-large",
				collidefriendly = false,
				craterareaofeffect = 425,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.75,
				energypershot = 1,
				explosiongenerator = "custom:genericshellexplosion-huge-aa",
				firestarter = 90,
				flighttime = 2.2,
				impulsefactor = 0,
				metalpershot = 0,
				model = "corscreamermissile.s3o",
				name = "Long-range heavy g2a missile launcher",
				noselfdamage = true,
				proximitypriority = -1,
				range = 2400,
				reloadtime = 0.1,
				smokecolor = 0.9,
				smokeperiod = 2,
				smokesize = 9,
				smoketime = 20,
				smoketrail = true,
				smoketrailcastshadow = false,
				soundhit = "impact",
				soundhitvolume = 8,
				soundhitwet = "splslrg",
				soundstart = "aarocket",
				soundstartvolume = 8,
				sprayangle = 10000,
				startvelocity = 1400,
				stockpile = false,
				stockpiletime = 14,
				texture1 = "null",
				texture2 = "smoketrailaaflak",
				tolerance = 10000,
				tracks = true,
				trajectoryheight = 0.55,
				turnrate = 99000,
				turret = true,
				weaponacceleration = 1000,
				weapontype = "MissileLauncher",
				weaponvelocity = 1850,
				customparams = {
					stockpilelimit = 5,
				},
				damage = {
					vtol = 99999,
				},
			}
UnitDefs["corkorg"].weapons[#UnitDefs["corkorg"].weapons+1] =  {
				badtargetcategory = "NOTAIR",
				def = "COR_ADVSAM",
				onlytargetcategory = "VTOL",
		}




local function unit(name)
	unitDef = UnitDefs[name]
	return unitDef
end

UnitDefs["ggeff"] = table.copy(UnitDefs["comeffigylvl1"])
for i=1 , #evolveOrder - 1 do
	
	unit(evolveOrder[i])
	
		UnitDefs[evolveOrder[i].."eff"] = table.copy(UnitDefs[ "corfink" ])
		--UnitDefs[evolveOrder[i].."eff"] = table.copy(UnitDefs[ evolveOrder[i] ])
		UnitDefs[evolveOrder[i].."eff"].customparams.iseffigy = true
		UnitDefs[evolveOrder[i].."eff"].sightdistance = 0
		UnitDefs[evolveOrder[i].."eff"].radardistance = 0
		UnitDefs[evolveOrder[i].."eff"].weapondefs = {}
        UnitDefs[evolveOrder[i].."eff"].cruisealtitude = 400
		UnitDefs[evolveOrder[i].."eff"].health = 1000
		-- UnitDefs["zggeff"..i] = table.copy(UnitDefs["comeffigylvl1"])
        

        -- effigy theories
		
		--[[
        UnitDefs[evolveOrder[i].."eff"].maxacc = 0.0
		UnitDefs[evolveOrder[i].."eff"].activatewhenbuilt = true
		UnitDefs[evolveOrder[i].."eff"].autoheal = 1000
		UnitDefs[evolveOrder[i].."eff"].maxdec = 0
		UnitDefs[evolveOrder[i].."eff"].builddistance = 145
		UnitDefs[evolveOrder[i].."eff"].buildpic = "COMEFFIGY.DDS"
		UnitDefs[evolveOrder[i].."eff"].buildtime = 6000
		UnitDefs[evolveOrder[i].."eff"].cancloak = true
		UnitDefs[evolveOrder[i].."eff"].canmove = false
		UnitDefs[evolveOrder[i].."eff"].canselfdestruct = true
		UnitDefs[evolveOrder[i].."eff"].capturable = false
		UnitDefs[evolveOrder[i].."eff"].cloakcost = 0
	    UnitDefs[evolveOrder[i].."eff"].cloakcostmoving = 0
		UnitDefs[evolveOrder[i].."eff"].cloaktimeout = 0
		UnitDefs[evolveOrder[i].."eff"].collisionvolumeoffsets = "0 3 0"
		UnitDefs[evolveOrder[i].."eff"].collisionvolumescales = "0 0 0"
		UnitDefs[evolveOrder[i].."eff"].collisionvolumetype = "CylY"
		UnitDefs[evolveOrder[i].."eff"].corpse = "HEAP"
		UnitDefs[evolveOrder[i].."eff"].explodeas = "decoycommander"
		UnitDefs[evolveOrder[i].."eff"].footprintx = 2
		UnitDefs[evolveOrder[i].."eff"].footprintz = 2
		UnitDefs[evolveOrder[i].."eff"].hidedamage = false
    	UnitDefs[evolveOrder[i].."eff"].holdsteady = true
		UnitDefs[evolveOrder[i].."eff"].initcloaked = false
		UnitDefs[evolveOrder[i].."eff"].sightemitheight = 40
		UnitDefs[evolveOrder[i].."eff"].mass = 1
		UnitDefs[evolveOrder[i].."eff"].health = 9999
        UnitDefs[evolveOrder[i].."eff"].weapons = {}
		]]


		

		-- unitDef.builder = true
		-- unitDef.customparams.iscommander = true
        unitDef.customparams.evolution_target = evolveOrder[i+1]
        unitDef.customparams.evolution_condition = "xp"
		unitDef.customparams.inheritxpratemultiplier = 0.0
        -- may need to move the xp threshold into the unit list...
        unitDef.customparams.evolution_xp_threshold = 0.02 * i
        unitDef.customparams.respawn_condition = "health"
		-- try using one effigy as the effigy for all units?
	    -- unitDef.customparams.effigy = "ggeff"
        unitDef.customparams.effigy = evolveOrder[i].."eff"
		
		unitDef.customparams.respawn_health_threshold = 0
        unitDef.customparams.respawn_pad = true
        unitDef.customparams.effigy_offset = 1
        unitDef.customparams.minimum_respawn_stun = 0
        unitDef.customparams.distance_stun_multiplier = 0
        unitDef.customparams.respawn_health = unitDef.health
        unitDef.customparams.respawn_stun_duration = 0
		unitDef.customparams.destructive_respawn = 4
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



