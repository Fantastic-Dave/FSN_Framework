client_script 'client.lua'
client_script 'items.lua'

server_script 'server.lua'
server_script 'items.lua'



-- Server scripts
server_script '@mysql-async/lib/MySQL.lua'

exports({
  'fsn_HasPhone',
  'fsn_HasItem',
  'fsn_GetItemAmount',
  'fsn_GetItemDetails',
  'fsn_CanCarry',
  'EnumerateObjects'
})

-- Item scripts
client_script '_item_misc/binoculars.lua'
client_script '_item_misc/drug_selling.lua'
client_script '_item_misc/dm_laundering.lua'
client_script '_item_misc/burger_store.lua'

ui_page "gui/index.html"

files {
	"gui/index.html",
	"gui/index.js",
	"gui/index.css"
}
