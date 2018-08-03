client_script 'client.lua'
server_script 'server.lua'

-- mechanic job
client_script 'mechanic/client.lua'
server_script 'mechanic/server.lua'

-- trucker job
client_script 'trucker/client.lua'

-- hunting job
client_script 'hunting/client.lua'

-- farming job
client_script 'farming/client.lua'

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
