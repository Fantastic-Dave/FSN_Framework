client_script 'client.lua'
server_script 'server.lua'

-- trucker job
client_script 'trucker/client.lua'

-- scrap job
client_script 'scrap/client.lua'

-- taxi job
client_script 'taxi/client.lua'
server_script 'taxi/server.lua'

-- tow job
client_script 'tow/client.lua'

exports({
  'fsn_GetJob',
  'fsn_SetJob'
})
