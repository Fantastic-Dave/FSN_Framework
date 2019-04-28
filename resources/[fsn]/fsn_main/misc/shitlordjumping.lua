local lastJump = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPedJumping(GetPlayerPed(-1)) then
			local maff = lastJump + 5
			if maff < fsn_GetTime() then
				lastJump = fsn_GetTime()
				SetPedToRagdoll(GetPlayerPed(-1), 1, 1000, 0, 0, 0, 0)
				Citizen.Wait(3000)
			end
		end
	end
end)