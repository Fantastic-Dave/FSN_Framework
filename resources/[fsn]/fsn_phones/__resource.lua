resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

-- gui stuffs
ui_page 'html/index.html'

files({ -- nice big table of files required for the interface
	-- main stuff
	'html/index.html', 
	'html/index.css', -- ALl this has in it is the Div class for the Phone Frame along with the Wifi,Battery, and Time.
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

	
	-- Apple
	'html/pages_css/iphone/main.css',
	'html/pages_css/iphone/adverts.css',
	'html/pages_css/iphone/call.css',
	'html/pages_css/iphone/contacts.css',
	'html/pages_css/iphone/email.css',
	'html/pages_css/iphone/fleeca.css',
	'html/pages_css/iphone/home.css', --Complete 
	'html/pages_css/iphone/messages.css',
	'html/pages_css/iphone/pay.css',
	'html/pages_css/iphone/phone.css',
	'html/pages_css/iphone/twitter.css', -- Work In-Progess
	'html/pages_css/iphone/whitelists.css',
	
	--Home Icons
	'html/img/Apple/Contact.png',
	'html/img/Apple/Frame.png',
	'html/img/Apple/wallpaper.png',
	'html/img/Apple/Phone.png',
	'html/img/Apple/Messages.png',
	'html/img/Apple/Wallet.png',
	'html/img/Apple/Twitter.png',	
	'html/img/Apple/Ads.png',
	'html/img/Apple/Mail.png',
	'html/img/Apple/Whitelist.png',
	'html/img/Apple/Fleeca.png',
	
	--Phone Info
	'html/img/Apple/wifi.png',
	'html/img/Apple/battery.png',
	'html/img/Apple/signal.png',
	
	--Twitter Assets
	'html/img/Apple/twitterlogo.png',
	'html/img/Apple/feedgrey.png',
	'html/img/Apple/tweetrectangle.png',
	'html/img/Apple/log-inBackground.png',

})

client_script 'cl_phone.lua'
server_script 'sv_phone.lua'