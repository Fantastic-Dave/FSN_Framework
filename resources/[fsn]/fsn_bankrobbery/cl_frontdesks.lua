local desks = {}

RegisterNetEvent('fsn_bankrobbery:desks:receive')
AddEventHandler('fsn_bankrobbery:desks:receive', function(tbl)
	desks = tbl
end)
TriggerServerEvent('fsn_bankrobbery:desks:request')

Util.Tick(function()
	for k, v in pairs(desks) do
		-- doors
		if GetDistanceBetweenCoords(v.door.x, v.door.y, v.door.z, GetEntityCoords(GetPlayerPed(-1)), true) < 3 then
			if v.door.locked then
				Util.DrawText3D(v.door.x, v.door.y, v.door.z, 'LOCKED', {255, 0, 0, 140}, 0.2)
				local door = GetClosestObjectOfType(v.door.x, v.door.y, v.door.z, 1.0, v.door.mdl, false, false, false)
				if door then
					FreezeEntityPosition(door, true)
					SetStateOfClosestDoorOfType(v.door.mdl, v.door.x, v.door.y, v.door.z, true, 0, 0)
				else
					print 'door is not here??'
				end
			else
				local door = GetClosestObjectOfType(v.door.x, v.door.y, v.door.z, 1.0, v.door.mdl, false, false, false)
				if door then
					FreezeEntityPosition(door, false)
					SetStateOfClosestDoorOfType(v.door.mdl, v.door.x, v.door.y, v.door.z, false, 0, 0)
				else
					print 'door is not here??'
				end
			end
		end
	end
end, 0)