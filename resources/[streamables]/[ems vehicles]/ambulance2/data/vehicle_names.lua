	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
	-- fire_ambulance2
	AddTextEntry('0x73920F8E', 'fire_ambulance2')
