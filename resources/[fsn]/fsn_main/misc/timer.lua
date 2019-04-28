fsn_time = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		fsn_time = fsn_time + 1
	end
end)

function fsn_GetTime()
	return fsn_time
end