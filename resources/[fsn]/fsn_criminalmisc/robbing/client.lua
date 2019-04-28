local lastRob = 0
local lastAttempt = 0
local beingRobbed = false

RegisterNetEvent('fsn_criminalmisc:robbing:startRob')
AddEventHandler('fsn_criminalmisc:robbing:startRob', function(srv_id)
	print'iambeingrobbed'
	local maff = lastAttempt + 3
	if maff < myTime or lastAttempt == 0 then
		local newMaff = lastRob + 600
		if maff < myTime or lastAttempt == 0 then
			if not beingRobbed then
				TriggerServerEvent('fsn_criminalmisc:robbing:startRobbing', srv_id)
				local dm = 0
				if exports['fsn_inventory']:fsn_HasItem('dirty_money') then
					dm = exports['fsn_inventory']:fsn_GetItemAmount('dirty_money')
				end
				Citizen.Wait(8000)
				TriggerServerEvent('fsn_criminalmisc:robbing:finishRob', srv_id, dm, exports["fsn_main"]:fsn_GetWallet())
				beingRobbed = false
				lastRob = myTime
			else
				TriggerServerEvent('fsn_notify:displayNotification', srv_id, 'Player is being robbed right now!.', 'centerLeft', 4000, 'error')
			end
		else
			TriggerServerEvent('fsn_notify:displayNotification', srv_id, 'Player has been robbed too recently.', 'centerLeft', 4000, 'error')
		end
	end
end)

RegisterNetEvent('fsn_criminalmisc:robbing:startRobbing')
AddEventHandler('fsn_criminalmisc:robbing:startRobbing', function()
	while not HasAnimDictLoaded('mini@triathlon') do
		RequestAnimDict('mini@triathlon')
		Citizen.Wait(5)
	end
	TaskPlayAnim(GetPlayerPed(-1), "mini@triathlon", "rummage_bag", 8.0, -8, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(2500)	
end)