-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

client_script 'client.lua'
server_script 'server.lua'

server_script '@mysql-async/lib/MySQL.lua'

ui_page 'gui/index.html'
files({
  'gui/index.html',
  'gui/index.js',
  'gui/index.css',
  'gui/atm_logo.png',
  'gui/atm_button_sound.mp3'
})
