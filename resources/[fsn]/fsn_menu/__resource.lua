-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

ui_page "gui/ui.html"

files {
	"gui/ui.html",
	"gui/ui.js",
	"gui/ui.css"
}

client_script 'main_client.lua'
