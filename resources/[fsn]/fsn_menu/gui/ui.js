/*--------------------------------------------------------------------------

    ActionMenu 
    Created by WolfKnight
    Additional help from lowheartrate, TheStonedTurtle, and Briglair.  

--------------------------------------------------------------------------*/
var items = false
var atstorage = false
$( function() {
    // Adds all of the correct button actions 
    //init();

    // Gets the actionmenu div container 
    var actionContainer = $( "#actionmenu" );

    // Listens for NUI messages from Lua 
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        if (item.type == 'init') {
			items = item.items
		}
		if (item.type == 'inventory') {
			updateInventory(item.inventory);
		}
        // Show the menu 
        if ( item.showmenu ) {
            ResetMenu()
            actionContainer.show();
			if (item.atstorage) {
				atstorage = true
			} else {
				atstorage = false
			}
			if (item.vehicle) {
				$('#vehiclebutton').show()
			} else {
				$('#vehiclebutton').hide()
			}
			if (item.lookingatvehicle) {
				$('#vehicleinvbutton').show()
			} else {
				$('#vehicleinvbutton').hide()
			}
			if (item.police) {
				$('#policebutton').show()
				if (item.pdcommand) {
					$('#pdcommandbutton').show()					
				} else {
					$('#pdcommandbutton').hide()
				}
			} else {
				$('#policebutton').hide()
				$('#pdcommandbutton').hide()
			}
			if (item.ems) {
				$('#emsbutton').show()
				if (item.emscommand) {
					$('#emscommandbutton').show()					
				} else {
					$('#emscommandbutton').hide()
				}
			} else {
				$('#emsbutton').hide()
				$('#emscommandbutton').hide()
			}
			
			if (item.dead) {
				$('#phonebutton').hide()
				$('#licensebutton').hide()
				$('#inventorybutton').hide()
				$('#vehiclebutton').hide()
				$('#policebutton').hide()
				$('#pdcommandbutton').hide()
				$('#emsbutton').hide()
				$('#emscommandbutton').hide()
			} else {
				$('#phonebutton').show()
				$('#licensebutton').show()
				$('#inventorybutton').show()
			}
        }

        // Hide the menu 
        if ( item.hidemenu ) {
            actionContainer.hide(); 
        }
    } );
} )

function updateInventory(inv) {
	$('#inventorysubmenu').html('');
	$('#invsubmenus').html('')
	var shit = document.querySelectorAll('[data-spawn="inventory"]')
	for (var i = 0; i < shit.length; i++) {
	  var item = shit[i]; 
	  item.remove();
	}
	inv = JSON.parse(inv)
	$('#exitbutton').remove()
	jQuery.each(inv, function(i, val) {
		if (i == 'dirty_money') {
			$('#inventorysubmenu').append('<button class="menuoption" data-sub="'+i+'">'+val.display_name+' ($'+val.amount+') </button>')
			if (atstorage) {
				$('#actionmenu').append('<div id="'+i+'" data-spawn="inventory" data-parent="inventorysubmenu" style="display: none;"><button class="menuoption" data-action="item_give" data-item="'+i+'">GIVE</button><button class="menuoption" data-action="item_drop" data-item="'+i+'">DROP</button></div>')
			} else {
				$('#actionmenu').append('<div id="'+i+'" data-spawn="inventory" data-parent="inventorysubmenu" style="display: none;"><button class="menuoption" data-action="item_store" data-item="'+i+'">STORE</button><button class="menuoption" data-action="item_give" data-item="'+i+'">GIVE</button><button class="menuoption" data-action="item_drop" data-item="'+i+'">DROP</button></div>')
			}
		} else if (i == 'handcuffs') {
			$('#inventorysubmenu').append('<button class="menuoption" data-sub="'+i+'">['+val.amount+'x] '+val.display_name+'</button>')
			$('#actionmenu').append('<div id="'+i+'" data-spawn="inventory" data-parent="inventorysubmenu" style="display: none;"><button class="menuoption" data-sub="handcuffs-menu" data-item="'+i+'">USE</button><button class="menuoption" data-action="item_give" data-item="'+i+'">GIVE</button><button class="menuoption" data-action="item_drop" data-item="'+i+'">DROP</button></div>')
		} else {
			$('#inventorysubmenu').append('<button class="menuoption" data-sub="'+i+'">['+val.amount+'x] '+val.display_name+'</button>')
			if (atstorage) {
				$('#actionmenu').append('<div id="'+i+'" data-spawn="inventory" data-parent="inventorysubmenu" style="display: none;"><button class="menuoption" data-action="item_use" data-item="'+i+'">USE</button><button class="menuoption" data-action="item_give" data-item="'+i+'">GIVE</button><button class="menuoption" data-action="item_drop" data-item="'+i+'">DROP</button></div>')
			} else {
				$('#actionmenu').append('<div id="'+i+'" data-spawn="inventory" data-parent="inventorysubmenu" style="display: none;"><button class="menuoption" data-action="item_use" data-item="'+i+'">USE</button><button class="menuoption" data-action="item_store" data-item="'+i+'">STORE</button><button class="menuoption" data-action="item_give" data-item="'+i+'">GIVE</button><button class="menuoption" data-action="item_drop" data-item="'+i+'">DROP</button></div>')
			}
		}
	});
	$('#actionmenu').append('<button id="exitbutton" class="menuoption" data-action="exit">Exit</button>')
	init()
}

// Hides all div elements that contain a data-parent, in
// other words, hide all buttons in submenus. 
function ResetMenu() {
    $( "div" ).each( function( i, obj ) {
        var element = $( this );

        if ( element.attr( "data-parent" ) ) {
            element.hide();
        } else {
            element.show();
        }
    } );
}

// Configures every button click to use its data-action, or data-sub
// to open a submenu. 
function init() {
    // Loops through every button that has the class of "menuoption"
    $( ".menuoption" ).each( function( i, obj ) {
		
		// Here I am making modifications for using inventory stuffs n shit
		if ($(this).attr("data-action") && $(this).attr("data-item")) {
			$( this ).click( function() { 
                var data = $( this ).data( "action" );
				var item = $( this ).data( "item" ); 				
				
				$.post('http://fsn_menu/inventoryAction', JSON.stringify({
					action: data,
					item: item})
				);
				return
            } )
		}
		
        // If the button has a data-action, then we set it up so when it is 
        // pressed, we send the data to the lua side. 
        if ( $( this ).attr( "data-action" ) ) {
            $( this ).click( function() { 
                var data = $( this ).data( "action" ); 

                sendData( "ButtonClick", data ); 
            } )
        }

        // If the button has a data-sub, then we set it up so when it is 
        // pressed, we show the submenu buttons, and hide all of the others.
        if ( $( this ).attr( "data-sub" ) ) {
            $( this ).click( function() {
                var menu = $( this ).data( "sub" );
                var element = $( "#" + menu ); 
                element.show();
                $( this ).parent().hide();  
            } )
        }
    } );
}

// Send data to lua for processing.
function sendData( name, data ) {
    $.post( "http://fsn_menu/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            console.log( datab );
        }            
    } );
}