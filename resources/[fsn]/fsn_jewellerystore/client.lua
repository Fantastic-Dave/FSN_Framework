local vehicle_colours = {
	'Black',
	'Graphite',
	'Black Steel',
	'Silver',
	'Bluish Silver',
	'Rolled Steel',
	'Shadow Silver',
	'Stone Silver',
	'Midnight Silver',
	'Cast Iron Silver',
	'Anthractite Black',
	'Matte Black',
	'Matte Gray',
	'Light Gray',
	'Util Black',
	'Util Black Poly',
	'Util Dark Silver',
	'Util Silver',
	'Util Gun Metal',
	'Util Shadow Silver',
	'Worn Black',
	'Worn Graphite',
	'Worn Silver Gray',
	'Worn Silver',
	'Worn Blue Silver',
	'Worn Shadow Silver',
	'Red',
	'Torino Red',
	'Formula Red',
	'Blaze Red',
	'Grace Red',
	'Garnet Red',
	'Sunset Red',
	'Cabernet Red',
	'Candy Red',
	'Sunrise Orange',
	'Gold',
	'Orange',
	'Red',
	'Dark Red',
	'Matte Orange',
	'Yellow',
	'Util Red',
	'Util Bright Red',
	'Util Garnet Red',
	'Worn Red',
	'Worn Golden Red',
	'Worn Dark Red',
	'Dark Green',
	'Metallic Racing Green',
	'Sea Green',
	'Olive Green',
	'Bright Green',
	'Metalic Gasoline Green',
	'Matte Lime Green',
	'Dark Green',
	'Worn Green',
	'Worn Sea Wash',
	'Metallic Midnight Blue',
	'Metallic Dark Blue',
	'Galaxy Blue',
	'Dark Blue',
	'Saxon Blue',
	'Blue',
	'Mariner Blue',
	'Harbor Blue',
	'Diamond Blue',
	'Surf Blue',
	'Nautical Blue',
	'Ultra Blue',
	'Schafter Purple',
	'Metallic Ultra Blue',
	'Racing Blue',
	'Light Blue',
	'Util Midnight Blue',
	'Util Blue',
	'Util Sea Foam Blue',
	'Util Lightening Blue',
	'Util Maui Blue Poly',
	'Util Bright Blue',
	'Slate Blue',
	'Dark Blue',
	'Blue',
	'Matte Midnight Blue',
	'Worn Dark Blue',
	'Worn Blue',
	'Baby Blue',
	'Yellow',
	'Race Yellow',
	'Bronze',
	'Dew Yellow',
	'Metallic Lime',
	'Metalic Champagne',
	'Feltzer Brown',
	'Creek Brown',
	'Chocolate Brown',
	'Maple Brown',
	'Saddle Brown',
	'Straw Brown',
	'Moss Brown',
	'Bison Brown',
	'Woodbeech Brown',
	'Beechwood Brown',
	'Straw Brown',
	'Sandy Brown',
	'Bleached Brown',
	'Cream',
	'Util Brown',
	'Util Medium Brown',
	'Util Light Brown',
	'Ice White',
	'Frost White',
	'Worn Honey Beige',
	'Worn Brown',
	'Dark Brown',
	'Worn Straw Beige',
	'Brushed Steel',
	'Brushed Black Steel',
	'Brushed Alluminum',
	'Chrome',
	'Worn Off-White',
	'Util Off-White',
	'Worn Orange',
	'Worn Light Orange',
	'Pea Green',
	'Worn Taxi Yellow',
	'Police Blue',
	'Green',
	'Matte Brown',
	'Worn Orange',
	'Ice White',
	'Worn White',
	'Worn Olive Army Green',
	'Pure White',
	'Hot Pink',
	'Salmon Pink',
	'Pfistrer Pink',
	'Bright Orange',
	'Green',
	'Flourescent Blue',
	'Midnight Blue',
	'Midnight Purple',
	'Wine Red',
	'Hunter Green',
	'Bright Purple',
	'Midnight Purple',
	'Carbon Black',
	'Matte Purple',
	'Matte Dark Purple',
	'Metallic Lava Red',
	'Olive Green',
	'Matte Olive Orab',
	'Dark Earth',
	'Desert Tan',
	'Matte Foilage Green',
	'Default Alloy',
	'Epsilon Blue',
	'Pure Gold',
	'Brushed Gold',
	'Secret Gold'
}

local outside = {x = -635.22967529297, y = -239.55569458008, z = 37.624103546143}
local backroom = {x = -630.63171386719, y = -229.15394592285, z = 38.057052612305}
local till = {x = -622.32482910156, y = -229.89263916016, z = 38.057052612305}
local centre = {x = -622.00439453125, y = -230.77331542969, z = 38.057022094727}

local amilocked = false
local doors = {
	[1] = { -- left
		mdl = 1425919976,
		x = -631.955,
		y = -236.333,
		z = 38.206,
	},
	[2] = { -- right
		mdl = 9467943,
		x = -630.426,
		y = -238.437,
		z = 38.206
	}
}
RegisterNetEvent('fsn_commands:police:lock')
AddEventHandler('fsn_commands:police:lock', function()
	if GetDistanceBetweenCoords(doors[1].x, doors[1].y, doors[1].z, GetEntityCoords(GetPlayerPed(-1)), true) < 3 or GetDistanceBetweenCoords(doors[2].x, doors[2].y, doors[2].z, GetEntityCoords(GetPlayerPed(-1)), true) < 3 then
		print 'you can lock/unlock the door at jewellerystore'
		TriggerServerEvent('fsn_jewellerystore:doors:toggle')
	end
end)
RegisterNetEvent('fsn_jewellerystore:doors:State')
AddEventHandler('fsn_jewellerystore:doors:State', function(state)
	amilocked = state
end)

local isgasdoorLocked = false
local gasdoor = {mdl= 161378502, loc = {x=3557.660, y=3669.192, z=27.118}, txt={x = 3557.6176757813, y = 3669.7663574219, z = 28.121891021729}}
RegisterNetEvent('fsn_jewellerystore:gasDoor:toggle')
AddEventHandler('fsn_jewellerystore:gasDoor:toggle', function()
	isgasdoorLocked = not isgasdoorLocked
end)
local gasuse = {x = -628.78393554688, y = -226.52185058594, z = 55.901119232178}

local guardmdls = {'s_m_m_armoured_01', 's_m_m_armoured_02', 's_m_m_chemsec_01'}
local guardWeapon = 'WEAPON_CARBINERIFLE'
local guardlocs = {
	[1] = {x = -631.37310791016, y = -235.05155944824, z = 38.05704498291, h = 308.68231201172, ped=false, tenthirteen=false},
	[2] = {x = -629.10021972656, y = -238.28601074219, z = 38.05704498291, h = 315.65130615234, ped=false, tenthirteen=false},
	[3] = {x = -615.44744873047, y = -230.43145751953, z = 38.057022094727, h = 127.00442504883, ped=false, tenthirteen=false},
	[4] = {x = -619.76403808594, y = -224.42778015137, z = 38.056983947754, h = 128.99319458008, ped=false, tenthirteen=false},
	[5] = {x = -626.38409423828, y = -228.23585510254, z = 38.057060241699, h = 267.1194152832, ped=false, tenthirteen=false},
	[6] = {x = -621.15222167969, y = -235.51699829102, z = 38.057048797607, h = 339.47375488281, ped=false, tenthirteen=false},
}
local guards = false
function TriggerGuardAttack()
	for key, guard in pairs(guardlocs) do
		if guard.ped then
			--SetBlockingOfNonTemporaryEvents(guard.ped, false)
			GiveWeaponToPed(guard.ped, GetHashKey(guardWeapon), 200, true, true)
			TaskCombatPed(guard.ped, GetPlayerPed(-1), 0, 16)
			SetPedCombatRange(guard.ped, 2)
			SetPedCombatMovement(guard.ped, 2)
			SetCanAttackFriendly(guard.ped, false, false)
			SetPedCanBeTargettedByTeam(guard.ped, false, false)
		end
	end
end

local blips = false
local cases = {
	{-626.5326, -238.3758, 38.05, blip=false, robbed=false},
	{ -625.6032, -237.5273, 38.05, blip=false, robbed=false},
	{-626.9178, -235.5166, 38.05, blip=false, robbed=false},
	{-625.6701, -234.6061, 38.05, blip=false, robbed=false},
	{-626.8935, -233.0814, 38.05, blip=false, robbed=false},
	{-627.9514, -233.8582, 38.05, blip=false, robbed=false},
	{-624.5250, -231.0555, 38.05, blip=false, robbed=false},
	{-623.0003, -233.0833, 38.05, blip=false, robbed=false},
	{-620.1098, -233.3672, 38.05, blip=false, robbed=false},
	{-620.2979, -234.4196, 38.05, blip=false, robbed=false},
	{-619.0646, -233.5629, 38.05, blip=false, robbed=false},
	{-617.4846, -230.6598, 38.05, blip=false, robbed=false},
	{-618.3619, -229.4285, 38.05, blip=false, robbed=false},
	{-619.6064, -230.5518, 38.05, blip=false, robbed=false},
	{-620.8951, -228.6519, 38.05, blip=false, robbed=false},
	{-619.7905, -227.5623, 38.05, blip=false, robbed=false},
	{-620.6110, -226.4467, 38.05, blip=false, robbed=false},
	{-623.9951, -228.1755, 38.05, blip=false, robbed=false},
	{-624.8832, -227.8645, 38.05, blip=false, robbed=false},
	{-623.6746, -227.0025, 38.05, blip=false, robbed=false},
}
RegisterNetEvent('fsn_jewellerystore:cases:update')
AddEventHandler('fsn_jewellerystore:cases:update', function(tbl)
	cases = tbl
end)

RegisterNetEvent('fsn_jewellerystore:case:startrob')
AddEventHandler('fsn_jewellerystore:case:startrob', function(caseid)
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local coords = {
		x = pos.x,
		y = pos.y,
		z = pos.z
	}
	TriggerServerEvent('fsn_police:dispatch', coords, 7)
		
	local anims = {'smash_case', 'smash_case_b', 'smash_case_c', 'smash_case_d'}
	RequestAnimDict('missheist_jewel')
	while not HasAnimDictLoaded('missheist_jewel') do
		Citizen.Wait(7500)
	end
	TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", anims[math.random(1,#anims)], 4.0, -4, -1, 1, 0, 0, 0, 0)
	robbing = true
	Citizen.Wait(7500)
	ClearPedTasks(GetPlayerPed(-1))
	robbing = false
	TriggerEvent('fsn_inventory:item:add', 'dirty_money', math.random(1000,1500))
	FreezeEntityPosition(GetPlayerPed(-1), false)
end)

function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.3, 0.3)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 140)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

function IsPedDriving()
	if IsPedInAnyVehicle(GetPlayerPed(-1)) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) then
		return true
	else
		return false
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(outside.x, outside.y, outside.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			if not exports["fsn_police"]:fsn_PDDuty() and IsPedDriving() then
				local pos = GetEntityCoords(GetPlayerPed(-1))
				local coords = {
					x = pos.x,
					y = pos.y,
					z = pos.z
				}
				local holdingcar = GetVehiclePedIsIn(GetPlayerPed(-1))
				local colour = table.pack(GetVehicleColours(holdingcar))
				colour = colour[1]
				colour = vehicle_colours[colour+1]
				local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(holdingcar))
				local plate = GetVehicleNumberPlateText(holdingcar)
				TriggerServerEvent('fsn_police:dispatch', coords, 13, '10-94 (SUS VEH) | Vehicle: '..vehicle..' | Plate: '..plate..' | Color: '..colour)
				Citizen.Wait(10000)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetDistanceBetweenCoords(doors[1].x, doors[1].y, doors[1].z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 or GetDistanceBetweenCoords(doors[2].x, doors[2].y, doors[2].z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			if amilocked then
				for k, v in pairs(doors) do
					local door = GetClosestObjectOfType(v.x,v.y,v.z, 1.0, v.mdl, false, false, false)
					fsn_drawText3D(v.x,v.y,v.z, '~r~LOCKED')
					FreezeEntityPosition(door, true)
				end
			else
				for k, v in pairs(doors) do
					local door = GetClosestObjectOfType(v.x,v.y,v.z, 1.0, v.mdl, false, false, false)
					FreezeEntityPosition(door, false)
				end
			end
		end
		if GetDistanceBetweenCoords(gasdoor.loc.x,gasdoor.loc.y,gasdoor.loc.z, GetEntityCoords(GetPlayerPed(-1)), true) < 5 then
			if isgasdoorLocked then
				fsn_drawText3D(gasdoor.txt.x,gasdoor.txt.y,gasdoor.txt.z, '~r~LOCKED\n~w~[E] Scan Card')
				local door = GetClosestObjectOfType(gasdoor.loc.x,gasdoor.loc.y,gasdoor.loc.z, 1.0, gasdoor.mdl, false, false, false)
				FreezeEntityPosition(door, true)
				if IsControlJustPressed(0,38) then
					if exports["fsn_inventory"]:fsn_HasItem('keycard') then
						TriggerServerEvent('fsn_inventory:gasDoorunlock')
					end
				end
			else
				local door = GetClosestObjectOfType(gasdoor.loc.x,gasdoor.loc.y,gasdoor.loc.z, 1.0, gasdoor.mdl, false, false, false)
				FreezeEntityPosition(door, false)
			end
		end
		if GetDistanceBetweenCoords(3563.146484375, 3673.47265625, 28.121885299683, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			DrawMarker(1,3563.146484375, 3673.47265625, 28.121885299683-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(3563.146484375, 3673.47265625, 28.121885299683, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("HINT: Use 'Empty Canister'")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if GetDistanceBetweenCoords(1660.0181884766, 6.2703385353088, 166.11819458008, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			DrawMarker(1,1660.0181884766, 6.2703385353088, 166.11819458008-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(1660.0181884766, 6.2703385353088, 166.11819458008, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("~INPUT_PICKUP~ grab canister")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
				if IsControlJustPressed(0,38) then
					TriggerEvent('fsn_inventory:item:add', 'empty_canister', 1)
				end
			end
		end
		if GetDistanceBetweenCoords(gasuse.x, gasuse.y, gasuse.z, GetEntityCoords(GetPlayerPed(-1)), true) < 30 then
			DrawMarker(1,gasuse.x,gasuse.y,gasuse.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
			if GetDistanceBetweenCoords(gasuse.x, gasuse.y, gasuse.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
				SetTextComponentFormat("STRING")
				AddTextComponentString("HINT: Use 'Gas Canister'")
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			end
		end
		if GetDistanceBetweenCoords(centre.x, centre.y, centre.z, GetEntityCoords(GetPlayerPed(-1)), true) < 30 then
			if NetworkIsHost() then
				if not guards then 
					for key, guard in pairs(guardlocs) do
						local mdl = GetHashKey(guardmdls[math.random(1,#guardmdls)])
						RequestModel(mdl)
						print('attempting to spawn mdl '..mdl)
						while not HasModelLoaded(mdl) do
							print('cannot load '..mdl)
							Wait(1)
						end
						guard.ped = CreatePed(2, mdl, guard.x, guard.y, guard.z, guard.h, true, true)
						guard.tenthirteen = false
						--SetBlockingOfNonTemporaryEvents(guard.ped, true)
						--SetPedCombatAttributes(guard.ped, 46, true)
						SetPedFleeAttributes(guard.ped, 0, 0)
					end
					guards = true
				else
					for key, guard in pairs(guardlocs) do
						if guard.ped and IsEntityDead(guard.ped) then
							--[[
							if not guard.tenthirteen then
								local pos = GetEntityCoords(guard.ped)
								local coords = {
									x = pos.x,
									y = pos.y,
									z = pos.z
								}
								--TriggerServerEvent('fsn_police:dispatch', coords, 4, '10-13 | IMMEDIATE BACKUP REQUESTED AT JEWELRY STORE')
								guard.tenthirteen = true
							end
							]]
						end
						if IsPedInMeleeCombat(GetPlayerPed(-1)) or IsPlayerFreeAiming(PlayerId()) then
							TriggerGuardAttack()
						end
					end
				end
			end
			if not blips then
				for key, case in pairs(cases) do
					case.blip = AddBlipForCoord(case[1], case[2], case[3])
					SetBlipSprite(case.blip, 1)
					SetBlipDisplay(case.blip, 4)
					SetBlipScale(case.blip, 0.5)
					SetBlipColour(case.blip, 2)
					SetBlipAsShortRange(case.blip, true)
					BeginTextCommandSetBlipName("STRING")
					AddTextComponentString("Robbable Case")
					EndTextCommandSetBlipName(case.blip)
				end
				blips = true
			else
				for key, case in pairs(cases) do
					if case.robbed then
						if case.blip ~= false then
							RemoveBlip(case.blip)
						end
						case.blip = false
					end
				end
			end
			for key, case in pairs(cases) do
				local inzone = false
				if GetDistanceBetweenCoords(case[1],case[2],case[3], GetEntityCoords(GetPlayerPed(-1)), true) < 0.7 then
					inzone = true
					if robbing then
						fsn_drawText3D(case[1],case[2],case[3], 'Looting...')
						FreezeEntityPosition(GetPlayerPed(-1), true)
					elseif case.robbed == false then 
						if exports["fsn_police"]:fsn_getCopAmt() > 2 then
							fsn_drawText3D(case[1],case[2],case[3], '[E] Loot Case')
							if IsControlJustPressed(0,38) then
								-- e is pressed
								TriggerServerEvent('fsn_jewellerystore:case:rob', key)
								TriggerGuardAttack()
							end
						else
							fsn_drawText3D(case[1],case[2],case[3], '~r~Ain\'t nobody around to stop you')
						end
					else
						fsn_drawText3D(case[1],case[2],case[3], 'Already looted')
					end
				end
			end
			if robbing and not inzone then
				robbing = false
			end
		else
			if blips then
				for key, case in pairs(cases) do
					if case.blip then
						RemoveBlip(case.blip)
						case.blip = false
					end
				end
				blips = false
			end
		end
	end
end)
