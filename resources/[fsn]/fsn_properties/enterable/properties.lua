enterable_properties = {
  [1] = {
    title = 'Darnell Bros Factory',
    owner = 1,
    blip = {x = 714.41790771484, y = -976.95068359375, z = 24.127908706665},
    rob_spot = {x = 707.25494384766, y = -966.89660644531, z = 30.412853240967},
    doors = {
      [1] = {desc='front left door',locked=true,hash=245182344,loc={x=716.780,y=-975.420,z=25.00},text={x=716.780,y=-975.420,z=25.00}},
      [2] = {desc='front right door',locked=true,hash=-681066206,loc={x=719.381,y=-975.418,z=25.00},text={x=719.381,y=-975.418,z=25.00}},
      [3] = {desc='office front door',locked=true,hash=551491569,loc={x=709.981,y=-963.531,z=30.545},text={x=709.981,y=-963.531,z=30.545}},
      [4] = {desc='office > storage',locked=true,hash=426403179,loc={x=707.804,y=-962.456,z=30.545},text={x=707.804,y=-962.456,z=30.545}},
      [5] = {desc='storage front door',locked=true,hash=933053701,loc={x=709.989,y=-960.667,z=30.545},text={x=709.989,y=-960.667,z=30.545}},
    },
  },
}

RegisterServerEvent('fsn_properties:doors:request')
AddEventHandler('fsn_properties:doors:request', function()
  TriggerClientEvent('fsn_properties:doors:init', source, enterable_properties)
end)

RegisterServerEvent('fsn_properties:door:unlock')
AddEventHandler('fsn_properties:door:unlock', function(propertyid, doorid)
  enterable_properties[propertyid].doors[doorid].locked = false
  TriggerClientEvent('fsn_properties:doors:init', -1, enterable_properties)
end)

RegisterServerEvent('fsn_properties:door:lock')
AddEventHandler('fsn_properties:door:lock', function(propertyid, doorid)
  enterable_properties[propertyid].doors[doorid].locked = true
  TriggerClientEvent('fsn_properties:doors:init', -1, enterable_properties)
end)
