local radioChannels = {
	["leo"] = {name = "[LEO]", users = {}},
	["ems"] = {name = "[EMS]", users = {}},
}
--[[
local radioChannels = {
	["lspd"] = {name = "[LSPD]", users = {}},
	["bcso"] = {name = "[BCSO]", users = {}},
	["shared"] = {name = "[SHARED]", users = {}},
	["ems"] = {name = "[EMS]", users = {}},
}
]]
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