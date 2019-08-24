local lock = false
local droppedItems = {
	{
		loc = {x = 246.47196960449, y = -584.28149414063, z = 43.042171478271},
		item = {
			index="id",
			name='ID Card (Logan Whitehead)',
			amt=1,
			data = {
			
			},
			customData = {
				Name = 'Logan Whitehead',
				Occupation = 'Police Officer',
				DOB = '14/06/1998',
				Issue = '18/08/2019',
				CharID = '1381'
			},
		},
	}
}

RegisterNetEvent('fsn_inventory:drops:request')
AddEventHandler('fsn_inventory:drops:request', function()
	TriggerClientEvent('fsn_inventory:drops:send', source, droppedItems)
end)

RegisterNetEvent('fsn_inventory:drops:collect')
AddEventHandler('fsn_inventory:drops:collect', function(id)
	local start = os.time()
	while lock do
		Citizen.Wait(1)
		if os.time() >= start+300 then
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Inventory action timed out (5 minutes). Contact a member of staff!' })
			return
		end
	end
	if not lock then
		lock = true
		if droppedItems[id] then
			TriggerClientEvent('fsn_inventory:items:add', source, droppedItems[id].item)
			
			droppedItems[id] = nil
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'This item looks to be missing, did someone else pick it up?' })
		end
		TriggerClientEvent('fsn_inventory:drops:send', -1, droppedItems)
		lock = false
	else
		print 'something broke the lock script'
	end
end)

RegisterNetEvent('fsn_inventory:drops:drop')
AddEventHandler('fsn_inventory:drops:drop', function(xyz, it)
	droppedItems[#droppedItems+1] = {
		loc = xyz,
		item = it
	}
	Citizen.Wait(500)
	TriggerClientEvent('fsn_inventory:drops:send', -1, droppedItems)
end)