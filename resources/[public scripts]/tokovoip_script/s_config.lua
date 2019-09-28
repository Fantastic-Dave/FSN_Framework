TokoVoipConfig = {
	channels = {
		{name = "LSPD Radio", subscribers = {}},
		{name = "LEO Shared Radio", subscribers = {}},
		{name = "SASP Radio", subscribers = {}},
		--{name = "LEO/EMS Shared Radio", subscribers = {}},
		{name = "EMS Radio", subscribers = {}},
	}
};

RegisterNetEvent('tokovoip_extras:radio:enter')
AddEventHandler('tokovoip_extras:radio:enter', function(id)
	if not TokoVoipConfig['channels'][id] then
		TokoVoipConfig['channels'][id] = {name = "Chnl ["..id.."]", subscribers = {}}
	end
end)