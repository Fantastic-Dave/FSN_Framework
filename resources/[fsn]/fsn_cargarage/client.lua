local garages = {
	["Peaceful street"] = {
		pos = {x = -294.14520263672, y = -762.88854980469, z = 33.968509674072, h = 50.745643615723},
		type = 'cars',
		blip = 50,
	},
	["Great Ocean Hwy"] = {
		pos = {x = -195.20651245117, y = 6225.5185546875, z = 31.062280654907, h = 47.219085693359},
		type = 'cars',
		blip = 50,
	},
	["Panorama Drv"] = {
		pos = {x = 1767.6580810547, y = 3346.2253417969, z = 40.437675476074, h = 145.78295898438},
		type = 'cars',
		blip = 50,
	},
	["Elgin Ave"] = {
		pos = {x = 273.81454467773, y = -331.25143432617, z = 44.919876098633, h = 165.61309814453},
		type = 'cars',
		blip = 50,
	},
	["East Galelio"] = {
		pos = {x = -404.83190917969, y = 1229.9833984375, z = 325.20980834961, h = 295.19909667969},
		type = 'cars',
		blip = 50,
	},
	["Shank St"] = {
		pos = {x = -796.48095703125, y = -1504.5534667969, z = 0.35866242647171, h = 94.127952575684},
		type = 'boats',
		blip = 50,
	},
	["New Empire Way"] = {
		pos = {x = -981.12878417969, y = -2997.1325683594, z = 13.51451587677, h = 59.888633728027},
		type = 'aircrafts',
		blip = 50,
	},
	["Joad Ln"] = {
		pos = {x = 2139.3576660156, y = 4809.689453125, z = 40.99416809082, h = 118.23760223389},
		type = 'aircrafts',
		blip = 50,
	}
}

local myGarage = {}
myGarage.cars = {}
myGarage.aircrafts = {}
myGarage.boats = {}

local myVehicles = {}
local menuEnabled = false

AddEventHandler('fsn_main:character', function()
	TriggerServerEvent('fsn_cargarage:reset', exports.fsn_main:fsn_CharID())
end)

RegisterNetEvent('fsn_cargarage:makeMine')
AddEventHandler('fsn_cargarage:makeMine', function(ent, classname, plate)
	table.insert(myVehicles, #myVehicles+1, {
		ent = ent,
		plate = plate,
		model = classname
	})
end)

RegisterNetEvent('fsn_cargarage:vehicleStatus')
AddEventHandler('fsn_cargarage:vehicleStatus', function(plate, status)
	local statuses = {
		[0] = 'INGARAGE',
		[1] = 'OUTGARAGE',
		[2] = 'IMPOUNDED',
		[3] = 'SEIZED'
	}
	TriggerEvent('fsn_notify:displayNotification', 'INFO: <b>'..plate..'</b> set to <b>'..statuses[status], 'centerLeft', 3000, 'info')
end)

RegisterNetEvent('fsn_cargarage:receiveVehicles')
AddEventHandler('fsn_cargarage:receiveVehicles', function(type, vehtbl)
	if type == 'cars' then
		myGarage.cars = vehtbl
		local grg = json.encode(vehtbl)
		SendNUIMessage({
			receive = 'vehicles',
			garage = grg
		})
	elseif type == 'aircrafts' then
		myGarage.aircrafts = vehtbl
	elseif type == 'boats' then
		myGarage.boats = vehtbl
	else
	end
end)

function fsn_ToggleGarageMenu()
	FreezeEntityPosition(GetPlayerPed(-1), 0)
  SetEntityCollision(GetPlayerPed(-1), 1, 1)
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true
		})
	else
		SetNuiFocus( false )
		SendNUIMessage({
			hidemenu = true
		})
	end
end

function fsn_GetVehicleDetails(vehid)
	for k, v in pairs(myGarage) do
		for key, value in pairs(v) do
			if value.veh_id == vehid then
				return value
			end
		end
	end
end

function fsn_SplitString(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

local function fsn_SpawnVehicle(vehid)
	Citizen.CreateThread(function()
		local veh = fsn_GetVehicleDetails(vehid)

		if veh.veh_status == 1 or veh.veh_status == 3 then
			TriggerEvent('fsn_notify:displayNotification', 'You cannot spawn this vehicle!', 'centerLeft', 4000, 'error')
			return
		end

		if veh.veh_status == 0 then
			TriggerEvent('fsn_bank:change:walletMinus', 50)
		elseif veh.veh_status == 2 then
			TriggerEvent('fsn_bank:change:walletMinus', 2500)
		end

		local model = GetHashKey(veh.veh_name)

		local colours = {}
		if veh.veh_colours ~= '[]' then
			colours = json.decode(veh.veh_colours)
		else
			colours = {
				primary = 0,
				secondary = 0,
				pearlone = 0,
				pearltwo = 0
			}
		end

		local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)

		RequestModel(model)
	  while not HasModelLoaded(model) do
	    Wait(1)
	  end
		local personalvehicle = CreateVehicle(model, pos.x, pos.y, pos.z, GetEntityHeading(GetPlayerPed(-1)), true, false)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(personalvehicle)
		SetVehicleHasBeenOwnedByPlayer(personalvehicle, true)
		local id = NetworkGetNetworkIdFromEntity(personalvehicle)
		SetNetworkIdCanMigrate(id, true)
		--Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
		-- shit to make it look right
		SetVehicleModKit(personalvehicle, 0)
		SetVehicleWheelType(personalvehicle, tonumber(veh.veh_wheeltype));
		local mods = json.decode(veh.veh_mods)
		for k, v in pairs(mods) do
			--if (k == 18 or k == 22) then
				ToggleVehicleMod(personalvehicle, tonumber(k), tonumber(v.mod));
			--else
			--	if (v ~= "customtire") then
					SetVehicleMod(personalvehicle, tonumber(k), tonumber(v.mod));
			--	end
			--end
		end
		SetVehicleColours(personalvehicle, colours.primary, colours.secondary)
		SetVehicleExtraColours(personalvehicle, colours.pearlone, colours.pearltwo)
		SetVehicleNumberPlateText(personalvehicle, veh.veh_plate)
		SetVehicleNumberPlateTextIndex(personalvehicle, veh.veh_plate_style)
		SetVehicleWindowTint(personalvehicle, veh.veh_windows)

		TaskWarpPedIntoVehicle(GetPlayerPed(-1), personalvehicle, -1)
		SetVehicleWindowTint(personalvehicle, veh.veh_windows)

		table.insert(myVehicles, #myVehicles+1, {
			ent = personalvehicle,
			plate = veh.veh_plate,
			model = veh.veh_name
		})
		TriggerEvent('fsn_vehiclecontrol:keys:carjack', GetVehicleNumberPlateText(personalvehicle))
		SetEntityAsMissionEntity(personalvehicle, false, true)
		TriggerServerEvent('fsn_cargarage:vehicle:toggleStatus', veh.veh_plate, 1)
	end)
end

RegisterNUICallback( "ButtonClick", function( data, cb )

	local split = fsn_SplitString(data, '-')
	if split[1] == 'spawn' then
		local vehid = tonumber(split[2])
		fsn_SpawnVehicle(vehid)
		fsn_ToggleGarageMenu()
	end
	if split[1] == 'sell' then
		local vehid = tonumber(split[2])
		local vehicle_details = fsn_GetVehicleDetails(vehid)
		--fsn_VehicleSale(vehicle_details)
		fsn_ToggleGarageMenu()
	end
	if ( data == "exit" ) then
		fsn_ToggleGarageMenu()
		return
	end
end )

Citizen.CreateThread(function()
	for _, grg in pairs(garages) do
		local bleep = AddBlipForCoord(grg.pos.x, grg.pos.y, grg.pos.z)
		SetBlipSprite(bleep, 50)
		SetBlipScale(bleep, 0.8)
		SetBlipAsShortRange(bleep, true)
		BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Garage")
		EndTextCommandSetBlipName(bleep)
	end
	while true do
		Citizen.Wait(0)
		for _, grg in pairs(garages) do
			if GetDistanceBetweenCoords(grg.pos.x,grg.pos.y,grg.pos.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,grg.pos.x,grg.pos.y,grg.pos.z-1,0,0,0,0,0,0,5.8, 5.8, 0.5,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(grg.pos.x,grg.pos.y,grg.pos.z,GetEntityCoords(GetPlayerPed(-1)), true) < 5.8 then
					local vehicle = fsn_IsVehicleHere(grg.pos.x,grg.pos.y,grg.pos.z,5.8)
					if vehicle then
						SetTextComponentFormat("STRING")
						AddTextComponentString("Press ~INPUT_CELLPHONE_SELECT~ to ~r~return~w~ your vehicle")
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						if IsControlJustPressed(1, 18) then
					    SetEntityAsMissionEntity( vehicle, false, true )
							TriggerServerEvent('fsn_cargarage:vehicle:toggleStatus', GetVehicleNumberPlateText(vehicle), 0)
					    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( vehicle ) )

	          end
					else
						SetTextComponentFormat("STRING")
						AddTextComponentString("Press ~INPUT_PICKUP~ to view your garage")
						DisplayHelpTextFromStringLabel(0, 0, 1, -1)
						if IsControlJustPressed(1, 38) then
							TriggerServerEvent('fsn_cargarage:requestVehicles', grg.type, exports.fsn_main:fsn_CharID())
							fsn_ToggleGarageMenu()
	          end
					end
				end
			end
		end
	end
end)

function fsn_IsVehicleHere(x,y,z,radius)
	for k, v in pairs(myVehicles) do
		local veh = v.ent
		if not veh then return false end
		if GetDistanceBetweenCoords(x,y,z,GetEntityCoords(veh, true)) < 5.8 then
			return veh
		end
	end
	return false
end

function fsn_IsVehicleOwner(veh1)
	local plate = GetVehicleNumberPlateText(veh1)
	for k, v in pairs(myVehicles) do
		local veh2 = v.plate
		if plate == veh2 then
			return true
		end
	end
	return false
end

function fsn_HasVehicleKeys(plate, model)
	for k, v in pairs(myKeys) do
		if v.plate == plate and v.model == model then
			return true
		end
	end
	return false
end
