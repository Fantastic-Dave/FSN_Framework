local spot = {x = 455.9189453125, y = -979.15704345703, z = 30.68943977356}

Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if GetDistanceBetweenCoords(spot.x, spot.y, spot.z, GetEntityCoords(GetPlayerPed(-1)), true) < 10 then
			DrawMarker(25,spot.x, spot.y, spot.z - 0.95, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 150, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(spot.x, spot.y, spot.z, GetEntityCoords(GetPlayerPed(-1)), true) < 1 then
				if exports["fsn_doormanager"]:IsDoorLocked(2) == false or exports["fsn_police"]:fsn_PDDuty() then
					Util.DrawText3D(spot.x, spot.y, spot.z, '[E] Access ~b~Police Locker', {255,255,255,200}, 0.25)
					if IsControlJustPressed(0,38) then
						TriggerServerEvent('fsn_inventory:locker:request')
					end
					if exports["fsn_police"]:fsn_getPDLevel() > 6 then
						Util.DrawText3D(spot.x, spot.y, spot.z+0.2, '[LALT+NUM5] ~r~EMPTY POLICE LOCKER\n(this cannot be undone)', {255,255,255,200}, 0.25)
						if IsControlPressed(0,19) then
							if IsControlJustPressed(0,126) then
								TriggerServerEvent('fsn_inventory:locker:empty')
							end
						end
					end
				end
			end
		end
	end
end)