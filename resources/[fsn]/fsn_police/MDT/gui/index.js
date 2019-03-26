var charges = [
	{
		"charge":"Jaywalking",
		"jail":0,
		"ticket":150		
	},
	{
		"charge":"Evading",
		"jail":5,
		"ticket":250		
	},
	{
		"charge":"Reckless Evading",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Illegal Passing",
		"jail":0,
		"ticket":150
	},
	{
		"charge":"Failuire to Yeild to an Emergency Vehicle",
		"jail":0,
		"ticket":250		
	},
	{
		"charge":"Failure to Obey a Traffic Control Device",
		"jail":0,
		"ticket":150		
	},
	{
		"charge":"Failure to Indicate Intention of Travel",
		"jail":0,
		"ticket":100		
	},
	{
		"charge":"Operation of an Unroadworthy Vehicle",
		"jail":0,
		"ticket":200		
	},
	{
		"charge":"Negligent Driving",
		"jail":0,
		"ticket":500		
	},
	{
		"charge":"Reckless Driving",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Third Degree Speeding (Speed in Excess 0-35)",
		"jail":0,
		"ticket":150		
	},
	{
		"charge":"Second Degree Speeding (Speed in Excess 36)",
		"jail":0,
		"ticket":250		
	},
	{
		"charge":"First Degree Speeding (Speed in Excess 55)",
		"jail":5,
		"ticket":450		
	},
	{
		"charge":"Unauthorized/Illegal Parking",
		"jail":0,
		"ticket":150		
	},
	{
		"charge":"Driving Under the Influence",
		"jail":5,
		"ticket":350		
	},
	{
		"charge":"Assault (R)",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Assault on Peace Officer (R)",
		"jail":15,
		"ticket":1000		
	},
	{
		"charge":"Assault With a Deadly Weapon (R)",
		"jail":20,
		"ticket":1500		
	},
	{
		"charge":"Involuntary Manslaughter (R)",
		"jail":15,
		"ticket":1000		
	},
	{
		"charge":"Vehicular Manslaughter (R)",
		"jail":15,
		"ticket":1000		
	},
	{
		"charge":"Second Degree Murder (R)",
		"jail":40,
		"ticket":2500		
	},
	{
		"charge":"First Degree Murder (R)",
		"jail":60,
		"ticket":3500		
	},
	{
		"charge":"Unlawful Imprisonment (R)",
		"jail":15,
		"ticket":1000		
	},
	{
		"charge":"Kidnapping (R)",
		"jail":20,
		"ticket":1500		
	},
	{
		"charge":"Impersonation (R)",
		"jail":20,
		"ticket":1000		
	},
	{
		"charge":"Impersonation of a Peace Officer (R)",
		"jail":30,
		"ticket":1500		
	},
	{
		"charge":"Stalking (R)",
		"jail":5,
		"ticket":250		
	},
	{
		"charge":"Criminal Threats (R)",
		"jail":10,
		"ticket":500		
	},
	{	
		"charge":"Second Degree Possession of a CS",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"First Degree Possession of a CS",
		"jail":15,
		"ticket":750		
	},
	{
		"charge":"Distribution of a CS",
		"jail":40,
		"ticket":1500		
	},
	{
		"charge":"Possession of CS paraphenalia",
		"jail":5,
		"ticket":250	
	},
	{
		"charge":"Petty Theft",
		"jail":0,
		"ticket":250		
	},
	{
		"charge":"Grand Theft",
		"jail":5,
		"ticket":500		
	},
	{
		"charge":"Joyriding",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Grant Theft Auto",
		"jail":20,
		"ticket":1000		
	},
	{
		"charge":"Tampering with a Vehicle",
		"jail":5,
		"ticket":500		
	},
	{
		"charge":"Second Degree Robbery",
		"jail":20,
		"ticket":1500		
	},
	{
		"charge":"First Degree Robbery",
		"jail":45,
		"ticket":3000		
	},
	{
		"charge":"Possesion of Stolen Property",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Tresspassing",
		"jail":0,
		"ticket":500		
	},
	{
		"charge":"Vandalism",
		"jail":0,
		"ticket":250		
	},
	{
		"charge":"Vandalism of Government Property",
		"jail":5,
		"ticket":500		
	},
	{
		"charge":"Bribery",
		"jail":15,
		"ticket":750		
	},
	{
		"charge":"Conspiracy to commit a crime",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"False Reporting",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Obstruction of Justice",
		"jail":15,
		"ticket":1500		
	},
	{
		"charge":"Initiation of a Riot",
		"jail":40,
		"ticket":2500		
	},
	{
		"charge":"Participation in a Riot",
		"jail":30,
		"ticket":1500		
	},
	{
		"charge":"Resisting arrest",
		"jail":5,
		"ticket":250		
	},
	{
		"charge":"Terrorism",
		"jail":90,
		"ticket":15000		
	},
	{
		"charge":"Loitering",
		"jail":0,
		"ticket":250		
	},
	{
		"charge":"Criminal Possession of a Firearm (Class 1)",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Criminal Possession of a Firearm (Class 2)",
		"jail":30,
		"ticket":2500		
	},
	{
		"charge":"Criminal Sale of a Firearm (Class 1)",
		"jail":15,
		"ticket":750		
	},
	{
		"charge":"Criminal Sale of a Firearm (Class 2)",
		"jail":30,
		"ticket":4250		
	},
	{
		"charge":"Criminal Use of a Firearm",
		"jail":10,
		"ticket":500		
	},
	{
		"charge":"Brandishing",
		"jail":5,
		"ticket":500		
	},
]

var currentCharges = []

function updateCharges() {
	var str = ''
	if (currentCharges.length > 0) {
		for(var i = 0; i < currentCharges.length; i++) {
			var obj = currentCharges[i];
			var chrg = charges[obj.chargeid].charge
			if (obj.amt > 0) {
				str = '['+obj.amt+'X] '+chrg+' | '+str 
			}
		}
	}
	$('#booking-charges-textarea').val(str)
	booking_compute_finetime()
}

function addCharge(id) {
	var pushed = false
	if (currentCharges.length > 0) {
		for(var i = 0; i < currentCharges.length; i++) {
			var obj = currentCharges[i];
			if (obj.chargeid == id) {
				currentCharges[i].amt = currentCharges[i].amt + 1
				pushed = true
			}		
		}
	}
	if (pushed == false) {
		var charge = charges[id].charge
		currentCharges.push({'chargeid':id,'amt': 1})
	}
	console.log(JSON.stringify(currentCharges))
	updateCharges();
}

function removeCharge(id) {
	if (currentCharges.length > 0) {
		for(var i = 0; i < currentCharges.length; i++) {
			var obj = currentCharges[i];
			if (obj.chargeid == id) {
				var newish = currentCharges[i].amt - 1
				if (newish < 0) {
					console.log('You can\'t remove a charge that isn\'t threre!')
				} else {
					currentCharges[i].amt = currentCharges[i].amt - 1
				}
			}		
		}
	}
	updateCharges();
}

function booking_compute_finetime() {
	var jailtime = 0
	var fine = 0
	if (currentCharges.length > 0) {
		for(var i = 0; i < currentCharges.length; i++) {
			var obj = currentCharges[i];
			var chrg = charges[obj.chargeid];
			
			var plustime = chrg.jail
			var plusfine = chrg.ticket
			
			jailtime = jailtime + plustime
			fine = fine + plusfine
		}
	}
	
	$('#booking-suggested-time').text(jailtime)
	$('#booking-suggested-fine').text(fine)
}

function booking_reset() {
	$('#booking-player-id').val('')
	$('#booking-player-name').val('')
	$('#booking-officer-name').val('')
	$('#booking-description').val('')
	$('#booking-charges-textarea').val('')
	$('#booking-fine').val('')
	$('#booking-jail').val('')
	$('#booking-suggested-time').text('0')
	$('#booking-suggested-fine').text('0')
	
	currentCharges = []
}

function booking_submit_now() {
	if ($("#booking-player-id").val() != '' && $("#booking-player-name").val() != '' && $("#booking-officer-name").val() != '' && $("#booking-charges-textarea").val() != '' && $("#booking-fine").val() != '', $("#booking-jail").val() != '') {
		
		$.post('http://fsn_police/booking-submit-now', JSON.stringify({
			"suspectID":$("#booking-player-id").val(),
			"suspectName":$("#booking-player-name").val(),
			"officerName":$("#booking-officer-name").val(),
			"charges":$("#booking-charges-textarea").val(),
			"jailTime":$("#booking-jail").val(),
			"jailFine":$("#booking-fine").val(),
		}));
        booking_reset()
	} else {
		$('#booking-now-button').css('background-color','red')
		$('#booking-now-button').text('ERROR: MISSING VALUE')
		setTimeout(function(){
			$('#booking-now-button').css('background-color','green')
			$('#booking-now-button').text('APPLY TO SUSPECT')
		}, 2000)
	}
}

function booking_submit_warrant() {
	if ($("#booking-description").val() != '' && $("#booking-player-name").val() != '' && $("#booking-officer-name").val() != '' && $("#booking-charges-textarea").val() != '' && $("#booking-fine").val() != '', $("#booking-jail").val() != '') {	
		$.post('http://fsn_police/booking-submit-warrant', JSON.stringify({
			"situationDesc":$("#booking-description").val(),
			"suspectName":$("#booking-player-name").val(),
			"officerName":$("#booking-officer-name").val(),
			"charges":$("#booking-charges-textarea").val(),
			"jailTime":$("#booking-jail").val(),
			"jailFine":$("#booking-fine").val(),
		}));
        booking_reset()
	} else {
		$('#booking-warrant-button').css('background-color','red')
		$('#booking-warrant-button').text('ERROR: MISSING VALUE')
		setTimeout(function(){
			$('#booking-warrant-button').css('background-color','orange')
			$('#booking-warrant-button').text('SUBMIT WARRANT')
		}, 2000)
	}
}

function requestWarrants() {
	$('#refreshwarrantsbuttton').text('Refreshing...')
    $.post('http://fsn_police/mdt-request-warrants', JSON.stringify({
		"name":$("#booking-description").val()
	}))
}
function removeWarrant(id) {
    $.post('http://fsn_police/mdt-remove-warrant', JSON.stringify({
        "id":id
    }))

    $.post('http://fsn_police/mdt-request-warrants', JSON.stringify({
        "name":$("#booking-description").val()
    }))
}


$(function() {
    window.addEventListener('message', function(event) {
		if (event.data.displayMDT) {
			$('#main-computer').show()
		} else {
			$('#main-computer').hide()
		}
		if (event.data.updateWarrants) {
		    $('#warrants_update').html('<button id="refreshwarrantsbuttton" class="cpic_searchbutton" type="submit" style="height:30px;background-color:#ffc57f" onclick="requestWarrants()">REFRESH</button>' +
                '<table id="warrants_append">' +
                    '<tr>' +
                        '<th>ID</th>' +
                        '<th>Name</th>' +
                        '<th>Officer</th>' +
                        '<th>Charges</th>' +
                        '<th>Desc</th>' +
                        '<th>Time/Fine</th>' +
                        '<th>Admin</th>' +
                    '</tr>' +
                '</table>')
            if (event.data.warrants.length > 0) {
                for(var i = 0; i < event.data.warrants.length; i++) {
                    var obj = event.data.warrants[i];
                    $('#warrants_append').append('<tr>' +
                        '<td>'+obj.war_id+'</td>' +
                        '<td>'+obj.suspect_name+'</td>' +
                        '<td>'+obj.officer_name+'</td>' +
                        '<td>'+obj.war_charges+'</td>' +
                        '<td>'+obj.war_desc+'</td>' +
                        '<td>'+obj.war_times+'/$'+obj.war_fine+'</td>' +
                        '<td><button onclick="removeWarrant('+obj.war_id+')">Remove</button></td>' +
                        '</tr>')
                }
            }
        }
		if (event.data.addDispatch) {
			var apstring = '<tr>'+
				'<td>'+timeNow()+'</td>'+
				'<td>'+event.data.tencode+'</td>'+
				'<td>'+event.data.name+'</td>'+
				'<td>'+event.data.loc+'</td>'+
				'<td><center><button id="disp-button" data-x="'+event.data.x+'" data-y="'+event.data.y+'" data-tencode="'+event.data.tencode+'" data-loc="'+event.data.loc+'">SET WAYPOINT</button></center></td>'+
			'</tr>'
			$('#dispatch-table').append(apstring)
			init() 
		}
    });
})


document.body.onmouseup = function() {
	if ($('#cpic-button:hover').length != 0) {
		$('#warrant-window').hide()
		$('#dmv-window').hide()
		$('#booking-window').hide()
		$('#dispatch-window').hide()
		$('#cpic-window').show()
	}
	if ($('#cpic-close-button:hover').length != 0) {
		$('#cpic-window').hide()
	}
	if ($('#dmv-button:hover').length != 0) {
		$('#warrant-window').hide()
		$('#cpic-window').hide()
		$('#dispatch-window').hide()
		$('#booking-window').hide()
		$('#dmv-window').show()
	}
	if ($('#booking-button:hover').length != 0) {
		$('#warrant-window').hide()
		$('#cpic-window').hide()
		$('#dispatch-window').hide()
		$('#dmv-window').hide()
		$('#booking-window').show()
	}
	if ($('#warrants-button:hover').length != 0) {
		$('#booking-window').hide()
		$('#cpic-window').hide()
		$('#dmv-window').hide()
		$('#dispatch-window').hide()
		$('#warrant-window').show()
	}
	if ($('#dispatch-button:hover').length != 0) {
		$('#booking-window').hide()
		$('#cpic-window').hide()
		$('#dmv-window').hide()
		$('#warrant-window').hide()
		$('#dispatch-window').show()
	}
	/////////////////////////////////////////////////
	///		Dropdown buttons
	/////////////////////////////////////////////////
	if ($('#dropdown-1-toggle:hover').length != 0) {
		if ($('#dropdown-1').is(":visible")) {
			$('#dropdown-1-icon-down').hide()
			$('#dropdown-1-icon-up').show()
			$('#dropdown-1').hide()
		} else {
			$('#dropdown-1-icon-up').hide()
			$('#dropdown-1-icon-down').show()
			$('#dropdown-2').hide()
			$('#dropdown-3').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').hide()
			$('#dropdown-6').hide()
			$('#dropdown-7').hide()
			$('#dropdown-1').show()
		}
	}
	if ($('#dropdown-2-toggle:hover').length != 0) {
		if ($('#dropdown-2').is(":visible")) {
			$('#dropdown-2-icon-down').hide()
			$('#dropdown-2-icon-up').show()
			$('#dropdown-2').hide()
		} else {
			$('#dropdown-2-icon-up').hide()
			$('#dropdown-2-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-3').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').hide()
			$('#dropdown-6').hide()
			$('#dropdown-7').hide()
			$('#dropdown-2').show()
		}
	}
	if ($('#dropdown-3-toggle:hover').length != 0) {
		if ($('#dropdown-3').is(":visible")) {
			$('#dropdown-3-icon-down').hide()
			$('#dropdown-3-icon-up').show()
			$('#dropdown-3').hide()
		} else {
			$('#dropdown-3-icon-up').hide()
			$('#dropdown-3-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-2').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').hide()
			$('#dropdown-6').hide()
			$('#dropdown-7').hide()
			$('#dropdown-3').show()
		}
	}
	if ($('#dropdown-4-toggle:hover').length != 0) {
		if ($('#dropdown-4').is(":visible")) {
			$('#dropdown-4-icon-down').hide()
			$('#dropdown-4-icon-up').show()
			$('#dropdown-4').hide()
		} else {
			$('#dropdown-4-icon-up').hide()
			$('#dropdown-4-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-2').hide()
			$('#dropdown-3').hide()
			$('#dropdown-5').hide()
			$('#dropdown-6').hide()
			$('#dropdown-7').hide()
			$('#dropdown-4').show()
		}
	}
	if ($('#dropdown-5-toggle:hover').length != 0) {
		if ($('#dropdown-5').is(":visible")) {
			$('#dropdown-5-icon-down').hide()
			$('#dropdown-5-icon-up').show()
			$('#dropdown-5').hide()
		} else {
			$('#dropdown-5-icon-up').hide()
			$('#dropdown-5-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-2').hide()
			$('#dropdown-3').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').show()
		}
	}
	if ($('#dropdown-6-toggle:hover').length != 0) {
		if ($('#dropdown-6').is(":visible")) {
			$('#dropdown-6-icon-down').hide()
			$('#dropdown-6-icon-up').show()
			$('#dropdown-6').hide()
		} else {
			$('#dropdown-6-icon-up').hide()
			$('#dropdown-6-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-2').hide()
			$('#dropdown-3').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').hide()
			$('#dropdown-7').hide()
			$('#dropdown-6').show()
		}
	}
	if ($('#dropdown-7-toggle:hover').length != 0) {
		if ($('#dropdown-7').is(":visible")) {
			$('#dropdown-7-icon-down').hide()
			$('#dropdown-7-icon-up').show()
			$('#dropdown-7').hide()
		} else {
			$('#dropdown-7-icon-up').hide()
			$('#dropdown-7-icon-down').show()
			$('#dropdown-1').hide()
			$('#dropdown-2').hide()
			$('#dropdown-3').hide()
			$('#dropdown-4').hide()
			$('#dropdown-5').hide()
			$('#dropdown-6').hide()
			$('#dropdown-7').show()
		}
	}
	
	/////////////////////////////////////////////////
	///		Start menu buttons
	/////////////////////////////////////////////////
	if ($('#start-button:hover').length != 0) {
		if ($('#start-menu').is(":visible")) {
			$('#start-menu').hide()
		} else {
			$('#start-menu').show()
		}
	} else {
		if ($('#start-menu').is(":visible")) {
			if ($('#start-menu:hover').length <= 0) {
				$('#start-menu').hide()
			}
		}
	}
	if ($('#off-button:hover').length != 0) {
		$('#start-menu').hide()
		$.post('http://fsn_police/closeMDT', JSON.stringify({}));
	}
}

$(document).keyup(function(e) {
     if (e.keyCode == 27 || e.keyCode == 112) { 
		$.post('http://fsn_police/closeMDT', JSON.stringify({}));
    }
});


function init() {
	$( "#disp-button" ).each( function( i, obj ) {
        if ($(this).attr("data-x")) {
            $(this).click( function() { 
                var data = $( this ).data(); 
				$.post('http://fsn_police/setWaypoint', JSON.stringify(data));
				$.post('http://fsn_police/closeMDT', JSON.stringify({}));
            })
        }
    });
}
