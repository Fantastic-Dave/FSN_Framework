local ids = 1
local items = {}
local locktable = false

RegisterServerEvent('fsn_inventory:item:dropped')
AddEventHandler('fsn_inventory:item:dropped', function(item, hash, xyz, amount, pickupid)
	local srv_id = #items+1
	table.insert(items,srv_id, {
    item = item,
    hash = hash,
    xyz = xyz,
    amount = amount,
    pickupid = srv_id
  })
  TriggerClientEvent('fsn_inventory:floor:update', -1, items)
	--TriggerClientEvent('fsn_inventory:itemhasdropped', -1, item, hash, xyz, amount, ids)
end)

RegisterServerEvent('fsn_inventory:itempickup')
AddEventHandler('fsn_inventory:itempickup', function(pickupid)
  --TriggerClientEvent('fsn_inventory:removedropped', -1, pickupid)
	if not locktable then
		locktable = true
		local item = items[pickupid]
		if item then
			TriggerClientEvent('fsn_inventory:item:add', source, item.item, item.amount)
			table.remove(items, pickupid)
			TriggerClientEvent('fsn_inventory:floor:update', -1, items)
		else
			print(':fsn_inventory: '..GetPlayerName(source)..' tried to pick up id: '..pickupid..' but it does not exist')
			TriggerClientEvent('fsn_inventory:floor:update', -1, items)
			DropPlayer(source, ':FSN: Attempted product dupe')
		end
		locktable = false
	else
		Citizen.Wait(1)
	end
end)

