$( function() {
    init();
    var actionContainer = $( "#actionmenu" );
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        if ( item.showmenu ) {
            actionContainer.show();
			if (item.updateProperty) {
				if (item.owned) {
					
				} else {
					$('#property-info').html('')
					$('#property-info').append('<button class="menuoption" data-action="buy-'+item.property_id+'">Buy Property ($'+item.price+')</button>')
					$('#loading').hide()
					$('#property-info').show()
					init()
				}
			}
        }
        if ( item.hidemenu ) {
            actionContainer.hide(); 
        }
		
		
    } );
} )

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

function init() {
    $( ".menuoption" ).each( function( i, obj ) {
        if ( $( this ).attr( "data-action" ) ) {
            $( this ).click( function() { 
                var data = $( this ).data( "action" ); 

                sendData( "ButtonClick", data ); 
            } )
        }
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

function sendData( name, data ) {
    $.post( "http://fsn_properties/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            console.log( datab );
        }            
    } );
}