-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'cl_manage.lua'
client_script 'cl_properties.lua'

server_script '@mysql-async/lib/MySQL.lua'
server_script 'sv_conversion.lua'
server_script 'sv_properties.lua'