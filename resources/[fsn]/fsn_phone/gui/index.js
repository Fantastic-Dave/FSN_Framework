$(function() {
    window.addEventListener('message', function(event) {
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
		$('#screen-phone').show()
	}
	if ($('#messages-button:hover').length != 0) {
		$('#screen-home').hide()
		$('#screen-messages').show()
	}
	if ($('#home-button:hover').length != 0) {
		$('#screen-phone').hide()
		$('#screen-messages').hide()
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