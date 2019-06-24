-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'vehshop.lua'
server_script 'vehshop_server.lua'

export 'ShowVehshopBlips'

server_script '@mysql-async/lib/MySQL.lua'
