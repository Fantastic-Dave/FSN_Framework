local taxirank = {
  {x = 899.5673828125, y = -174.81382751465, z = 73.894668579102}
}
local yourtaxi = false
local yourtaxi_blip = false
local istaxi = false
local char = {}
local mytaxi = false
AddEventHandler('fsn_main:character', function(character)
  char = character
end)

local function fsn_taxiAddBlip()
  yourtaxi_blip = AddBlipForEntity(yourtaxi)
  SetBlipSprite(yourtaxi_blip, 56)
  SetBlipRoute(yourtaxi_blip, true)
  SetBlipRouteColour(yourtaxi_blip, 5)
  BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Your taxi")
  EndTextCommandSetBlipName(yourtaxi_blip)
  SetBlipAsShortRange(yourtaxi_blip, false)
end

RegisterNetEvent('fsn_jobs:taxi:request')
AddEventHandler('fsn_jobs:taxi:request', function(x,y,z)
  if istaxi then

  end
end)
RegisterNetEvent('fsn_jobs:taxi:accepted')
AddEventHandler('fsn_jobs:taxi:accepted', function(taxi)
  yourtaxi = taxi
end)

Citizen.CreateThread(function()
  -- Blip creation
	for k,v in pairs(taxirank) do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 56)
		BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Taxi Rank")
		EndTextCommandSetBlipName(blip)
		SetBlipAsShortRange(blip, true)
	end
  while true do
    Citizen.Wait(0)
    if yourtaxi then

    else
      if DoesBlipExist(yourtaxi_blip) then
        RemoveBlip(yourtaxi_blip)
      end
    end
    if istaxi then

    end
    for k, v in pairs(taxirank) do
      if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          if istaxi == false then
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to get a Taxi (~g~$250~w~)")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              local spawn = {x = 920.74658203125, y = -163.43037414551, z = 74.439865112305, h = 100.0173034668}
              local model = 'taxi'
              RequestModel(model)
              while not HasModelLoaded(model) do
                Wait(1)
              end
              local personalvehicle = CreateVehicle(model, spawn.x, spawn.y, spawn.z, spawn.h, true, false)
              mytaxi = personalvehicle
              SetModelAsNoLongerNeeded(model)
              SetVehicleOnGroundProperly(personalvehicle)
              SetVehicleHasBeenOwnedByPlayer(personalvehicle, true)
              local id = NetworkGetNetworkIdFromEntity(personalvehicle)
              SetNetworkIdCanMigrate(id, true)
              Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
              TriggerEvent('fsn_notify:displayNotification', 'Get your taxi from the carpark!', 'centerRight', 4000, 'info')
            	TriggerEvent('fsn_cargarage:makeMine', mytaxi, GetDisplayNameFromVehicleModel(GetEntityModel(mytaxi)), GetVehicleNumberPlateText(mytaxi))
              istaxi = true
              fsn_SetJob('Taxi Driver')
            end
          else
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~return~w~ your Taxi (~g~+$150~w~)")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              if DoesEntityExist(mytaxi) then
                SetEntityAsMissionEntity( mytaxi, true, true )
    				    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( mytaxi ) )
                TriggerEvent('fsn_notify:displayNotification', 'Your taxi was collected in good condition', 'centerRight', 4000, 'info')
                TriggerEvent('fsn_bank:change:bankAdd', 150)
                istaxi = false
                mytaxi = false
                fsn_SetJob('Unemployed')
              else
                TriggerEvent('fsn_notify:displayNotification', 'You destroyed/lost your taxi! Fined $2500!', 'centerRight', 4000, 'error')
                TriggerEvent('fsn_bank:change:bankMinus', 2500)
                istaxi = false
                mytaxi = false
                fsn_SetJob('Unemployed')
              end
            end
          end
        end
      end
    end
  end
end)
