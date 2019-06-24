-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'client.lua'
server_script 'server.lua'

ui_page 'gui/ui.html'

files({
  'gui/ui.css',
  'gui/ui.html',
  'gui/ui.js'
})

exports({
  'fsn_IsVehicleOwner'
})

-- Server scripts
server_script '@mysql-async/lib/MySQL.lua'
