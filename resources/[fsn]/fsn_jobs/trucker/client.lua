local truckspawn = {x = 769.27258300781, y = -3195.3212890625, z = 5.9940619468689, h = 269.38400268555}
local cur_truck = false
local cur_trailer = false
local owned_truck = false
local mission_index = 0
local trailer_blip = false
local mission_blip = false
local jobs = {
  {trailer="trailerlogs",pickup={x=937.078,y=-3209.439,z=7.778,h=182.203},dropoff={x=1202.677,y=-1315.115,z=37.086,h=182.203}}
}

function spawnTruck(cost)
  local hashKey = GetHashKey("phantom")
	RequestModel(hashKey)
	while not HasModelLoaded(hashKey) do
	    Wait(.5)
	end
	if not IsAnyVehicleNearPoint(truckspawn.x, truckspawn.y, truckspawn.z, 6.0) then
		cur_truck = CreateVehicle(RequestModel(hashKey),truckspawn.x, truckspawn.y, truckspawn.z,truckspawn.h,true,false)
		SetVehicleOnGroundProperly(cur_truck)
  	TriggerEvent('fsn_cargarage:makeMine', cur_truck, GetDisplayNameFromVehicleModel(GetEntityModel(cur_truck)), GetVehicleNumberPlateText(cur_truck))
    TriggerEvent('fsn_bank:change:walletMinus', cost)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1),cur_truck,-1)
    getNewJob(0)
	else
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1:FSN:^0^r There cannot be anything in the spawn area!')
  end
end

function getNewJob(cost)
  local index = math.random(1, #jobs)
  local job = jobs[index]
  mission_index = index
  local hashKey = GetHashKey(job.trailer)
	RequestModel(hashKey)
	while not HasModelLoaded(hashKey) do
	    Wait(.5)
	end
  if not IsAnyVehicleNearPoint(job.pickup.x, job.pickup.y, job.pickup.z, 6.0) then
		cur_trailer = CreateVehicle(RequestModel(hashKey),job.pickup.x, job.pickup.y, job.pickup.z,job.pickup.h,true,false)
		SetVehicleOnGroundProperly(cur_trailer)
  	TriggerEvent('fsn_cargarage:makeMine', cur_trailer, GetDisplayNameFromVehicleModel(GetEntityModel(cur_trailer)), GetVehicleNumberPlateText(cur_trailer))
    TriggerEvent('fsn_bank:change:walletMinus', cost)
    TaskWarpPedIntoVehicle(GetPlayerPed(-1),cur_trailer,-1)

    trailer_blip = AddBlipForCoord(job.pickup.x, job.pickup.y, job.pickup.z)
    SetBlipSprite(trailer_blip, 1)
    SetBlipColour(trailer_blip, 11)
    SetBlipRoute(trailer_blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Trailer")
    EndTextCommandSetBlipName(trailer_blip)
    SetBlipAsShortRange(trailer_blip, false)
  end
end

Citizen.CreateThread(function()
  local blip = AddBlipForCoord(truckspawn.x, truckspawn.y, truckspawn.z)
  SetBlipSprite(blip, 477)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Trailer")
  EndTextCommandSetBlipName(blip)
  SetBlipAsShortRange(blip, false)
  while true do
    Citizen.Wait(0)
    -----------------------------------------------------------------
    -- Mission shit
    -----------------------------------------------------------------
    if mission_index ~= 0 then
      if IsVehicleAttachedToTrailer(cur_truck) then
        if trailer_blip then
          local job = jobs[mission_index]
          if not mission_blip then
            mission_blip = AddBlipForCoord(job.dropoff.x, job.dropoff.y, job.dropoff.z)
            SetBlipSprite(mission_blip, 1)
            SetBlipColour(mission_blip, 1)
            SetBlipRoute(mission_blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Dropoff")
            EndTextCommandSetBlipName(mission_blip)
            SetBlipAsShortRange(mission_blip, false)
          end
          RemoveBlip(trailer_blip)
        end
      else
        if cur_trailer and not trailer_blip then
          if mission_blip then
            RemoveBlip(mission_blip)
            mission_blip = false
          end
          if not trailer_blip then
            trailer_blip = AddBlipForEntity(cur_trailer)
            SetBlipSprite(trailer_blip, 1)
            SetBlipColour(trailer_blip, 11)
            SetBlipRoute(trailer_blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Trailer")
            EndTextCommandSetBlipName(trailer_blip)
            SetBlipAsShortRange(trailer_blip, false)
          end
        end
      end
    end
    -----------------------------------------------------------------
    -- Truck/Job shit
    -----------------------------------------------------------------
    if GetDistanceBetweenCoords(truckspawn.x,truckspawn.y,truckspawn.z, GetEntityCoords(GetPlayerPed(-1))) < 5 and not IsPedInAnyVehicle(GetPlayerPed(-1)) and mission_index == 0 then
      if cur_truck then
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press ~INPUT_PICKUP~ to get a new job (~g~$500~w~)")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,38) then
          if exports.fsn_main:fsn_GetWallet() >= 500 then
            getNewJob(500)
          else
            TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
          end
        end
      else
        SetTextComponentFormat("STRING")
        AddTextComponentString("Press ~INPUT_PICKUP~ to get a truck & job (~g~$6500~w~)")
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
        if IsControlJustPressed(0,38) then
          if exports.fsn_main:fsn_GetWallet() >= 6500 then
            spawnTruck(6500)
          else
            TriggerEvent('fsn_notify:displayNotification', 'You cannot afford this!', 'centerLeft', 3000, 'error')
          end
        end
      end
    end
  end
end)
