-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'client.lua'

ui_page 'gui/index.html'

files({
  'gui/index.html',
  'gui/index.js'
})
