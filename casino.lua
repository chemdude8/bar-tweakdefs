-- Casino v1

local unitDef

local function unit(name)
	unitDef = UnitDefs[name]
	return unitDef
end


local randomUnitsStringByMetalCostTable = {}

local disabledUnits = {
    ["volcano_projectile_unit"] = true,
    ["legmlv"] = true,
	["cormlv"] = true,
	["armmlv"] = true
}

local shipUnitsByMetalCost = {}

for name, unitDef in pairs(UnitDefs) do
        if not disabledUnits[name] and unitDef.metalcost and unitDef.metalcost > 10 then
		    table.insert(randomUnitsStringByMetalCostTable, name)
			for i = 1, math.max(40, (50000 / unitDef.metalcost)) do
                -- check for ships:
                if (unitDef and unitDef.customparams and unitDef.customparams.subfolder and string.find(unitDef.customparams.subfolder:lower(), "ship", 1, true)) then
                    table.insert(shipUnitsByMetalCost, name) 
                else
                    table.insert(randomUnitsStringByMetalCostTable, name)
                end
			end
        end
end


randomUnitsStringByMetalCostString = table.concat(randomUnitsStringByMetalCostTable, " ")

print("woot33")
print(randomUnitsStringByMetalCostString)

coms = {"corcom", "armcom", "legcom"}
for _, i in pairs(coms) do
	unit(i)
	    unitDef.builder = false
		unitDef.weapons = {			[1] = {
				badtargetcategory = "VTOL GROUNDSCOUT SHIP",
				def = "BOTCANNON",
				onlytargetcategory = "NOTSHIP",
			},
            --[[ [2] = {
				badtargetcategory = "VTOL GROUNDSCOUT",
				def = "SHIPCANNON",
				onlytargetcategory = "ALL",
			}]]
                }
        unitDef.weapondefs = {
		botcannon = {
				accuracy = 0.2,
				areaofeffect = 10,
				avoidfeature = false,
				avoidfriendly = false,
				burst = 2,
				burstrate = 0.1,
				collidefriendly = false,
				craterareaofeffect = 116,
				craterboost = 0.1,
				cratermult = 0.1,
				edgeeffectiveness = 0.15,
				energypershot = 100,
				explosiongenerator = "custom:botrailspawn",
				gravityaffected = "true",
				heightboostfactor = 8,
				hightrajectory = 1,
				impulsefactor = 0.5,
				leadbonus = 0,
				model = "LegionUnitCapsule.s3o",
				movingaccuracy = 600,
				mygravity = 4.8,
				name = "Long range bot cannon",
				noselfdamage = true,
				range = 500,
				reloadtime = 0.9,
				sprayangle = 2800,
				stockpile = true,
				stockpiletime = 4,
				soundhit = "xplonuk1xs",
				soundhitwet = "splshbig",
				soundstart = "lrpcshot3",
				soundstartvolume = 50,
				turret = true,
				trajectoryheight = 1,
				waterbounce = true,
				bounceSlip = 0.74,
				bouncerebound = 0.5,
				numbounce = 10,
				weapontype = "Cannon",
				weaponvelocity = 2000,
				customparams = {
					spawns_name = randomUnitsStringByMetalCostString,
					spawns_expire = 25000,
					spawns_surface = "LAND", -- Available: "LAND SEA"
					spawns_mode = "random",
					stockpilelimit = 10,
					weapons_group = 1,
				},
				damage = {
					default = 0,
					shields = 250,
				},
			},
            --[[ shipcannon = {
				accuracy = 0.2,
				areaofeffect = 10,
				avoidfeature = false,
				avoidfriendly = false,
				burst = 2,
				burstrate = 0.1,
				collidefriendly = false,
				craterareaofeffect = 116,
				craterboost = 0.1,
				cratermult = 0.1,
				edgeeffectiveness = 0.15,
				energypershot = 100,
				explosiongenerator = "custom:botrailspawn",
				gravityaffected = "true",
				heightboostfactor = 8,
				hightrajectory = 1,
				impulsefactor = 0.5,
				leadbonus = 0,
				model = "LegionUnitCapsule.s3o",
				movingaccuracy = 600,
				mygravity = 4.8,
				name = "Long range bot cannon",
				noselfdamage = true,
				range = 500,
				reloadtime = 0.9,
				sprayangle = 2800,
				stockpile = true,
				stockpiletime = 4,
				soundhit = "xplonuk1xs",
				soundhitwet = "splshbig",
				soundstart = "lrpcshot3",
				soundstartvolume = 50,
				turret = true,
				trajectoryheight = 1,
				waterbounce = true,
				bounceSlip = 0.74,
				bouncerebound = 0.5,
				numbounce = 10,
				weapontype = "Cannon",
				weaponvelocity = 2000,
				customparams = {
					spawns_name = shipUnitsByMetalCost,
					spawns_expire = 25000,
					spawns_surface = "SEA", -- Available: "LAND SEA"
					spawns_mode = "random",
					stockpilelimit = 10,
					weapons_group = 2,
				},
				damage = {
					default = 0,
					shields = 250,
				},
			} ]]
		}
end




			






