local races = {}
local inrace = false
local racestarted = false

RegisterNetEvent('fsn_criminalmisc:racing:createRace')
AddEventHandler('fsn_criminalmisc:racing:createRace', function()
	if IsWaypointActive() then
		local wypt = GetBlipInfoIdCoord(GetFirstBlipInfoId(8))
		local signup = 0 
		Citizen.CreateThread(function()
		  DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "#ID NUMBER", "", "", "", "", 10)
		  local editOpen = true
		  while UpdateOnscreenKeyboard() == 0 or editOpen do
			Wait(0)
			drawTxt('How much is this race to enter?',4,1,0.5,0.30,0.7,255,255,255,255)
			drawTxt('~b~Minimum race fee of $500',4,1,0.5,0.35,0.4,255,255,255,255)
			drawTxt('~r~Races will expire 5 minutes after created',4,1,0.5,0.49,0.4,255,255,255,255)
			if UpdateOnscreenKeyboard() ~= 0 then
			  editOpen = false
			  if UpdateOnscreenKeyboard() == 1 then
				if tonumber(GetOnscreenKeyboardResult()) then
					signup = tonumber(GetOnscreenKeyboardResult())
					local pos = GetEntityCoords(GetPlayerPed(-1))
					local ex = pos.x
					local why = pos.y
					local zed = pos.z
					local name, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
					local name2, var2 = GetStreetNameAtCoord(wypt.x, wypt.y, 0, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
					TriggerServerEvent('fsn_criminalmisc:racing:newRace', signup, GetStreetNameFromHashKey(name), ex, why, zed, wypt.x, wypt.y, GetStreetNameFromHashKey(name2))
				else
					TriggerEvent('fsn_notify:displayNotification', 'You need to enter a number', 'centerRight', 4000, 'error')
				end
			  end
			  break
			end
		  end
		end)
	else
		TriggerEvent('fsn_notify:displayNotification', 'You do not have a waypoint set', 'centerLeft', 4000, 'error')
	end
end)

RegisterNetEvent('fsn_criminalmisc:racing:update')
AddEventHandler('fsn_criminalmisc:racing:update', function(tbl)
	races = tbl
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			for key, race in pairs(races) do
				if GetDistanceBetweenCoords(race.start.x, race.start.y, race.start.z, GetEntityCoords(GetPlayerPed(-1)), false) < 10 then
					
				end
			end
		end
	end
end)