/*
	Global javascript
*/
var currentPage = 'home';
var currentPhone = 'iphone';
var pages = ['home', 'adverts', 'call', 'contacts', 'email', 'fleeca', 'messages', 'pay', 'phone', 'twitter', 'whitelists'];

var debug = true
function log(msg) {
	if (debug) {
		console.log(msg)
	}
}

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
	
	// dynamically load the css for each page
	for (i = 0; i < document.styleSheets.length; i++) {
		//void(document.styleSheets.item(i).disabled=true);
		var path = document.styleSheets.item(i).href.replace('nui://fsn_phones/html/pages_css/', '');
		var filephone = path.split('/')[0];
		var file = path.split('/')[1];
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

$(function () {
	window.addEventListener('message', function (event) {
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

/*
	james' notes
	
	for ( i=0; i<document.styleSheets.length; i++) {
		void(document.styleSheets.item(i).disabled=true);
	}

*/