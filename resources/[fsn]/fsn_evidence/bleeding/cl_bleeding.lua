Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if exports["fsn_ems"]:ems_isBleeding() and not exports["fsn_police"]:fsn_PDDuty() then
			local pos = GetEntityCoords(GetPlayerPed(-1))
			local coords = {
			 x = pos.x,
			 y = pos.y,
			 z = pos.z
			}
			TriggerServerEvent('fsn_evidence:drop:blood', exports["fsn_main"]:fsn_CharID(), pos)
			Citizen.Wait(2000)
		end
	end
end)
