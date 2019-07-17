-- gui stuffs
ui_page 'html/index.html'

files({ -- nice big table of files required for the interface
	-- main stuff
	'html/index.html',
	'html/index.css',
	'html/index.js',
	
	-- samsung
	'html/pages_css/samsung/adverts.css',
	'html/pages_css/samsung/call.css',
	'html/pages_css/samsung/contacts.css',
	'html/pages_css/samsung/email.css',
	'html/pages_css/samsung/fleeca.css',
	'html/pages_css/samsung/home.css',
	'html/pages_css/samsung/messages.css',
	'html/pages_css/samsung/pay.css',
	'html/pages_css/samsung/phone.css',
	'html/pages_css/samsung/twitter.css',
	'html/pages_css/samsung/whitelists.css',
	
	-- samsung
	'html/pages_css/samsung/adverts.css',
	'html/pages_css/samsung/call.css',
	'html/pages_css/samsung/contacts.css',
	'html/pages_css/samsung/email.css',
	'html/pages_css/samsung/fleeca.css',
	'html/pages_css/samsung/home.css',
	'html/pages_css/samsung/messages.css',
	'html/pages_css/samsung/pay.css',
	'html/pages_css/samsung/phone.css',
	'html/pages_css/samsung/twitter.css',
	'html/pages_css/samsung/whitelists.css',
})

client_script 'cl_phone.lua'
server_script 'sv_phone.lua'