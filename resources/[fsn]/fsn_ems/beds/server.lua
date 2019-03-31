local beds = {
	{
		enter = {x = 333.70169067383, y = -579.32836914063, z = 43.317234039307},
		bed = {x = 334.14465332031, y = -578.15869140625, z = 44.009075164795, h = 160.98306274414},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 344.33535766602, y = -581.96209716797, z = 43.315013885498},
		bed = {x = 344.9494934082, y = -580.83331298828, z = 44.01636505127, h = 150.24169921875},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 348.57412719727, y = -583.07806396484, z = 43.315013885498},
		bed = {x = 349.83334350586, y = -583.59423828125, z = 44.016368865967, h = 257.1083984375},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 352.26821899414, y = -584.34741210938, z = 43.315017700195},
		bed = {x = 353.02993774414, y = -584.76959228516, z = 44.105567932129, h = 247.2795715332},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 355.67907714844, y = -585.49719238281, z = 43.315013885498},
		bed = {x = 356.50100708008, y = -585.82067871094, z = 44.105571746826, h = 250.98168945313},
		occupied = {false, 0, false, {0,0}},
	},
	{
		enter = {x = 359.14797973633, y = -586.76055908203, z = 43.315013885498},
		bed = {x = 360.20581054688, y = -587.06304931641, z = 44.016361236572, h = 245.10762023926},
		occupied = {false, 0, false, {0,0}},
	},
}

RegisterNetEvent('fsn_ems:bed:occupy')
RegisterNetEvent('fsn_ems:bed:leave')
RegisterNetEvent('fsn_ems:bed:restraintoggle')
RegisterNetEvent('fsn_ems:bed:health')

AddEventHandler('fsn_ems:bed:health', function(bed, current, maximum)
	beds[bed].occupied[4][1] = current
	beds[bed].occupied[4][2] = maximum
	TriggerClientEvent('fsn_ems:bed:update', -1, bed, beds[bed])
end)

AddEventHandler('fsn_ems:bed:restraintoggle', function(bed)
	beds[bed].occupied[3] = not beds[bed].occupied[3]
	TriggerClientEvent('fsn_ems:bed:update', -1, bed, beds[bed])
end)

AddEventHandler('fsn_ems:bed:occupy', function(bed)
	beds[bed].occupied[1] = not beds[bed].occupied[1]
	beds[bed].occupied[2] = source
	TriggerClientEvent('fsn_ems:bed:update', -1, bed, beds[bed])
end)

AddEventHandler('fsn_ems:bed:leave', function(bed)
	beds[bed].occupied[1] = not beds[bed].occupied[1]
	beds[bed].occupied[2] = 0
	TriggerClientEvent('fsn_ems:bed:update', -1, bed, beds[bed])
end)