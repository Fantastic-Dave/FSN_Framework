local ids = 1
RegisterServerEvent('fsn_inventory:item:dropped')
AddEventHandler('fsn_inventory:item:dropped', function(item, hash, xyz, amount, pickupid)
  ids = ids+1
  TriggerClientEvent('fsn_inventory:itemhasdropped', -1, item, hash, xyz, amount, ids)
end)

RegisterServerEvent('fsn_inventory:itempickup')
AddEventHandler('fsn_inventory:itempickup', function(pickupid)
  TriggerClientEvent('fsn_inventory:removedropped', -1, pickupid)
end)
