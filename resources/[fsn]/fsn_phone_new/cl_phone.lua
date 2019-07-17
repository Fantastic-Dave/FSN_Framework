local phoneEnabled = false

function enablePhone()
	if phoneEnabled then
		-- phone is on screen, disable it
		SetNuiFocus( false )
		SendNUIMessage({
			type = 'status',
			display = false,
		})
	else
		-- phone is not on screen, enable it
		
		--[[ 		DISABLED DURING TESTING
		if not exports.fsn_inventory:fsn_HasPhone() then -- if does not have phone return jack shit
			TriggerEvent('fsn_notify:displayNotification', 'You do not have a phone!<br>Visit a general store to get one.', 'centerLeft', 5000, 'error')
		return end
		]]
		
		SetNuiFocus( true, true )
		SendNUIMessage({
			type = 'status',
			display = true,
			phoneType = 'samsung', -- I'll set this dynamically in the future
		})
	end
	phoneEnabled = not phoneEnabled
end

-- disable nui focus every time the script is restarted 
SetNuiFocus( false )