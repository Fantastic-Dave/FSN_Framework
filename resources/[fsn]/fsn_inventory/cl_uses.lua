itemUses = {
	["bandage"] = {
		takeItem = true,
		use = function(item)
			print('Using item: '..item.name)
		end,
	},
	["id"] = {
		takeItem = true,
		use = function(item)
			local players = {}
			for _, ply in pairs(GetActivePlayers()) do
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(ply)),GetEntityCoords(GetPlayerPed(-1)),true) < 5 then
					players[#players+1] = GetPlayerServerId(ply)
				end
			end
			TriggerServerEvent('fsn_licenses:id:display', players, item.customData.Name, item.customData.Occupation, item.customData.DOB, item.customData.Issue, item.customData.CharID)
		end,
	},
}