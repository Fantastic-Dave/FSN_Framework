local menuEnabled = false
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

function ToggleActionMenu()
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

RegisterNUICallback( "ButtonClick", function( data, cb )
	if ( data == "exit" ) then
		ToggleActionMenu()
		return
	else
		local split = fsn_SplitString(data, '-')
		if split[1] == 'buy' then
			local item = split[2]
			TriggerEvent('fsn_inventory:prebuy', item)
		else
			--??
		end
	end
end )

local stores = {
  {x = -707.94940185547, y = -914.28442382813, z = 19.215589523315},
  {x = 25.816429138184, y = -1347.3413085938, z = 29.497024536133},
  {x = -48.42569732666, y = -1757.5212402344, z = 29.420993804932},
  {x = 374.22787475586, y = 326.03570556641, z = 103.56636810303},
  {x = -1487.6705322266, y = -379.61917114258, z = 40.163394927979},
  {x = -2968.5520019531, y = 390.56546020508, z = 15.043312072754},
  {x = -3242.7116699219, y = 1001.4896240234, z = 12.830704689026},
  {x = 1961.62890625, y = 3741.0764160156, z = 32.343776702881},
  {x = 1392.3483886719, y = 3604.0036621094, z = 34.980926513672},
  {x = 1166.4477539063, y = 2708.3881835938, z = 38.157699584961},
  {x = 1698.4125976563, y = 4924.998046875, z = 42.063678741455},
  {x = 1730.2172851563, y = 6415.9599609375, z = 35.037227630615},
  {x = 2678.9938964844, y = 3281.0151367188, z = 55.241138458252},
  {x = 2557.4074707031, y = 382.74633789063, z = 108.62294769287},
  {x = 1136.1823730469, y = -981.75445556641, z = 46.415802001953},
  {x = 1163.341796875, y = -323.94161987305, z = 69.205139160156},
  {x = -1223.4569091797, y = -906.90423583984, z = 12.3263463974}
}

Citizen.CreateThread( function()
  for k, store in pairs(stores) do
    local blip = AddBlipForCoord(store.x, store.y, store.z)
    SetBlipSprite(blip, 52)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Store")
    EndTextCommandSetBlipName(blip)
  end
	while true do
		Citizen.Wait(0)
		for k, v in pairs(stores) do
			if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
        DrawMarker(1,v.x,v.y,v.z-1,0,0,0,0,0,0,1.001,1.0001,0.4001,0,155,255,175,0,0,0,0)
        if GetDistanceBetweenCoords(v.x,v.y,v.z,GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
          SetTextComponentFormat("STRING")
        	AddTextComponentString("Press ~INPUT_PICKUP~ to view the ~y~store")
        	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
          if IsControlJustPressed(0,38) then
						ToggleActionMenu()
					end
				end
			end
		end
	end
end )

local storekeepers = {
	{x = -705.81408691406, y = -914.63317871094, z = 19.215587615967, h = 88.849708557129, ped = false}
}	
local robbing = false
local robbingstart = 0
local lastrob = 0
local curtime = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		curtime = curtime+1
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(storekeepers) do
			if GetDistanceBetweenCoords(v.x, v.y, v.z, GetEntityCoords(GetPlayerPed(-1)), true) < 50 then
				if v.ped then
					if GetDistanceBetweenCoords(GetEntityCoords(v.ped), v.x, v.y, v.z) > 2 and not IsPedFleeing(v.ped) and not IsPedInCombat(v.ped) then
						RequestModel(416176080)
						while not HasModelLoaded(416176080) do
							Wait(1)
						end
						v.ped = CreatePed(5, 416176080, v.x, v.y, v.z, true, true)
						SetEntityHeading(v.ped, v.h)
					end
					if IsPlayerFreeAiming(PlayerId()) and IsPlayerFreeAimingAtEntity(PlayerId(), v.ped) then
						local quickmaff = lastrob + 1800
						if quickmaff < curtime then
							if robbing then
								TaskStandStill(v.ped, 3000)
								if not IsEntityPlayingAnim(v.ped, 'random@mugging3', "handsup_standing_base", 3) then
									RequestAnimDict('random@mugging3')
									TaskPlayAnim(v.ped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
								end
								local maff = robbingstart + 15
								if maff < curtime then
									robbing = false
								end
							elseif not IsPedInCombat(v.ped) then
								if math.random(0,100) > 20 then
									TaskStandStill(v.ped, 3000)
									robbing = true
									TriggerEvent('fsn_notify:displayNotification', 'Robbing...', 'centerLeft', 6000, 'info')
									robbingstart = curtime
									if not IsEntityPlayingAnim(v.ped, 'random@mugging3', "handsup_standing_base", 3) then
										RequestAnimDict('random@mugging3')
										TaskPlayAnim(v.ped, "random@mugging3", "handsup_standing_base", 4.0, -4, -1, 49, 0, 0, 0, 0)
									end
									if math.random(0,100) > 30 then
										local pos = GetEntityCoords(GetPlayerPed(-1))
										local coords = {
										 x = pos.x,
										 y = pos.y,
										 z = pos.z
										}
										TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-90 | ARMED ROBBERY IN PROGRESS')
									end
								else
									TaskCombatPed(v.ped, GetPlayerPed(-1), 0, 16)
									if math.random(0,100) > 30 then
										local pos = GetEntityCoords(GetPlayerPed(-1))
										local coords = {
										 x = pos.x,
										 y = pos.y,
										 z = pos.z
										}
										TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-90 | ARMED ROBBERY IN PROGRESS')
									end
									robbing = false
								end
							end
						else
							TriggerEvent('fsn_notify:displayNotification', 'You can\'t do that yet!', 'centerLeft', 6000, 'info')
							local pos = GetEntityCoords(GetPlayerPed(-1))
							local coords = {
							 x = pos.x,
							 y = pos.y,
							 z = pos.z
							}
							TriggerServerEvent('fsn_police:dispatch', coords, 12, '10-90 | Attempted armed store robbery')
							Citizen.Wait(2000)
						end 
					else
						robbing = false
					end
				else
					if GetClosestObjectOfType(v.x, v.y, v.z, 1.0, 416176080, false, false, false) then
						v.ped = GetClosestObjectOfType(v.x, v.y, v.z, 1.0, 416176080, false, false, false)
					else
						RequestModel(416176080)
						while not HasModelLoaded(416176080) do
							Wait(1)
						end
						v.ped = CreatePed(5, 416176080, v.x, v.y, v.z, true, true)
						SetEntityHeading(v.ped, v.h)
					end
				end
			end
		end
	end
end)
