local currentRobberies = {}

RegisterServerEvent('fsn_criminalmisc:robbing:finishRob')
AddEventHandler('fsn_criminalmisc:robbing:finishRob', function(robber, dm, cash)
	TriggerClientEvent('fsn_bank:change:walletMinus', source, cash)
	TriggerClientEvent('fsn_notify:displayNotification', source, 'You were robbed for: $'..cash, 'centerLeft', 4000, 'error')
	
	TriggerClientEvent('fsn_bank:change:walletAdd', robber, cash)
	TriggerClientEvent('fsn_notify:displayNotification', robber, 'You robbed: $'..cash, 'centerLeft', 4000, 'success')
	
	TriggerClientEvent('fsn_inventory:item:take', source, 'dirty_money', dm)
	TriggerClientEvent('fsn_notify:displayNotification', source, 'You were robbed for: '..dm..' dirty money', 'centerLeft', 4000, 'error')

	TriggerClientEvent('fsn_inventory:item:add', robber, 'dirty_money', dm)
	TriggerClientEvent('fsn_notify:displayNotification', robber, 'You robbed: '..dm..' dirty money', 'centerLeft', 4000, 'success')
end)

RegisterServerEvent('fsn_criminalmisc:robbing:startRobbing')
AddEventHandler('fsn_criminalmisc:robbing:startRobbing', function(robber)
	TriggerClientEvent('fsn_criminalmisc:robbing:startRobbing', robber)
end)

RegisterServerEvent('fsn_criminalmisc:robbing:requesRob')
AddEventHandler('fsn_criminalmisc:robbing:requesRob', function(robbee)
	for k, v in pairs(currentRobberies) do
		if v.victim == robbee then
			TriggerClientEvent('fsn_notify:displayNotification', source, 'You cannot rob this person yet', 'centerLeft', 4000, 'error')		
			return
		end
	end
	table.insert(currentRobberies, #currentRobberies+1, {
		victim = robbee,
		robber = source,
		time = os.time(),
		status = 'robbing',
	})
	TriggerClientEvent('fsn_criminalmisc:robbing:startRob', robbee, source)
end)
