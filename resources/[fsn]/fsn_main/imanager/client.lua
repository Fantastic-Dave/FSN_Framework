local playerconnecting = 0
local PlayerConnectingId = {}

RegisterNetEvent("sendSession:PlayerConnecting") -- Call when other player connecting
AddEventHandler("sendSession:PlayerConnecting", function(PlayerName)
	if PlayerConnectingId[PlayerName] == nil then
		playerconnecting = playerconnecting+1
		PlayerConnectingId[PlayerName] = 1
		print("Solo Player Connecting: "..playerconnecting) -- Debug
	end
end)

RegisterNetEvent("sendSession:PlayerSpawned") -- Call when other player connected
AddEventHandler("sendSession:PlayerSpawned", function(PlayerName)
	if PlayerConnectingId[PlayerName] ~= nil then
		playerconnecting = playerconnecting-1
		PlayerConnectingId[PlayerName] = nil
		print("Solo Player Connecting: "..playerconnecting) -- Debug
	end
end)

Citizen.CreateThread(function() -- Check solo session every 30 sec
	Wait(180000) -- Delay first spawn.
	while true do
		if playerconnecting == 0 then
			TriggerServerEvent('sendSession:PlayerNumber', GetNumberOfPlayers())
			print("Solo Checking") -- Debug
			Wait(60000)
		end
		Wait(0)
	end
end)

AddEventHandler("playerSpawned",function() -- Send when other spawned.
	TriggerServerEvent("sendSession:PlayerSpawned")
end)
