local function countPlayer() -- count all players
	local counter = 0
	for _ in pairs(GetPlayers()) do
		counter = counter + 1
	end
	return counter
end

local warnings = {}

RegisterServerEvent('sendSession:PlayerNumber')
AddEventHandler('sendSession:PlayerNumber', function(clientPlayerNumber)
	if source ~= nil then
		serverPlayerNumber = countPlayer()
		if serverPlayerNumber-clientPlayerNumber > 2 then
			if warnings[source] then
        if warnings[source] < 5 then
          TriggerClientEvent('chatMessage', -1, '', {255,255,255},  '^*'..GetPlayerName(source)..'#'..source..'^r you are ^1instanced^0 please reconnect to avoid being kicked.')
          warnings[source] = warnings[source] + 1
        else
          TriggerClientEvent('chatMessage', -1, '', {255,255,255},  '^*'..GetPlayerName(source)..'#'..source..'^r has been kicked due to instancing.')
          DropPlayer(source, ':FSN: You have been kicked from the server due to instancing, please rejoin.')
        end
      else
        warnings[source] = 1
      end
		end
	end
end)

AddEventHandler( 'playerConnecting', function( name, setReason )  -- Fix player connecting
	-- 'source' now working on playerConnecting event.
	TriggerClientEvent('sendSession:PlayerConnecting', -1, name)
	--print("------Solo PlayerConnecting "..name.."------") -- Debug
end)

RegisterServerEvent('sendSession:PlayerSpawned') -- Fix player connecting
AddEventHandler('sendSession:PlayerSpawned', function()
	TriggerClientEvent('sendSession:PlayerSpawned', -1, GetPlayerName(source))
	--print("------Solo PlayerSpawned "..GetPlayerName(source).."------") -- Debug
end)

AddEventHandler("playerDropped",function(reason)
	TriggerClientEvent('sendSession:PlayerSpawned', -1, GetPlayerName(source))
	--print("------Solo PlayerDroped "..GetPlayerName(source).."------") --
end)
