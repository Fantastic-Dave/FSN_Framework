Citizen.CreateThread(function()
	--while true do Citizen.Wait(0)
		for k, v in pairs(robbables) do
			--local bleep = AddBlipForCoord(v.x, v.y, v.z)
			--SetBlipSprite(bleep, 1)
			--SetBlipColour(bleep, 3)
			--SetBlipAsShortRange(bleep, true)
			--BeginTextCommandSetBlipName("STRING")
			--AddTextComponentString("Robbable Property")
			--EndTextCommandSetBlipName(bleep)
		end
	--end
end)

RegisterNetEvent('fsn_criminalmisc:houserobbery:try')
AddEventHandler('fsn_criminalmisc:houserobbery:try', function()
	
end)
