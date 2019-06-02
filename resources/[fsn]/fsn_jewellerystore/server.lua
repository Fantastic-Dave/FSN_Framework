local ongoing = false
local lastrobbery = 0
local currenttime = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		currenttime = currenttime +1
	end
end)