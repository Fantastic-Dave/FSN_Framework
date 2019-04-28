local races = {}

RegisterNetEvent('fsn_criminalmisc:racing:createRace')
AddEventHandler('fsn_criminalmisc:racing:createRace', function()
	if IsWaypointActive() then
		local wypt = GetFirstBlipInfoId(8)
	else
		TriggerServerEvent('fsn_notify:displayNotification', srv_id, 'Player has been robbed too recently.', 'centerLeft', 4000, 'error')
	end
end)