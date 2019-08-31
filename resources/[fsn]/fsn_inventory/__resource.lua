-- GLOBAL UTILS
client_script '@fsn_main/cl_utils.lua'
server_script '@fsn_main/sv_utils.lua'

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
client_script '_item_misc/dm_laundering.lua'
client_script '_item_misc/burger_store.lua'

---------------------------------------------------- new script stuff below
	client_script 'cl_presets.lua'
	client_script 'cl_uses.lua'
	client_script 'cl_inventory.lua'
	client_script 'cl_dropping.lua'
	client_script 'cl_vehicles.lua'
	server_script 'sv_inventory.lua'
	server_script 'sv_dropping.lua'
	server_script 'sv_vehicles.lua'
-- new gui
ui_page "html/ui.html"
files {
  "html/ui.html",
  "html/css/ui.css",
  "html/css/jquery-ui.css",
  "html/js/inventory.js",
  "html/js/config.js",
  -- JS LOCALES
  "html/locales/cs.js",
  "html/locales/en.js",
  "html/locales/fr.js",
  -- IMAGES
  "html/img/bullet.png",
  -- ICONS
  "html/img/items/id.png",
  "html/img/items/evidence.png",
  "html/img/items/bandage.png",
  "html/img/items/beef_jerky.png",
  "html/img/items/binoculars.png",
  "html/img/items/burger.png",
  "html/img/items/cash.png",
  "html/img/items/coffee.png",
  "html/img/items/coke.png",
  "html/img/items/cupcake.png",
  "html/img/items/dirty_money.png",
  "html/img/items/ecola.png",
  "html/img/items/evidence.png",
  "html/img/items/joint.png",
  "html/img/items/lockpick.png",
  "html/img/items/meth_rocks.png",
  "html/img/items/microwave_burrito.png",
  "html/img/items/morphine.png",
  "html/img/items/packaged_cocaine.png",
  "html/img/items/painkillers.png",
  "html/img/items/panini.png",
  "html/img/items/pepsi.png",
  "html/img/items/pepsi_max.png",
  "html/img/items/phone.png",
  "html/img/items/repair_kit.png",
  "html/img/items/empty_canister.png",
  "html/img/items/full_canister.png",
  "html/img/items/cooked_meat.png",
  "html/img/items/uncooked_meat.png",
}