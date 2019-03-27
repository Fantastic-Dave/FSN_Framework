local radioChannels = {
	["lspd"] = {name = "lspd", users = {}},
	["bcso"] = {name = "bcso", users = {}},
	["shared"] = {name = "shared", users = {}},
	["ems"] = {name = "ems", users = {}},
}
RegisterServerEvent("addUserToRadioChannel")
AddEventHandler("addUserToRadioChannel", function(channel,userClientID)
	radioChannels[channel].users[userClientID] = 1
	TriggerClientEvent("updateRadioChannels", -1, radioChannels)
end)

RegisterServerEvent("removeUserFromRadioChannel")
AddEventHandler("removeUserFromRadioChannel", function(channel,userClientID)
	radioChannels[channel].users[userClientID] = nil
	TriggerClientEvent("updateRadioChannels", -1, radioChannels)
end)

RegisterServerEvent("updateRadioChannels")
AddEventHandler("updateRadioChannels", function()
	TriggerClientEvent("updateRadioChannels", source, radioChannels)
end)