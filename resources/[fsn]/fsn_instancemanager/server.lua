-- There are no limits on instances afaik
local instances = {}

RegisterServerEvent('fsn_instancemanager:server:createVisVoice')
AddEventHandler('fsn_instancemanager:server:createVisVoice', function(cbScript)
  local insID = #instances+1
  local instable = {
    type = 'VisVoice',
    owner = source,
    members = {source},
  }
  table.insert(instances, insID, instable)
  print(':fsn_instancemanager: player #'..source..' created instance #'..insID)
  TriggerClientEvent('fsn_instancemanager:client:updateInstances', -1, instances)
  TriggerClientEvent('fsn_instancemanager:client:joinInstance', source, instable, insID)
end)

RegisterServerEvent('fsn_instancemanager:server:createVoice')
AddEventHandler('fsn_instancemanager:server:createVoice', function(cbScript)

end)

RegisterServerEvent('fsn_instancemanager:server:joinInstance')
AddEventHandler('fsn_instancemanager:server:joinInstance', function(cbScript, id)
  table.insert(instances[id].members,nil,source)
  print(':fsn_instancemanager: player#'..source..' joined instance #'..id)
  TriggerClientEvent('fsn_instancemanager:client:joinInstance', source, instances[id], id)
  TriggerClientEvent('fsn_instancemanager:client:updateInstances', -1, instances)
end)

AddEventHandler('chatMessage', function(source, auth, msg)
  if msg == '/instanceMe' then
    TriggerClientEvent('fsn_instancemanager:client:createInstance', source)
  end
end)
