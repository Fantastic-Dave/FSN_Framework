amicop = false
pdonduty = false ----------------- REMEMBER TO CHANGE THESE
policelevel = 0

function showLoadingPrompt(showText, showTime, showType)
  Citizen.CreateThread(function()
    Citizen.Wait(0)
    N_0xaba17d7ce615adbf("STRING") -- set type
    AddTextComponentString(showText) -- sets the text
    N_0xbd12f8228410d9b4(showType) -- show promt (types = 3)
    Citizen.Wait(showTime) -- show time
    N_0x10d373323e5b9c0d() -- remove promt
  end)
end

RegisterNetEvent('fsn_police:911r')
AddEventHandler('fsn_police:911r', function(nineoneone, at, msg)
  if pdonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911R #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

RegisterNetEvent('fsn_police:911')
AddEventHandler('fsn_police:911', function(nineoneone, at, msg)
  if pdonduty then
    TriggerEvent('chatMessage', '', {255,255,255}, '^*^1 911 #'..nineoneone..' ('..at..') | ^0^r'..msg)
  end
end)

function fsn_PDDuty()
  if pdonduty then
    return true
  else
    return false
  end
end
function fsn_getPDLevel()
  return policelevel
end

function getNearestVeh()
local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
return vehicleHandle
end

RegisterNetEvent('fsn_police:putMeInVeh')
AddEventHandler('fsn_police:putMeInVeh', function()
  if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
    local curpos = GetEntityCoords(GetPlayerPed(-1))
    local car = getNearestVeh()--GetClosestVehicle(curpos.x, curpos.y, curpos.z, 3.000, 0, 70)
    if IsVehicleSeatFree(car, 2) then
    	TaskWarpPedIntoVehicle(GetPlayerPed(-1), car, 2)
    else
    	TaskWarpPedIntoVehicle(GetPlayerPed(-1), car, 1)
    end
  else
    TaskLeaveVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1)), 16)
  end
end)

RegisterNetEvent('fsn_police:MDT:vehicledetails')
AddEventHandler('fsn_police:MDT:vehicledetails', function(name, wanted, car)
  if MDTOpen then
    -- js stuff for later
  else
    if not car then
      SetNotificationTextEntry("STRING");
      AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~g~FALSE~w~<br>Status: ~r~STOLEN 10-99');
      SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
      DrawNotification(false, true);
    else
      if wanted then
        SetNotificationTextEntry("STRING");
        AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~r~TRUE~w~<br>Status: ~g~LICIT');
        SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
        DrawNotification(false, true);
      else
        SetNotificationTextEntry("STRING");
        AddTextComponentString('Name: ~b~'..name..'~w~<br>Wanted: ~g~FALSE~w~<br>Status: ~g~LICIT');
        SetNotificationMessage("CHAR_DEFAULT", "CHAR_DEFAULT", true, 1, "~g~MTD RESULT:~s~", "");
        DrawNotification(false, true);
      end
    end
  end
end)

RegisterNetEvent('fsn_police:init')
AddEventHandler('fsn_police:init', function(pdlvl)
  TriggerServerEvent('fsn_police:requestUpdate')
  if pdlvl > 0 then
    amicop = true
    policelevel = pdlvl
  else
    amicop = false
    policelevel = 0
  end
end)

RegisterNetEvent('fsn_police:updateLevel')
AddEventHandler('fsn_police:updateLevel', function(pdlvl)
  TriggerServerEvent('fsn_police:requestUpdate')
  if pdlvl > 0 then
    TriggerEvent('fsn_notify:displayNotification', 'Your <span>police</span> whitelist has been updated to: '..pdlvl, 'centerLeft', 6000, 'info')
    amicop = true
    policelevel = pdlvl
  else
    TriggerEvent('fsn_notify:displayNotification', 'Your <span style="color:#72a8ff;font-weight:bold">police</span> whitelist has been removed.', 'centerLeft', 6000, 'error')
    amicop = false
    policelevel = 0
  end
end)

local clockInStations = {
  {
    name = "Mission Row PD",
    x = 440.61553955078,
    y = -975.72308349609,
    z = 30.689582824707
  },
  {
    name = "Sandy Shores Sheriff's Office",
    x = 1851.7194824219,
    y = 3691.4135742188,
    z = 34.267078399658
  },
  {
    name = "Blaine County Sheriff's Office",
    x = -450.69024658203,
    y = 6011.1479492188,
    z = 31.716394424438
  }
}
local armoryStations = {
  {
    name = "Mission Row Armory",
    x = 461.45196533203,
    y = -980.94122314453,
    z = 30.689605712891
  },
  {
    name = "Sandy Shores Armory",
    x = 1848.2283935547,
    y = 3689.2102050781,
    z = 34.267036437988
  },
  {
    name = "Blaine County Armory",
    x = -447.37493896484,
    y = 6007.7734375,
    z = 31.716390609741
  }
}

local onduty_police = {}
RegisterNetEvent('fsn_police:update')
AddEventHandler('fsn_police:update', function(cops)
  --print(':fsn_police: There are '..#cops..' on duty!')
  onduty_police = cops
end)
function fsn_getCopAmt()
  return #onduty_police
end

policeWeapons = {
    "WEAPON_STUNGUN",
    "WEAPON_FLARE",
    "WEAPON_NIGHTSTICK",
    --"WEAPON_CARBINERIFLE",
    --"WEAPON_PUMPSHOTGUN",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_COMBATPISTOL",
    "WEAPON_FLASHLIGHT",
    "WEAPON_KNIFE"
}

local function fsn_policeEquipped()
  -- maybe add other loadouts later?
  policeWeapons = {
    "WEAPON_STUNGUN",
    "WEAPON_FLARE",
    "WEAPON_NIGHTSTICK",
    --"WEAPON_CARBINERIFLE",
    --"WEAPON_PUMPSHOTGUN",
    "WEAPON_FIREEXTINGUISHER",
    "WEAPON_COMBATPISTOL",
    "WEAPON_FLASHLIGHT",
    "WEAPON_KNIFE"
  }
  for i=1, #policeWeapons do
    if not HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(policeWeapons[i])) then
      return false
    end
  end
  return true
end

local pdCarBlips = {}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(4000)
    if pdonduty then
      for k, v in pairs(pdCarBlips) do
        if not DoesEntityExist(v.ent) or not IsVehicleDriveable(v.ent) then
          RemoveBlip(v.blip)
          pdCarBlips[k] = nil
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if pdonduty then
      --[[
      for id = 0, 32 do
        if NetworkIsPlayerActive(id) then
          local ped = GetPlayerPed(id)
          if GetDistanceBetweenCoords(ped, GetPlayerPed(-1), true) < 2 and ped ~= GetPlayerPed(-1) then
            if DecorGetBool(GetPlayerPed(id), "hardcuff") then
              showLoadingPrompt("[SHIFT + Y] uncuff "..GetPlayerServerId(id), 3000, 3)
            else
              showLoadingPrompt("[SHIFT + Y] cuff "..GetPlayerServerId(id), 3000, 3)
            end
            if IsControlPressed() then
              if IsControlJustPressed() then
                ExecuteCommand('pd c '..GetPlayerServerId(id))
              end
            end
          end
        end
      end
      ]]
      for id = 0, 32 do
        if NetworkIsPlayerActive(id) then
          local ped = GetPlayerPed(id)
          if IsPedInAnyVehicle(ped) then
            local veh = GetVehiclePedIsUsing(ped)
            if GetVehicleClass(veh) == 18 and not pdCarBlips[GetVehicleNumberPlateText(veh)] then
              local pd_blip = AddBlipForEntity(veh)
              SetBlipSprite(pd_blip, 227)
              SetBlipColour(pd_blip, 3)
              SetBlipAsShortRange(pd_blip, true)
          	  BeginTextCommandSetBlipName("STRING")
              AddTextComponentString("Police Car")
              EndTextCommandSetBlipName(pd_blip)

              pdCarBlips[GetVehicleNumberPlateText(veh)] = {}
              pdCarBlips[GetVehicleNumberPlateText(veh)].ent = veh
              pdCarBlips[GetVehicleNumberPlateText(veh)].blip = pd_blip
            end
          end
        end
      end
    end
    for k, stn in pairs(clockInStations) do
      if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 and amicop then
        DrawMarker(1,stn.x,stn.y,stn.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          if pdonduty == false then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~g~clock in~w~ as ~b~police")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          else
            SetTextComponentFormat("STRING")
            AddTextComponentString("Press ~INPUT_PICKUP~ to ~r~clock out~w~ as ~b~police")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          end
          if IsControlJustPressed(0,38) then
            if pdonduty then
              pdonduty = false
              TriggerEvent('fsn_notify:displayNotification', 'Thanks for your service!', 'centerLeft', 2000, 'info')
              exports.fsn_jobs:fsn_SetJob('Unemployed')
              for k, v in pairs(pdCarBlips) do
                RemoveBlip(v.blip)
                pdCarBlips[k] = nil
              end
              TriggerServerEvent('fsn_police:offDuty')
            else
              exports.fsn_jobs:fsn_SetJob('Police')
              pdonduty = true
              TriggerEvent('fsn_notify:displayNotification', 'You have clocked in as <span style="color: #42b6f4">police</span> (lvl: '..policelevel..') @ '..stn.name, 'centerLeft', 2000, 'info')
              TriggerServerEvent('fsn_police:onDuty', policelevel)
            end
          end
        end
      end
    end
    for k, stn in pairs(armoryStations) do
      if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 and pdonduty then
        DrawMarker(1,stn.x,stn.y,stn.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(stn.x,stn.y,stn.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
            SetTextComponentFormat("STRING")
          	AddTextComponentString("Press ~INPUT_PICKUP~ to ~g~collect~w~ your weapons")
          	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
              for k, v in pairs(policeWeapons) do
                --GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(v), 1000)
				TriggerEvent('fsn_criminalmisc:weapons:add:police', GetHashKey(v), 250)
              end
              AddArmourToPed(GetPlayerPed(-1), 100)
              TriggerEvent('fsn_notify:displayNotification', 'You have <span style="color:red">checked out</span> <span style="color:#f4a442;font-weight:bold">STANDARD LOADOUT</span> from '..stn.name, 'centerLeft', 2000, 'info')
            end
          end
        end
      end
    end
end)
RegisterNetEvent('fsn_police:command:duty')
AddEventHandler('fsn_police:command:duty', function()
  if pdonduty then
    pdonduty = false
    TriggerEvent('fsn_notify:displayNotification', 'Thanks for your service!', 'centerLeft', 2000, 'info')
    for k, v in pairs(pdCarBlips) do
      RemoveBlip(v.blip)
      pdCarBlips[k] = nil
    end
    TriggerServerEvent('fsn_police:offDuty')
  else
    if policelevel > 0 then
      pdonduty = true
      TriggerEvent('fsn_notify:displayNotification', 'You have clocked in as <span style="color: #42b6f4">police</span> (lvl: '..policelevel..')', 'centerLeft', 2000, 'info')
      TriggerServerEvent('fsn_police:onDuty', policelevel)
    else
      TriggerEvent('fsn_notify:displayNotification', 'You are not a police officer!', 'centerLeft', 6000, 'error')
    end
  end
end)

--------------------------------------------- Handcuffing
DecorRegister("hardcuff")
DecorRegister("softcuff")
local handCuffed = false
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if DecorGetBool(GetPlayerPed(-1), "softcuff") == 1 then
      DisableControlAction(1, 18, true)
      DisableControlAction(1, 24, true)
      DisableControlAction(1, 69, true)
      DisableControlAction(1, 92, true)
      DisableControlAction(1, 106, true)
      DisableControlAction(1, 122, true)
      DisableControlAction(1, 135, true)
      DisableControlAction(1, 142, true)
      DisableControlAction(1, 144, true)
      DisableControlAction(1, 176, true)
      DisableControlAction(1, 223, true)
      DisableControlAction(1, 229, true)
      DisableControlAction(1, 237, true)
      DisableControlAction(1, 257, true)
      DisableControlAction(1, 329, true)
      DisableControlAction(1, 80, true)
      DisableControlAction(1, 140, true)
      DisableControlAction(1, 250, true)
      DisableControlAction(1, 263, true)
      DisableControlAction(1, 310, true)
      DisableControlAction(1, 22, true)
      DisableControlAction(1, 55, true)
      DisableControlAction(1, 76, true)
      DisableControlAction(1, 102, true)
      DisableControlAction(1, 114, true)
      DisableControlAction(1, 143, true)
      DisableControlAction(1, 179, true)
      DisableControlAction(1, 193, true)
      DisableControlAction(1, 203, true)
      DisableControlAction(1, 216, true)
      DisableControlAction(1, 255, true)
      DisableControlAction(1, 298, true)
      DisableControlAction(1, 321, true)
      DisableControlAction(1, 328, true)
      DisableControlAction(1, 331, true)
      DisableControlAction(0, 63, false)
      DisableControlAction(0, 64, false)
      DisableControlAction(0, 59, false)
      DisableControlAction(0, 278, false)
      DisableControlAction(0, 279, false)
      DisableControlAction(0, 68, false)
      DisableControlAction(0, 69, false)
      DisableControlAction(0, 75, false)
      DisableControlAction(0, 76, false)
      DisableControlAction(0, 102, false)
      DisableControlAction(0, 81, false)
      DisableControlAction(0, 82, false)
      DisableControlAction(0, 83, false)
      DisableControlAction(0, 84, false)
      DisableControlAction(0, 85, false)
      DisableControlAction(0, 86, false)
      DisableControlAction(0, 106, false)
      DisableControlAction(0, 25, false)
      while not HasAnimDictLoaded('mp_arresting') do
        RequestAnimDict('mp_arresting')
        Citizen.Wait(5)
      end
      if not IsEntityPlayingAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 3) then
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
      end
    end
  end
end)
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if DecorGetBool(GetPlayerPed(-1), "hardcuff") == 1 then
      for i=1,345 do
        if i > 10 and i ~= 249 and i ~= 25 and i ~= 245 then
          DisableControlAction(1, i, true)
        end
      end
      DisableControlAction(0, 63, false)
      DisableControlAction(0, 64, false)
      DisableControlAction(0, 59, false)
      DisableControlAction(0, 278, false)
      DisableControlAction(0, 279, false)
      DisableControlAction(0, 68, false)
      DisableControlAction(0, 69, false)
      DisableControlAction(0, 75, false)
      DisableControlAction(0, 76, false)
      DisableControlAction(0, 102, false)
      DisableControlAction(0, 81, false)
      DisableControlAction(0, 82, false)
      DisableControlAction(0, 83, false)
      DisableControlAction(0, 84, false)
      DisableControlAction(0, 85, false)
      DisableControlAction(0, 86, false)
      DisableControlAction(0, 106, false)
      DisableControlAction(0, 25, false)
      while not HasAnimDictLoaded('mp_arresting') do
        RequestAnimDict('mp_arresting')
        Citizen.Wait(5)
      end
      if not IsEntityPlayingAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 3) then
        TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
      end
    end
  end
end)

RegisterNetEvent('fsn_police:handcuffs:hard')
AddEventHandler('fsn_police:handcuffs:hard', function(pl)
  local ped = GetPlayerPed(GetPlayerFromServerId(pl))
    if ped == GetPlayerPed(-1) then
    if handCuffed then
      TriggerEvent('fsn_notify:displayNotification', 'You have been unrestrained!', 'centerLeft', 2000, 'info')
    else
      TriggerEvent('fsn_notify:displayNotification', 'You have been restrained!', 'centerLeft', 2000, 'info')
    end
    handCuffed = not handCuffed
    if(not handCuffed)then
      EnableControlAction(1, 329, true)
      DecorSetBool(ped,  "hardcuff",  false)
    else
      SetPedCanSwitchWeapon(ped, false)
      DecorSetBool(ped,  "hardcuff",  true)
    end

    if DecorGetBool(ped, "hardcuff") == false then
      StopAnimTask(ped, 'mp_arresting', 'idle', 1.0)
      SetPedCanSwitchWeapon(GetPlayerPed(-1),  not handCuffed)
    end

    if DecorGetBool(ped, "hardcuff") == 1 then
      Citizen.CreateThread(function()
        Citizen.Wait(1000)
        TaskPlayAnim(GetPlayerPed(GetPlayerFromServerId(pl)), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
      end)
    end

    cuffed[pl] = handCuffed
  end
end)

RegisterNetEvent('fsn_police:handcuffs:soft')
AddEventHandler('fsn_police:handcuffs:soft', function(pl)
  local ped = GetPlayerPed(GetPlayerFromServerId(pl))
    if ped == GetPlayerPed(-1) then
    if handCuffed then
      TriggerEvent('fsn_notify:displayNotification', 'You have been unrestrained!', 'centerLeft', 2000, 'info')
    else
      TriggerEvent('fsn_notify:displayNotification', 'You have been restrained!', 'centerLeft', 2000, 'info')
    end
    handCuffed = not handCuffed
    if(not handCuffed)then
      EnableControlAction(1, 329, true)
      DecorSetBool(ped,  "softcuff",  false)
    else
      SetPedCanSwitchWeapon(ped, false)
      DecorSetBool(ped,  "softcuff",  true)
    end

    if DecorGetBool(ped, "softcuff") == false then
      StopAnimTask(ped, 'mp_arresting', 'idle', 1.0)
      SetPedCanSwitchWeapon(GetPlayerPed(-1),  not handCuffed)
    end

    if DecorGetBool(ped, "softcuff") == 1 then
      Citizen.CreateThread(function()
        Citizen.Wait(1000)
        TaskPlayAnim(GetPlayerPed(GetPlayerFromServerId(pl)), 'mp_arresting', 'idle', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
      end)
    end

    cuffed[pl] = handCuffed
  end
end)

--------------------------------------------- DRAG xx
local escorted = false
RegisterNetEvent('fsn_police:toggleDrag')
AddEventHandler('fsn_police:toggleDrag', function(officer)
  if not escorted then
    local myPed = GetPlayerPed(-1)
    local pdPed = GetPlayerPed(GetPlayerFromServerId(officer))
    if IsPedInAnyVehicle(GetPlayerPed(-1)) then
      TaskLeaveVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1)), 16)
    end
    AttachEntityToEntity(myPed, pdPed, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    escorted = true
  else
    DetachEntity(GetPlayerPed(-1), true, false)
    escorted = false
  end
end)
--------------------------------------------- No wanted xx
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local playerLocalisation = GetEntityCoords(playerPed)
    ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)
  end
end)
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
	  for i = 1, 12 do
			EnableDispatchService(i, false)
		end
      if GetPlayerWantedLevel(PlayerId()) ~= 0 then
        SetPlayerWantedLevel(PlayerId(), 0, false)
			  SetPoliceIgnorePlayer(PlayerId(), true)
		    SetDispatchCopsForPlayer(PlayerId(), false)
        SetPlayerWantedLevelNow(PlayerId(), false)
      end
      DisablePlayerVehicleRewards(PlayerId())
    end
end)

local IllegalItems = {
  '2g_weed',
  'joint',
  'acetone',
  'meth_rocks',
  'packaged_cocaine'
}

function fsn_getIllegalItems()
  return IllegalItems
end

SetNuiFocus(true,true)
