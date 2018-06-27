local vault_doors = {
  [1] = {'closed'},
  [2] = {'closed'},
  [3] = {'closed'},
}

RegisterServerEvent('fsn_bankrobbery:vault:open')
AddEventHandler('fsn_bankrobbery:vault:open', function(id)
  print('attempting to open door '..id)
  vault_doors[id][1] = 'open'
  TriggerClientEvent('fsn_bankrobbery:openDoor', -1, id)
end)

RegisterServerEvent('fsn_bankrobbery:vault:close')
AddEventHandler('fsn_bankrobbery:vault:close', function(id)
  print('attempting to close door '..id)
  vault_doors[id][1] = 'closed'
  TriggerClientEvent('fsn_bankrobbery:closeDoor', -1, id)
end)

RegisterServerEvent('fsn_bankrobbery:init', function()
  TriggerClientEvent('fsn_bankrobbery:init', source, vault_doors)
end)
