-- shared functions
function fsn_drawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    if onScreen then
        SetTextScale(0.2, 0.2)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

local menuEnabled = false

function ToggleActionMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then
		SetNuiFocus( true, true )
		SendNUIMessage({
			showmenu = true
		})
	else
		SetNuiFocus( false )

		SendNUIMessage({
			hidemenu = true
		})
	end
end

RegisterNUICallback( "ButtonClick", function( data, cb )
	if ( data == "button1" ) then
		chatPrint( "Button 1 pressed!" )
	elseif ( data == "button2" ) then
		chatPrint( "Button 2 pressed!" )
	elseif ( data == "button3" ) then
		chatPrint( "Button 3 pressed!" )
	elseif ( data == "button4" ) then
		chatPrint( "Button 4 pressed!" )
	elseif ( data == "exit" ) then
		ToggleActionMenu()
		return
	end
	ToggleActionMenu()
end )
