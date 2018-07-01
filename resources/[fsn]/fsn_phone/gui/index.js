var texts = []
var contacts = [
	{
		luaid:1,
		name:'Logan Whitehead',
		number:07849891833
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	},
	{
		luaid:2,
		name:'Anna Dicksucker',
		number:999
	}
]
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

function displayContact(jsid) {
	var ctc = contacts[jsid]
	if (ctc) {
		$('#screen-contacts').hide()
		$('#screen-contact-view').show()
		$('#ctc-name').val(ctc.name)
		$('#ctc-number').val(ctc.number)
		$('.contact_buttons').html('<button onclick="addUpdateContact('+jsid+')">ADD/UPDATE</button>'+
		'<button onclick="deleteContact('+jsid+')">DELETE</button>')
		
	} else {
		$('#screen-contacts').hide()
		$('#screen-contact-view').show()
		$('#ctc-name').val('')
		$('#ctc-number').val('')
		$('.contact_buttons').html('<button onclick="addUpdateContact(false)">ADD/UPDATE</button>'+
		'<button onclick="deleteContact(false)">DELETE</button>')
	}
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
		$('#screen-phone').show()
	}
	if ($('#contacts-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-phone').hide()
		$('#screen-message-view').hide()
		$('#screen-contact-view').hide()
		$('#screen-messages').hide()
		
		// Add the contacts
		$('#contacts-append').html('')
		contacts.sort();
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