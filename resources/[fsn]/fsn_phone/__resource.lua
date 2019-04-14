client_script 'client.lua'

ui_page 'gui/index.html'

files({
  'gui/index.html',
  'gui/index.css',
  'gui/index.js',
  'gui/img/phone.png',
  'gui/img/home-background.png',
  'gui/img/sim.png',
  'gui/img/main-square.png',
  'gui/img/main-back.png',
  'gui/img/message_button.png',
  'gui/img/phone_button.png',
  'gui/img/contact_button.png',
  'gui/img/icons/icon_contacts.png',
  'gui/img/icons/icon_fleeca.png',
  'gui/img/icons/icon_messages.png',
  'gui/img/icons/icon_phone.png',
  'gui/img/icons/icon_whitelists.png',
  'gui/img/icons/icon_adverts.png',
})

server_script '@mysql-async/lib/MySQL.lua'
server_script 'server.lua'
