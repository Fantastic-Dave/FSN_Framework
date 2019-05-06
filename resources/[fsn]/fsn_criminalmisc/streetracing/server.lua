local raceid = 1
local races = {}

RegisterServerEvent('fsn_criminalmisc:racing:newRace')
AddEventHandler('fsn_criminalmisc:racing:newRace', function(cost, streetname, startx, starty, startz, x, y, racetoname)
	local race = {
		starttime = os.time(),
		start = {
			x = startx,
			y = starty,
			z = startz,
			price = cost,
		},
		status = 'getready',
		members = 0
	}
	table.insert(races, #races+1, race)
	TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
	TriggerClientEvent('fsn_phone:recieveMessage', -1, {
      sender = 'Racerz',
      from_number = 123456,
      to_number = -1,
      message = 'A new race has been started at '..streetname..' to '..racetoname..' get there within 5 minutes to take part!'
    })
	print('new race being started at '..streetname..' to '..racetoname)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(races) do
			if v.status ~= 'completed' then
			
			end
		end
	end
end)