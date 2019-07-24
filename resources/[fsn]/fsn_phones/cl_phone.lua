local phoneEnabled = false

function togglePhone()
	if phoneEnabled then
		print'togglin'
		SetNuiFocus( false )
		SendNUIMessage({
			type = 'status',
			display = false,
		})
	else
		
		--[[ 		DISABLED DURING TESTING
		if not exports.fsn_inventory:fsn_HasPhone() then -- if does not have phone return jack shit
			TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone!<br>Visit a general store to get one.', 'centerLeft', 5000, 'error')
		return end
		]]
		
		SetNuiFocus( true, true )
		SendNUIMessage({
			type = 'status',
			display = true,
			phoneType = 'iphone', -- I'll set this dynamically in the future
		})
	end
	phoneEnabled = not phoneEnabled
end



-- disable nui focus every time the script is restarted 
SetNuiFocus( false )


-- display the phone
Citizen.CreateThread(function()
	while true do Citizen.Wait(0)
		if not phoneEnabled then
			togglePhone()
			break
		end
	end
end)


RegisterNUICallback( "closePhone", function(data, cb)
print'toggling'
	togglePhone()
end)