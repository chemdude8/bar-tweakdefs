--ApocalypseCommNukes V1.1
for name, unitDef in pairs(UnitDefs) do
        if name == 'armsilo' then
            unitDef.metalcost = 1
            unitDef.energycost =1
            unitDef.buildtime = 1
            unitDef['weapondefs']['nuclear_missile'].energypershot = 1
            unitDef['weapondefs']['nuclear_missile'].metalpershot = 100
            unitDef['weapondefs']['nuclear_missile'].stockpiletime = 20
 
        end
        if name == 'armnuke' or name == 'cornuke' then
            unitDef.metalcost = 1
            unitDef.energycost =1
            unitDef.buildtime  = 100
        end
        if name == 'armcom' or name == 'corcom' or name =='legcom' then
            table.insert(unitDef.buildoptions, 'armsilo')
        end
end