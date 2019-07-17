/*
	Global javascript
*/
var currentPage = 'home';

function changePage(page) { // simple function that disables the css from the previous page and enables it for the new one -- will also show/hide all the pages
	for ( i=0; i<document.styleSheets.length; i++) {
		//void(document.styleSheets.item(i).disabled=true);
		console.log(document.styleSheets.item(i));
	}
}

$(function() {
    window.addEventListener('message', function(event) {
		if (event.data.type == 'status') {
			if (event.data.display) {
				if (event.data.phoneType == 'iphone') {
					$('#phone-iphone').show();
				} else {
					$('#phone-samsung').show();
				}
			} else {
				$('#phone-iphone').hide();
				$('#phone-samsung').hide();
			}
			return;
		}
	})
});

/*
	james' notes
	
	for ( i=0; i<document.styleSheets.length; i++) {
		void(document.styleSheets.item(i).disabled=true);
	}

*/