Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
    NetworkSetVoiceActive(false)
	end
end)

--PlaySound(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
--TriggerClientEvent('fsn_phone:call:effects:calling', src)
--TriggerClientEvent('fsn_phone:call:effects:called', src)
local beingCalled = false
local rings = 0
local isCalling = false
local isInCall = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isInCall then
			while not HasAnimDictLoaded('cellphone@') do
				RequestAnimDict('cellphone@')
				Citizen.Wait(5)
			end
			if not IsEntityPlayingAnim(GetPlayerPed(-1), 'cellphone@', 'cellphone_call_listen_base', 3) and not IsPedRagdoll(GetPlayerPed(-1)) then
				TaskPlayAnim(GetPlayerPed(-1), 'cellphone@', 'cellphone_call_listen_base', 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
			end
		end
		if beingCalled then
			rings = rings + 1
			if rings > 5 then
				ExecuteCommand('decline')
				TriggerEvent('fsn_notify:displayNotification', 'Call rejected', 'centerLeft', 3000, 'error')
			else
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2, 'ringtone-iphone', 0.3)
				Citizen.Wait(7000)
			end
		end
		if isCalling then
			--TriggerEvent('fsn_phone:sound', 'calling')
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2, 'dialtone', 0.4)
			Citizen.Wait(6000)
		end
	end
end)

RegisterNetEvent('fsn_phone:call:effects:called')
AddEventHandler('fsn_phone:call:effects:called', function()
	beingCalled = true
	rings = 0
end)

RegisterNetEvent('fsn_phone:call:effects:calling')
AddEventHandler('fsn_phone:call:effects:calling', function()
	isCalling = true
	isInCall = true
end)

RegisterNetEvent('fsn_phone:call:effects:stop')
AddEventHandler('fsn_phone:call:effects:stop', function()
	isCalling = false
	beingCalled = false
end)

RegisterNetEvent('fsn_phone:call:effects:isInCall')
AddEventHandler('fsn_phone:call:effects:isInCall', function(state)
	isInCall = state
	if state == false then
		ClearPedTasks(GetPlayerPed(-1))
	end
end)