ui_page 'gui/index.html'

files({
  "gui/ui.html",
	"gui/ui.js",
	"gui/ui.css"
})

client_script 'entarable/properties.lua'
client_script 'enterable/client.lua'

client_script 'nonenterable/properties.lua'
client_script 'nonenterable/client.lua'

server_script 'enterable/properties.lua'
server_script 'nonenterable/properties.lua'
server_script 'server.lua'
