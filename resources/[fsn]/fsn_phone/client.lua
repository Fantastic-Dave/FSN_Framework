local stores = {
	{x = -1082.1314697266, y = -247.65126037598, z = 37.763290405273}
}
local character = {}
local phoneEnabled = false

function fsn_NearestPlayersC(x, y, z, radius)
	local players = {}
	for id = 0, 31 do
		local ppos = GetEntityCoords(GetPlayerPed(id))
		if GetDistanceBetweenCoords(ppos.x, ppos.y, ppos.z, x, y, z) < radius then
			table.insert(players, #players+1, GetPlayerServerId(id))
		end
	end
  return players
end

RegisterNetEvent('fsn_phone:displayNumber')
AddEventHandler('fsn_phone:displayNumber', function()
	if character.char_phone ~= -1 then
		local pos = GetEntityCoords(GetPlayerPed(-1))
	  TriggerServerEvent('fsn_phone:chat', '^*^3phone# |^0^r '..character.char_phone, fsn_NearestPlayersC(pos.x, pos.y, pos.z, 5))
	else
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone number!<br>Goto Lifeinvader to get one', 'centerLeft', 8000, 'error')
	end
end)

AddEventHandler('fsn_main:character', function(char)
  character = char
end)

RegisterNetEvent('fsn_phone:togglePhone')
AddEventHandler('fsn_phone:togglePhone', function()
	--if character.char_phone == nil then
	--	print(':fsn_phone: INIT FAILED FOR FSN_PHONE')
	--	return
	--end
	if not exports.fsn_inventory:fsn_HasPhone() then
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone!<br>Visit a general store to get one.', 'centerLeft', 5000, 'error')
	return end
	if character.char_phone == -1 then
		seemcard = false
	else
		seemcard = true
	end
	if phoneEnabled then
		SetNuiFocus( false )
		SendNUIMessage({
			displayPhone = false
		})
		phoneEnabled = false
	else
		SetNuiFocus( true, true )
		SendNUIMessage({
			displayPhone = true,
			simcard = seemcard
		})
		if not IsPedInAnyVehicle(GetPlayerPed(-1),  false) then
			TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE", 0, true);
		end
		phoneEnabled = true
 	end
end)

RegisterNUICallback( "disablePhone", function(data, cb)
	FreezeEntityPosition(GetPlayerPed(-1), 0)
	SetEntityCollision(GetPlayerPed(-1), 1, 1)
	ClearPedTasks(GetPlayerPed(-1))
	TriggerEvent('fsn_phone:togglePhone')
end)

RegisterNetEvent('fsn_phone:updateNumber')
AddEventHandler('fsn_phone:updateNumber', function(source, number)
  character.char_phone = number
end)

RegisterNetEvent('fsn_phone:recieveMessage')
AddEventHandler('fsn_phone:recieveMessage', function(msg)
  if msg.number == character.char_phone then

  end
end)

Citizen.CreateThread( function()
  for k, store in pairs(stores) do
    local blip = AddBlipForCoord(store.x, store.y, store.z)
    SetBlipSprite(blip, 365)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Lifeinvader")
    EndTextCommandSetBlipName(blip)
  end
	while true do
		Citizen.Wait(0)
		for k, v in pairs(stores) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          SetTextComponentFormat("STRING")
        	AddTextComponentString("Press ~INPUT_PICKUP~ to get a ~b~simcard~w~ ($250)")
        	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
            TriggerServerEvent('fsn_phone:purchased', character.char_id)
					end
				end
			end
		end
	end
end)
