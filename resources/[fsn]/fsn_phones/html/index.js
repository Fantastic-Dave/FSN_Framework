/*
	Global javascript
*/
var currentPage = 'home';
var currentPhone = 'iphone';
var pages = ['home', 'adverts', 'call', 'contacts', 'email', 'fleeca', 'messages', 'pay', 'phone', 'twitter', 'whitelists'];

var debug = false
function log(msg) {
	if (debug) {
		console.log(msg)
	}
}

// datastore
var datastore = {};


// phone functions
function changePage(page, phone) { // simple function that disables the css from the previous page and enables it for the new one -- will also show/hide all the pages
	log('+-------------- changePage --------------+');
	log('+ changing page to '+page+' on '+phone)
	// hide all the pages
	for (i = 0; i < pages.length; i++) {
		$('#page-samsung-'+pages[i]).hide();
		$('#page-iphone-'+pages[i]).hide();
	}
	
	// show the page we need
	$('#page-'+phone+'-'+page).show();
	currentPage = page;
	if (window.getFunctionFromString('process'+page)) {
		window.getFunctionFromString('process'+page)();
	}
	// dynamically load the css for each page
	for (i = 0; i < document.styleSheets.length; i++) {
		//void(document.styleSheets.item(i).disabled=true);
		var path = document.styleSheets.item(i).href.replace('nui://fsn_phones/html/pages_css/', '');
		
		var filephone = path.split('/')[path.split('/').length-2];
		var file = path.split('/')[path.split('/').length-1];
		if (filephone == 'iphone' || filephone == 'samsung') {
			if (filephone != phone) {
				// this css is for the other phone, hide it
				void(document.styleSheets.item(i).disabled=true);
				log('(other phone) disabling css: '+path);
			} else {
				if (file != 'main.css' && file != page+'.css') {
					void(document.styleSheets.item(i).disabled=true);
					log('(other page) disabling css: '+path);
				} else {
					void(document.styleSheets.item(i).disabled=false);
					log('(main.css | this page) enabling css: '+path);
				}
			}
		}
	}
}

var viewingMessage = 0
function viewMessages(pn) {
	var messages = datastore['messages'][pn]['texts']
	viewingMessage = pn //.replace('-', '')
	$('#insertMessages').html();
	$('#view-message').show();
	$('#view-messages').hide();
	var frm = pn
	if (datastore['messages'][pn].contact) {
		frm = datastore['messages'][pn].contact
	}
	var msgHtml = '<div style="width:100%;background-color:white;padding-top:5px;padding-bottom:5px;text-align:center;font-weight:bold;font-size:16px">'+frm+'</div>'
	for (var key in messages){
		var msg = messages[key];
		if (msg.from) {
			msgHtml = msgHtml+
			'<div class="messagebox">'+
				'<div class="message-from">'+
					msg.text+
				'</div>'+
			'</div>'
		} else {
			msgHtml = msgHtml+
			'<div class="messagebox">'+
				'<div class="message-to">'+
					msg.text+
				'</div>'+
			'</div>'
		}
	}
	$('#insertMessages').html(msgHtml);
}

$(function () {
	window.addEventListener('message', function (event) {
		if (event.data.type == 'notification') {
			log('adding notification from lua')
			addNotification(event.data.icon, event.data.app, event.data.html)
		}
		if (event.data.type == 'update') {
			// datastore stuff
			datastore['messages'] = event.data.messages;
			datastore['tweets'] = event.data.tweets;
			datastore['whitelists'] = event.data.whitelists;
			datastore['adverts'] = event.data.adverts;
			datastore['emails'] = event.data.emails;
		}
		if (event.data.type == 'status') {
			if (event.data.display) {
				if (event.data.phoneType == 'iphone') {
					$('#phone-iphone').show();
					changePage('home', 'iphone');
					currentPhone = 'iphone';
				} else {
					$('#phone-samsung').show();
					changePage('home', 'samsung');
					currentPhone = 'samsung';
				}
			} else {
				$('#phone-iphone').hide();
				$('#phone-samsung').hide();
			}
			return;
		}
	})
});

var oldY = 0
var buffer = 100
document.body.onmouseup = function() {
	var newY = event.clientY
	if (oldY > newY) {
		var diff = oldY - newY
		if ( diff > buffer) {
			if (currentPage == 'home') {
				$.post('http://fsn_phones/closePhone', JSON.stringify({}));
			} else {
				changePage('home', currentPhone);
			}
		}
	}
	oldY = 0
}
document.body.onmousedown = function() {
	oldY = event.clientY
}

window.getFunctionFromString = function(string) {
    var scope = window;
    var scopeSplit = string.split('.');
    for (i = 0; i < scopeSplit.length - 1; i++) {
        scope = scope[scopeSplit[i]];
        if (scope == undefined) return;
    }
    return scope[scopeSplit[scopeSplit.length - 1]];
}

// functions that will run when the user selects a page, process+pagename
function processmessages() {
	$('#insertTexts').html('');
	var insertString = ''
	for (var key in datastore['messages']){
		var msg = datastore['messages'][key]
		var frm = key
		if (msg.contact) {
			frm = msg.contact
		}
		insertString = insertString+
		'<div class="message" onclick="viewMessages(\''+key+'\')">'+
			'<div class="message-title-area">'+
				frm+' <span class="message-title-date">- Today at 15:09</span>'+
			'</div>'+
			'<div class="message-text-area">'+
				msg.preview+
			'</div>'+
		'</div>'
	}
	$('#insertTexts').html(insertString);
	$('#view-message').hide();
	$('#view-messages').show();
}

function processtwitter() {
	$('#insertTweets').html('');
	var insertString = ''
	for (var key in datastore['tweets']){
		var tweet = datastore['tweets'][key]
		var div = ''
		if (tweet.mention) {
			div = '<div class="tweet mention">'
		} else {
			div = '<div class="tweet">'
		}
		insertString = insertString+
			div+
			'<div class="tweet-title-area">'+
				'@'+tweet.username+' <span class="tweet-title-date">- Today at 15:09</span>'+
			'</div>'+
			'<div class="tweet-text-area">'+
				tweet.tweet+
			'</div>'+
		'</div>'
	}
	$('#insertTweets').html(insertString);
}

function processadverts() {
	$('#insertAdverts').html('');
	var insertString = ''
	for (var key in datastore['adverts']){
		var advert = datastore['adverts'][key]
		insertString = insertString+
		'<div class="advert">'+
			'<div class="advert-text">'+
				advert.advert+
			'</div>'+
			'<div class="advert-author">'+
				advert.name+' - '+advert.number+
			'</div>'+
		'</div>'
	}
	$('#insertAdverts').html(insertString);	
}

function processemail() {
	$('#insertEmails').html('');
	var insertString = ''
	for (var key in datastore['emails']){
		var email = datastore['emails'][key]
		if (email.image) {
			img = '<div class="email-image" style="background-image:url(\''+email.image+'\')"></div>'
		} else {
			img = ''
		}
		insertString = insertString+
			'<div class="email">'+
				'<div class="email-title">'+
					email.subject+
				'</div>'+
				img+
				'<div class="email-content">'+
					email.body+
				'</div>'+
			'</div>'
	}
	$('#insertEmails').html(insertString);	
}

function processwhitelists() {
	$('#insertWhitelists').html('');
	var insertString = ''
	for (var key in datastore['whitelists']){
		var wl = datastore['whitelists'][key]
		var staff = ''
		for (var k in datastore['whitelists'][key].access){
			var st = datastore['whitelists'][key].access[k]
			staff = staff+'<tr>'+
				'<td>'+st.charid+'</td>'+
				'<td>'+st.level+'</td>'+
			'</tr>'
		}
		insertString = insertString+
		'<div class="whitelist">'+
			'<div class="whitelist-title">'+
				wl.title+
			'</div>'+
			
			'<div class="whitelist-info">'+
				'<p>Whitelist Information:</p>'+
				'<table class="wl-table">'+
					'<thead>'+
						'<tr>'+
							'<th></th>'+
							'<th></th>'+
						'</tr>'+
					'</thead>'+
					'<tbody>'+
						'<tr>'+
							'<td>Money</td>'+
							'<td>'+wl.bank+'</td>'+
						'</tr>'+
						'<tr>'+
							'<td>Owner</td>'+
							'<td>'+wl.owner+'</td>'+
						'</tr>'+
					'</tbody>'+
				'</table>'+
				'<p>Manage:</p>'+
				'<div style="width:92%;">'+
					'<input type="text"></input><button>Deposit</button>'+
					'<input type="text"></input><button>Withdraw</button>'+
					'<input type="text" style="width:50%;"></input><input type="text" style="width:25%;"></input><button>Whitelist</button>'+
				'</div>'+
				'<p>Staff:</p>'+
				'<table class="wl-table">'+
					'<thead>'+
						'<tr>'+
							'<th>CharacterID</th>'+
							'<th>Level</th>'+
						'</tr>'+
					'</thead>'+
					'<tbody>'+
						staff+
					'</tbody>'+
				'</table>'+
			'</div>'+
		'</div>'
	}
	$('#insertWhitelists').html(insertString);
}

/*
	james' notes
	
	for ( i=0; i<document.styleSheets.length; i++) {
		void(document.styleSheets.item(i).disabled=true);
	}

*/

/*
	Notification things
*/
var notiID = 0
var notiEN = true
function toggleNotification() {
	if (notiEN) {
		addNotification('img/Apple/Noti.png', 'Phone', 'Notifications: <b>disabled</b>')
		notiEN = false
	} else {
		notiEN = true
		addNotification('img/Apple/Noti.png', 'Phone', 'Notifications: <b>enabled</b>')
	}
}
function removeNotification(id) {
	$('#'+id).fadeOut()
}
function addNotification(icon, app, html) {
	if (notiEN) {
		notiID = notiID+1
		var myID = 'notification-display-'+notiID
		var html = '<div class="notification-'+currentPhone+'" id="'+myID+'" style="display:none;">'+
			'<div class="notification-'+currentPhone+'-title-area">'+
				'<div class="notification-'+currentPhone+'-title-icon">'+
					'<img src="'+icon+'">'+
				'</div>'+
				'<div class="notification-'+currentPhone+'-title-text">'+
					'<p>'+app+'</p>'+
				'</div>'+
				'<div class="notification-'+currentPhone+'-title-time"><p>now</p></div>'+
			'</div>'+
			'<div class="notification-'+currentPhone+'-info">'+
				'<p>'+html+'</p>'+
			'</div>'+
		'</div>'
		$('#insertNotifications').append(html)
		$('#'+myID).fadeIn('fast')
		setTimeout(function(){removeNotification(myID)}, 5000);
	}
}

/*
	Usage things
*/

function sendText(number, msg) {
	if (number == false) {
		number = viewingMessage
	}
	$.post('http://fsn_phones/sendToServer', JSON.stringify({
		'message': {
			'to': number,
			'body': msg
		},
	}));
}

function sendTweet() {
	var twt = $('#tweet_textarea').val()
	$.post('http://fsn_phones/sendToServer', JSON.stringify({
		'tweet': twt
	}));
	changePage('home', currentPhone)
	$('#tweet_textarea').val('')
}