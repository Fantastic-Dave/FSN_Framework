-------------------
-- Instance stuff
-- _seriously idk why this is here_
-------------------
local instanced = false
local instance_debug = false
local myinstance = {}
function instanceMe(state)
	instanced = state
	TriggerEvent('tokovoip_extras:muteall', state)
end
function inInstance()
	return instanced	
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for _, id in ipairs(GetActivePlayers()) do
			if instanced then
				SetVehicleDensityMultiplierThisFrame(0.0)
				SetRandomVehicleDensityMultiplierThisFrame(0.0)
				local ped = GetPlayerPed(id)
				if ped ~= GetPlayerPed(-1) then
					SetEntityVisible(ped, false, 0)
					SetEntityCollision(ped, false, false)
				end
			else
				SetVehicleDensityMultiplierThisFrame(0.2)
				SetRandomVehicleDensityMultiplierThisFrame(0.2)
				local ped = GetPlayerPed(id)
				if ped ~= GetPlayerPed(-1) then
					SetEntityVisible(ped, true, 0)
					SetEntityCollision(ped, true, true)
				end
			end
		end
	end
end)

RegisterNetEvent('fsn_apartments:instance:join')
AddEventHandler('fsn_apartments:instance:join', function(id)
	
end)

RegisterNetEvent('fsn_apartments:instance:leave')
AddEventHandler('fsn_apartments:instance:leave', function(id)
	
end)

RegisterNetEvent('fsn_apartments:instance:debug')
AddEventHandler('fsn_apartments:instance:debug', function()
	
end)

