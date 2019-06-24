-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'
description 'Model Menu v3 by Frazzle :D'
client_scripts {
	'gui.lua',
	'client.lua',
	'config.lua',
}

server_script 'server.lua'

-- exports
exports {
	"isClothingOpen",
	"GetOutfit"
}