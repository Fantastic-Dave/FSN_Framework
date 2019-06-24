-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

server_script '@mysql-async/lib/MySQL.lua'

-- judge
client_script 'judges/client.lua'
server_script 'judges/server.lua'

-- attorney
client_script 'attorneys/client.lua'
server_script 'attorneys/server.lua'