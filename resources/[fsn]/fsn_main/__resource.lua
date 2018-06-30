-- Client scripts
client_script 'initial/client.lua'
client_script 'hud/client.lua'
client_script 'playermanager/client.lua'

-- gui stuffs
ui_page 'gui/index.html'
files({
  'gui/index.html',
  'gui/index.js',
  'gui/motd.txt',
  'gui/logo.png',
  'gui/spin.js',
  'gui/pdown.ttf'
})

-- Server scripts
server_script '@mysql-async/lib/MySQL.lua'
server_script 'initial/server.lua'
server_script 'playermanager/server.lua'


-- exports
exports {
	"fsn_GetWallet",
  "fsn_CharID",
}
server_export 'fsn_GetPlayerFromCharacterId'
server_export 'fsn_GetPlayerFromPhoneNumber'
