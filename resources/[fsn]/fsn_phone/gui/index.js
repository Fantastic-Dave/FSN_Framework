var texts = []
var contacts = []
contacts.sort(function(a, b) {
    return a.name > b.name;
});
/*
	{
		luaid:1,
		contact:"LIFEINVADER",
		number:696969,
		message:'Welcome to Lifeinvader!<br><br>Your new mobile phone number is <b style="color:#f44242">696969</b>.<br><br>~Lifeinvader Team'
	},
*/
function displayMessage(jsid) {
	var txt = texts[jsid]
	if (txt) {
		$('#message-text').html(txt.message)
		$('#message-contact').text(txt.contact)
		$('#message-number').text(txt.number)
		$('#screen-messages').hide()
		$('#screen-message-view').show()
		$('#textbox-number').val(txt.number)
	} else {
		$('#message-text').html('')
		$('#message-contact').text('')
		$('#message-number').text('')
		$('#screen-messages').hide()
		$('#screen-message-view').show()
		$('#textbox-number').val('')
		$('#textbox-message').val('')
	}
}

function textNumber(num) {
	$('#message-text').html('')
	$('#message-contact').text('')
	$('#message-number').text('')
	$('#screen-messages').hide()
	$('#textbox-number').val(num)
	$('#textbox-message').val('')
	$('#screen-contact-view').hide()
	$('#screen-message-view').show()
}

function addUpdateContact(jsid) {
	var ctc = contacts[jsid]
	if (ctc) {
		var nam = $('#ctc-name').val()
		var num = $('#ctc-number').val()
		$.post('http://fsn_phone/updateContact', JSON.stringify({
			luaid:ctc.luaid,
			name:nam,
			number:num
		}));
	} else {
		var nam = $('#ctc-name').val()
		var num = $('#ctc-number').val()
		$.post('http://fsn_phone/addContact', JSON.stringify({
			name:nam,
			number:num
		}));
	}
	$('#screen-contact-view').hide()
	$('#contacts-append').html('')
		if (contacts.length > 0) {
			contacts.sort();
		}
		for(var i = 0; i < contacts.length; i++) {
			var ctc = contacts[i]
			var appendStr = '<div class="contact">'+
				'<div class="contact_details">'+
					'<div class="contact_title">'+
						ctc.name+
					'</div>'+
					'<div class="contact_desc">'+
						ctc.number+
					'</div>'+
				'</div>'+
				'<div class="contact_button">'+
					'<button onclick="displayContact('+i+')">View</button>'+
				'</div>'+
			'</div>'
			
			$('#contacts-append').append(appendStr)
		}
		$('#screen-contacts').show()
}

function deleteContact(jsid) {
	var ctc = contacts[jsid]
	if (ctc) {
		$.post('http://fsn_phone/deleteContact', JSON.stringify({
			luaid:ctc.luaid,
		}));
	}
	$('#screen-contact-view').hide()
	$('#contacts-append').html('')
		if (contacts.length > 0) {
			contacts.sort();
		}
		for(var i = 0; i < contacts.length; i++) {
			var ctc = contacts[i]
			var appendStr = '<div class="contact">'+
				'<div class="contact_details">'+
					'<div class="contact_title">'+
						ctc.name+
					'</div>'+
					'<div class="contact_desc">'+
						ctc.number+
					'</div>'+
				'</div>'+
				'<div class="contact_button">'+
					'<button onclick="displayContact('+i+')">View</button>'+
				'</div>'+
			'</div>'
			
			$('#contacts-append').append(appendStr)
		}
		$('#screen-contacts').show()
}

function displayContact(jsid) {
	var ctc = contacts[jsid]
	if (ctc) {
		$('#ctc-buttons').html('<div id="ctc-txt-buttons" class="contact_buttons" style="margin-top:15px;">'+
			'<button onclick="textNumber('+ctc.number+')">TEXT CONTACT</button>'+
			'<button onclick="callNumber('+ctc.number+')">CALL CONTACT</button>'+
		'</div>')
		$('#screen-contacts').hide()
		$('#screen-contact-view').show()
		$('#ctc-name').val(ctc.name)
		$('#ctc-number').val(ctc.number)
		$('#ctc-detail-buttons').html('<button onclick="addUpdateContact('+jsid+')">UPDATE</button>'+
		'<button onclick="deleteContact('+jsid+')">DELETE</button>')
		
	} else {
		$('#ctc-buttons').html('')
		$('#screen-contacts').hide()
		$('#screen-contact-view').show()
		$('#ctc-name').val('')
		$('#ctc-number').val('')
		$('.contact_buttons').html('<button onclick="addUpdateContact(false)">ADD</button>')
	}
}

function postAdvert() {
	var message = $('#advert_textarea').val()
	$.post('http://fsn_phone/placeAdvert', JSON.stringify({
		ad:message
	}));
	
	$('#advert_textarea').val('')
	$.post('http://fsn_phone/disablePhone', JSON.stringify({}));
}


function sendTextMessage() {
	var number = $('#textbox-number').val()
	var message = $('#textbox-message').val()
	
	$.post('http://fsn_phone/sendText', JSON.stringify({
		num:number,
		msg:message
	}));
	
	$('#textbox-number').val('')
	$('#textbox-message').val('')
	
	//////// asss
	$('#screen-message-view').hide()
	
	// Add the messages
	$('#messages-append').html('')
	for(var i = 0; i < texts.length; i++) {
		var txt = texts[i]
		var appendStr = '<div class="msg_box">'+
			'<div class="msg_title">'+
				txt.contact+' ('+txt.number+')'+
			'</div>'+
			'<div id="message-bubble" class="talk-bubble tri-right left-top" onclick="displayMessage('+i+')">'+
			  '<div class="talktext">'+
				'<p>'+txt.message+'</p>'+
			  '</div>'+
			'</div>'+
		'</div>'
		$('#messages-append').append(appendStr)
	}
	$('#screen-messages').show()
}

$(function() {
    window.addEventListener('message', function(event) {
		if (event.data.updateContacts == true) {
			contacts = event.data.contacts
		}
		if (event.data.updateWhitelists == true) {
			$('#whitelists').html('')
			whitelists = event.data.whitelists
			if (whitelists.length > 0) {
				for(var i = 0; i < whitelists.length; i++) {
					var wl = whitelists[i]
					console.log(wl)
					$('#whitelists').append('<div id="no-whitelists" class="whitelists-whitelist">'+
					'<b>'+wl.title+'</b><br>'+
					'<b>Owner:</b> '+wl.owner+'<br>'+
					'<b>Access:</b> ...<br>'+
					'<b>Bank: $</b>'+wl.bank+
					'<button>Manage Business</button></div>')
				}
			} else {
				$('#whitelists').append('<div id="no-whitelists" class="whitelists-error">You are not currently a part of any business.</div>')
			}
		}
		if (event.data.updateAdverts == true) {
			$('#adverts').html('')
			adverts = event.data.ads
			if (adverts.length > 0) {
				for(var i = 0; i < adverts.length; i++) {
					var ad = adverts[i]
					$('#adverts').append('<div class="advert"><div class="advert_ad">'+ad.text+'</div><div class="advert_contact">'+ad.writer+' - '+ad.number+'</div></div>')
				}
			} else {
				$('#adverts').append('<div id="no-adverts" class="adverts-error">There are not any adverts</div>')
			}
		}
		if (event.data.addMessage == true) {
			var json = 	{
				contact:event.data.contact,
				number:event.data.number,
				message:event.data.message
			}
			texts.unshift(json)
		}
		if (event.data.displayPhone == true) {
			$('#phone').show()
			if (event.data.simcard == false) {
				$('#screen-home').hide()
				$('.back_bar').hide()
				$('#screen-nosim').show()
			} else {
				$('#screen-nosim').hide()
				$('#screen-phone').hide()
				$('#screen-messages').hide()
				$('#screen-contacts').hide()
				$('#screen-whitelists').hide()
				$('#screen-message-view').hide()
				$('#screen-contact-view').hide()
				$('#screen-adverts').hide()
				$( "#phone-sim-number" ).text( '#'+event.data.number );
				$('#screen-home').show()
			}
		} else if (event.data.displayPhone == false) {
			$('#phone').hide()
		}
    });
})

$(document).keyup(function(e) {
     if (e.keyCode == 27 || e.keyCode == 112) { 
		$.post('http://fsn_phone/disablePhone', JSON.stringify({}));
    }
});


document.body.onmouseup = function() {
	/////////////////////////////////////////////////
	///		home screen buttons
	/////////////////////////////////////////////////
	if ($('#phone-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-messages').hide()
		$('#screen-contacts').hide()
		$('#screen-whitelists').hide()
		$('#screen-adverts').hide()
		$('#screen-phone').show()
	}
	if ($('#adverts-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-messages').hide()
		$('#screen-contacts').hide()
		$('#screen-phone').hide()
		$('#screen-whitelists').hide()
		$('#screen-adverts').show()
	}
	if ($('#whitelists-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-messages').hide()
		$('#screen-contacts').hide()
		$('#screen-phone').hide()
		$('#screen-adverts').hide()
		$('#screen-whitelists').show()
	}
	if ($('#contacts-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-phone').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-whitelists').hide()
		$('#screen-adverts').hide()
		$('#screen-messages').hide()
		
		// Add the contacts
		$('#contacts-append').html('')
		if (contacts.length > 0) {
			contacts.sort();
		}
		for(var i = 0; i < contacts.length; i++) {
			var ctc = contacts[i]
			var appendStr = '<div class="contact">'+
				'<div class="contact_details">'+
					'<div class="contact_title">'+
						ctc.name+
					'</div>'+
					'<div class="contact_desc">'+
						ctc.number+
					'</div>'+
				'</div>'+
				'<div class="contact_button">'+
					'<button onclick="displayContact('+i+')">View</button>'+
				'</div>'+
			'</div>'
			
			$('#contacts-append').append(appendStr)
		}
		$('#screen-contacts').show()
	}
	if ($('#messages-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-phone').hide()
		$('#screen-contacts').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-adverts').hide()
		$('#screen-whitelists').hide()
		
		// Add the messages
		$('#messages-append').html('')
		for(var i = 0; i < texts.length; i++) {
			var txt = texts[i]
			var appendStr = '<div class="msg_box">'+
				'<div class="msg_title">'+
					txt.contact+' ('+txt.number+')'+
				'</div>'+
				'<div id="message-bubble" class="talk-bubble tri-right left-top" onclick="displayMessage('+i+')">'+
				  '<div class="talktext">'+
					'<p>'+txt.message+'</p>'+
				  '</div>'+
				'</div>'+
			'</div>'
			$('#messages-append').append(appendStr)
		}
		$('#screen-messages').show()
	}
	if ($('.back_img_home:hover').length != 0) {
		$('#screen-phone').hide()
		$('#screen-messages').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-contacts').hide()
		$('#screen-whitelists').hide()
		$('#screen-adverts').hide()
		$('#screen-home').show()
	}
	
	/////////////////////////////////////////////////
	///		phone keypad buttons
	/////////////////////////////////////////////////
	if ($('#one:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'1')
	}
	if ($('#two:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'2')
	}
	if ($('#three:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'3')
	}
	if ($('#four:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'4')
	}
	if ($('#five:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'5')
	}
	if ($('#six:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'6')
	}
	if ($('#seven:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'7')
	}
	if ($('#eight:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'8')
	}
	if ($('#nine:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'9')
	}
	if ($('#zero:hover').length != 0) {
		var currentVal = $('#call_input').val()
		$('#call_input').val(currentVal+'0')
	}
	if ($('#clear:hover').length != 0) {
		$('#call_input').val('')
	}
}