local lastJump = 0
local jumped = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPedJumping(GetPlayerPed(-1)) then
			local maff = lastJump + 5
			if maff >= fsn_GetTime() and jumped == false then
				lastJump = fsn_GetTime()
				SetPedToRagdoll(GetPlayerPed(-1), 1, 1000, 0, 0, 0, 0)
				jumped = true
				Citizen.Wait(5000)
				jumped = false
			end
		end
	end
end)
