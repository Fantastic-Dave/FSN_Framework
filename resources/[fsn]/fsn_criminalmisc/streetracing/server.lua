local raceid = 1
local races = {}

RegisterServerEvent('fsn_criminalmisc:racing:newRace')
AddEventHandler('fsn_criminalmisc:racing:newRace', function(cost, streetname, startx, starty, startz, ex, why, racetoname)
	local rid = raceid + 1
	local race = {
		race_id = rid,
		starttime = os.time(),
		start = {
			x = startx,
			y = starty,
			z = startz,
			price = cost,
		},
		finish = {
			x = ex,
			y = why
		},
		status = 'getready',
		members = {},
	}
	table.insert(races, #races+1, race)
	TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
	TriggerClientEvent('fsn_phone:recieveMessage', -1, {
      sender = 'Racerz',
      from_number = 123456,
      to_number = -1,
      message = 'A new race has been started at '..streetname..' to '..racetoname..' get there within 5 minutes to take part!'
    })
end)

RegisterServerEvent('fsn_criminalmisc:racing:joinRace')
AddEventHandler('fsn_criminalmisc:racing:joinRace', function(id)
	for k, v in pairs(races) do
		if v.race_id == id then
			if v.status == 'getready' then
				table.insert(v.members, #v.members+1, source)
				TriggerClientEvent('fsn_criminalmisc:racing:putmeinrace', source, v.race_id, v.members)
			else
				TriggerClientEvent('fsn_notify:displayNotification', source, 'Too late!', 'centerLeft', 4000, 'error')
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(races) do
			if v.status == 'getready' then			
				local maff = v.starttime + 300
				if maff <= os.time() then
					for k, ply in pairs(v.members) do
						TriggerClientEvent('fsn_notify:displayNotification', ply, '<b>THE RACE HAS STARTED GO GO GO', 'centerLeft', 4000, 'info')
						TriggerClientEvent('fsn_phone:recieveMessage', ply, {
						  sender = 'Racerz',
						  from_number = 123456,
						  to_number = -1,
						  message = 'The race has started. Go go go!'
						})
					end
					v.status = 'inprogress'
					TriggerClientEvent('fsn_criminalmisc:racing:update', -1, races)
				end
			end
		end
	end
end)