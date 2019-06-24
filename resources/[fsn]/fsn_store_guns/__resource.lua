-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'client.lua'

ui_page 'gui/ui.html'

files({
  'gui/ui.html',
  'gui/ui.css',
  'gui/ui.js'
})
