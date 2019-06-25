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

local dispatch_calls = {}
local disp_id = 0
local last_disp = 0
RegisterNetEvent('fsn_jobs:taxi:request')
AddEventHandler('fsn_jobs:taxi:request', function(tbl)
  if istaxi then
    local x = tbl.x
    local y = tbl.y
    local var1, var2 = GetStreetNameAtCoord(x, y, z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local sname = GetStreetNameFromHashKey(var1)
    disp_id = #dispatch_calls+1
    last_disp = current_time
    table.insert(dispatch_calls, disp_id, {
      type = 'taxi call',
      cx = x,
      cy = y
    })
    SetNotificationTextEntry("STRING");
    AddTextComponentString('Location: ~y~'..sname);
    SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "Taxi Dispatch", "");
    DrawNotification(false, true);
  end
end)
RegisterNetEvent('fsn_jobs:taxi:accepted')
AddEventHandler('fsn_jobs:taxi:accepted', function(taxi)
  yourtaxi = taxi
end)
Citizen.CreateThread(function()
   while true do
     Citizen.Wait(0)
     if disp_id ~= 0 then
       if last_disp + 10 > current_time then
         SetTextComponentFormat("STRING")
         AddTextComponentString("Press ~INPUT_MP_TEXT_CHAT_TEAM~ to ~g~accept~w~ the call\nPress ~INPUT_PUSH_TO_TALK~ to ~r~decline~w~ the call")
         DisplayHelpTextFromStringLabel(0, 0, 1, -1)
         if IsControlJustPressed(0, 246) then
           SetNewWaypoint(dispatch_calls[disp_id].cx, dispatch_calls[disp_id].cy)
           last_disp = 0
         end
         if IsControlJustPressed(0, 249) then
           last_disp = 0
         end
       end
     end
   end
end)

Citizen.CreateThread(function()
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
    for k, v in pairs(taxirank) do
      if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          if istaxi == false then
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to get a Taxi (~g~$150~w~)")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
            if IsControlJustPressed(0,38) then
              local spawn = {x = 920.74658203125, y = -163.43037414551, z = 74.439865112305, h = 100.0173034668}
              local model = 'taxi'
              RequestModel(model)
              while not HasModelLoaded(model) do
                Wait(1)
              end
              local personalvehicle = CreateVehicle(model, spawn.x, spawn.y, spawn.z, spawn.h, true, false)
              TriggerEvent('fsn_fuel:update', GetVehicleNumberPlateText(personalvehicle), 100)
              mytaxi = personalvehicle
              SetModelAsNoLongerNeeded(model)
              SetVehicleOnGroundProperly(personalvehicle)
              SetVehicleHasBeenOwnedByPlayer(personalvehicle, true)
              local id = NetworkGetNetworkIdFromEntity(personalvehicle)
              SetNetworkIdCanMigrate(id, true)
              --Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
              TriggerEvent('fsn_notify:displayNotification', 'Get your taxi from the carpark!', 'centerRight', 4000, 'info')
            	TriggerEvent('fsn_cargarage:makeMine', mytaxi, GetDisplayNameFromVehicleModel(GetEntityModel(mytaxi)), GetVehicleNumberPlateText(mytaxi))
              istaxi = true
              fsn_SetJob('Taxi Driver')
              TriggerEvent('fsn_bank:change:walletMinus', 150)
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
